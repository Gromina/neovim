" General settings
" ================

set nocompatible " vim mode
set cursorline " highlight current line
set ttyfast
set encoding=utf-8
set termencoding=utf-8
let loaded_netrw = 1 "fuck netrw
language C "use C locale to avoid localized warnings

set langmap=ё`йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж\\;э'яzчxсcмvиbтnьmб\\,ю.Ё~ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э\\"ЯZЧXСCМVИBТNЬMЮ>Б<

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


" leader keys
let mapleader = ','
let maplocalleader = '  ' " tab key

if has('mac')
  set macmeta "command and alt keys should mean the same
endif

" history/undo settings
set history=500
set timeoutlen=250
set undolevels=100

" respect modeline
set modeline
set modelines=5   " default numbers of lines to read for modeline instructions

" backups and swap files
set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile
set hidden

" search settings
set smartcase
set ignorecase
set incsearch
set nohlsearch

" Text editing options
" ====================

" swap settings
set nowrap
set textwidth=0
set sidescroll=5
set sidescrolloff=5
set listchars=extends:>,precedes:<

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

set backspace=indent,eol,start

" indent settings
set autoindent
"set foldmethod=indent


" Visual settings
" ===============
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set mouse=a
set mousehide
set showmatch " show brackets matches
set number " show line numbers
set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

" disable window flashing
set noerrorbells
set visualbell
set t_vb=
set hid

" status line
set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

" show tabs
set list
set listchars=tab:>-
set listchars+=trail:·
set listchars+=extends:»,precedes:«

"highlight unnecessary spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" File type settings
" ==================

"autocmd BufNewFile,BufRead *Cakefile set filetype=coffee

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Hot Keys
" ========

" buffer movement
nmap <M-k> :bn!<CR>
nmap <M-j> :bp!<CR>
nmap <leader>k :bn!<CR>
nmap <leader>j :bp!<CR>
nmap <leader>- :Bdelete<CR>
nmap <leader>e :NERDTree<CR>
nmap + :EasyBufferToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin(stdpath('data') . '/plugged')
"call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'troydm/easybuffer.vim'
Plug 'bronson/vim-visual-star-search'

Plug 'kien/ctrlp.vim'"
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_cmd = 'CtrlP %{getpwd()}'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plug 'scrooloose/nerdcommenter'

"Syntax / Languages

" js, react
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" theming
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline' "В список плагинов


" Initialize plugin system
call plug#end()

"airline
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу
