arc([H|T],Node,Cost,KB) :- member([H|B],KB),
                           append(B,T,Node),
                           length(B,L),
                           Cost is 1+ L/(L+1).

goal([]).

astar(Node, Node, 0, _):- goal(Node).
astar(Node, [Node|Path], Cost, KB):- arc(Node, NextNode, ArcCost, KB),
                                     astar(NextNode, Path, AccCost, KB),
                                     Cost is ArcCost + AccCost.
