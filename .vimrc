" vim.rc by Thomas Steinholz
" ------------------------------------------------------------------------------
" ViM!
" <Leader> : Space Key
" F2  : Toggle Paste Mode
" F3  : Undo Tree
" F4  : Toggle Spell Check
" F8  : New Tab
" F9  : Previous Tab
" F10 : Next Tab
" zo  : Open Fold
" zc  : Close Fold
" zR  : Remove all Folds
"
" NerdTree!
" Ctrl-t : Open Nerd Tree
" Ctrl-f : Focus Nerd Tree
"
" Bookmarks!
" mm  : Add/remove bookmark at current line mm  :BookmarkToggle
" mi  : Add/edit/remove annotation at current line  mi  :BookmarkAnnotate <TEXT>
" mn  : Jump to next bookmark in buffer mn  :BookmarkNext
" mp  : Jump to previous bookmark in buffer mp  :BookmarkPrev
" ma  : Show all bookmarks (toggle) ma  :BookmarkShowAll
" mc  : Clear bookmarks in current buffer only  mc  :BookmarkClear
" mx  : Clear bookmarks in all buffers  mx  :BookmarkClearAll
" mkk : Move up bookmark at current line    mkk :BookmarkMoveUp
" mjj : Move down bookmark at current line  mjj :BookmarkMoveDown
" - Save all bookmarks to a file        :BookmarkSave <FILE_PATH>
" - Load bookmarks from a file      :BookmarkLoad <FILE_PATH>
"
" Thesaurus!
" :Thesaurus word
"
" Working with Git!
" :Gita
"
" Personal Wiki!
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Follow/Create wiki link
" <Shift-Enter> -- Split and follow/create wiki link
" <Ctrl-Enter> -- Vertical split and follow/create wiki link
" <Backspace> -- Go back to parent(previous) wiki link
" <Tab> -- Find next wiki link
" <Shift-Tab> -- Find previous wiki link
"
" TMuX Naviagator!
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split
"
" Have not utilized!
" incsearch.vim

" Spell Check
" ------------------------------------------------------------------------------
if has("spell")
  " turn off spelling on by default
  "set spell

  " toggle spelling with F4 key
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10

  " Disable default thesaurus key map
  let g:online_thesaurus_map_keys = 0

endif

" Plugins
" ------------------------------------------------------------------------------
set shell=bash
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " required
call vundle#begin()        " required

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'elzr/vim-json'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'groenewege/vim-less'
Plugin 'kopischke/unite-spell-suggest'
Plugin 'SpellCheck'
Plugin 'szw/vim-tags'
Plugin 'numkil/ag.nvim'                   " Silver Searcher Support in ViM
Plugin 'itchyny/vim-cursorword'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'rafi/vim-tagabana'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lambdalisue/vim-gita'
Plugin 'mbbill/undotree'
Plugin 'Shougo/vinarise.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'thinca/vim-prettyprint'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-ref'
Plugin 'vimwiki/vimwiki'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'Raimondi/delimitMate'
Plugin 'rhysd/vim-clang-format'
Plugin 'severin-lemaignan/vim-minimap'

call vundle#end()            " required
filetype plugin indent on    " required

" Colors
" ------------------------------------------------------------------------------
syntax on                     " Enable Syntax Highlighting
set t_Co=256                  " Enable 256 Color Support
colorscheme synthwave         " deep-space - Old color scheme
let g:airline_powerline_fonts = 1 " Use Powerline Fonts

" Spaces and Tabs
" ------------------------------------------------------------------------------
set expandtab                 " Make Tabs Spaces
set tabstop=4                 " Make Tabs 4 Spaces Long Visually
set softtabstop=4             " Make Tabs 4 Spaces Long when Editing
set shiftwidth=4              " Indenting is 4 Characters

" UI Configuration
" ------------------------------------------------------------------------------
set number                    " Show Line Numbers
set cursorline                " Highlight the Line that is being edited
set mouse=nicr                " Add mouse capatablity with iTerm2
set wildmenu                  " Add a menu for vim's autocomplete
set spelllang=en              " Set the spell check language
set foldmethod=syntax

" Searching
" ------------------------------------------------------------------------------
set incsearch                 " search as characters are entered
set smartcase                 " case sensitive only if cased letters are used

" Clang Formatting
" ------------------------------------------------------------------------------
"let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "SortIncludes": "false",
            \ "BreakBeforeBraces": "Allman",
            \ "ColumnLimit": 120,
            \ "AlignAfterOpenBracket": "Align",
            \ "AlignTrailingComments": "true",
            \ "IndentWidth": 4,
            \ "IndentCaseLabels": "true",
            \ "PointerAlignment": "Right",
            \ "SpaceAfterCStyleCast": "true",
            \ "SpaceBeforeAssignmentOperators": "true",
            \ "SpaceBeforeParens": "ControlStatements",
            \ "UseTab": "Never",
            \ "AllowShortBlocksOnASingleLine": "false",
            \ "AllowShortCaseLabelsOnASingleLine": "false",
            \ "AllowShortFunctionsOnASingleLine": "false",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "BreakBeforeTernaryOperators": "true",
            \ }

" Advanced Vim Plugin Configuration
" ------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline#extensions#whitespace#enabled = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set laststatus=2

let mapleader = "\<Space>"

augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

let g:tmux_navigator_save_on_switch = 2

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Keymaps
" ------------------------------------------------------------------------------
set ttimeoutlen=50             " The Key delay for keymaps
map <C-t> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>
set pastetoggle=<f2>
nnoremap <F3> :UndotreeToggle<cr>
map <F8>  :tabe<CR>
map <F9>  :tabp<CR>
map <F10> :tabn<CR>
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
