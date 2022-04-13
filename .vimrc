call plug#begin('~/.vim/plugged')
  Plug 'davidhalter/jedi-vim' " Autocomplete/syntax for python
  Plug 'jmcantrell/vim-virtualenv' " User virtualenv for current python interpretor
  Plug 'mitsuhiko/vim-jinja'        " Jinja support for vim
  Plug 'yuezk/vim-js'
  Plug 'nvie/vim-flake8' " Linter for python code
  Plug 'alvan/vim-closetag' " Automatic tag closing
  Plug 'mattn/emmet-vim' " Emmet, fast HTML inserting
  Plug 'curist/vim-angular-template'
  Plug 'burnettk/vim-angular'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " File search
  Plug 'junegunn/fzf.vim' " File search
  Plug 'preservim/nerdtree' " File tree
  Plug 'ryanoasis/vim-devicons' " Nice icons for nerd tree commander
  Plug 'sheerun/vim-polyglot' "Syntax highlighting for different languages
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " Amazing autocomplete/typing support for much languages
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'Quramy/tsuquyomi' " typescript
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'neoclide/vim-jsx-improve'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'python',
    \ 'html',
    \ 'swift' ] } " Good code autoformatting
call plug#end() 
syntax on
set re=0
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:coc_global_extensions = [ 'coc-tsserver' ]

let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'
let g:material_style='palenight'

set background=dark
colorscheme palenight 
set encoding=UTF-8

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1 " top pane
let g:airline_theme = "palenight" " template 

let $FZF_DEFAULT_OPTS    = '--reverse'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>
nmap <C-s> :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

