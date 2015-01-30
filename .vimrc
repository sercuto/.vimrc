" ~/.vimrc
"==================
" CONFIGURACION VIM
" ==================
let g:license = "GPLv3+"
let g:email = "Sergio.Cubero[AT]uv[DOT]es"
let g:username = "Sergio Cubero"
set nocompatible
"==================
" COLORES y THEME
"==================
syntax on
colorscheme wombat
"colorscheme wombat
"==================
" Saber posicion cursor
"==================
set ruler
"set number "activa el numerado de lineas
set sm
" Mostrar la combinacion de teclas ejecutada
set showcmd
" Q la linea no continue mas q el tamano de la ventana
set wrap
" salta de una llave al otra con %
set showmatch
set nocompatible
set noautoindent
"set autoindent
set nosmartindent "desactiva el indentado automatico
"set smartindent
set nocindent
set autoread " lee automaticamente si el fichero ha cambiado
" Guardado rapido
nmap <leader>w :w!<cr>
"==================
" Aumento del deshacer.
"==================
set undolevels=1000
filetype on "detecta el tipo de archivo automaticamente
filetype plugin on "activa soporte a plugins
filetype indent on
set ofu=syntaxcomplete#Complete
set expandtab       "Converting tabs to spaces
set tabstop=8       "numero de espacios por tab antes 4
set shiftwidth=4    "espacios para el sangrado
set softtabstop=4
"set textwidth=80    "Ancho de la linea
set title           "Muestra el fichero y path editado en window title
set titlestring=Fichero:\ %F  "Automatically set screen title
set ignorecase      " ignora si la palabra esta en mayusculas o minusculas
set hlsearch        " Resalta las palabras encontradas
set smartcase
" Zen Coding
let g:user_zen_expandabbr_key = '<C-e>'     "Change zen coding plugin expansion key to shift + e
"=====================
" Copy/Paste Bonito
"=====================
set pastetoggle=<F2> " Pegar codigo sin indentacion automatica

" AutoCompletado
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" Sparkup
"let g:sparkup = 'sparkup'
"let g:sparkupArgs = '--no-last-newline'
"let g:sparkupExecuteMapping = ''
"let g:sparkupNextMapping = ''
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=/home/pipo/tags/tagsopencv
set tags+=/home/pipo/tags/tagsc
set tags+=/home/pipo/tags/tagsc++
set tags+=/tmp/tags
set tags+=./tags "Etiquetas generadas en el directorio actual
set encoding=utf-8 "Condificacion para acentos
" Recordar la ultima linea en que estabas
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif
augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
