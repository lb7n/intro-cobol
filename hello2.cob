      *****************************************
      *Date April 11, 2020
      *Purpose: Practice COBOL
      *Tectonics: cobc
      ****************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRACTICE-ROOM.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-USER.
           05 WS-FIRST-NAME PIC a(10).
           05 WS-LAST-NAME  PIC a(10).
           05 WS-FIRST-NUMBER    PIC s9(19)v9(19)   comp-3.
           05 WS-SECOND-NUMBER  PIC s9(19)v9(19)    comp-3.
       01 WS-FULL-NAME  PIC a(20).
       01 WS-CLOSE      PIC a(1).
       01 WS-ADDED-NUMBERS  PIC s9(19)v9(19)    comp-3.

       PROCEDURE DIVISION.
           PERFORM GET-DATA
           PERFORM CALC-DATA
           PERFORM SHOW-DATA
           PERFORM FINISH-UP
           GOBACK.

       GET-DATA.
           MOVE SPACE TO WS-USER WS-FULL-NAME
           DISPLAY "What is your first name?"
           ACCEPT WS-FIRST-NAME OF WS-USER
           DISPLAY "What is your last name?"
           ACCEPT WS-LAST-NAME OF WS-USER
           DISPLAY "Choose a number:"
           ACCEPT WS-FIRST-NUMBER OF WS-USER
           DISPLAY "Choose a second number:"
           ACCEPT WS-SECOND-NUMBER OF WS-USER
           STRING WS-FIRST-NAME OF WS-USER DELIMITED BY SPACE
           SPACE DELIMITED BY SIZE
                WS-LAST-NAME OF WS-USER DELIMITED BY SPACE
                SPACE DELIMITED BY SIZE
                INTO WS-FULL-NAME
                ON OVERFLOW
                DISPLAY "Your data was truncated :("
            END-STRING.

       CALC-DATA.
           ADD WS-FIRST-NUMBER WS-SECOND-NUMBER OF WS-USER TO
           WS-ADDED-NUMBERS.

       SHOW-DATA.
           DISPLAY "Welcome " WS-FULL-NAME " The sum of numbers is: "
           WS-ADDED-NUMBERS.

        FINISH-UP.
           DISPLAY "Press any key to close".
           ACCEPT WS-CLOSE
           DISPLAY "Goodbye!".
           END PROGRAM PRACTICE-ROOM. 
