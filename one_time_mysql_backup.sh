#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

git clone https://github.com/nagaraj-devops/backup_shell_scripts.git

echo -e "${GREEN}git clone taken{ENDCOLOR}"

sudo cp backup_shell_scripts/mysql_db_backup_script.sh /usr/local/bin
sudo cp backup_shell_scripts/capture_mysql_input.sh /usr/local/bin

sudo chmod +x /usr/local/bin/mysql_db_backup_script.sh
sudo chmod +x /usr/local/bin/capture_mysql_input.sh

echo -e "${GREEN}copied shell files to bin{ENDCOLOR}"

capture_mysql_input.sh

sudo mv saved_vars.sh /usr/local/bin
sudo chmod +x /usr/local/bin/saved_vars.sh

echo -e "${GREEN}move saved varibles file to bin{ENDCOLOR}"

source /usr/local/bin/saved_vars.sh

echo -e "${GREEN}source the exported variables{ENDCOLOR}"

mysql_db_backup_script.sh

echo -e "${GREEN}Database backed up and moved to s3 bucket{ENDCOLOR}"

sudo rm -rf backup_shell_scripts

echo -e "${RED}removed git repo{ENDCOLOR}"
