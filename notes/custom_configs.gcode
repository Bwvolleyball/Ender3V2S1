; Custom Config Settings
; Professional Firmware Config File
;=====================================================
C10                          ; Mark as a configuration/theme file
;-----------------------------------------------------
C29 L25 R204 F25 B205 N9 T60 ; Mesh inset and leveling settings: 9x9 T=60 C
M603 L200.00 U200.00         ; Configure Filament Change
C104 T275                    ; Max Extruder temperature
C125 X240 Y221 Z20           ; Park Head
C412 M0                      ; Filament runout sensor: Active mode: LOW
C562 E0                      ; Invert Extruder: Not inverted
C851 F0.00000 S480 M0        ; Probe Z Fix, Speed and Multiple Probing
;-----------------------------------------------------
M500                         ; Save all settings
;-----------------------------------------------------
G4 S1                        ; Wait a second
M300 P200                    ; Beep