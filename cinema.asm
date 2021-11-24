org 100h

.model small 

.stack 100h

.data


menu:    DB 0Dh,0Ah,"1- Movie theaters and their locations",0Dh,0Ah
         DB "2- Book a ticket",0Dh,0Ah 
         DB "3- Exit the application",0Dh,0Ah,
         DB "please choose: ", '$'

CrLf     db 13,10,'$'
         
totalbill: DB 0Dh,0Ah,"The total bill is: ",'$'

theaters_info:   
         DB 0Dh,0Ah,0Dh,0Ah,"Theater name               Location           Telephone number           Working hours",0Dh,0Ah
         DB "Adventure Theater          Madhura street     863-2569856            3 pm – 12 am",0Dh,0Ah
         DB "Comedy genre Theater       Ashok Nagar        0863-4587125           1 pm – 10 pm",0Dh,0Ah
         DB "Action Theater             Dilshuk Nagar      0863-5634872           1 pm – 10 pm",0Dh,0Ah
         DB "Thriller Theater           Jublee Hills       0863-4583765           1 pm – 10 pm",0Dh,0Ah
         DB "Horror Theater             Brodiepet          0863-5487177           1 pm – 10 pm",0Dh,0Ah,'$'


adventure_theater:
         DB 0Dh,0Ah,"1- adventure theater",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    100 Rs",0Dh,0Ah 
         DB "Adults               150 Rs",0Dh,0Ah
         DB "Seiners              125 Rs",0Dh,0Ah,'$'

comedy_theater:
         DB "2- comedy theater",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    85 Rs",0Dh,0Ah 
         DB "Adults               135 Rs",0Dh,0Ah
         DB "Seiners              115 Rs",0Dh,0Ah,'$'

action_theater:
         DB "3- action theater",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    105 Rs",0Dh,0Ah 
         DB "Adults               150 Rs",0Dh,0Ah
         DB "Seiners              135 Rs",0Dh,0Ah,'$'
thriller_theater:
         DB "4- thriller theater",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    110 Rs",0Dh,0Ah 
         DB "Adults               160 Rs",0Dh,0Ah
         DB "Seiners              135 Rs",0Dh,0Ah,'$'
horror_theater:
         DB "5- horror theater",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    115 Rs",0Dh,0Ah 
         DB "Adults               140 Rs",0Dh,0Ah
         DB "Seiners              135 Rs",0Dh,0Ah,'$'

theaters:      DB 0Dh,0Ah,"What theaters would you like to go to (1-Adventure , 2-Comedy, 3-Action, 4-Thriller, 5-Horror)? ",'$'
ticket:        DB 0Dh,0Ah,"What ticket would you like to buy (1-child , 2-adult , 3-seniors)? ",'$'
ticket_number: DB 0Dh,0Ah,"How many ticket do you want to buy ",'$'

child_adventure    DD 100 ; child Price for adventure theater       
adult_adventure    DD 150 ; adult Price for adventure theater
seiners_adventure  DD 125 ; seiners Price for adventure theater  

child_comedy    DD 85 ; child Price for film theater       
adult_comedy    DD 135 ; adult Price for film theater
seiners_comedy  DD 115 ; seiners Price for film theater

child_action    DD 105  ; child Price for action theater       
adult_action    DD 150 ; adult Price for action theater
seiners_action  DD 135 ; seiniors Price for action theater 

child_thriller    DD 110  ; child Price for action theater       
adult_thriller    DD 160 ; adult Price for action theater
seiners_thriller  DD 145 ; seiniors Price for action theater 

child_horror    DD 115  ; child Price for action theater       
adult_horror    DD 140 ; adult Price for action theater
seiners_horror  DD 135 ; seiniors Price for action theater

theater_type   DB 0
ticket_type    DB 0
ticket_num     DD 0
ticket_price   DD 0   
result         DD 0
              
.code

begin:
      mov ax,@data
      mov ds,ax
  
start:
; Code to display the menu  
      mov dx, offset menu
      mov ah, 09h
      int 21h
      
;code to choose one choice from the menu
get_choice:
     
      mov ah, 1
      int 21h

      ; first choice
      cmp al, '1'
      je  FIRST_CHOICE
      
      ; second choice
      cmp al, '2'
      je  SECOND_CHOICE
      
       ; third choice
      cmp al, '3'
      je  THIRD_CHOICE
      
    
      jmp get_choice
      
