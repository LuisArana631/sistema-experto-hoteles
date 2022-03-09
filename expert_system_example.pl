%To Start the system type start.
% Name : - Chamara M. Dodandeniya

start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
		
        write("Hi. How are you? First of all tell me your name Please : "),
        read(Patient),
        hypothesis(Patient,Disease),
        write(Patient),write(', you '), write(' probably have '),write(Disease),write('.'),undo,
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.
        
        
    symptom(Patient,fever) :- verify(Patient," have a fever (y/n) ?").
 
    symptom(Patient,rash) :- verify(Patient," have a rash (y/n) ?").
  
    symptom(Patient,headache) :- verify(Patient," have a headache (y/n) ?").

    symptom(Patient,runny_nose) :- verify(Patient," have a runny_nose (y/n) ?").
    
    symptom(Patient,conjunctivitis) :- verify(Patient," have a conjunctivitis (y/n) ?").
    
    symptom(Patient,cough) :- verify(Patient," have a cough (y/n) ?").
	
    symptom(Patient,body_ache) :- verify(Patient," have a body_ache (y/n) ?").
 
    symptom(Patient,chills) :- verify(Patient," have a chills (y/n) ?").
   
    symptom(Patient,sore_throat) :- verify(Patient," have a sore_throat (y/n) ?").
  
    symptom(Patient,sneezing) :- verify(Patient," have a sneezing (y/n) ?").
   
    symptom(Patient,swollen_glands) :- verify(Patient," have a swollen_glands (y/n) ?").
	
	  symptom(_,"Sorry, I don't seem to be able to diagnose the disease.").

        
    hypothesis(Patient,measles) :-
        symptom(Patient,fever),
        symptom(Patient,cough),
        symptom(Patient,conjunctivitis),
        symptom(Patient,runny_nose),
        symptom(Patient,rash).
    
    hypothesis(Patient,german_measles) :-
        symptom(Patient,fever),
        symptom(Patient,headache),
        symptom(Patient,runny_nose),
        symptom(Patient,rash).
        
    hypothesis(Patient,flu) :-
        symptom(Patient,fever),
        symptom(Patient,headache),
        symptom(Patient,body_ache),
        symptom(Patient,conjunctivitis),
        symptom(Patient,chills),
        symptom(Patient,sore_throat),
        symptom(Patient,runny_nose),
        symptom(Patient,cough).    
        
    hypothesis(Patient,common_cold) :-
        symptom(Patient,headache),
        symptom(Patient,sneezing),
        symptom(Patient,sore_throat),
        symptom(Patient,runny_nose),
        symptom(Patient,chills).
        
    hypothesis(Patient,mumps) :-
        symptom(Patient,fever),
        symptom(Patient,swollen_glands).
    
    hypothesis(Patient,chicken_pox) :-
        symptom(Patient,fever),
        symptom(Patient,chills),
        symptom(Patient,body_ache),
        symptom(Patient,rash).
    
    hypothesis(Patient,measles) :-
        symptom(Patient,cough),
        symptom(Patient,sneezing),
        symptom(Patient,runny_nose).
        
	  hypothesis(_,"disease. But I'm Sorry, I don't seem to be able to diagnose the disease").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(Patient,Question) :-
	write(Patient),write(', do you'),write(Question),
	read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt(Patient):- 
		hypothesis(Patient,Disease),
    write(Patient),write(', you probably have '),write(Disease),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.
	
help :- write("To start the expert system please type 'start.' and press Enter key").