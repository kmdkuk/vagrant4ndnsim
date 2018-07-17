sudo apt install -y build-essential libsqlite3-dev libcrypto++-dev libboost-all-dev libssl-dev git python-setuptools
sudo apt install -y python-dev python-pygraphviz python-kiwi python-pygoocanvas python-gnome2 python-rsvg ipython
sudo apt install -y pkg-config
mkdir ndnSIM
cd ndnSIM
git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3
git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen
git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM

# Build and install NS-3 and ndnSIM
cd ns-3
./waf configure -d optimized
./waf

sudo ./waf install
cd ..

git clone https://github.com/named-data-ndnSIM/scenario-template.git scenario
cd scenario
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

./waf configure
