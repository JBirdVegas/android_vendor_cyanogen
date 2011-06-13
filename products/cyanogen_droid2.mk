# Inherit AOSP device configuration for passion.
$(call inherit-product, device/motorola/droid2/droid2.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_droid2
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := droid2
PRODUCT_MODEL := DROID2
PRODUCT_MANUFACTURER := Motorola

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-DROID2
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC0-DROID2
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC0-DROID2-KANG
    endif
endif

#TODO This needs to be updated to include newest droid2 build.prop values
PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=VZW BUILD_DISPLAY_ID=GRH78C PRODUCT_NAME=shadow_vzw TARGET_DEVICE=cdma_shadow BUILD_FINGERPRINT=verizon/shadow_vzw/cdma_shadow/shadow:2.2.1/VZW/23.340:user/ota-rel-keys,release-keys PRODUCT_BRAND=verizon PRIVATE_BUILD_DESC="cdma_shadow-user 2.2.1 VZW 2.3.340 ota-rel-keys,release-keys" BUILD_NUMBER=2.3.340 BUILD_UTC_DATE=1289194863 TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys USER=w30471

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/droid2

# Add the Torch app
PRODUCT_PACKAGES += Torch
