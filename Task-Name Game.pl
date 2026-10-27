%Name Game
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

name_game :-
    writeln('Hi, this is the "Name Game"'),
    writeln('Add, delete or move letters to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    choice(Choice).

choice(1) :-
    findall(L, letter(L), Letters),
    write('Current letters: '), writeln(Letters),
    menu.
choice(2) :-
    write('Enter a letter: '), read(L),
    assertz(letter(L)),
    menu.
choice(3) :-
    write('Enter a letter: '), read(L),
    asserta(letter(L)),
    menu.
choice(4) :-
    write('Enter a letter: '), read(L),
    assertz(letter(L)),
    menu.
choice(5) :-
    write('Enter the letter to delete: '), read(L),
    ( retract(letter(L))
    -> writeln('Letter deleted.')
    ;  writeln('Letter not found.')
    ),
    menu.
choice(6) :-
    retractall(letter(_)),
    writeln('All letters deleted.'),
    menu.
choice(7) :-
    writeln('Goodbye!').
choice(Choice) :-
    \+ member(Choice, [1, 2, 3, 4, 5, 6, 7]),
    writeln('Invalid choice. Please try again.'),
    menu.

% Run with: ?- name_game.