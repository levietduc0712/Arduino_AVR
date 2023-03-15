CC = "AVR_ARDUINO/avr-gcc/bin/avr-gcc"
CPP = "AVR_ARDUINO/avr-gcc/bin/avr-g++"
AR = "AVR_ARDUINO/avr-gcc/bin/avr-gcc-ar"
OBJCOPY = "AVR_ARDUINO/avr-gcc/bin/avr-objcopy"
AR_SIZE = "AVR_ARDUINO/avr-gcc/bin/avr-size"

MAIN_SKETCH = Blink.cpp
F_CPU = 16000000
MCU = atmega328p

GENERAL_CC = -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=$(MCU) -DF_CPU=$(F_CPU)L -DARDUINO=10813 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR
GENERAL_CPP = -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=$(MCU) -DF_CPU=$(F_CPU)L -DARDUINO=10813 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR

CORES_ARDUINO = "-IC:AVR_ARDUINO/cores/arduino"
VAR_STANDARD = "-IC:AVR_ARDUINO/variants/standard"
LIBRARY_DIR = "AVR_ARDUINO/cores/arduino/"
OUTPUT = "AVR_ARDUINO/output/cores/"

build:
	Compiling sketch
	$(CC) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(MAIN_SKETCH) -o $(MAIN_SKETCH).o
	Compiling libraries
	Compiling core
	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=$(MCU) -DF_CPU=$(F_CPU)L -DARDUINO=10813 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring_pulse.S -o $(OUTPUT)wiring_pulse.S.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)hooks.c -o $(OUTPUT)hooks.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring_analog.c -o $(OUTPUT)wiring_analog.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring_pulse.c -o $(OUTPUT)wiring_pulse.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring.c -o $(OUTPUT)wiring.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring_digital.c -o $(OUTPUT)wiring_digital.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)wiring_shift.c -o $(OUTPUT)wiring_shift.c.o 
	$(CC) $(GENERAL_CC) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)WInterrupts.c -o $(OUTPUT)WInterrupts.c.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)CDC.cpp -o $(OUTPUT)CDC.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)PluggableUSB.cpp -o $(OUTPUT)PluggableUSB.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)HardwareSerial0.cpp -o $(OUTPUT)HardwareSerial0.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)HardwareSerial.cpp -o $(OUTPUT)HardwareSerial.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)HardwareSerial2 -o $(OUTPUT)HardwareSerial2.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)HardwareSerial1.cpp -o $(OUTPUT)HardwareSerial1.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)IPAddress.cpp -o $(OUTPUT)IPAddress.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)HardwareSerial3.cpp -o $(OUTPUT)HardwareSerial3.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)Print.cpp -o $(OUTPUT)Print.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)Stream.cpp -o $(OUTPUT)Stream.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)Tone.cpp -o $(OUTPUT)Tone.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)USBCore.cpp -o $(OUTPUT)USBCore.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)WMath.cpp -o $(OUTPUT)WMath.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)WString.cpp -o $(OUTPUT)WString.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)abi.cpp -o $(OUTPUT)abi.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)main.cpp -o $(OUTPUT)main.cpp.o 
	$(CPP) $(GENERAL_CPP) $(CORES_ARDUINO) $(VAR_STANDARD) $(LIBRARY_DIR)new.cpp -o $(OUTPUT)new.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)wiring_pulse.S.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)hooks.c.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)wiring_analog.c.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)wiring_pulse.c.o  
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)wiring_digital.c.o  
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)wiring_shift.c.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)WInterrupts.c.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)CDC.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)PluggableUSB.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)HardwareSerial0.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)HardwareSerial.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)HardwareSerial2.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)HardwareSerial1.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)IPAddress.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)HardwareSerial3.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)Print.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)Stream.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)Tone.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)USBCore.cpp.o 
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)WMath.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)WString.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)abi.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)main.cpp.o
	$(AR) rcs $(OUTPUT)core.a $(OUTPUT)new.cpp.o
	Linking everything together
	$(CC) -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=$(MCU) -o $(MAIN_SKETCH).elf $(MAIN_SKETCH).o $(OUTPUT)core.a "-LC:AVR_ARDUINO/output" -lm
	$(OBJCOPY) -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 Blink.elf $(MAIN_SKETCH).eep
	$(OBJCOPY) -O ihex -R .eeprom $(MAIN_SKETCH).elf $(MAIN_SKETCH).hex
	$(AR_SIZE) -A $(MAIN_SKETCH).elf

