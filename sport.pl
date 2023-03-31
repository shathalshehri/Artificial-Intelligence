/* prolog Sports identification game.
  start with ?- go.     */
go :- hypothesize(Sports),
      write('I think that the sport is: '),
      write(Sports),
      nl,
      undo.
/* hypotheses to be tested */
hypothesize(basketball)   :- basketball, !.
  hypothesize(swimming)     :- swimming, !.
  hypothesize(boxing)   :- boxing, !.
hypothesize(cycling)     :- cycling, !.
hypothesize(fishing)   :- fishing, !.
hypothesize(climbing)   :- climbing, !.
hypothesize(ice_hockey) :- ice_hockey, !.
 hypothesize(judo) :- judo, !.
 hypothesize(tennis) :- tennis, !.
 hypothesize(breakdancing) :- breakdancing, !.
 hypothesize(unknown).             /* no diagnosis */

/* sports identification rules */
basketball :- team_sport,
           use_hand,
           verify(has_shooting_selves),
           verify(has_hoop ),
            verify(has_short_and_shose),
            verify(has_wistbands),
            verify(five_player_in_each_team).

swimming :- individual_sport,
        use_body ,
         verify(has_pool_to_race),
         verify(has_fine_to_move),
         verify(has_goggles_for_eyes),
         verify(has_snorkels).

boxing :- combat_sport,
           verify(has_gloves),
           verify(has_mouthguards),
           verify(has_ring_robe),
           verify(has_body_protector).

cycling :- ride_sport,
           verify(race_for_faster),
           verify(has_jacket_short_Tshiert),
           verify(has_front_and_rear_light),
           verify(use_halmet),
           verify(use_bicycle)
           .

fishing :- individual_sport  ,
           verify(has_artifical_baits),
           verify(has_wear_bibs),
           verify(use_boots),
           verify(use_buckets_for_fish),
           verify(has_fishing_nets).

climbing :- extreme_sport,
           verify(has_harness),
           verify(has_helmet),
           verify(has_quickdraw),
           verify(use_ropes),
           verify(use_shoes_climbing).

ice_hockey :- team_sport,
             verify(played_on_ice),
             verify(has_hockey_to_play),
             verify(has_jackstraps_and_cups),
             verify(use_laces),
             verify(has_goalie_equipment).

judo :-use_legs_hand,

    verify(has_diffrent_kinds_of_belts),
    verify(use_elbow_pads),
    verify(has_grapping_dummies_for_parctice),
    verify(the_clothis_is_gis).

tennis :- hitting,
    verify(has_two_player_to_play),
    verify(has_ball_to_throw_it_to_otherSide),
    verify(use_bandana),
    verify(has_sunglasses),
    verify(has_hats),
    verify(use_knee_brace),
    verify(has_net),
    verify(use_rackets).

breakdancing :- acrobatic_sport,
    verify(has_comfortable_clothing),
    verify(has_elbow_and_knee_pads),
    verify(use_skateboard_helmet_for_headspins),
    verify(use_wrist_wraps).








/* classification rules */
team_sport :- verify(work_in_team), !.
use_hand :- verify(catch_the_ball), !.
individual_sport      :- verify(only_one_persone_not_in_team), !.
use_body       :- verify(use_all_ther_body_to_move_through_the_pool),!.
combat_sport :- verify(has_two_people_throwing_punches_to_win), !.
ride_sport :- verify(ride_individuals_by_use_bicycles),!.
extreme_sport :- verify(individuals_climb_up_rocks),!.
use_legs_hand :- verify(for_kicks_and_throws),!.
hitting :- verify(sport_that_hit_the_ball_repeatedly),!.
acrobatic_sport :- verify(different_styles_of_street_dancing),!.

/* how to ask questions */
ask(Question) :-
    write('Does the sports have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
 
