FROM rocker/tidyverse

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# set working directory
WORKDIR /project

# Install necessary packages 
# RUN Rscript -e "install.packages('grDevices')"
# RUN Rscript -e "install.packages('readxl')"
# RUN Rscript -e "install.packages('lubridate')"
# RUN Rscript -e "install.packages('here')"
RUN Rscript -e "renv::restore()"

# make container entry point report creation
CMD /bin/bash
