#!/bin/bash

EXITO() {
printf "\033[1;32m${1}\033[0m\n"
}

#VARIABLES
DIR_APACHE='/var/www'
FECHA=`date +%F-%Hh-%Mm-%Ss`
DIR_RESPALDOS=$HOME/respaldos/feng_$FECHA
mkdir -p $DIR_RESPALDOS
echo "Introduzca el directorio de apache donde se encuentre el Feng Office que desee respaldar. Ejemplo1: fengoffice. Ejemplo2: fo_prueba."
read DIR_FENG

EXITO "Iniciando respaldo de los directorios de Feng Office"
sleep 1
cp -rv $DIR_APACHE/$DIR_FENG/* $DIR_RESPALDOS/

EXITO "Iniciando respaldo de la base de datos"
echo "Por favor, ingrese el usuario de la base de datos"
read USERDB

echo "Por favor, ingrese el nombre de la base de datos"
read DB

echo "Por favor, ingrese la contraseña de la base de datos"
read PASSDB

BACKUP_DB=$DIR_RESPALDOS/db_fengoffice.sql
echo `mysqldump -u $USERDB -p$PASSDB -d $DB > $BACKUP_DB`
echo Base de datos respaldada en $BACKUP_DB
sleep 1

EXITO "Respaldo culminado."
