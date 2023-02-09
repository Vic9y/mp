DATA SEGMENT
    MSG1 DB “ENTER THE STRING : $”
    	MSG2 DB “NO OF OCCURRENCES OF e : $”
    NEWLINE DB 10, 13, ‘$’
    	STR1 DB 80 DUP(‘$’)
    CNT DB 0
DATA ENDS
CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX, DATA
        MOV DS, AX
        MOV AH, 09H
        LEA DX, MSG1
        INT 21H
        MOV AH, 0AH
        LEA DX, STR1
        INT 21H
        MOV AH, 09H
        LEA DX, NEWLINE
        INT 21H
        LEA SI, STR+1
        MOV CL, BYTE PTR[SI]
        MOV CH, 00H
    L1:       INC SI
        CMP BYTE PTR[SI], ‘e’
        JNC L2
        INC CNT
    L2:       LOOP L1
        ADD CNT, ‘0’
        MOV AH, 09H
        LEA DX, MSG2
        INT 21H
        MOV AH, 02H
        MOV DH, 00H
        MOV DL, CNT
        INT 21H
        MOV AH, 4CH
        INT 21H
CODE ENDS
    END START