grammar Decaf;

/* LEXER RULES */

/* Identifiers */
Identifier
	:	Letter(Letter|Digit|'_')*
    ;

fragment
Letter
	:	'A'..'Z'
	|	'a'..'z'
	;
	
fragment
Digit
	: '0'..'9'
	;
	
/* Constants : integer, floating point, and string constants */
IntegerConstant 
	:	Digit+
    ;

FloatConstant
	:	Digit+ '.' Digit+ Exponent?
	;
	
fragment
Exponent 
	: ('e'|'E') ('+'|'-')? Digit+ 
	;	

StringConstant
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;
    
fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')
    ;

/* Single-line comments, multi-line comments, and white space */
Comment
    :   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
	|	'//' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    ;

WhiteSpace  
	:   (' '|'\t'|'\r'|'\n') {$channel=HIDDEN;}
    ;
