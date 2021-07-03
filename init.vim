
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/brglng/vim-im-select.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'KeitaNakamura/neodark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'

set rtp+=~/.fzf
Plug '~/.fzf'

call plug#end()


" 支持鼠标
"set mouse=a

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set nocompatible "不兼容vi
set ruler "显示光标的当前位置
set showmode "模式显示
set showcmd "命令显示

"主题
colorscheme neodark
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'
let g:neodark#use_256color = 1 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0

" 开启256 支持
set background=dark
set t_Co=256

set nobackup

syntax on    " 关键字上色
syntax enable " 语法高亮
set autoindent "自动缩进
set smartindent

set nu "显示行号
set hlsearch "搜索高亮
let loaded_matchparen=1 "关闭括号高亮


"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread

" 定义快捷键的前缀，即<Leader>
let mapleader = " "

filetype indent on "开启文件类型检查
set expandtab "tab 转换为空格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set browsedir=buffer
set clipboard=unnamed
set scrolloff=7                 " 保持在光标上下最少行数
set sidescrolloff=15            " 水平滚动


" 使用Tab键补全时,在状态栏显示匹配的列表,方便查看都有哪些命令符合补全条件.
"命令模式tab补全，第一次显示所有命令，第二次依次选择
set wildmenu
set wildmode=longest:list,full

set ic " 忽略大小写, set noic 不忽略大小写

set backspace=2

" 当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * :set hlsearch<cr>*

inoremap jj <esc>

" 结尾分号
noremap <Leader>, $a,<ESC>
noremap <Leader>; $a;<ESC>

noremap <Leader>p o<ESC>p

" 再次粘贴
vmap <Leader>P viw"0p

" buffers
noremap <Leader>d :bd<CR> " 删除buffer

" tabs
noremap <C-n> :tabn<CR>
noremap <C-p> :tabp<CR>
noremap <C-t> :tabe<CR>
noremap <C-w> :q<CR>

"关闭高亮时只需要按下 Ctrl+h，当发生下次搜索时又会自动启用。
nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc


" ======================== nerdtree ==========================
noremap <Leader>e :NERDTreeFind<CR>

"当NERDTree为剩下的唯一窗口时自动关闭
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif

" ======================== end nerdtree =======================



" ======================== fzf ==========================
noremap <Leader>f :FZF<CR>
" ======================== end fzf ==========================



" ======================== coc ==========================
" 回车自动选择第一个
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 转到定义
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" 方法列表
nnoremap <Leader>o  :<C-u>CocList outline -kind method<cr>


"预览
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>l  <Plug>(coc-format-selected)
nmap <leader>l  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ======================== end coc ==========================

" ======================== align ==========================
xmap <leader>a <Plug>(EasyAlign)=<cr>
" ======================== end align ==========================

" ======================== input ==========================
" ======================== end input ==========================


" 复制到系统
"vmap <silent><leader>y :w !/home/yuan/.iterm2/it2copy<CR><CR>
"

" json 一直显示双引号
let g:indentLine_conceallevel = 0









