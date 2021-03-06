"setting encoding as pre urxvt termingal
set encoding=utf-8  " always encode in utf
set nocompatible    " use vim defaults instead of vi

" -- Plugins -- "
" File detection
execute pathogen#infect()
"----For java completion
"autocmd FileType java setlocal omnifunc=javacomplete#Complete


" -- Mappings -- "
let mapleader = ','
filetype plugin indent on
syntax on

let g:syntastic_auto_jump=3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let java_comment_strings=1
let java_highlight_java_lang_ids=1

""Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

"binding key to compiel to the java files
map qq :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!clear && echo '>----Compiling------>' && javac % && echo '>---->Running------->' && java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'html'
    exec "!chromium % &"
elseif &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
endif
endfunc

" General
set directory^=$HOME/backups/  " put all swap files together in one place
set backspace=2                " enable <BS> for everything
set completeopt-=preview       " dont show preview window
set fillchars+=vert:\          " empty space instead of broken line for vsplits 
set hidden                     " hide when switching buffers, don't unload
set laststatus=2               " always show status line
set lazyredraw                 " don't update screen when executing macros
"set mouse=a                    " enable mouse in all modes
set wrap                       " word wrap
set linebreak                  " attempt to wrap lines cleanly
"set number                     " show line numbers
"set relativenumber             " show relative number
set cursorline                 " highlight cursor line
set title                      " use filename in window title
set ttyfast                    " you've got a fast terminal

" Folding
set foldignore=                " don't ignore anything when folding
set foldlevelstart=99          " no folds closed on open
set foldmethod=marker          " collapse code using markers

" Tabs
set autoindent                 " copy indent from previous line
set expandtab                  " replace tabs with spaces
set shiftwidth=4               " spaces for autoindenting
set smarttab                   " <BS> removes shiftwidth worth of spaces set softtabstop=2              " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                  " spaces for <Tab>

" Searches
set hlsearch                   " highlight search results
set incsearch                  " search whilst typing
set ignorecase                 " case insensitive searching
set smartcase                  " override ignorecase if upper case typed
set showcmd                    " show command on last line of screen
set showmatch                  " show bracket matches
set textwidth=0                " don't break lines after some maximum width
set wildmenu                   " enhanced cmd line completion
set ruler                      " shows ruler

colorscheme wal 

" Paste from PRIMARY and CLIPBOARD
inoremap <silent> <M-v> <Esc>"+p`]a
  inoremap <silent> <S-Insert> <Esc>"*p`]a
endif

" vimdiff
if &diff
  set diffopt=filler,foldcolumn:0
endif


" Exit insert mode
inoremap jj <esc>

"Toogle Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Toggle fold
nnoremap <space> za

" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Toggle hlsearch for current results
nnoremap <leader><leader> :nohlsearch<CR>

"Toogle Tabs 
nnoremap T :tabnew<CR>

"Alt-h to move to lefttab
noremap <A-h> gT<Esc>
"Alt-k to move to right tab
noremap <A-l> gt<Esc>

" Insert newline in normal mode
map <S-Enter> O<Esc>

map <CR> o<Esc>

" Search for trailing whitespace
nnoremap <leader>w /\s\+$<CR>


" Toggle method used for folding
nnoremap <leader>m :call ToggleFoldMethod()<CR>

" Paste mode for terminals
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<F2>


" Insert current date and time
nnoremap <leader>d "=strftime("%d %b, %Y %X")<CR>p
nnoremap <leader>D "=strftime("%d %b, %Y %X")<CR>P

" Shortcut for Tabularize
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

" repeat operator in visual selection
vnoremap . :normal .<CR>

" Search and open buffer, files, recent
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>

" -- Functions -- "

function! ToggleFoldMethod()
if &foldmethod == 'indent'
  set foldmethod=marker
  echo "foldmethod=marker"
else
  set foldmethod=indent
  echo "foldmethod=indent"
endif
endfunction

" For powerline
" set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim/
" Always show statusline

"" COLORS
set background=dark         

""" AIRLINES themes
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='distinguished'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" --python
nnoremap <leader>c  :exec '!python3' shellescape(@%, 1)<cr>

" TABS
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 :tablast<CR>
map <S-.> :tabnext<CR> 
map <S-,> :tabprevious<CR>

"" SPLITS
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"" DELIMATE 
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1
set clipboard=unnamedplus

"" Themes
:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=Black ctermbg=Red
:hi TabLineSel ctermfg=Red ctermbg=Black
:hi Title ctermfg=LightBlue ctermbg=Magenta

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
