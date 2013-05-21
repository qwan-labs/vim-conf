set nocompatible               " be iMproved
filetype off                   " required!

let mapleader = "\\"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/searchfold.vim'
Bundle 'tpope/vim-endwise'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/gist-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-commentary'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/taglist.vim'
Bundle 'mattn/webapi-vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/SuperTab'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/CSApprox'
Bundle "nanotech/jellybeans.vim"
Bundle 'altercation/vim-colors-solarized'
Bundle 'railscasts'
Bundle 'endel/vim-github-colorscheme'

set number
syntax on
set autoread " Automatically reload changes if detected
set ruler
set encoding=utf8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile}    set ft=ruby
"
" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()

" Yaml Configuration
au BufRead,BufNewFile *.{yml,yaml} set foldmethod=indent

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1


" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1


" Use modeline overrides
set modeline
set modelines=10


" Show (partial) command in the status line
set showcmd
" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 1

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Patter ignore when use the completion in search file
set wig=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3

" No save backup by .swp
set nowb
set noswapfile
set noar

" Delete all whitespace in end of line
" autocmd BufWritePre * :%s/\s\+$//e

" Autocomplete Fabricator gem
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" Autocomplete Fabricator gem
autocmd User Rails Rnavcommand decorator app/decorators -suffix=_decorator.rb -default=model()

" SuperTab completion
let g:SuperTabMappingForward='<tab>'
let g:SuperTabMappingBackward='<s-tab>'

let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:solarized_termcolors=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Default color scheme
set background=light
color solarized

let Tlist_Auto_Update = 'true'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"spell check when writing commit logs
autocmd filetype svn,*commit* set spell

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Handle TERM quirks in vim
if $TERM =~ '^screen-256color'
  set t_Co=256
  nmap <Esc>OH <Home>
  imap <Esc>OH <Home>
  nmap <Esc>OF <End>
  imap <Esc>OF <End>
endif
