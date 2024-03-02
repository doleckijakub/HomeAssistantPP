TARGET := homeassistantpp

SRC_DIR := src
BUILD_DIR := build

SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRC_FILES))

CPPFLAGS += -I vendor/crow/include

$(TARGET): $(OBJ_FILES)
	g++ -o $@ $^

.PHONY: test
test: $(TARGET)
	./$(TARGET)

$(BUILD_DIR):
	mkdir $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	g++ -o $@ -c $(CPPFLAGS) $<
