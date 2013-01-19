export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Developer/usr/bin:/Users/murakami/jukebox/scripts:/Users/murakami/jukebox/scripts/private
# export RUBYLIB=/Users/murakami/jukebox/lib
# export GEM_PATH=/opt/local/lib/ruby/gems/
# export GEM_HOME=/opt/local/lib/ruby/gems/

#color
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

# For RVM
#[[ -s "/Users/murakami/.rvm/scripts/rvm" ]] && source "/Users/murakami/.rvm/scripts/rvm"

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
autoload -U compinit
compinit
export LANG=ja_JP.UTF-8
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

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'

alias Chrome='open /Applications/Google\ Chrome.app'
alias iTunes='open /Applications/iTunes.app'
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
