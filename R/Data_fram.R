# Installation et initiation des packages

install.packages("readxl")
install.packages("usethis")
library(readxl)
library(usethis)

# Création des dossiers
#dir.create("inst/extdata", recursive = TRUE)

# Importation fichier ECel
import_excel_data <- function(file_path) {
  # Liste pour stocker les data frames de chaque feuille
  data_list <- list()

  # Obtenir les noms des feuilles dans le fichier Excel
  sheet_names <- excel_sheets(file_path)

  # Importer chaque feuille
  for (sheet in sheet_names) {
    # Convertir le nom de la feuille en nom de variable valide
    var_name <- make.names(sheet)

    # Lire la feuille et la stocker dans la liste
    data_list[[var_name]] <- read_excel(file_path, sheet = sheet)
  }

  return(data_list)
}

# Chemin vers votre fichier Excel
excel_file_path <- "C:\\TFE\\TFEr\\inst\\extdata\\Equations.xlsx"

# Importer les données
donnees <- import_excel_data(excel_file_path)

# Rendre les data frames accessibles en lecture seule
for (name in names(donnees)) {
  # Utiliser 'data()' pour charger les données dans l'environnement du package
  assign(name, donnees[[name]], envir = globalenv())

  # Documenter les données
  # usethis::use_data() pour créer le fichier .rda
  usethis::use_data(list(get(name)), name = name, overwrite = TRUE)
}

# Dans votre fichier R/data.R, ajoutez des documentation pour chaque jeu de données
#' Nom du jeu de données
#'
#' Description du jeu de données
#'
#' @format Un data frame avec X colonnes et Y lignes
#' @source Lien ou description de la source des données
"nom_du_jeu_de_donnees"
