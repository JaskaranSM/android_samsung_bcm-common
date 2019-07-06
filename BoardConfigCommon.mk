# inherit from the proprietary version

# PATH
LOCAL_PATH := device/samsung/bcm-common

# Platform
TARGET_ARCH                   := arm
TARGET_NO_BOOTLOADER          := true
TARGET_BOARD_PLATFORM         := hawaii
TARGET_CPU_ABI                := armeabi-v7a
TARGET_CPU_ABI2               := armeabi
TARGET_ARCH_VARIANT           := armv7-a-neon
TARGET_CPU_VARIANT            := cortex-a9
TARGET_CPU_SMP                := true
ARCH_ARM_HAVE_TLS_REGISTER    := true
ARCH_ARM_HAVE_ARMV7A          := true
ARCH_ARM_HAVE_VFP             := true
ARCH_ARM_HAVE_NEON            := true
TARGET_BOOTLOADER_BOARD_NAME  := hawaii
TARGET_GLOBAL_CFLAGS          += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp -O3 -funsafe-math-optimizations
TARGET_GLOBAL_CPPFLAGS        += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp -O3 -funsafe-math-optimizations
WITH_SU                       := true

# Kernel
BOARD_KERNEL_BASE               := 0x81e00000
BOARD_KERNEL_PAGESIZE           := 4096
TARGET_KERNEL_CUSTOM_TOOLCHAIN  := arm-eabi-4.8
TARGET_KERNEL_CONFIG 			      := cm_defconfig
TARGET_KERNEL_SOURCE 			      := kernel/samsung/hawaii
KERNEL_TOOLCHAIN_PREFIX 		    := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
BOARD_MKBOOTIMG_ARGS 			      := --second $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/hawaii_ss_vivaltods5m_rev00.dtb

# Extended filesystem support
TARGET_KERNEL_HAVE_EXFAT        := true
TARGET_KERNEL_HAVE_NTFS         := true

# PARTITION SIZE
BOARD_BOOTIMAGE_PARTITION_SIZE        := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 1161543680
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 2424307712
BOARD_CACHEIMAGE_PARTITION_SIZE       := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE     := ext4

# FLASH BLOCK SIZE (BOARD_KERNEL_PAGESIZE * 64)
BOARD_FLASH_BLOCK_SIZE                := 262144

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_BCM                    := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF                 := $(LOCAL_PATH)/bluetooth/libbt_vndcfg_ace3.txt

# Connectivity - Wi-Fi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4343
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_NO_WIFI_HAL                := true


# Resolution
TARGET_SCREEN_HEIGHT              := 800
TARGET_SCREEN_WIDTH               := 480

# Hardware rendering
USE_OPENGL_RENDERER                         := true
BOARD_USE_MHEAP_SCREENSHOT                  := true
BOARD_EGL_WORKAROUND_BUG_10194508           := true
TARGET_USES_ION                             := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK       := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS       := true
COMMON_GLOBAL_CFLAGS                        += -DNEEDS_VECTORIMPL_SYMBOLS -DHAWAII_HWC -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Opengl
BOARD_USES_HWCOMPOSER             := true
BOARD_USE_BGRA_8888               := true

# Audio
BOARD_USES_ALSA_AUDIO             := true

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    #WITH_DEXPREOPT := true
  endif
endif

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD           := true
TARGET_BOOTANIMATION_TEXTURE_CACHE     := true

# Charger
BACKLIGHT_PATH                         := /sys/class/backlight/panel/brightness
BOARD_CHARGING_MODE_BOOTING_LPM        := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_ENABLE_SUSPEND           := true

# healthd
BOARD_HAL_STATIC_LIBRARIES             := libhealthd-vivaltods5m.hawaii

# RIL
BOARD_RIL_CLASS                        := ../../../device/samsung/bcm-common/ril/
COMMON_GLOBAL_CFLAGS                   += -DDISABLE_ASHMEM_TRACKING

# Recovery
#TARGET_RECOVERY_INITRC                := 
TARGET_RECOVERY_FSTAB                  := $(LOCAL_PATH)/ramdisk/fstab.hawaii_ss_vivaltods5m
TARGET_USERIMAGES_USE_EXT4             := true
TARGET_RECOVERY_PIXEL_FORMAT           := BGRA_8888
BOARD_HAS_NO_MISC_PARTITION            := true
BOARD_RECOVERY_HANDLES_MOUNT           := true
BOARD_USES_MMCUTILS                    := false
BOARD_RECOVERY_ALWAYS_WIPES            := false
BOARD_SUPPRESS_EMMC_WIPE               := true

# Vold
BOARD_UMS_LUNFILE                      := /sys/class/android_usb/f_mass_storage/lun/file
TARGET_USE_CUSTOM_LUN_FILE_PATH        := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR       := true
BOARD_VOLD_MAX_PARTITIONS              := 19

# CMHW
BOARD_HARDWARE_CLASS                   := hardware/samsung/cmhw/ device/samsung/bcm-common/cmhw/

# GPS
TARGET_SPECIFIC_HEADER_PATH            := $(LOCAL_PATH)/include

# jemalloc causes a lot of random crash on free()
MALLOC_IMPL                            := dlmalloc

# Misc.
TARGET_SYSTEM_PROP                     := $(LOCAL_PATH)/system.prop

BOARD_SEPOLICY_DIRS += \
    device/samsung/vivaltods5m/sepolicy
