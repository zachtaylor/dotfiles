" netrw.vim

" change netrw dir to current file
set autochdir

" sync current dir w browsing dir
let g:netrw_keepdir = 0
" default banner off (toggle: `I`)
let g:netrw_banner = 0
" view default = 'tree' (toggle: `i`)
let g:netrw_liststyle = 3
" preview (`v`) is alternate layout: large preview (multi pane)
let g:netrw_altv = 1
" 25% width
let g:netrw_winsize = 25
" hidden files hidden by default
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" augroup ProjectDrawer
"   autocmd!
"   autocmd TabNew * :Vexplore!
" autocmd VimEnter * :Vexplore
" augroup END

function! NetrwMapping()
  " h acts as up directory, left in sideways tree
  nmap <buffer> h -^
  " l acts as down directory, right in sideways tree
  nmap <buffer> l <CR>
  " ff creates a file by buffering the name first
  nmap <buffer> ff %:w<CR>:buffer #<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
