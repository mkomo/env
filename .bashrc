# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	source /etc/bash_completion
fi

# User specific aliases and functions
source ~/bin/bash_aliases
source ~/bin/bash_extras
