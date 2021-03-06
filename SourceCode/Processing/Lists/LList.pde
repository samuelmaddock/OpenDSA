/* *** ODSATag: LList *** */
// Linked list implementation
/* *** ODSATag: LListVars *** */
class LList implements List {
  private Link head;         // Pointer to list header
  private Link tail;         // Pointer to last element
  private Link curr;         // Access to current element
  private int listSize;      // Size of list
/* *** ODSAendTag: LListVars *** */

/* *** ODSATag: LListCons *** */
  // Constructors
  LList(int size) { this(); }     // Constructor -- Ignore size
  LList() { clear(); }

  // Remove all elements
  void clear() {
    curr = tail = new Link(null); // Create trailer
    head = new Link(tail);        // Create header
    listSize = 0;
  }
/* *** ODSAendTag: LListCons *** */
  
/* *** ODSATag: LListInsert *** */
  // Insert "it" at current position
  void insert(Object it) {
    curr.setnext(new Link(curr.element(), curr.next()));
    curr.setelement(it);
    if (tail == curr) tail = curr.next();  // New tail
    listSize++;
  }
/* *** ODSAendTag: LListInsert *** */
  
  // Append "it" to list
  void append(Object it) {
    tail.setnext(new Link(null));
    tail.setelement(it);
    tail = tail.next();
    listSize++;
  }

/* *** ODSATag: LListRemove *** */
  // Remove and return current element
  Object remove () {
    if (curr == tail) return null;          // Nothing to remove
    Object it = curr.element();             // Remember value
    curr.setelement(curr.next().element()); // Pull forward the next element
    if (curr.next() == tail) tail = curr;   // Removed last, move tail
    curr.setnext(curr.next().next());       // Point around unneeded link
    listSize--;                             // Decrement element count
    return it;                              // Return value
  }
/* *** ODSAendTag: LListRemove *** */

  void moveToStart() { curr = head.next(); } // Set curr at list start
  void moveToEnd() { curr = tail; }     // Set curr at list end

/* *** ODSATag: LListPrev *** */
  // Move curr one step left; no change if now at front
  void prev() {
    if (head.next() == curr) return; // No previous element
    Link temp = head;
    // March down list until we find the previous element
    while (temp.next() != curr) temp = temp.next();
    curr = temp;
  }
/* *** ODSAendTag: LListPrev *** */

/* *** ODSATag: LListNext *** */
  // Move curr one step right; no change if now at end
  void next() { if (curr != tail) curr = curr.next(); }
/* *** ODSAendTag: LListNext *** */

  int length() { return listSize; } // Return list length


  // Return the position of the current element
  int currPos() {
    Link temp = head.next();
    int i;
    for (i=0; curr != temp; i++)
      temp = temp.next();
    return i;
  }
  
/* *** ODSATag: LListPos *** */
  // Move down list to "pos" position
  void moveToPos(int pos) {
    if ((pos < 0) || (pos > listSize)) {
      println("Pos out of range, current position unchanged");
      return;
    }
    curr = head.next();
    for(int i=0; i<pos; i++) curr = curr.next();
  }
/* *** ODSAendTag: LListPos *** */

  // Return true if current position is at end of the list
  Boolean isAtEnd() { return curr == tail; }

  // Return current element value
  Object getValue() {
    if(curr == tail) return null;
    return curr.element();
  }
}
/* *** ODSAendTag: LList *** */
