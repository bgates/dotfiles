filetype off
set nocompatible

" Setting up Vundle - the vim plugin bundler --------------------------{{{
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-ragtag'
    Bundle 'tpope/vim-commentary'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-bundler'
    Bundle 'tpope/vim-rails'
    Bundle 'tpope/vim-endwise'
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'kana/vim-arpeggio'
    Bundle 'mileszs/ack.vim'
    Bundle 'rking/ag.vim'
    Bundle 'vim-scripts/surround.vim'
    Bundle 'SirVer/ultisnips'
    Bundle 'Townk/vim-autoclose'
    Bundle 'wincent/Command-T'
    Bundle 'ervandew/supertab'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'ap/vim-css-color'
    Bundle 'slim-template/vim-slim'
    Bundle 'sunaku/vim-ruby-minitest'
    Bundle 'chrisbra/histwin.vim'
    Bundle 'elixir-lang/vim-elixir'
    Bundle 'KabbAmine/vCoolor.vim'

    " This is just for console vim
"    Bundle 'vim-scripts/CSApprox'
    "...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" }}} Setting up Vundle - the vim plugin bundler end
" syntax, filetype, mapleader, etc {{{
call arpeggio#load()
let mapleader=","
let maplocalleader="-"
noremap \ ,
syntax on
filetype plugin indent on
runtime macros/matchit.vim
" }}} end syntax etc
" tab settings --{{{
set tabstop=2
set softtabstop=2
set smarttab
set shiftwidth=2
set expandtab
" }}} end tab settings
" general settings ---{{{
set autoindent
set autowrite
set backspace=indent,eol,start
set confirm
set encoding=utf-8
set guioptions-=T
set hidden
set laststatus=2
set mouse=a
set nomodeline
set relativenumber
set scrolloff=30
set showcmd
set virtualedit=all
set wrap
" }}} end general settings
" wildmenu settings ---------{{{
set history=1000
set wildmenu
set wildmode=longest,list,full
set wildignore=*.git,*.log,*.*~,tmp/*
" }}} end wildmenu
" persistent undo settings ---{{{
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000 "maximum number lines to save for undo on buffer reload
" }}} end persistent undo
" search settings --{{{
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}} end search settings
" statusline settings ------------------------{{{
set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator 
set statusline+=%y        " Filetype
set statusline+=%=        " Switch to the right
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
" }}} end statusline
" mappings -----------------------{{{
" search w normal regex, not vim's crazy scheme
nnoremap / /\v
vnoremap / /\v
" clear highlighting
nnoremap <leader><space> :noh<cr>
" use tab to find matching brackets
nnoremap <tab> %
vnoremap <tab> %
" leave insert mode the easy way, not the hard way
inoremap jj <Esc>
inoremap <Esc> <nop>
" copy to end of line
nnoremap Y y$
" move to begin/end of line
nnoremap H ^
nnoremap L $
" make default up/down go into wrapped line instead of skipping past
nnoremap j gj
nnoremap gj j 
nnoremap k gk
nnoremap gk k 
" save a keystroke to switch windows
nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l        
" save office-style; fewer keystrokes, but is it vim?
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
" TODO remove if it's true that autotest is deprecated
nnoremap <leader>err :cf /mtp/autotest.txt<cr> :compiler rubyunit<cr>
" change Ruby 1.8-style hashrocket to 1.9-style colon for hash symbol keys
nnoremap <leader>H :%s/:\(\w\+\) =>/\1:<CR>`` 
"strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> 
" open duplicate of current window next to it
nnoremap <leader>w <C-w>v<C-w>l
" operator-pending movements in/around parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap ar( :<c-u>normal! f(va(<cr>
" edit .vimrc
nnoremap <leader>v :tabedit $MYVIMRC<CR>
" write a copy of the current buffer into a file w the same name - why?
cnoremap w!! w !sudo tee % >/dev/null
" command shortcuts
nnoremap <leader>bu :!bundle<CR>
noremap <leader>f :CommandTFlush<CR>
" arpeggio mappings
Arpeggioinoremap ht <Esc>la
Arpeggioinoremap eu <left>
Arpeggioinoremap hs <Esc>A
Arpeggioinoremap au <Esc>I
Arpeggioinoremap gt <Esc>gt
Arpeggioimap vz <Esc>A<CR>
Arpeggioinoremap mw <Esc>$jo<CR>
" surround line w erb <%= %> or <% %>
Arpeggioimap pe <Esc>yss=$
Arpeggioimap jk <Esc>yss-$
let g:arpeggio_timeoutlens = { 'h': 20}
" }}} end mappings
" abbreviations --{{{
iabbrev adn and
iabbrev teh the
iabbrev fro for
" iabbrev @@ briandotgates@gmail.com
iabbrev ccopy Copyright 2013 Brian Gates, all rights reserved.
" }}} end abbreviations 
" UltiSnips -----------------------------------------------------{{{
py import sys; sys.path.append('/home/bgates/.vim/python')
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDir="~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/UltiSnips"]
" }}} end UltiSnips
" global variables -----------------{{{
let g:surround_61 = "<%= \r %>" "=
let g:surround_45 = "<% \r %>" "-
let g:ragtag_global_maps = 1
let g:CommandTMaxFiles=50000
let g:AutoCloseExpandSpace = 0
" }}} end global variables
" Vimscript file settings ---------------------{{{
augroup filetype_vim
  autocmd!
  autocmd BufWritePost .vimrc source %
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" visual settings, colorscheme, terminal, etc---------{{{
if has('gui_running') == 0
"  set t_Co=256  http://stackoverflow.com/questions/2200924/vim-ruby-syntax-coloring-messes-up-terminal-colors-on-exiting-vim-in-gnu-screen
  colorscheme ekvoli256
"  set background=dark
  highlight SpellBad term=underline gui=undercurl guisp=Orange
  set colorcolumn=85
  set vb t_vb=
"  set lines=60
  set columns=80
" http://superuser.com/questions/559041/vim-backgroundcolor-in-tmux-how-to-force-zsh-to-use-screen-instead-of-xterm-in?rq=1
  set t_ut=
else
  if exists("+lines")
    set lines=60
  endif
  if exists("+columns")
    set columns=80
  endif
endif
" }}} end visual settings 
" ToggleSpell function ---------{{{
function! ToggleSpell()
  if !exists("b:spell")
    setlocal spell spellang=en_us
    let b:spell=1
  else
    setlocal nospell
    unlet b:spell
  endif
endfunction
" }}} end function

compiler rubyunit
command! -bar -nargs=1 OpenURL :!sensible-browser <args> &
function! OpenURL(url)
  command -bar -nargs=1 OpenURL :!sensible-browser <args> &
endfunction

:command! -bar -nargs=0 Test !autotest &>tmp/autotest.out &

augroup comments
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<Esc>
  autocmd FileType ruby       nnoremap <buffer> <localleader>c I#<Esc>
augroup END

augroup md
  autocmd!
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^\\(==\\+\\)\\|\\(--\\+\\)$\r:nohlsearch\rkvg_"
augroup END

"map <tab> <tab><C-O>:AutoCloseOn<CR>
" https://github.com/Townk/vim-autoclose
