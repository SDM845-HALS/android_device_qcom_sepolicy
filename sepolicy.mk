# Board specific SELinux policy variable definitions
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy-sdm710/generic/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy-sdm710/generic/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy-sdm710/qva/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy-sdm710/qva/private

# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS += \
    device/qcom/sepolicy-sdm710/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    device/qcom/sepolicy-sdm710/product/private

ifeq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
        device/qcom/sepolicy-sdm710/generic/vendor/common \
        device/qcom/sepolicy-sdm710/qva/vendor/common/sysmonapp \
        device/qcom/sepolicy-sdm710/qva/vendor/ssg \
        device/qcom/sepolicy-sdm710/timeservice \
        device/qcom/sepolicy-sdm710/qva/vendor/qwesas \
        device/qcom/sepolicy-sdm710/qva/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/generic/vendor/$(TARGET_BOARD_PLATFORM)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/qva/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/generic/vendor/$(TARGET_SEPOLICY_DIR)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/qva/vendor/$(TARGET_SEPOLICY_DIR)
    endif

    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/generic/vendor/test
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/qva/vendor/test
    endif
endif

ifneq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
        device/qcom/sepolicy-sdm710/legacy/vendor/common/sysmonapp \
        device/qcom/sepolicy-sdm710/legacy/vendor/ssg \
        device/qcom/sepolicy-sdm710/timeservice \
        device/qcom/sepolicy-sdm710/legacy/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/legacy/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/legacy/vendor/$(TARGET_SEPOLICY_DIR)
    endif
    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-sdm710/legacy/vendor/test
    endif
endif

-include device/lineage/sepolicy/qcom/sepolicy.mk
