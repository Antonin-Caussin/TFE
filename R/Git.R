# Initialisation de GitHub

# Installation des packages nécessaires
install.packages(c("usethis", "gitcreds"))
library(usethis)
library(gitcreds)

# Configuration de Git
# 1) Informations GitHub
usethis::use_git_config(
  user.name = "Antonin-Caussin",
  user.email = "antonin.caussin@student.uliege.be"
)
# 2) Personal Access Token (PAT) : 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

# 3) Enregistrer le token dans R
gitcreds::gitcreds_set()

# 4) Vérification et initialisation dans le terminal

# Premier commit et push
# Dans le Terminal RStudio ou via Git Bash
# git add .
# git commit -m "Initial commit"
# git push -u origin main


