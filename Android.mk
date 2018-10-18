LOCAL_PATH := $(call my-dir)

libpaho-mqtt3_lib_path := src
libpaho-mqtt3_c_includes := $(LOCAL_PATH)/include \
	external/hdc/android-ifaddrs \
	external/openssl/include \
	external/zlib 

libpaho-mqtt3_local_src_c_files_common := \
	$(libpaho-mqtt3_lib_path)/MQTTProtocolClient.c \
	$(libpaho-mqtt3_lib_path)/Tree.c \
	$(libpaho-mqtt3_lib_path)/Heap.c \
	$(libpaho-mqtt3_lib_path)/MQTTPacket.c \
	$(libpaho-mqtt3_lib_path)/Clients.c \
	$(libpaho-mqtt3_lib_path)/Thread.c \
	$(libpaho-mqtt3_lib_path)/utf-8.c \
	$(libpaho-mqtt3_lib_path)/StackTrace.c \
	$(libpaho-mqtt3_lib_path)/MQTTProtocolOut.c \
	$(libpaho-mqtt3_lib_path)/Socket.c \
	$(libpaho-mqtt3_lib_path)/Log.c \
	$(libpaho-mqtt3_lib_path)/Messages.c \
	$(libpaho-mqtt3_lib_path)/LinkedList.c \
	$(libpaho-mqtt3_lib_path)/MQTTPersistence.c \
	$(libpaho-mqtt3_lib_path)/MQTTPacketOut.c \
	$(libpaho-mqtt3_lib_path)/SocketBuffer.c \
	$(libpaho-mqtt3_lib_path)/MQTTPersistenceDefault.c \
	$(libpaho-mqtt3_lib_path)/MQTTProperties.c \
	$(libpaho-mqtt3_lib_path)/WebSocket.c \
	$(libpaho-mqtt3_lib_path)/SHA1.c \
	$(libpaho-mqtt3_lib_path)/Base64.c \
	$(libpaho-mqtt3_lib_path)/MQTTReasonCodes.c


libpaho-mqtt3_local_src_c_files_c := \
	$(libpaho-mqtt3_lib_path)/MQTTClient.c \

libpaho-mqtt3_local_src_c_files_cs := \
	$(libpaho-mqtt3_lib_path)/MQTTClient.c \
	$(libpaho-mqtt3_lib_path)/SSLSocket.c \

libpaho-mqtt3_local_src_c_files_a := \
	$(libpaho-mqtt3_lib_path)/MQTTAsync.c \

libpaho-mqtt3_local_src_c_files_as := \
	$(libpaho-mqtt3_lib_path)/MQTTAsync.c \
	$(libpaho-mqtt3_lib_path)/SSLSocket.c \

MY_CFLAGS := -Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-type-limits
# building static libraries
include $(CLEAR_VARS)
LOCAL_MODULE := libpaho-mqtt3c
LOCAL_CFLAGS := $(MY_CFLAGS)
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_c)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3cs
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/$(libpaho-mqtt3_lib_path)
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_CFLAGS := $(MY_CFLAGS) -DOPENSSL
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_cs)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3a
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/${libpaho-mqtt3_lib_path}
LOCAL_CFLAGS := $(MY_CFLAGS)
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_a)
include $(BUILD_STATIC_LIBRARY)
  
include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3as
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/${libpaho-mqtt3_lib_path}
LOCAL_CFLAGS := $(MY_CFLAGS) -DOPENSSL
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_as)
include $(BUILD_STATIC_LIBRARY)

# building shared libraries

include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3c
LOCAL_SHARED_LIBRARIES := libdl
LOCAL_CFLAGS := $(MY_CFLAGS)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/$(libpaho-mqtt3_lib_path)
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_c)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3cs
LOCAL_SHARED_LIBRARIES := libcrypto libssl libdl
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/$(libpaho-mqtt3_lib_path)
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_CFLAGS := $(MY_CFLAGS) -DOPENSSL
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_cs)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3a
LOCAL_SHARED_LIBRARIES := libdl
LOCAL_CFLAGS := $(MY_CFLAGS)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/${libpaho-mqtt3_lib_path}
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_a)
include $(BUILD_SHARED_LIBRARY)
 
include $(CLEAR_VARS)
LOCAL_MODULE    := libpaho-mqtt3as
LOCAL_SHARED_LIBRARIES := libcrypto libssl libdl
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/${libpaho-mqtt3_lib_path}
LOCAL_CFLAGS := $(MY_CFLAGS) -DOPENSSL
LOCAL_C_INCLUDES:= $(libpaho-mqtt3_c_includes)
LOCAL_SRC_FILES := $(libpaho-mqtt3_local_src_c_files_common) $(libpaho-mqtt3_local_src_c_files_as)
include $(BUILD_SHARED_LIBRARY)
