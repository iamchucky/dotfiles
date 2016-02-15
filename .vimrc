set nocompatible
filetype off

" ========================================
"         General
" ========================================

" --- From http://nvie.com/posts/how-i-boosted-my-vim/
set hidden        " Allows you to exit when using hidden buffers
set nowrap        " Don't wrap lines
set tabstop=2     " A tab is four spaces
set backspace=indent,eol,start
                  " Allow backspacing over everything in insert mode
set expandtab
set autoindent    " Always set autoindenting on
set copyindent    " Copy the previous indentation on autoindenting
set number        " Always show line numbers
set shiftwidth=2  " Number of spaces to use for autoindenting
set shiftround    " Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " Set show matching parenthesis
set ignorecase    " Ignore case when searching
set smartcase     " Ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " Insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " Highlight search terms
set incsearch     " Show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set laststatus=2  " Always show the statusline


" Set the color scheme background properly?
hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

" ========================================
"         Keymaps
" ========================================

" Efficiency
inoremap kj <esc>
noremap ; :
let mapleader=","

" Quick edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Movement mappings
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
nnoremap <Space> 10jzz
nnoremap <BS> 10kzz

" Disable auto indent locally
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Clear search highlights with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Use w!! to write with sudo
cmap w!! w !sudo tee % >/dev/null

set pastetoggle=<C-p>

" Insert single character in normal mode
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Rebinds for EasyMotion
let g:EasyMotion_leader_key = ','

" Easy open terminal
cmap bh ConqueTerm bash

" ========================================
"         Colors
" ========================================

" hi link EasyMotionTarget TODO
" hi EasyMotionTarget ctermbg=none ctermfg=Folded
" hi EasyMotionShade  ctermbg=none ctermfg=blue

" Load font if enough colors are supported
if &t_Co >= 256 || has("gui_running")
   colorscheme molokai
   let g:rehash256 = 1
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

let g:neocomplcache_enable_at_startup = 1

let g:airline_theme = 'powerlineish'

set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=~/vimfiles/bundle/Vundle.vim/
"let path='~/vimfiles/bundle'
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'hdima/python-syntax'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on

let g:netrw_liststyle=3
set enc=utf-8
set fileencoding=utf-8
au BufNewFile,BufReadPost *.jade set filetype=jade
