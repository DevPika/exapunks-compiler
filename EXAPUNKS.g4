// adapted from the asm8080 grammar available under BSD license at http://lab.antlr.org/
grammar EXAPUNKS;

// prog
//    : EOL* ((line EOL)* line EOL*)? EOF
//    ;

prog
   : EOL* (line EOL)* EOF
   ;

line
   : instruction comment?
   | // lbl comment?
   | comment
   ;

instruction
   : opcode (expressionlist)*
   ;

opcode
   : OPCODE
   ;

register_
   : REGISTER
   ;

//lbl
//   : label ':'?
//   ;

expressionlist
   : argument (argument)*
   ;

//label
//   : name
//   ; 

argument
   : number
   | register_
   | EOFS
   ;

argumentspecial
   : MRDS
   | EOFS
   ;

number
   : NUMBER
   ;

comment
   : COMMENT
   ;

REGISTER
   : 'X' | 'T' | 'M' | 'F'
   ;

OPCODE
   : 'COPY'
   | 'ADDI'
   | 'SWIZ'

   | 'MARK'
   | 'JUMP'
   | 'TJMP'
   | 'FJMP'

   | 'TEST'

   | 'REPL'
   | 'HALT'
   | 'KILL'

   | 'LINK'
   | 'HOST'

   | 'MODE'
   | 'VOID'

   | 'MAKE'
   | 'GRAB'
   | 'FILE'
   | 'SEEK'
   | 'DROP'
   | 'WIPE'

   | 'NOOP'
   | 'RAND'
   ;

// NAME
//    : [A-Z] [A-Z0-9."]*
//    ;

NUMBER
   : [0-9]?[0-9]?[0-9]?[0-9]
   ;

COMMENT
   : ';' ~ [\r\n]*
   | 'NOTE' ~ [\r\n]*
   ;

// STRING
//    : '\u0027' ~'\u0027'* '\u0027'
//    ;

MRDS
   : 'MRD'
   ;

EOFS
   : 'EOF'
   ;

NOTES
   : 'NOTE'
   ;

EOL
   : [\r\n] +
   ;

WS
   : [ \t] -> skip
   ;
