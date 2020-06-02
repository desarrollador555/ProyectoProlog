%declaracion de librerias para la interfaz

:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
inicio:-
	new(Menu, dialog('Proyecto Sistema Experto - Diagnostico Medico', size(1000,800))),
	new(L,label(nombre,'SISTEMA DE DIAGNOSTICO MEDICO')),
	new(A,label(nombre,'Hecho por Willian G Dzul Castillo y Limbergh A Morales Arellano')),
	new(@texto,label(nombre,'Responda El Cuestionario Para Diagnostico')),
	new(@respl,label(nombre,'')),
	new(Salir,button('Salir',and(message(Menu, destroy),message(Menu,free)))),
	new(Repetir,button('Repetir',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('Realizar Cuestionario',message(@prolog,botones))),

	send(Menu,append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu,display,L,point(125,20)),
	send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,Repetir,point(120,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

% Enfermedad que presenta y tratamiento de acuerdo a las reglas de
% diagnostico

fallas('Usted Padece Paperas:
       TRATAMIENTO:
Aplicar compresas frías o calientes en la zona del cuello.
Tomar paracetamol (Tylenol) para aliviar el dolor. (No le dé ácido acetilsalicílico
a los niños con una enfermedad viral debido al riesgo del síndrome de Reye).
Tomar líquidos adicionales.
Comer alimentos blandos.
Hacer gárgaras con agua tibia con sal.
'):-paperas,!.

fallas('Usted Padece Varicela:
       TRATAMIENTO:
Lociones para aliviar la picazón, paracetamol para la fiebre y el fármaco antivírico
aciclovir.  el aciclovir reduce el número de días de fiebre de la varicela en niños
sin otra enfermedad,'):-varicela,!.

fallas('Usted Padece Sarampion:
       TRATAMIENTO:
El descanso y el aislamiento junto con el tratamiento de síntomas se pueden emprender
para permitir el paso del episodio lejos en sus los propio. cremas hidratantes Locales
de la piel se prescriben en caso de la erupción que pica. '):-sarampion,!.

fallas('Usted Padece Anemia:
       TRATAMIENTO:
Tratamiento para detener el sangrado. Si la pérdida de sangre está causando
anemia por deficiencia de hierro, el tratamiento dependerá de la causa del sangrado.
Por ejemplo, si usted tiene una úlcera sangrante,
el médico puede recetarle antibióticos y otras medicinas para tratar la úlcera.
	 '):-anemia,!.

fallas('Usted Padece Resfriado:
       TRATAMIENTO:
El tratamiento de los síntomas no hará desaparecer el resfriado,
pero le ayudará a sentirse mejor.
Los antibióticos casi nunca se necesitan para tratar un resfriado común.
El paracetamol (Tylenol) y el ibuprofeno (Advil, Motrin) ayudan a disminuir
la fiebre y aliviar los dolores musculares.
         '):-resfriado,!.

fallas('Usted Padece Influenza:
       TRATAMIENTO:
Se recomiendan tres medicamentos antivirales para la influenza aprobados por
la Administración de Alimentos y Medicamentos de EE. UU. (FDA) para usar en
los Estados Unidos durante la temporada de influenza 2015-2016: oseltamivir
(Tamiflu®) por vía oral, zanamivir (Relenza®) para inhalar y peramivir
(Rapivab®) por vía intravenosa. Estos medicamentos son antivirales químicamente
relacionados, conocidos como inhibidores de neuraminidasa que actúan contra los
virus de la influenza A y B.
         '):-influenza,!.

fallas('Usted Padece Hepatitis B:
       TRATAMIENTO:
Actualmente disponemos del interferón alfa en forma pegilada denominada Peg-IFN,
fármaco que estimula la inmunidad y que actúa sobre el sistema inmunológico para
que éste elimine las células hepáticas infectadas. También podemos utilizar dos
tipos de sustancias antivirales: los análogos de los nucleósidos a los que
pertenecen lamivudina, telbivudina y entecavir y los análogos del nucleótidos
como son adefovir y tenofovir.
         '):-hepatitisb,!.

fallas('Usted Padece Hepatitis C:
       TRATAMIENTO:
El tratamiento de la hepatitis C se basa en medicamentos antivirales.
El tratamiento indicado es la combinación de dos medicamentos,
el interferón alfa y la ribavirina y, actualmente, se emplea una nueva
formulación del interferón alfa, el interferón alfa pegilado,
cuya eficacia en combinación con ribavirina es aún mayor.
'):-hepatitisc,!.

fallas('Sin Resultados, Usted No Proporcionó Información Suficiente').

% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad

paperas:- spaperas,
	pregunta('¿Presenta fiebre?'),
	pregunta('¿Presenta perdida de apetito'),
	pregunta('¿Presenta dolor en las glandulas salivales?');
	pregunta('¿Presenta Dolores musculares?');
	pregunta('¿Presenta dificultad para masticar o tragar?');
	pregunta('¿Presenta debilidad y fatiga?');
        pregunta('¿Presenta dolor de cabeza?').

varicela:- svaricela,
        pregunta('¿Presenta fiebre? '),
	pregunta('¿Presenta dolor de cabeza?'),
	pregunta('¿Presenta cansancio');
	pregunta('¿Presenta pérdida de apetito?').

sarampion:- ssarampion,
	pregunta('¿Presenta tos?'),
        pregunta('¿Presenta moqueo?');
	pregunta('¿Presenta puntos blancos en la boca?');
	pregunta('¿Presenta fiebre?').

anemia:- sanemia,
	pregunta('¿Presenta dolor de cabeza?'),
	pregunta('¿Presenta palidez?');
	pregunta('¿Presenta dolor en pecho?');
	pregunta('¿Presenta frio en manos y pies? ');
        pregunta('¿Presenta mareo?').

resfriado:- sresfriado,
	pregunta('¿Presenta dolor de garganta?'),
	pregunta('¿Presenta escalofrios?'),
	pregunta('¿Presenta fiebre?'),
	pregunta('¿Presenta dificultad para tragar?');
	pregunta('¿Presenta cansancio? ').

influenza:- sinfluenza,
	pregunta('¿Presenta fiebre?'),
	pregunta('¿Presenta escalofrios?'),
	pregunta('¿Presenta tos'),
	pregunta('¿Presenta dolor de garganta? '),
	pregunta('¿Presenta moqueo?'),
	pregunta('¿Presenta dolor muscular?');
	pregunta('¿Presenta diarrea?').

hepatitisb:- shepatitisb,
	pregunta('¿Presenta coloracion amarillenta?'),
	pregunta('¿Presenta orina oscura?'),
	pregunta('¿Presenta cansancio'),
	pregunta('¿Presenta vomito? '),
	pregunta('¿Presenta dolor abdominal?');
	pregunta('¿Presenta diarrea?').

hepatitisc:- shepatitisc,
	pregunta('¿Presenta cansancio?'),
	pregunta('¿Presenta coloracion amarilenta?'),
	pregunta('¿Presenta perdida de apetito'),
	pregunta('¿Presenta heces blanquecinas?');
	pregunta('Presenta picores generalizados');
	pregunta('¿Presenta alteraciones en coagulacion');
	pregunta('¿Presenta hinchazon en piernas y abdomen?');
	pregunta('¿Presenta orina oscura? ').

%identificador de falla que dirige a las preguntas correspondientes

spaperas:-pregunta('¿Presenta alguna inflamación o dolor en al madíbula?'),!.
svaricela:-pregunta('¿Presenta ampollas o erupciones que le producen picazón?'),!.
ssarampion:-pregunta('¿Presenta erupción en la piel de color roja con manchas?'),!.
sanemia:-pregunta('¿Presenta cansancio y debilidad acompañado de palidez?'),!.
sresfriado:-pregunta('¿Presenta malestar general?'),!.
sinfluenza:-pregunta('¿Presenta malestar general acompañado de escalofríos?'),!.
shepatitisb:-pregunta('¿Presenta alguna pigmentacion amarilla de la piel y la parte blanca del ojo?'),!.
shepatitisc:-pregunta('¿Presenta alguna hinchazón en el área del abdomen?'),!.

% proceso del diagnostico basado en preguntas de si y no, cuando el
% usuario dice si, se pasa a la siguiente pregunta del mismo ramo, si
% dice que no se pasa a la pregunta del siguiente ramo


:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Diagnostico Medico')),
     new(L2,label(texto,'Responde las siguientes preguntas')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).

% cada vez que se conteste una pregunta la pantalla se limpia para
% volver a preguntar

pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

% proceso de eleccion de acuerdo al diagnostico basado en las preguntas
% anteriores

botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento mecanico',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
