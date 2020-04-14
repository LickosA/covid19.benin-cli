#!/bin/bash

# Define message selection based on LANGUAGE
lang=$(locale | grep 'LANG|LANGUAGE' | cut -d= -f2 | cut -d_ -f1)
if [[ $lang == 'fr' ]]; then
    messages_array[0]="La commande 'covid19.benin' a été installé avec succès!"
    messages_array[1]="L'installation a echoué. Veuillez reesayer avec les droits d'admiministrateur ou le fichier exist deja."
else
    messages_array[0]="The command 'covid19.benin' has been installed successfully!"
    messages_array[1]="The installation failed. Please try with root priveleges or file exist already."
fi

chmod +x covid19.benin
ln -s $(pwd)/covid19.benin /usr/local/bin/covid19.benin

if [ $? -eq 0 ]
then
    echo ${messages_array[0]}
else
    echo ${messages_array[1]} >&2
fi
