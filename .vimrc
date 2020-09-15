set nocompatible

syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
set noerrorbells visualbell t_vb=
set mouse+=a
set nu
set nowrap
set noswapfile

let mapleader = ","

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'dense-analysis/ale'
Plug 'jupyter-vim/jupyter-vim'

call plug#end()

nmap Q <Nop>

" Dont use arrows
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Enable folding with the spacebar
nnoremap <C-,> za

set tabstop=2
set softtabstop=2

set colorcolumn=80

set splitbelow
set splitright

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Switch buffers
nnoremap <leader>l :buffers<CR>:buffer<Space>
nnoremap <leader>d :bp<cr>:bd #<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>

set background=dark
colorscheme gruvbox

map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
 
set shellcmdflag=-ic

" https://realpython.com/vim-and-python-a-match-made-in-heaven/
"au BufNewFile,BufRead *.py
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

set clipboard=unnamed

let g:ale_linters = {'python': ['pycodestyle', 'flake8', 'bandit']}
let g:ale_fixers = {'python': ['black', 'isort']}
"let g:ale_python_pylint_options = '--load-plugins pylint'
let g:ale_fix_on_save = 1

nnoremap <buffer> <leader>C :JupyterConnect<CR>
nnoremap <buffer> <leader>f :JupyterRunFile<CR>
nnoremap <buffer> <leader>c :JupyterSendCell<CR>

autocmd TextChanged,TextChangedI <buffer> silent write
