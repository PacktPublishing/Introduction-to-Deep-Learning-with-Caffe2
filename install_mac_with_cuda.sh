# Create a conda environment (optional)
conda create -n my_caffe2_env && source activate my_caffe2_env

# Install required packages
# mkl isn't actually required, but is really recommended for Anaconda
conda install -y \
    future \
    glog \
    lmdb \
    mkl \
    mkl-include \
    numpy \
    protobuf \
    snappy \
    six

# (Optional) these packages are needed for some of the ipython jupyter notebook
# tutorials, but not for base Caffe2
conda install -y --channel https://conda.anaconda.org/conda-forge \
    flask \
    graphviz \
    hypothesis \
    jupyter \
    leveldb \
    lmdb \
    matplotlib \
    pydot \
    pyyaml \
    requests \
    scikit-image \
    scipy \
    tornado \
    unzip \
    zeromq

# Clone Caffe2
cd ~ && git clone --recursive https://github.com/caffe2/caffe2.git && cd caffe2

# Make Caffe2 in a separate folder to avoid polluting the Caffe2 source tree.
# This can be anywhere you want it
mkdir build && cd build

# Add flags to this command to control which packages you want to use. The
# options to use are at the top of CMakeLists.txt in the topmost Caffe2
# directory
cmake -DUSE_CUDA=ON -DUSE_LEVELDB=ON -DCMAKE_PREFIX_PATH=~/anaconda2/envs/my_caffe2_env -DCMAKE_INSTALL_PREFIX=~/anaconda2/envs/my_caffe2_env ..
sudo make install
