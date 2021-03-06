#!/bin/bash
if [[ $# -ne 1 ]]
then
  echo "Usage: ./get_plot.sh city"
  exit -1
fi
DEEPNAV_CITY=$1

~/libraries/caffe/tools/extra/parse_log.py log/${DEEPNAV_CITY}_vgg_log.log log/

sed "$(eval echo $(cat sub.sed))" log/plot_log.gnuplot > log/plot_log_${DEEPNAV_CITY}.gnuplot
gnuplot log/plot_log_${DEEPNAV_CITY}.gnuplot

eog -n ${DEEPNAV_CITY}_train_log.png &
eog -n ${DEEPNAV_CITY}_val_log.png &
