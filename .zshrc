
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/go/Downloads/yes/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/go/Downloads/yes/etc/profile.d/conda.sh" ]; then
        . "/Users/go/Downloads/yes/etc/profile.d/conda.sh"
    else
        export PATH="/Users/go/Downloads/yes/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# display color 
export CLICOLOR=1 

# make color usable
autoload -Uz colors
colors

# prompt setting
PROMPT="%{${fg[blue]}%}%n:%{${reset_color}%} %c/ %# "

# history settings
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# setopt extended_history
alias history='history -t "%F %T"'

# 同時に起動したzshの間でhisotryを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# 補完機能を有効にする
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# コマンドをまちがたら、これじゃね？って教えてくれる
setopt correct

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# git branchのsetting
# setopt PROMPT_SUBST

# Go path
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# direnv settings
# eval "$(direnv hook zsh)"

# homebrew env for ruby env
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

# rbenv
export RBENV_ROOT=/opt/homebrew/opt/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init - zsh)"

# openssl
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
