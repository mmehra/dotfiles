"My preferences
set hidden
set nocompatible
set nohlsearch
set number
set showmatch
set autoindent
set smartindent
set cindent
set copyindent
set smarttab
set ruler
set incsearch
set ttyfast
set expandtab
set visualbell
set title
set noerrorbells
set nobackup
set noswapfile
set history=100
set laststatus=2
set tabstop=4
set shiftwidth=4
set undolevels=100
set textwidth=75
set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set term=xterm
set scrolloff=3
set makeprg=waf
"set equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
"set t_Co=256

colorscheme desert
filetype on
filetype plugin on
filetype plugin indent on
syntax on

"Set dictionary
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k

"Error on >80 columns and trailing spaces
"match Error /\%81v.\+/
"match Error "\s\+$"

"Shortcuts
map <C-F> :cs find f 
map <C-H> :cs show<CR>
map <S-S> :w<CR>
map <S-Q> :q<CR>
map ,m :make<CR>
map ,k :make clean<CR>
map ,nn :set number!<CR>
map ,e :set expandtab!<CR>
map ,t :set ts=8<CR>

"Key Mappings for quickfix
set cscopequickfix=s-,c-,d-,i-,t-,f-,e-
map <C-Up>    :cope 15<CR>
map <C-Down>  :ccl<CR>
map <C-Right> :cn<CR>
map <C-Left>  :cp<CR>
map <C-S-Right> :cn<CR>
map <C-S-Left>  :cp<CR>
map <C-H> :cs show<CR>

"Git shortcuts
map <C-B> :Gblame<CR>
map <C-K> :!git difftool %<CR>
map <C-F12> :Gread<CR>


" ---------------------
" FUNCTION KEY BINDINGS
" ---------------------

nnoremap <F2> :set list!<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :NERDTreeToggle<CR>

set pastetoggle=<F5>
map <F6> :e sudo:%<CR>

"Folding shortcuts
set foldmethod=manual
set nofoldenable
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf

nnoremap <F8> :set nofoldenable!<CR>
map <F12> :%s/\s\+$//e<CR>
map <F9> :%s/\s\+$//e<CR>



" ----------------
" PLUGINS SETTINGS
" ----------------

"Taglist settings
map <C-L> :Tlist<CR>
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exist_OnlyWindow=1
let Tlist_Use_Horiz_Window=0
let Tlist_Display_Prototype=1
let Tlist_Compart_Format=1
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Display_Tag_Scope=1
let Tlist_Close_On_Select=0
let Tlist_Enable_Fold_Column=1
let Tlist_WinHeight=20


"Key Mappings for BufExplorer
let bufExplorerOpenMode=1
let bufExplorerSplitBelow=1
let bufExplorerSplitHorzSize=10
map <S-Right> :bnext<CR>
map <S-Left>  :bprev<CR>
map <S-Up>    \bs


"Pydoc settings
let g:pydoc_open_cmd='vsplit'
let g:pydoc_highlight=0
map <S-M> \pw


"Conque settings
let g:ConqueTerm_CWInsert=0
let g:ConqueTerm_EscKey='<Esc>'
map ,b :ConqueTermVSplit bash<CR>


" -------------
" KEY SHORTCUTS
" -------------

"H      Goto head of a page
"L      Goto bottom of a page
"M      Goto middle of a page
"\t=    Align all spaces (left-align)
"\T=    Align all spaces (right-align)
"\adec  Align all declarations
"\acom  Align all comments


"Zoom-in / zoom-out split windows
nnoremap <C-W>o :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"Tmux will send xterm-style keys when xterm-keys option is on
"if &term =~ '^screen'
"  execute "set <xUp>=\e[1;*A"
"  execute "set <xDown>=\e[1;*B"
"  execute "set <xRight>=\e[1;*C"
"  execute "set <xLeft>=\e[1;*D"
"endif

"Add cscope databases by default
cscope add $WS
cscope add $HOME/test-automation/versaQaAutomation

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
