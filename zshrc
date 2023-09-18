#      ___           ___            ___         ___           ___           ___ 
#     /\  \         /\  \          /\  \       /\  \         /\  \         /\__\
#    /::\  \       /::\  \         \:\  \     /::\  \       /::\  \       /:/  /
#   /:/\:\  \     /:/\:\  \    ___ /::\__\   /:/\:\  \     /:/\:\  \     /:/  / 
#  /::\~\:\  \   /:/  \:\  \  /\  /:/\/__/  /::\~\:\  \   /::\~\:\  \   /:/  /  
# /:/\:\ \:\__\ /:/__/ \:\__\ \:\/:/  /    /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/   
# \:\~\:\ \/__/ \:\  \ /:/  /  \::/  /     \:\~\:\ \/__/ \:\~\:\ \/__/ \:\  \   
#  \:\ \:\__\    \:\  /:/  /    \/__/       \:\ \:\__\    \:\ \:\__\    \:\  \  
#   \:\ \/__/     \:\/:/  /                  \:\ \/__/     \:\ \/__/     \:\  \ 
#    \:\__\        \::/  /                    \:\__\        \:\__\        \:\__\
#     \/__/         \/__/                      \/__/         \/__/         \/__/
#
#
#
## Personal zsh configuration of eojeel <joe@joelee.io>

#--------------------------------------------------------------------------
# Oh My Zsh
#--------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

plugins=(
    rsync
    git
    zsh-autosuggestions
    # https://github.com/jasonmccreary/git-trim
    git-trim 
)

source $ZSH/oh-my-zsh.sh

alias pc="cd ~/pcsdeveloper/"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias a='sail php artisan'
