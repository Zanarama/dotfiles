# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#Virtual Env Wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
#/etc/bashrc-gitprompt
# Git in my promptz
if [[ $- == *i* ]] ; then
    c_cyan=`tput setaf 6`
    c_red=`tput setaf 1`
    c_green=`tput setaf 2`
    c_sgr0=`tput sgr0`

    parse_git_branch ()
    {
        if git rev-parse --git-dir >/dev/null 2>&1
        then
            gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	        numfil=$(git status | grep "#	" | wc -l)
            echo -e git:$gitver:$numfil
        
        elif hg status -q >/dev/null 2>&1
        then
            hgver=$(hg branch 2>/dev/null)
            numfil=$(hg status | wc -l)
            echo -e hg:$hgver:$numfil
        else
              return 0
        fi
    }

    branch_color ()
    {
            color="${c_red}"
            if git rev-parse --git-dir >/dev/null 2>&1
            then
		            if git status | grep "nothing to commit" 2>&1 > /dev/null
                    then
                        color=${c_green}
                    fi
            elif hg status -q >/dev/null 2>&1
            then
                    if expr $(hg status | wc -l) == 0 2>&1 > /dev/null
                    then
                        color=${c_green}
                    fi
            else
                    return 0
            fi
            echo -ne $color
    }

    PS1='[\u@\h \[${c_red}\]\W\[${c_sgr0}\] [\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]]]$ '
fi

