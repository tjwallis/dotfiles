#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='[\u@\h \W]\$ '  # To leave the default one
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)

PS1='\[$red\]\u\[$reset\] \[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\] '

# No CD necessary
shopt -s autocd

# Wrap on resize
shopt -s checkwinsize

[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

export PATH="${PATH}:/home/tjwallis/.composer/vendor/bin"

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

#source /usr/share/git/completion/git-completion.bash

## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="/usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
# }}}

source /usr/share/git/completion/git-prompt.sh

#TERM=konsole-256color

