execute pathogen#infect()
syntax on
set number
set modifiable
colorscheme jellybeans_modified
inoremap kj <esc>
nnoremap m :

nmap <f9> :!python %<cr>

"set f keys for compliling and running java programs
map <F12> :!cd echo expand('%:p:h')
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
map <F9> :w <CR> :!javac % && java %< <CR>

"set the cursor for stuff

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline guibg=red
	        set cursorcolumn
	elseif a:mode == 'r'
		hi statusline guibg=blue
	else
		hi statusline guibg= magenta
	endif
	endfunction
	function! InsertLeaveActions()
		hi statusline guibg=green
	    	set nocursorcolumn
	endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline guibg=green

" have a permanent statusline to color
set laststatus=2




let g:neocomplete#enable_at_startup=1
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:snipMateTrigger=<jf>
set autoindent
set cindent
set splitright

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set mouse=a
let NERDTreeIgnore = ['\.class$']
let NERDTreeIgnore = ['\.s$']
let NERDTreeIgnore = ['\.i$']
set lines=50 columns=175
let g:NERDTreeWinSize = 23
command R !javac %
command T !java %:r

let NERDTreeShowHidden =1


"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
			    \ }

			    " Define keyword.
			    if !exists('g:neocomplete#keyword_patterns')
				let g:neocomplete#keyword_patterns = {}
				endif
				let g:neocomplete#keyword_patterns['default'] = '\h\w*'

			" Plugin key-mappings.
				inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
      endfunction
      " <TAB>: completion.
      inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
      " <C-h>, <BS>: close popup and delete backword char.
      inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
      " Close popup by <Space>.
      "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

      " AutoComplPop like behavior.
      "let g:neocomplete#enable_auto_select = 1

      " Shell like behavior(not recommended).
      "set completeopt+=longest
      "let g:neocomplete#enable_auto_select = 1
      "let g:neocomplete#disable_auto_complete = 1
      "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

      " Enable heavy omni completion.
      if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
	endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
		" https://github.com/c9s/perlomni.vim
		let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


		




