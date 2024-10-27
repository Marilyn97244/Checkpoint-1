#!/bin/bash

# Vérifiaction présence arguments
if [ "$#" -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

# Boucle pour tous les utilisateurs passé en argument
for username in "$@"; do
    # Vérification si l'utilisateur existe
    if id "$username" &>/dev/null; then
        echo "L'utilisateur $username existe déjà"
    else
        # Création de l'utilisateur
        if  useradd "$username"; then 
            echo "L'utilisateur $username a été créé"
        else
            echo "Erreur à la création de l'utilisateur $username"
        fi
    fi        
done
