/* 
 * Definição: seção para código do usuário. 
 */
import token.Token;

%%

/* 
 * Opções e Declarações 
 */

%standalone         
%line               
%column             
%class Scanner      

%{
  Token token;
%}

/* 
 * Macros 
 */
BRANCO = [ \t\n\r]+
PONTOEVIRGULA = ";"
ABREPARENTESE = "("
FECHAPARENTESE = ")"
ABRECHAVE = "{"
FECHACHAVE = "}"
SOMA = "+"
INCREMENTO = "++"
ADICAOATRIB = "+="
ATRIBUICAO = "="
COMPARACAO = "=="
MENORIGUAL = "<="
MAIORIGUAL = ">="
MENOR = "<"
MAIOR = ">"
INTEIRO = 0|[1-9][0-9]*
ID = [_a-zA-Z][_a-zA-Z0-9]*

%%

/*  
 * Regras léxicas 
 */

"int"              { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada int"); token.imprimir(); }
"main"             { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada main"); token.imprimir(); }
"while"            { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada while"); token.imprimir(); }
"return"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada return"); token.imprimir(); }
"printf"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada printf"); token.imprimir(); }

{ABREPARENTESE}    { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
{FECHAPARENTESE}   { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
{ABRECHAVE}        { token = new Token(yyline, yycolumn, yytext(), "Abre chave"); token.imprimir(); }
{FECHACHAVE}       { token = new Token(yyline, yycolumn, yytext(), "Fecha chave"); token.imprimir(); }

{PONTOEVIRGULA}    { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }

{ADICAOATRIB}      { token = new Token(yyline, yycolumn, yytext(), "Atribuição com soma (+=)"); token.imprimir(); }
{INCREMENTO}       { token = new Token(yyline, yycolumn, yytext(), "Incremento (++)"); token.imprimir(); }
{SOMA}             { token = new Token(yyline, yycolumn, yytext(), "Operador de soma"); token.imprimir(); }

{ATRIBUICAO}       { token = new Token(yyline, yycolumn, yytext(), "Atribuição"); token.imprimir(); }
{COMPARACAO}       { token = new Token(yyline, yycolumn, yytext(), "Comparação (==)"); token.imprimir(); }
{MENORIGUAL}       { token = new Token(yyline, yycolumn, yytext(), "Operador <= "); token.imprimir(); }
{MAIORIGUAL}       { token = new Token(yyline, yycolumn, yytext(), "Operador >= "); token.imprimir(); }
{MENOR}            { token = new Token(yyline, yycolumn, yytext(), "Operador < "); token.imprimir(); }
{MAIOR}            { token = new Token(yyline, yycolumn, yytext(), "Operador > "); token.imprimir(); }

{BRANCO}           { /* ignora espaços */ }

{INTEIRO}          { token = new Token(yyline, yycolumn, yytext(), "Número inteiro"); token.imprimir(); }
{ID}               { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }

.                  { token = new Token(yyline, yycolumn, yytext(), "Caractere inválido"); token.dispararExcecao(); }