;===== Get a theaters_info =====
FIRST_CHOICE:
      ; Code to display the theaters_info message
      mov dx, offset theaters_info
      mov ah, 9
      int 21h

      mov dx, offset CRLF
      MOV AH,9
      INT 21H  
      
      ; return to menu
      jmp start

;===== book a ticket =====
SECOND_CHOICE:
      ; Code to display the theater type message
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      mov dx, offset adventure_theater
      mov ah, 9
      int 21h 
         
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset comedy_theater
      mov ah, 9
      int 21h
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset action_theater
      mov ah, 9
      int 21h 
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset thriller_theater
      mov ah, 9
      int 21h 
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset horror_theater
      mov ah, 9
      int 21h
      
      mov dx, offset theaters
      mov ah, 9
      int 21h
      
      ; Get the theaters type 
      MOV AH, 1
      INT 21H
      mov theater_type, al

      ; Code to display the ticket_type message
      mov dx, offset ticket
      mov ah, 9
      int 21h    
	  
      ; Get the ticket type 
      MOV AH, 1
      INT 21H
      mov ticket_type, al
	  
      ; Code to display the ticket_number message
      mov dx, offset ticket_number
      mov ah, 9
      int 21h
	  
      ; Get the ticket number      
      call INDEC
      mov ticket_num, ax

      ; check the theaters type
      cmp theater_type, '1'
      je  adventure_cinema
      cmp theater_type, '2'
      je comedy_cinema 
      cmp theater_type, '3'
      je action_cinema 
      cmp theater_type, '4'
      je thriller_cinema 
      cmp theater_type, '5'
      je horror_cinema
      jmp SECOND_CHOICE
       
  ; code for the film theaters
  adventure_cinema:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_adventure
	  mov ax, child_adventure
      mov ticket_price, ax
	  jmp calculate
	  
      ; adult ticket
    ADULT_ticket_adventure:
      cmp ticket_type, '2'
      jne SEINERS_ticket_adventure
	  mov ax, adult_adventure
      mov ticket_price, ax
      jmp calculate
      
      ; seiners ticket
    SEINERS_ticket_adventure:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seiners_adventure
      mov ticket_price, ax
	  jmp calculate 
	  
	  
  comedy_cinema:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_comedy
	  mov ax, child_comedy
      mov ticket_price, ax
	  jmp calculate
	  
      ; adult ticket
    ADULT_ticket_comedy:
      cmp ticket_type, '2'
      jne SEINERS_ticket_comedy
	  mov ax, adult_comedy
      mov ticket_price, ax
      jmp calculate
      
      ; seiners ticket
    SEINERS_ticket_comedy:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seiners_comedy
      mov ticket_price, ax
	  jmp calculate


  ; code for the action theaters
  action_cinema:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_action
	  mov ax, child_action
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_action:
      cmp ticket_type, '2'
      jne SEINERS_ticket_action
	  mov ax, adult_action
      mov ticket_price, ax
      jmp calculate
      
      ; seiners ticket
    SEINERS_ticket_action:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seiners_action
      mov ticket_price, ax
	  jmp calculate  
	  
	thriller_cinema:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_thriller
	  mov ax, child_thriller
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_thriller:
      cmp ticket_type, '2'
      jne SEINERS_ticket_thriller
	  mov ax, adult_thriller
      mov ticket_price, ax
      jmp calculate
      
      ; seiners ticket
    SEINERS_ticket_thriller:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seiners_thriller
      mov ticket_price, ax
	  jmp calculate  
	  
	horror_cinema:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_horror
	  mov ax, child_horror
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_horror:
      cmp ticket_type, '2'
      jne SEINERS_ticket_horror
	  mov ax, adult_horror
      mov ticket_price, ax
      jmp calculate
      
      ; seiners ticket
    SEINERS_ticket_horror:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seiners_horror
      mov ticket_price, ax
	  jmp calculate

	  
      ; calculate price
    calculate: 
      mov cx, ticket_num
	  mov ax, ticket_price
      mul cx  ; ticket_num * ticket_price
      mov result, ax
      
      ; Code to display the total bill message
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      mov dx, offset totalbill
      MOV AH,9
      INT 21H      
      
      mov ax, result
      call OUTDEC
      
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
               
      jmp start
      
