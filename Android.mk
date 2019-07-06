LOCAL_PATH := $(call my-dir)

SAMSUNG_TARGETS := vivaltods5mxx vivaltods5m
 
ifneq ($(filter $(SAMSUNG_TARGETS),$(TARGET_DEVICE)),)

include $(all-subdir-makefiles)
include $(CLEAR_VARS)

endif
