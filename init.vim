set encoding=UTF-8
"Set directory for swap files
set directory=$HOME/.config/nvim/swap/

"Install plugins
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


"Configure coc autocompletion to use tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-eslint', 'coc-prettier']

"Set Pmenu color
"hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
"hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"Set numbers
set number
set splitright
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
set mouse=a
let g:NERDTreeMouseMode=3
let NERDTreeMapOpenInTab='<C-n>'
let NERDTreeShowHidden=1
nmap <C-n>t :NERDTreeToggle<CR> 

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <C-f>f  <Plug>(coc-format-selected)
nmap <C-f>f  <Plug>(coc-format-selected)

nmap <silent> ge <Plug>(coc-definition)
nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)
nmap <silent> gt :vsp<CR><Plug>(coc-definition)<C-W>T
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-s>f :Files<CR>

syntax on
set t_Co=256
set cursorline
set clipboard=unnamedplus
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

set list!
set listchars=trail:.
highlight RedundantSpaces ctermbg=grey guibg=grey 
match RedundantSpaces /\s\+$/
