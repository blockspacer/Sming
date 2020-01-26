COMPONENT_DEPENDS			:= esp8266

COMPONENT_SRCDIRS			:= .
COMPONENT_INCDIRS			:= include

COMPONENT_DOXYGEN_INPUT		:= include/driver

COMPONENT_DOXYGEN_PREDEFINED := \
	ENABLE_CUSTOM_PWM=1

# hw_timer
COMPONENT_VARS				+= USE_US_TIMER
USE_US_TIMER				?= 1
ifeq ($(USE_US_TIMER),1)
GLOBAL_CFLAGS				+= -DUSE_US_TIMER
endif

# PWM
COMPONENT_RELINK_VARS		+= ENABLE_CUSTOM_PWM
ENABLE_CUSTOM_PWM			?= 1
ifeq ($(ENABLE_CUSTOM_PWM), 1)
	COMPONENT_SUBMODULES	+= new-pwm
	COMPONENT_SRCDIRS		+= new-pwm
	COMPONENT_CFLAGS		+= -DSDK_PWM_PERIOD_COMPAT_MODE=1
else
	LIBS					+= pwm
endif