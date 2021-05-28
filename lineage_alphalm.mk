#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from alphalm device
$(call inherit-product, device/lge/alphalm/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifiers

PRODUCT_NAME := lineage_alphalm
PRODUCT_DEVICE := alphalm# import $(TARGET_PRODUCT) vendor rc file
import /vendor/etc/init/hw/init.${ro.hardware}_vendor.rc

# Begin Immersion Changes
service immvibed /vendor/bin/immvibed -p 99 -u 1000
    class late_start
    user root
    group root
    ioprio rt 4
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE
PRODUCT_RELEASE_NAME := G8 ThinQ
PRODUCT_MODEL := LM-G820

PRODUCT_GMS_CLIENTID_BASE := android-lge

TARGET_VENDOR_PRODUCT_NAME := alphalm_lao_com
TARGET_VENDOR_DEVICE_NAME := alphalm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="alphalm_lao_com" \
    PRIVATE_BUILD_DESC="alphalm_lao_com-user 10 QKQ1.191021.002 202480518b6a5 release-keys"

BUILD_FINGERPRINT := "lge/alphalm_lao_com/alphalm:10/QKQ1.190929.002/210471639d08f:user/release-keys"

