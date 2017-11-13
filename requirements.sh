set -e

# Packages neccecary for tidyverse
apt-get update
apt-get install -y libcurl4-openssl-dev libxml2-dev

##### This adds files to the datasets/ folder on the live project #####
# A list of files in datasets/ separated by space, needs to be manually updated
FILES="global_temperature.csv project_image.png run_code_cell_image.png"
# The URL where the assets of the project lives
ASSETURL=https://s3.amazonaws.com/assets.datacamp.com/production/project_33/datasets # <- NOT CORRECT CHANGE THIS!
# Where the datasets will be compied on the Project image.
DATADIR=/home/repl/datasets

mkdir -p $DATADIR
for FILE in $FILES
do
	wget -O $DATADIR/$FILE $ASSETURL/$FILE
done