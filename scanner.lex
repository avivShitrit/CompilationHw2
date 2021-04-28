%{
#define YYSTYPE int
#include "parser.tab.hpp"
#include "output.hpp"
%}

%option noyywrap
%option yylineno

NUM     [0]|([1-9][0-9]*)
ID	    [A-Za-z][A-Za-z0-9]*
COMMENT \/\/[^\r\n]*[\r|\n|\r\n]?
WHITESPACE ([\t\n\r ])
STRING  \"([^\n\r\"\\]|\\[rnt"\\])+\"

%%
void        return VOID;
int         return INT;
byte        return BYTE;
b           return B;
bool        return BOOL;
and         return AND;
or          return OR;
not         return NOT;
true        return TRUE;
false       return FALSE;
return      return RETURN;
if          return IF;
else        return ELSE;
while       return WHILE;
break       return BREAK;
continue    return CONTINUE;
switch      return SWITCH;
case        return CASE;
default     return DEFAULT;
(\:)        return COLON;
(\;)        return SC;
(\,)        return COMMA;
(\()        return LPAREN;
(\))        return RPAREN;
(\{)        return LBRACE;
(\})        return RBRACE;
=           return ASSIGN;
(==)|(!=)   return RELOPL;
(<)|(>)|(<=)|(>=)   return RELOPN;
\+|\-       return ADD;
\*|\/       return MUL;
{ID}        return ID;
{NUM}       return NUM;
{WHITESPACE} ;
{STRING}    return STRING;
{COMMENT}   ;
.           {output::errorLex(yylineno); exit(0);};

%%
