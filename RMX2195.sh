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
rm -rf hardware/qcom-caf/sm8250

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

# Remote
SM8250="https://github.com/custom-crdroid/hardware-qcom-caf-sm8250-xxx.git"
# CLO HALs
git clone $SM8250 -b audio hardware/qcom-caf/sm8250/audio
git clone $SM8250 -b media hardware/qcom-caf/sm8250/display
git clone $SM8250 -b display hardware/qcom-caf/sm8250/media

# Vendor common
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_wfd-commonsys -b lineage-18.1 vendor/qcom/common/system/wfd
git clone https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/location -b LA.UM.9.15.1.r1-04800-KAMORTA.0 vendor/qcom/common/system/gps
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_dataservices -b lineage-18.1 vendor/qcom/opensource/dataservices
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_display-commonsys -b lineage-19.0 vendor/qcom/opensource/display


. build/envsetup.sh; \

breakfast RMX2195 userdebug ; \
mka bacon ; \
