file(GLOB MEM_SOURCES
    "*.cpp"
)

add_library(mem STATIC
    ${MEM_SOURCES}
)

target_include_directories(mem
    PUBLIC
        ${PROJECT_SOURCE_DIR}
)
