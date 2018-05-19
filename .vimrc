set nocompatible
syntax enable
filetype plugin on

"Finding files with built-in search
set path+=** "recursive path searching
set wildmenu "tab complete search finds

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Spell checking functions
nnoremap /spus :setlocal spell spelllang=en_us<CR>
nnoremap /spgb :setlocal spell spelllang=en_gb<CR>

let mapleader=","

"My selected sets
set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set visualbell
set noerrorbells
set nobackup
set noswapfile

set pastetoggle=<F2>
set mouse=a

au WinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

set showmode
set shortmess+=I

" Window Splitting
" vsp filename
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Remove annoying underscore/highlights
nnoremap H :set cursorline! <CR>

" OCaml
"let g:opamshare = substitute(system('opam config var share'),'\n$', '', '''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim/doc"

"## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let camlfts = ['ml', 'caml', 'mli']
if index(camlfts, &filetype) == -1
	let s:opam_share_dir = system("opam config var share")
	let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
	
	let s:opam_configuration = {}

	function! OpamConfOcpIndent()
	  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
	endfunction
	let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
	
	function! OpamConfOcpIndex()
	  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
	endfunction
	let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
	
	function! OpamConfMerlin()
	  let l:dir = s:opam_share_dir . "/merlin/vim"
	  execute "set rtp+=" . l:dir
	endfunction
	let s:opam_configuration['merlin'] = function('OpamConfMerlin')
	
	let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
	let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
	let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
	for tool in s:opam_packages
	  " Respect package order (merlin should be after ocp-index)
	  if count(s:opam_available_tools, tool) > 0
	    call s:opam_configuration[tool]()
	  endif
	endfor

endif
" ## end of OPAM user-setup addition for vim / base ## keep this line
