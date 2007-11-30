" TI-99/4-style BASIC Syntax
"
" Language:    TI-BASIC
" Maintainer:  Tim Hentenaar <tim@hentenaar.com>
" Last Change: Fri Dec 1 2007 12:53:00 AM
" Version:     1.0
"
" Description:
" 	Based on the Beginner's Basic and Extended Basic References
" 	Circa 1981.
"

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" File numbers
syn match   tiFileNumber	"#\d+"

" Operators
syn match   tiOperator		"[<>+\*^/=-]"

" Numbers
syn match   tiNumber		"\<\d\+\>"
syn match   tiNumber		"\<\d\+\>\.\<\d\+\>"

" Variable Identifiers
syn match   tiVar		"\<[a-zA-Z_][a-zA-Z0-9_]*\>\$\?"

" Line numbers
syn region  tiLineNumber	start="^\s*[0-9]" end="\s"

" Comments
syn region  tiComment		start="^\s*[Rr][Ee][Mm]\s" end="$"
syn region  tiComment		start=":\s*[Rr][Ee][Mm]\s" end="$"

" Strings
syn region  tiString		start=+"+ skip=+\\\\\|\\"+ end=+"+ 

" Statements
syn case ignore

syn keyword tiStatement		ACCEPT AND CALL CLOSE DATA DEF DIM DISPLAY END FOR TO STEP NEXT GOSUB GOTO 
syn keyword tiStatement		IF THEN ELSE IMAGE INPUT LET LINPUT NEXT OPEN OR PRINT RANDOMIZE READ RESTORE
syn keyword tiStatement		RETURN STOP SUB SUBEND SUBEXIT 
syn region  tiStatement		start="[Oo][Nn]\W" end="[Bb][Rr][Ee][Aa][Kk]"
syn region  tiStatement		start="[Oo][Nn]\W" end="[Ee][Rr][Rr][Oo][Rr]"
syn region  tiStatement		start="[Oo][Nn]\W" end="[Gg][Oo][Ss][Uu][Bb]"
syn region  tiStatement		start="[Oo][Nn]\W" end="[Gg][Oo][Tt][Oo]"
syn region  tiStatement		start="[Oo][Nn]\W" end="[Ww][Aa][Rr][Nn][Ii][Nn][Gg]"
syn region  tiStatement		start="[Oo][Pp][Tt][Ii][Oo][Nn]\W" end="[Bb][Aa][Ss][Ee]"
syn region  tiStatement		start="[Dd][Ii][Ss][Pp][Ll][Aa][Yy]\W" end="[Uu][Ss][Ii][Nn][Gg]"
syn region  tiStatement		start="[Pp][Rr][Ii][Nn][Tt]\W" end="[Uu][Ss][Ii][Nn][Gg]"
syn region  tiStatement		start="[Ii][Nn][Pp][Uu][Tt]\W" end="[Rr][Ee][Cc]"

" Subroutines
syn keyword tiSub		CHAR CHARPAT CHARSET CLEAR COINC COLOR DELSPRITE ERR GCHAR HCHAR INIT JOYST KEY
syn keyword tiSub		LINK LOAD LOCATE MAGNIFY MOTION PATTERN PEEK POSITION SAY SCREEN SOUND SPGET  
syn keyword tiSub		SPRITE VCHAR VERSION

" Functions
syn keyword tiFunction		ABS ASC COS EOF EXP INT LEN LOG MAX MIN PI POS REC RND SIN SQR TAB TAN VAL
syn region  tiFunction		start="\(chr\|rpt\|seg\|str\)" end="\$"

if version >= 508 || !exists("did_mysql_syn_inits")
	if version < 508
		let did_ti_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink tiStatement		 Statement
	HiLink tiSub			 Type
	HiLink tiFunction		 Special
	HiLink tiFileNumber		 Identifier
	HiLink tiString			 String
	HiLink tiNumber			 Number
	HiLink tiOperator		 Operator
	HiLink tiComment		 Comment
	HiLink tiLineNumber		 Comment
	HiLink tiVar			 Identifier
	delcommand HiLink
endif

let b:current_syntax = "tibasic"