THIRD_CHOICE:
      mov ah,4Ch
      int 21h
      
   
      
      INDEC PROC
  

   PUSH BX                        
   PUSH CX                        
   PUSH DX                       

   JMP @READ                      

   @SKIP_BACKSPACE:               
   MOV AH, 2                      
   MOV DL, 20H                    
   INT 21H                        

   @READ:                         
   XOR BX, BX                     
   XOR CX, CX                     
   XOR DX, DX                     

   MOV AH, 1                      
   INT 21H                        

   CMP AL, '-'                  
   JE @MINUS                      

   CMP AL, '+'                    
   JE @PLUS                     

   JMP @SKIP_INPUT               

   @MINUS:                        
   MOV CH, 1                      
   INC CL                        
   JMP @INPUT                     

   @PLUS:                        
   MOV CH, 2                      
   INC CL                        

   @INPUT:                        
     MOV AH, 1                    
     INT 21H                     

     @SKIP_INPUT:                 

     CMP AL, 0DH                  
     JE @END_INPUT               

     CMP AL, 8H                   
     JNE @NOT_BACKSPACE           

     CMP CH, 0                    
     JNE @CHECK_REMOVE_MINUS     

     CMP CL, 0                   
     JE @SKIP_BACKSPACE          
     JMP @MOVE_BACK               

     @CHECK_REMOVE_MINUS:         

     CMP CH, 1                  
     JNE @CHECK_REMOVE_PLUS       

     CMP CL, 1                  
     JE @REMOVE_PLUS_MINUS        

     @CHECK_REMOVE_PLUS:          

     CMP CL, 1                   
     JE @REMOVE_PLUS_MINUS        
     JMP @MOVE_BACK               

     @REMOVE_PLUS_MINUS:        
       MOV AH, 2                
       MOV DL, 20H                
       INT 21H                    

       MOV DL, 8H              
       INT 21H                    

       JMP @READ                 

     @MOVE_BACK:                 

     MOV AX, BX                 
     MOV BX, 10                  
     DIV BX                      

     MOV BX, AX                  

     MOV AH, 2                
     MOV DL, 20H                 
     INT 21H                      

     MOV DL, 8H                   
     INT 21H                      

     XOR DX, DX                  
     DEC CL                       

     JMP @INPUT                 

     @NOT_BACKSPACE:            

     INC CL                     

     CMP AL, 30H                  
     JL @ERROR                   

     CMP AL, 39H                  
     JG @ERROR                

     AND AX, 000FH               

     PUSH AX                      

     MOV AX, 10                  
     MUL BX                   
     MOV BX, AX                  

     POP AX                      

     ADD BX, AX                 
     JS @ERROR                   
   JMP @INPUT                   

   @ERROR:                      

   MOV AH, 2                      
   MOV DL, 7H                    
   INT 21H                     

   XOR CH, CH                   

   @CLEAR:                     
     MOV DL, 8H                
     INT 21H                    

     MOV DL, 20H                  
     INT 21H                     

     MOV DL, 8H                  
     INT 21H                  
   LOOP @CLEAR                    

   JMP @READ                      

   @END_INPUT:                   

   CMP CH, 1                        
   JNE @EXIT                      
   NEG BX                       

   @EXIT:                        

   MOV AX, BX                     

   POP DX                        
   POP CX                         
   POP BX                         

   RET                           
 INDEC ENDP 
 
    OUTDEC PROC
   PUSH BX                       
   PUSH CX                       
   PUSH DX                        

   CMP AX, 0                      
   JGE @START                  

   PUSH AX                        

   MOV AH, 2                 
   MOV DL, '-'                
   INT 21H                      
   POP AX                       
   NEG AX                        

   @START:                       

   XOR CX, CX                   
   MOV BX, 10                  

   @OUTPUT:                     
     XOR DX, DX              
     DIV BX                  
     PUSH DX                  
     INC CX                      
     OR AX, AX                 
   JNE @OUTPUT                 

   MOV AH, 2                 

   @DISPLAY:                  
     POP DX                    
     OR DL, 30H                
     INT 21H                 
   LOOP @DISPLAY              

   POP DX                    
   POP CX                        
   POP BX                    
   RET                        
 OUTDEC ENDP
 
 HLT