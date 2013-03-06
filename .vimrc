"filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
filetype plugin indent on
filetype plugin on


set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

"set undofile -creates a file when you edit that allows undoing after closing the file <FILENAME>.un~
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set noswapfile
set nobackup
nnoremap <leader><space> :noh<cr> #this clears out a search to get rid of highlighting once you have found what you are looking for


" remap escape key
imap sdf <Esc>

" handle long lines correctly
set wrap
set textwidth=79
"set formatoptions=qrn1
set colorcolumn=85

" make ; map to : so its quicker to save files
nnoremap ; :
inoremap <C-Z> <ESC>

" autosave when window loses focus au FocusLost * :wa

set nu
set backupdir=~/.vim/backup

"Colorscheme
"colorscheme cloudMidnight
colorscheme molokai
syntax on

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

