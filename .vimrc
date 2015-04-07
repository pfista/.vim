set nocompatible " be iMproved
filetype off " required

"Required for Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " Let vundle manage itself

" All my bundles
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set noshowmode

let g:YUNOcommit_after = 20

let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=1
let g:airline_detect_paste=1
let g:airline_theme='powerlineish'

"Force markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set modelines=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

"set undofile -creates a file when you edit that allows undoing after closing the file <FILENAME>.un~
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set noswapfile
set nobackup

" Disable arrow keys :)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"this clears out a search to get rid of highlighting once you have found what you are looking for
nnoremap <leader><space> :noh<cr> 

" remap escape key
imap sdf <Esc>
vmap sdf <Esc>  " escape in visual mode

" handle long lines correctly
set wrap
set textwidth=80
"set formatoptions=qrn1
set colorcolumn=81

" make ; map to : so its quicker to save files
nnoremap ; :
inoremap <C-Z> <ESC>
vnoremap <C-Z> <ESC>

" autosave when window loses focus au FocusLost * :wa
set nu
set backupdir=~/.vim/backup

"Colorscheme
syntax on
syntax enable
colorscheme molokai 

" Toggle between dark and light backgrounds
map <leader>x :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Make NERDTree close when vim when its the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Map window movement
map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-N> <Esc>:NERDTreeTabsToggle<CR>

"Map tab movement
map <C-U> gT 
map <C-I> gt 

"Look for .vimrc changes and autoload them to open vim instances
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Saves folds and cursor position when saving or exiting vim
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
