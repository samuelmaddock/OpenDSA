// Array-based stack implementation
/* *** ODSATag: AStack1 *** */
class AStack implements Stack {
  private static final int defaultSize = 10;
  private int maxSize;            // Maximum size of stack
  private int top;                // Index for top Object
  private Object listArray[];     // Array holding stack

  // Constructors
  AStack(int size) {
    maxSize = size;
    top = 0; 
    listArray = new Object[size]; // Create listArray
  }

  AStack() { this(defaultSize); }
/* *** ODSAendTag: AStack1 *** */

  String toString() {
    StringBuffer out = new StringBuffer(top * 4);
    for (int i=top-1; i>=0; i--) {
      out.append(listArray[i]);
      out.append(" ");
    }
    return out.toString();
  }
/* *** ODSATag: AStack2 *** */

  void clear() { top = 0; }       // Reinitialize stack

// Push "it" onto stack
/* *** ODSATag: AStackPush *** */
  void push(Object it) {
    if (top >= maxSize) return;
    listArray[top++] = it;
  }
/* *** ODSAendTag: AStackPush *** */

// Remove and return top element
/* *** ODSATag: AStackPop *** */
  Object pop() {               
    if (top == 0) return null;
    return listArray[--top];
  }
/* *** ODSAendTag: AStackPop *** */

  Object topValue() {             // Return top element
    if (top == 0) return null;
    return listArray[top-1];
  }

  int length() { return top; }    // Return stack size
}
/* *** ODSAendTag: AStack2 *** */
