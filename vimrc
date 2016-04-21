" cd1ftyz's vimrc

"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plugged')

" Plug 'Townk/vim-autoclose'

Plug 'ervandew/matchem'

call plug#end()

""""""""""""""""
" UI && COLORS "
""""""""""""""""

" use color coded syntax
syntax enable

" no ruler
set noruler

" set colorscheme
colorscheme dawn

" enable line numbers
set number

" enable hilighting the cursor line
set cursorline

" highlight as characters are typed
set incsearch

" Turn match hilighting off
let loaded_matchparen = 1 

" disable startup message
set shortmess+=I

"""""""""""""""
" SET OPTIONS "
"""""""""""""""

filetype plugin indent on

" Use spaces instead of tabs
set expandtab

" set case-unsensitive searching
set ignorecase

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" set cursor t0 be 5 lines when scrolling
set so=5

" persistent undo
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" set persistent undo
set undofile

" set undo directory
set undodir=$HOME/.vim/undo

" save 1000 undos
set undolevels=1000

" no auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufNewFile *.c 0r ~/.vim/c.skel
au BufNewFile *.html 0r ~/.vim/html.skel

autocmd FileType lisp nnoremap <buffer> <F9> :exec '!clear; clisp' shellescape(@%, 1)<cr>

""""""""""""
" (RE)MAPS "
""""""""""""

" leader (for custom commands) is comma
let mapleader = ","

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" hjkl 4eva

" disable ex mode
nnoremap Q <nop>

" jk in insert mode enters normal mode
inoremap jk <ESC>

" j and k (up and down) can navigate long lines easierly
map j gj
map k gk

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" ,/ clears search buffer
nmap <silent> ,/ :nohlsearch<CR>

" ctrl-hjkl switches panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

func! WordProcessorMode()
    setlocal spell spelllang=en_us
    set nonumber
    syntax off
endfu
com! WM call WordProcessorMode()

func! ProgrammingMode()
    setlocal spell! spelllang=en_us
    set number
    syntax on
endfu
com! PM call ProgrammingMode()
