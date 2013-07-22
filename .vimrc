syntax on

set autoindent

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

imap jj <Esc>

"highlight bad whitespace (for Python)
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.rst match BadWhitespace /*\t\*/
au BufRead,BufNewFile *.rst match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py match BadWhitespace /*\t\*/
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

"PEP8 checker for .py files
au BufWritePost *.py !pyflakes %
au BufWritePost *.py !pep8 %

set number

set vb
