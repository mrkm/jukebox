export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/git/jukebox/scripts

# jukebox
export JUKEBOX_HOME=$HOME/git/jukebox
export PATH=$PATH:$JUKEBOX_HOME/scripts:$JUKEBOX_HOME/scripts/private

# python & virtualenv
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENV_HOME=/usr/bin
if [ -f $VIRTUALENV_HOME/virtualenvwrapper.sh ]; then
    source $VIRTUALENV_HOME/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/virtualenv
export PIP_RESPECT_VIRTUALENV=true
# export LD_LIBRARY_PATH=/usr/local/lib

# ruby
# export RUBYLIB=/Users/murakami/jukebox/lib
# export GEM_PATH=/opt/local/lib/ruby/gems/
# export GEM_HOME=/opt/local/lib/ruby/gems/
# For RVM
#[[ -s "/Users/murakami/.rvm/scripts/rvm" ]] && source "/Users/murakami/.rvm/scripts/rvm"

# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
autoload -U compinit
compinit
export LANG=ja_JP.UTF-8

# color
local gray=$'%{\e[0;30m%}'
local red=$'%{\e[0;31m%}'          # 赤色
local green=$'%{\e[0;32m%}'        # 緑色
local yellow=$'%{\e[0;33m%}'       # 黄色
local blue=$'%{\e[0;34m%}'         # 青色
local purple=$'%{\e[0;35m%}'       # 紫色
local light_blue=$'%{\e[0;36m%}'   # 水色
local white=$'%{\e[0;37m%}'        # 白色
local GRAY=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'          # 赤色
local GREEN=$'%{\e[1;32m%}'        # 緑色
local YELLOW=$'%{\e[1;33m%}'       # 黄色
local BLUE=$'%{\e[1;34m%}'         # 青色
local PURPLE=$'%{\e[1;35m%}'       # 紫色
local LIGHT_BLUE=$'%{\e[1;36m%}'   # 水色
local WHITE=$'%{\e[1;37m%}'        # 白色
local DEFAULT=$white               # 標準の色

# prompt
case ${UID} in
0)s
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[36m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="${purple}${HOST%%.*}:${PROMPT}"
    ;;
esac
case "${TERM}" in
kterm*|xterm*)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
bindkey -e
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep
setopt always_last_prompt       # 補完をしてもプロンプトの位置を変えない
setopt numeric_glob_sort     # ファイル名を数字としてソート 1, 10, 2 -> 1, 2, 10

alias top='top -s 10 -o rsize -O cpu'
alias cp='cp -i'
alias ls='ls -CFG'
alias ll="ls -CFG -l"
alias l1="ls -CFG -1"
alias la="ls -CFG -a"
alias lh="ls -CFG -l -h"
alias mv='mv -i'
alias du="du -h"
alias rm='rm -i'
alias rma='rm [0-z]*~'
alias rmtex='rm *.aux *.log *.dvi *.idx *.ilg *.ind *.toc *~'

# CentOS
# ssh-agent
alias sshadd='eval `ssh-agent -s`; ssh-add'
# for git cmd with CUI
unset SSH_ASKPASS

# MacOS
# export PATH=$PATH:/usr/X11/bin:/Developer/usr/bin