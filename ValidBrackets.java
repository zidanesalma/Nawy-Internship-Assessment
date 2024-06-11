import java.util.Stack;

class ValidBrackets {

    public static boolean isValid(String s) {

        Stack<Character> stack = new Stack<Character>();
        
        for (int i = 0; i < s.length(); i++) {
            
            if (s.charAt(i) == '{' || s.charAt(i) == '(' || s.charAt(i) == '[')
                
                stack.push(s.charAt(i)); // if it is an opening bracket, push it to the stack
            
            else if (s.charAt(i) == '}' || s.charAt(i) == ')' || s.charAt(i) == ']') {
                
                // if it is a closing bracket, get its corresponding opening bracket
                char openiningBracket = getOpeningBracket(s.charAt(i)); 
                
                // if the stack's not empty and that the stack peek is the corresponding opening bracket, pop from the stack
                if (!stack.isEmpty() && openiningBracket != 0 && stack.peek() == openiningBracket)
                    
                    stack.pop();
                
                else // either the stack is empty or the brackets are not matching, so return false in both cases
                
                    return false;

            } else // the character is not a bracket just continue looping, to allow the input to be some sort of this form "(1+2*4)"
                
                continue;
        }
        
        //if the stack is empty by the end of the looping, return true, as all opening brackets, had closing ones
        //else if not empty, then the brackets are not valid
        return stack.isEmpty();

    }

    public static char getOpeningBracket(char closingBracket) {
        
        switch (closingBracket) {
            
            case '}':
                return '{';
            
            case ')':
                return '(';
            
            case ']':
                return '[';
            
            default:
                return '0';
            
        }

    }

    public static void main(String[] args) {
        
        String expression = "()";
        
        System.out.println(isValid(expression));
    
    }
}