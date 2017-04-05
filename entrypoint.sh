#!/bin/sh

# if we have location.csv and dapc.rds, but not webapp_input.csv, run data prep pipeline
if ! [ -e "data/webapp_input.csv" ] && [ -e "data/location.csv" ] && [ -e "data/dapc.rds" ]
then
    Rscript scripts/extractData.R
    python scripts/dataprep.py
fi

# if we have webapp_input.csv, run webapp
if [ -e "data/webapp_input.csv" ]
then
    bokeh serve ${BOKEH_APP} --port ${APP_PORT}
fi
