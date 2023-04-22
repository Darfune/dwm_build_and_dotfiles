# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export PATH=".local/bin/lf-previews/":$PATH
export PATH=".local/bin/statusbar/":$PATH
export PATH="$HOME/.local/bin":$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#[ -f ~/.config/lf/LF_ICONS ] && {
#	LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
#		&& export LF_ICONS
#}


alias ls='lsd'
alias cls='clear'
alias clr='clear'
alias cat='bat'
alias nv='nvim'
alias lv='lvim'
alias lf='lfub'
alias update='sudo pacman -Syyu'


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control]}" ]] && bindkey -- "${key[Left]}"  backward-word
[[ -n "${key[Control]}" ]] && bindkey -- "${key[Right]}" forward-word

bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


export LF_ICONS="\
di=:\
d=:\
fi=:\
ln=:\
or=:\
so=ﯲ:\
db=:\
su=:\
sg=:\
tw=:\
ow=w:\
st=:\
ex=:\
*.styl=:\
*.sass=:\
*.scss=:\
*.htm=:\
*.html=:\
*.slim=:\
*.haml=:\
*.ejs=:\
*.css=:\
*.less=:\
*.md=:\
*.mdx=:\
*.markdown=:\
*.rmd=:\
*.json=:\
*.webmanifest=:\
*.js=:\
*.mjs=:\
*.jsx=:\
*.rb=:\
*.gemspec=:\
*.rake=:\
*.php=:\
*.py=:\
*.pyc=:\
*.pyo=:\
*.pyd=:\
*.coffee=:\
*.mustache=:\
*.hbs=:\
*.conf=:\
*.ini=:\
*.yml=:\
*.yaml=:\
*.toml=:\
*.bat=:\
*.mk=:\
*.jpg=:\
*.jpeg=:\
*.bmp=:\
*.png=:\
*.webp=:\
*.gif=:\
*.ico=:\
*.twig=:\
*.cpp=:\
*.c++=:\
*.cxx=:\
*.cc=:\
*.cp=:\
*.c=:\
*.cs=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hxx=:\
*.hs=:\
*.lhs=:\
*.nix=:\
*.lua=:\
*.java=:\
*.kt=:\
*.sh=:\
*.fish=:\
*.bash=:\
*.zsh=:\
*.ksh=:\
*.csh=:\
*.awk=:\
*.ps1=:\
*.ml=λ:\
*.mli=λ:\
*.diff=:\
*.db=:\
*.sql=:\
*.dump=:\
*.clj=:\
*.cljc=:\
*.cljs=:\
*.edn=:\
*.scala=:\
*.go=:\
*.dart=:\
*.xul=:\
*.sln=:\
*.suo=:\
*.pl=:\
*.pm=:\
*.t=:\
*.rss=:\
'*.f#'=:\
*.fsscript=:\
*.fsx=:\
*.fs=:\
*.fsi=:\
*.rs=:\
*.rlib=:\
*.d=:\
*.erl=:\
*.hrl=:\
*.ex=:\
*.exs=:\
*.eex=:\
*.leex=:\
*.heex=:\
*.vim=:\
*.ai=:\
*.psd=:\
*.psb=:\
*.ts=:\
*.tsx=:\
*.jl=:\
*.pp=:\
*.vue=﵂:\
*.elm=:\
*.swift=:\
*.xcplayground=:\
*.tex=ﭨ:\
*.r=ﳒ:\
*.rproj=鉶:\
*.sol=ﲹ:\
*.pem=:\
*gruntfile.coffee=:\
*gruntfile.js=:\
*gruntfile.ls=:\
*gulpfile.coffee=:\
*gulpfile.js=:\
*gulpfile.ls=:\
*mix.lock=:\
*dropbox=:\
*.ds_store=:\
*.gitconfig=:\
*.gitignore=:\
*.gitattributes=:\
*.gitlab-ci.yml=:\
*.bashrc=:\
*.zshrc=:\
*.zshenv=:\
*.zprofile=:\
*.vimrc=:\
*.gvimrc=:\
*_vimrc=:\
*_gvimrc=:\
*.bashprofile=:\
*favicon.ico=:\
*license=:\
*node_modules=:\
*react.jsx=:\
*procfile=:\
*dockerfile=:\
*docker-compose.yml=:\
*rakefile=:\
*config.ru=:\
*gemfile=:\
*makefile=:\
*cmakelists.txt=:\
*robots.txt=ﮧ:\
*Gruntfile.coffee=:\
*Gruntfile.js=:\
*Gruntfile.ls=:\
*Gulpfile.coffee=:\
*Gulpfile.js=:\
*Gulpfile.ls=:\
*Dropbox=:\
*.DS_Store=:\
*LICENSE=:\
*React.jsx=:\
*Procfile=:\
*Dockerfile=:\
*Docker-compose.yml=:\
*Rakefile=:\
*Gemfile=:\
*Makefile=:\
*CMakeLists.txt=:\
.*jquery.*\.js$=:\
.*angular.*\.js$=:\
.*backbone.*\.js$=:\
.*require.*\.js$=:\
.*materialize.*\.js$=:\
.*materialize.*\.css$=:\
.*mootools.*\.js$=:\
.*vimrc.*=:\
Vagrantfile$=:\
*jquery.min.js=:\
*angular.min.js=:\
*backbone.min.js=:\
*require.min.js=:\
*materialize.min.js=:\
*materialize.min.css=:\
*mootools.min.js=:\
*vimrc=:\
Vagrantfile=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
"

