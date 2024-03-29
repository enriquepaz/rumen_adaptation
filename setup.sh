#!/bin/bash

if [ "$1" = "" ]; then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee RMarkdown file for details.\n\n"
    exit 1
fi

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-MacOSX-x86_64.sh
bash Anaconda-2.3.0-MacOSX-x86_64.sh
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
#bash Anaconda-2.3.0-Linux-x86_64.sh

anaconda/bin/conda create -n rumenEnv python pip numpy matplotlib scipy pandas cython mock nose
source anaconda/bin/activate rumenEnv
pip install https://github.com/biocore/qiime/archive/1.9.0.tar.gz
#conda install -c https://conda.binstar.org/jorge qiime
anaconda/bin/conda install -c r r r-xml
anaconda/bin/conda install -c https://conda.binstar.org/asmeurer pandoc
anaconda/bin/conda install -c https://conda.binstar.org/r rpy2

wget -O anaconda/envs/rumenEnv/bin/usearch $1
chmod 775 anaconda/envs/rumenEnv/bin/usearch

mkdir fastx
cd fastx
wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_MacOSX.10.5.8_i386.tar.bz2
bzip2 -d fastx_toolkit_0.0.13_binaries_MacOSX.10.5.8_i386.tar.bz2
tar -xvf fastx_toolkit_0.0.13_binaries_MacOSX.10.5.8_i386.tar
#wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2
#bzip2 -d fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2
#tar -xvf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar
cd ..
mv fastx/bin/* anaconda/envs/rumenEnv/bin/
rm -rf fastx

#wget https://github.com/mothur/mothur/releases/download/v1.35.1/Mothur.cen_64.zip
#unzip Mothur.cen_64.zip
#mv mothur/mothur anaconda/envs/rumenEnv/bin/
#rm Mothur.cen_64.zip
wget https://github.com/mothur/mothur/releases/download/v1.35.1/Mothur.mac_64.OSX-10.9.zip
unzip Mothur.mac_64.OSX-10.9.zip
mv mothur/mothur anaconda/envs/rumenEnv/bin/
rm Mothur.mac_64.OSX-10.9.zip
rm -rf mothur
rm -rf __MACOSX

wget https://raw.githubusercontent.com/chrisLanderson/rumen_adaptation/master/rumen_adaptation.Rmd

