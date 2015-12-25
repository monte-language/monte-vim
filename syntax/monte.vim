" Vim syntax file
" Language: Monte
" Maintainer: Corbin Simpson <cds@corbinsimpson.com>
" <http://github.com/MostAwesomeDude>
" Latest Revision: December 25 2015

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword monteKeyword as bind def else escape exit extends guards implements
syn keyword monteKeyword in method pass var via
syn keyword monteKeyword exports imports
syn keyword monteNew fn interface object to
syn keyword monteConditional catch if finally for match switch try when while
syn keyword monteControl break continue return

" Names that are also literals
syn keyword monteBool true false
syn keyword monteDouble NaN Infinity
syn keyword monteNull null

" Literal ints
syn match monteInt '\d\+'
syn match monteInt '0x[0-9a-fA-F]\+'

" Literal strings
syn region monteStr start='"' skip='\(\\\"\)\|\(\\\\\)' end='"' contains=monteEscape
syn region monteChar start='\'' skip='\(\\\'\)\|\(\\\\\)' end='\'' contains=monteEscape

" Literal escapes
syn match monteEscape '\\[\\bfnrt]' contained
syn match monteEscape '\\x[a-fA-F0-9]\{2\}' contained
syn match monteEscape '\\u[a-fA-F0-9]\{4\}' contained
syn match monteEscape '\\U[a-fA-F0-9]\{8\}' contained

" Quasiliteral strings
syn region monteStr start='`' end='`' contains=monteHole,monteQLEscape

" Quasiliteral holes
syn match monteHole '\$\w\+' contained
syn match monteHole '\${[^}]\+}' contained
syn match monteHole '@\w\+' contained
syn match monteHole '@{[^}]\+}' contained

" Quasiliteral escapes
syn match monteQLEscape '\$\\[rn]' contained
syn match monteQLEscape '\$\\x[a-fA-F0-9]\{2\}' contained
syn match monteQLEscape '\$\\u[a-fA-F0-9]\{4\}' contained
syn match monteQLEscape '\$\\U[a-fA-F0-9]\{8\}' contained

" Universal scope
syn keyword monteGuard List Map NullOk Pair Same Set
syn keyword monteGuard Any Bool Bytes Char Empty Double Int Str Void
syn keyword monteGuard Tag Term
syn keyword monteGuard Near
syn keyword monteGuard Selfless DeepFrozen SubrangeGuard

" Identifiers
syn match monteIdentifier '[a-zA-Z_][a-zA-Z0-9_]*'

" Operators
" Remember: Vim says that the *last* match wins. Not the first.
syn match monteOperator ' \/'
syn match monteOperator ' \/\/'
syn match monteOperator ' [~!%^|&*-+<>]'
syn match monteOperator ' >>'
syn match monteOperator ' <<'
syn match monteOperator ' \/\/='
syn match monteOperator ' \*\*='
syn match monteOperator ' [!=]\~'
syn match monteOperator ' [~!%^|&*-=+:<>]='
syn match monteOperator ' >>='
syn match monteOperator ' <<='
" No leading space required for sends.
syn match monteOperator '<-'
syn match monteOperator ' ->'
syn match monteOperator ' <=>'
syn match monteOperator ' &&'
syn match monteOperator ' &!'
syn match monteOperator ' ||'
syn match monteOperator ' \*\*'
syn match monteOperator '\w\+='

" Pairs
syn match montePair '=>'

" Errors
syn match monteEqualError ' =[^~=>]'

" Comments
syn match monteComment '#.*$'
syn region monteComment start=" */\*\*" end="\*/"

let b:current_syntax = "monte"

hi def link monteComment Comment
hi def link monteKeyword Keyword
hi def link monteNew Keyword
hi def link monteConditional Conditional
hi def link monteControl Conditional
hi def link monteBool Boolean
hi def link monteInt Number
hi def link monteDouble Float
hi def link monteNull Special
hi def link monteStr String
hi def link monteChar Character
hi def link monteEscape SpecialChar
hi def link monteHole Identifier
hi def link monteQLEscape SpecialChar
hi def link monteGuard Type
hi def link monteOperator Operator
hi def link montePair Delimiter
hi def link monteEqualError Error
" hi def link monteIdentifier Identifier

" Foldable regions, based on braces.
" syn region monteFold start="{" end="}" transparent fold
" syn sync fromstart
" set foldmethod=syntax

" Multiline strings are common in Monte.
syntax sync minlines=42
