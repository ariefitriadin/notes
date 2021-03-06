alias dstart='docker-compose up -d'
alias dbuild='docker-compose build'
alias dstop='docker-compose down --remove-orphans'
alias drestart='docker-compose up -d --force-recreate'
alias drebuild='docker-compose down --remove-orphans && docker-compose build && docker-compose up -d'
alias dclean='docker system prune'
