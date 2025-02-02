#!/bin/bash
#
# This script will download BiT models and create OpenVINO IRs.
#

# Download BiT models.

wget https://tfhub.dev/google/bit/m-r50x1/1?tf-hub-format=compressed -O bit_m_r50x1_1.tar.gz
mkdir -p bit_m_r50x1_1 && tar -xvf bit_m_r50x1_1.tar.gz -C bit_m_r50x1_1

wget https://tfhub.dev/google/bit/m-r50x3/1?tf-hub-format=compressed -O bit_m_r50x3_1.tar.gz
mkdir -p bit_m_r50x3_1 && tar -xvf bit_m_r50x3_1.tar.gz -C bit_m_r50x3_1

wget https://tfhub.dev/google/bit/m-r101x1/1?tf-hub-format=compressed -O bit_m_r101x1_1.tar.gz
mkdir -p bit_m_r101x1_1 && tar -xvf bit_m_r101x1_1.tar.gz -C bit_m_r101x1_1

wget https://tfhub.dev/google/bit/m-r101x3/1?tf-hub-format=compressed -O bit_m_r101x3_1.tar.gz
mkdir -p bit_m_r101x3_1 && tar -xvf bit_m_r101x3_1.tar.gz -C bit_m_r101x3_1


# Run Model Optimization and create OpenVINO IRs

saved_model_dir_list=("bit_m_r50x1_1" "bit_m_r50x3_1" "bit_m_r101x1_1" "bit_m_r101x3_1")

for saved_model_dir in ${saved_model_dir_list[@]}; do
    mo --framework tf \
    --saved_model_dir ./${saved_model_dir} \
    --output_dir ov_irs/${saved_model_dir}/
done
