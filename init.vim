"" request:
"   1. node
"   2. npm
"   3. python3 (pip3 install neovim)
nnoremap <space>rl :so ~/.config/nvim/init.vim<CR>
nnoremap <space>rc :e ~/.config/nvim/init.vim<CR>
"===============代码折叠==============
set foldmethod=indent
set foldlevel=99
nnoremap <space>a za
"===============通用配置==============
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=2
set ignorecase
set smartcase
set notimeout
set mouse=a
set cmdheight=3 
set autowrite
set showmatch
set virtualedit=block
set noswapfile
set ruler
set magic
set scrolloff=8
set clipboard=unnamedplus
set tags+=./tags
let mapleader = "\<SPACE>" " defualt ,
let g:python3_host_prog='~/anaconda3/bin/python'

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  :exe '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" =======================
" ===  plugins  begin ===
" =======================
call plug#begin('~/.config/nvim/plugged')
  " graphviz vim 
  Plug 'liuchengxu/graphviz.vim'
  " markdown preview
  Plug 'iamcco/markdown-preview.nvim',{'do':'cd app && yarn install'}
  
  " enhance editor
  Plug 'tomtom/tcomment_vim'
  
  "vim-pdf
  Plug 'makerj/vim-pdf'
  
  " terminal
  Plug 'skywind3000/vim-terminal-help'
  
  " file explorer
  Plug 'preservim/nerdtree'
  
  " file finder
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  " highlight
  "Plug 'morhetz/gruvbox'
  "Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'bfrg/vim-cpp-modern'
  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " debug
  Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python'}
  
  " tagbar
  Plug 'preservim/tagbar'
  
  " translator
  Plug 'voldikss/vim-translator'
  
  " auto-pairs
  Plug 'jiangmiao/auto-pairs'
  
  "vim-move
  Plug 'matze/vim-move'
  
  "bufferline
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim'
  
  " vim-commentary
  Plug 'tpope/vim-commentary'
  
  "easy-align
  Plug 'junegunn/vim-easy-align'
  
  "expand-region
  Plug 'terryma/vim-expand-region'

  "vim-gas
  Plug 'Shirk/vim-gas'
  "semantic-highlight.vim
  Plug 'jaxbot/semantic-highlight.vim'
  "折叠
  Plug 'tmhedberg/SimpylFold'

  "colorscheme 
  Plug 'morhetz/gruvbox'
  call plug#end()
" =======================
" ===   plugins  end  ===
" =======================


" =================================
" ===   plugins  configuration  ===
" =================================
" ========tmhedberg SimpylFold=====
let g:SimpylFold_docstring_preview=1
" ========semantic highlight=======
nnoremap <leader>s :SemanticHighlightToggle<cr>
" =======markdown preservim========
let g:move_key_modifier='C'
" =========commentary===============
nnoremap <leader>cm :Commentary<cr>

" =======markdown preservim========
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = '/usr/bin/google-chrome-stable'
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \'mkit':{},
    \'katex':{},
    \'maid':{},
    \ 'disable_sync_scroll':0,
    \ 'sync_scroll_type':'relative',
    \ 'hide_yaml_meta':1,
    \ 'sequence_diagrams':{},
    \ 'flowchart_diagrams':{},
    \ 'content_editable':v:true,
    \ 'disable_filename':0
    \}
let g:mkdp_filetypes = ['markdown']
nmap <C-s> <Plug>MarkdownPreview<CR>
nmap <M-s> <Plug>MarkdownPreviewStop<CR>
nmap <C-p> <Plug>MarkdownPreviewToggle<CR>
" ==== tomtom/tcomment_vim ====

let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ==== preservim/nerdtree ====

nnoremap <LEADER>e :NERDTreeToggle<CR>


" ==== Yggdroot/LeaderF ====
let g:Lf_WindowPosition='right'
let g:Lf_PreviewInPopup=1
let g:Lf_CommandMap = {
\   '<C-p>': ['<C-k>'],
\   '<C-k>': ['<C-p>'],
\   '<C-j>': ['<C-n>']
\}
nmap <leader>f :Leaderf file<CR>
nmap <leader>b :Leaderf! buffer<CR>
nmap <leader>F :Leaderf rg<CR>
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"


" ====morhetz/gruvbox====
colorscheme gruvbox

" ==== jackguo380/vim-lsp-cxx-highlight ====

"hi default link LspCxxHlSymFunction cxxFunction
"hi default link LspCxxHlSymFunctionParameter cxxParameter
"hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
"hi default link LspCxxHlSymStruct cxxStruct
"hi default link LspCxxHlSymStructField cxxStructField
"hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
"hi default link LspCxxHlSymClassField cxxStructField
"hi default link LspCxxHlSymEnum cxxEnum
"hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
"hi default link LspCxxHlSymVariable cxxVariable
"hi default link LspCxxHlSymMacro cxxMacro
"hi default link LspCxxHlSymEnumMember cxxEnumMember
"hi default link LspCxxHlSymParameter cxxParameter
"hi default link LspCxxHlSymClass cxxTypeAlias


" ==== neoclide/coc.nvim ====

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-cmake',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer'
      \ ]


" <TAB> to select candidate forward or
" pump completion candidate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <s-TAB> to select candidate backward
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <CR> to comfirm selected candidate
" only when there's selected complete item
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight link CocHighlightText Visual
" autocmd CursorHold * silent call CocActionAsync('highlight')   " TODO

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" diagnostic info
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <LEADER>qf <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" statusline support
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}  "TODO

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:generate_compile_commands()
  if empty(glob('CMakeLists.txt'))
    echo "Can't find CMakeLists.txt"
    return
  endif
  if empty(glob('build'))
    execute 'silent !mkdir build'
  endif
  execute '!cmake -DCMAKE_BUILD_TYPE=debug
      \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build'
endfunction
command! -nargs=0 Gcmake :call s:generate_compile_commands()

" ==== puremourning/vimspector ====
let g:vimspector_enable_mappings = 'HUMAN'

function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp' 
      !cp ~/.config/nvim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval

"=========translator=========
nnoremap <leader>tt :TranslateW<CR>

"=========ctags==============
let g:ctags_path="/usr/bin/ctags"
let g:ctags_statusline=1
nmap <F3> :TagbarToggle<CR>

"=========save==============
nnoremap <leader>w :w<CR>
nnoremap <leader>z :wq<CR>

"=========macro=============
"注释宏
" =================color scheme====================
set t_Co=256
"===========c cpp highlight================
"
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

