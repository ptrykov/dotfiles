"Vim bundle configuration
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'  
Bundle 'tpope/vim-endwise'  
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'garbas/vim-snipmate'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'honza/snipmate-snippets' 
Bundle 'rgarver/Kwbd.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'ap/vim-css-color'
Bundle 'mattn/gist-vim'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/ZoomWin'

"Langs
Bundle 'pangloss/vim-javascript'
Bundle "kchmck/vim-coffee-script"
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
Bundle 'skwp/vim-rspec'
Bundle 'vim-ruby/vim-ruby'

"Colors
Bundle 'larssmit/vim-getafe'
Bundle 'telamon/vim-color-github'
Bundle 'TechnoGate/janus-colors'
Bundle 'vim-scripts/molokai'
Bundle 'vim-scripts/Color-Sampler-Pack'
Bundle 'altercation/vim-colors-solarized'

" vim-scripts repos
Bundle 'closetag.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""
"" Basic Setup
""

set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp886
set fileformat=unix
set ffs=unix,mac,dos
set showcmd           "the bottom line will show you information about the current command going on
set showmatch         "highlights the matching braces|brackets|parens when the cursor is on a bracket
set ls=2              "This makes Vim show a status line even when only one window is shown 
set confirm
set visualbell
set hidden            "enable unsaved buffers
set cursorline
set cursorcolumn
set pastetoggle=
set autoread          "When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again
set splitbelow
set splitright
set history=128
set undolevels=1000
set scrolljump=7
set scrolloff=7
set ch=1             "Number of screen lines to use for the command-line
set t_Co=256
set wildmode=longest,list,full "normal autocompletion
set wildmenu

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

""
"" GUI options
""
if has("gui_macvim") && has("gui_running")
  set guifont=Monaco:h13
else
  set guifont=Droid\ Sans\ Mono\ 13
endif
set guioptions=fatige "Tm "see help for more options
if has('gui_running')
  set bg=light
  colorscheme solarized
else
  colorscheme molokai
endif

"Gist prefs
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chromium %URL% &'
let g:gist_show_privates = 1
"let g:github_user = 
"let g:github_token = 

"Statusline
set statusline=%<\ %f\ lines:%L\ %m%r%y\ %{fugitive#statusline()}\ %=%-14.(format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ l,c=%l,%c%V\ %P%)

" Start the status line
"set statusline=%f\ %m\ %r
"set statusline+=Line:%l/%L[%p%%]
"set statusline+=Col:%v
"set statusline+=Buf:#%n
"set statusline+=[%b][0x%B]



""
"" File types
""

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " This actually might be confusing, but the plugin +ruby+ already does
  " this, so we want to do it only if the plugin +ruby+ is disabled for
  " some reason

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif
endif

""
"" Mappings
""

cmap w!! %!sudo tee > /dev/null %

nmap <silent> <Leader>ct :CommandT<CR>

nmap <C-n> :tabnew<CR>
imap <C-n> <Esc>:tabnew<CR>a
nmap <D-n> :tabnew<CR>
imap <D-n> <Esc>:tabnew<CR>a

"NERD Tree
map <F2> <ESC>:NERDTreeToggle<CR>
nmap <F2> <ESC>:NERDTreeToggle<CR>
imap <F2> <ESC>:NERDTreeToggle<CR>i

"Clipboard
vmap <C-c> "+yi
imap <C-v> <Esc>"+p
nmap <C-v> "+p



""
"" Janus mappings
""

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i
 
  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

"Toggle comments
map <leader>/ :NERDCommenterToggle<CR>
imap <leader>/ <Esc>:NERDCommenterToggle<CR>

"Gundo window
map <F5> :Gundotoggle<CR>
imap <F5> <Esc>:Gundotoggle<CR>

"Kill all :-)
nmap <C-W>! :Kwbd

"Syntastic prefs
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

"Show tagbar
map <Leader>rt :TagbarToggle<CR>

"ZoomWin
map <leader>zw :ZoomWin<CR>

"CTAGS Jump
map <leader>tv :vsp <CR>:exec("tj ".expand("<cword>"))<CR>
map <leader>tt :tab split<CR>:exec("tj ".expand("<cword>"))<CR>
map <C-CR> <C-W>gf
map <F10> :!ctags -f ./tmp/tags --append=yes -R --langmap="ruby:+.rake.builder.rjs" --languages=-javascript `rbenv prefix`
