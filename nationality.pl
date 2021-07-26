% Author : - Gulzar Safar

tree(if_then_else('employee is from Asia',
                        if_then_else('employee is from Azerbaijan',
                                    if_then_else('Azerbaijani is native language',
                                                        if_then_else('employee\'s father is from Azerbaijan',
                                                                    nationality('Azerbaijani'),
                                                                     if_then_else('employee\'s father is from Russia', nationality('Russian'), false)),
                                                         if_then_else('Russian is native language',
                                                                if_then_else('employee\'s father is from Azerbaijan',
                                                                                nationality('Azerbaijani'),
                                                                                if_then_else('employee\'s father is from Russia', nationality('Russian'),false)),
                                                                                false)),
                                                                                     
                        if_then_else('employee is from Georgia',
                                    if_then_else('Georgian is native language',
                                                        if_then_else('employee\'s father is from Georgia',
                                                                    nationality('Georgian'),
                                                                     if_then_else('employee\'s father is from Russia', nationality('Russian'), false)),
                                                        if_then_else('Russian is native language',
                                                                if_then_else('employee\'s father is from Georgia',
                                                                                nationality('Georgian'),
                                                                                if_then_else('employee\'s father is from Russia', nationality('Russian'),false)),
                                                                                if_then_else('Azerbaijani is native language',
                                                                                            if_then_else('employee\'s father is from Georgia',
                                                                                                            nationality('Georgian'),
                                                                                                            if_then_else('employee\'s father is from Azerbaijan', nationality('Azerbaijani'), false)),
                                                                            false))),
                                                     false)),

        if_then_else('employee is from Europe',
                        if_then_else('employee is from France',
                                        if_then_else('French is native language',
                                                                if_then_else('employee\'s father is from France',
                                                                        nationality('French'),
                                                                        if_then_else('employee\'s father is from Italy', nationality('Italian'), false)),
                                                                if_then_else('Italian is native language',
                                                                        if_then_else('employee\'s father is from France',
                                                                                        nationality('French'),
                                                                                        if_then_else('employee\'s father is from Italy', nationality('Italian'),false)),
                                                                                        false)),
                                                                                     
                                        if_then_else('employee is from Germany',
                                                if_then_else('German is native language',
                                                                        if_then_else('employee\'s father is from Germany',
                                                                                         nationality('German'),
                                                                                        if_then_else('employee\'s father is from Turkey', nationality('Turkish'),false)),
                                                                        if_then_else('Turkish is native language',
                                                                                        if_then_else('employee\'s father is from Germany',
                                                                                                nationality('German'),
                                                                                                if_then_else('employee\'s father is from Turkey', nationality('Turkish'),false)),
                                                                                false)),
                                                false)),
                                                                                        false))).



 nationality(A) :-
        tree(T),
        tree_nationality(T, A).

tree_nationality(nationality(A), A).


tree_nationality(if_then_else(Cond,Then,Else), A) :-
                                                ( is_true(Cond) ->
                                                                tree_nationality(Then, A)
                                                                ; tree_nationality(Else, A)
                                                                ).
 
is_true(Q) :-
 format("~w?\n", [Q]),
 read(yes).