# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ "$PS1" ]; then
    case $TERM in
        xterm*|screen*|linux)
            export PS1='\[\033[31m\][\[\033[36;01m\]\u\[\033[0;35m\]@\[\033[31;01m\]\h\[\033[0;35m\]:\[\033[33;01m\]\w\[\033[0;31m\]]$(git_prompt_vars "\[\033[0;33m\]%s ")\[\033[$(($??7:0));36m\]\$\[\033[0m\] '
            ;;
    esac
else
    PS1="[\u@\h:\w]\\$ "
fi

[ "$TERM" = "xterm" ] && export TERM=xterm-256color

export GIT_PS1_SHOWDIRTYSTATE=1
function git_prompt_vars {
    BKP=$?
    echo "$(__git_ps1 "$1")"
    return $BKP
} 

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi


# Set vars here
#JDK_HOME=/usr/java/latest
#export JDK_HOME
