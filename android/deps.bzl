load("//:deps.bzl", 
    "build_bazel_rules_android",
    "com_google_protobuf_lite",
    "com_google_protobuf", 
    "gmaven_rules",
    "io_grpc_grpc_java",
)

def android_proto_compile(**kwargs):
    com_google_protobuf(**kwargs)
    com_google_protobuf_lite(**kwargs)

def android_grpc_compile(**kwargs):
    android_proto_compile(**kwargs)
    io_grpc_grpc_java(**kwargs)

def android_proto_library(**kwargs):
    android_proto_compile(**kwargs)
    build_bazel_rules_android(**kwargs)
    gmaven_rules(**kwargs)

def android_grpc_library(**kwargs):
    android_grpc_compile(**kwargs)    
    android_proto_library(**kwargs)