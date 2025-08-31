#! /bin/bash
rm -rf .repo/local_manifests; \
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

rm -rf out/target/product/RMX2195
rm -rf device/realme/RMX2195
rm -rf kernel/realme/RMX2195
rm -rf vendor/realme/RMX2195
rm -rf device/realme/bengal-common
rm -rf hardware/oplus

# Device Tree
git clone https://github.com/SM4250-Dev/device_realme_RMX2195.git -b los device/realme/RMX2195; \
# Device tree common
git clone https://github.com/SM4250-Dev/device_realme_bengal-common.git -b los device/realme/bengal-common; \

# Vendor
git clone https://github.com/SM4250-Dev/vendor_realme_RMX2195.git vendor/realme/RMX2195 -b los --depth=1; \

# Kernel
git clone https://github.com/SM4250-Dev/kernel_realme_RMX2195.git -b stable --depth=1 kernel/realme/RMX2195; \

# Hardware oplus
git clone https://github.com/LineageOS/android_hardware_oplus.git hardware/oplus -b lineage-19.1; \

. build/envsetup.sh; \

breakfast RMX2195 userdebug ; \
mka bacon ; \
