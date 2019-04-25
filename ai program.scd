(
		(

			/*
			To do:

			- make so you can set note set in GUI via mouse
			- PATTERNIZE
			- store data... for instance.... store note progression for patterns
			- make thing that does like... [a, c, f]... [a, c, f]*n.... maybe save the "n" value as well. yes
			- generate pattern of times, not just notes.... save the time patterns.... and asign time patterns with note patterns...
			.... make sure assigned time patterns are same size as note patterns... maybe use if statements in algo
			- figure out how to make two or more synths "make sense with each other"
			- figure out how to make note *and* time patterns.... more pattern-esqe.... like [432,432,543,543] or [432,432,432,789,789,789].. and
			... [1,0.5,0.25,0.5,0.25,0.5,1].. not sure about time patterns
			- make macro patterns.... maybe make arrays which save each pattern after each other.... and make a macro pattern
			- utilize macro and micro patterns to see how music starts and ends? Not sure if I want it to end :P
			- make loudness and softness
			- figure out how to make sections, or parts, of a running piece... different sections or parts... like.. adiago... presto etc... and even smaller
			parts... just like... different parts or sections of a single piece
			- make an ~f3 within task 1
			- make chords possible
			- create "branches".... like a tree.... so like... a root thing.... then it branches off..... then all other branches branche off.... and so on
			and so on... (side note: maybe related to souls?)
			- Find way to save random seeds
			- ***manitpulate and change generated patterns in different ways... ex... take radom ordered array... and make ordered from lowest to
			highest freq..... ..... and utilize all other tools to change and manipulate data... to change patterns.... and order.. and mix
			and match and stuff, already generated patterns/data sets (ie freqs)... utilize all and any tools
			- "I want a like.... genuine AI composer.... I want this AI to be honest in it's art <3.... To celebrate who it is :)... I want it to sound
			like an AI.....
			...I want it to embrace who and what it is
			- When generating patterns of notes.... generate a string of (***maybe***) random notes.... then generate another string of THOSE strings as
			sub-strings..... in different patterns - taking out or adding in notes of the original string, mix and match. See what you can do with that.
			Make it modular. Perhaps more than two levels of that.
			- Find a way to guide the algorithm to reach a kind of "conclusion", like and finale, or "goal", in terms of where the algorithm wants to
			go. Find a way to randomize this maybe..... Or to repeat the process. Be it for an entire piece of music and/or parts of a peice.
			- make different instruments
			- allow for both true and pseudo random generators
			- more
			*/

			(

		~gm = 1.6180339887499; //phi (golden mean), scaled on 1 key change per King Wen sequence
	~gm2 = ~gm**(1/2);
	~gm6 = ~gm**(1/6);

	~ngm1 = ~gm**(1/9);    //phi (golden mean), scaled on 9 key changes per King Wen sequence
	~ngm2 = ~ngm1**(1/2);
	~ngm6 = ~ngm1**(1/6);

	~nngm1 = ~gm**(1/64);  //phi (golden mean), scaled on 64 key changes per King Wen sequence
	~nngm2 = ~nngm1**(1/2);
	~nngm6 = ~nngm1**(1/6);

	~h1 = 360/19.47;       //based on 19.47:360, scaled on 1 key change per King Wen sequence
	~h2 = ~h1**(1/2);
	~h6 = ~h1**(1/6);

	~nh1 = ~h1**(1/9);     //based on 19.47:360, scaled on 9 key changes per King Wen sequence
	~nh2 = ~nh1**(1/2);
	~nh6 = ~nh1**(1/6);

	~nnh1 = ~h1**(1/64);   //based on 19.47:360, scaled on 64 key changes per King Wen sequence
	~nnh2 = ~nnh1**(1/2);
	~nnh6 = ~nnh1**(1/6);

		~tuning_frequency = 432; //default 432 hz
		~freqmap = (i = ~tuning_frequency / (2 ** (69 / 12)); a = (-1); b = (-1); Array.fill(128, {i * (2 ** (((a=a+1) / 12).trunc)) * ( (2 ** (12.reciprocal)) ** ((b=b+1)  % 12));}));/*~freqmap = (i = 8.0271480262684/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(128, { i = i*~stepratio;}));*/


				~random_seed_for_notes = 10000.rand;

				if(~notes_seed_array == nil, {
					~notes_seed_array = []; ~notes_seed_array = ~notes_seed_array.add(~random_seed_for_notes);
				}, {
					~notes_seed_array_backup = ~notes_seed_array; ~notes_seed_array = ~notes_seed_array.add(~random_seed_for_notes);
				});

				~freqmap2 = (i = ~freqmap.at(65)/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(24, { i = i*~stepratio;}));

				(
					~rseed_routine_notes = Routine({
						loop({~freqmap2.choose.yield })
					});
					~rseed_routine_notes.randSeed = ~random_seed_for_notes;
				);

				~max_note_length = 4;
				~number_of_notes = 16;
				~min_note = ~freqmap.at(65);
				~max_note = ~freqmap.at(65)*4;
				~time_sig_array1 = [2, 1, 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625]; /*{x = ~max_note_length; Array.fill(8, {x = (x/(1.333333333333))})}.value;*/
				~time_sig_array2 = [4, 3, 2, 1];
				~time_sig_array3 = [1, 0.5, 0.25, 0.125];
				~time_sig_array4 = [0.5, 0.25, 0.125, 0.0625];
				~time_sig_array5 = [4, 2, 1];
				/*~time_sig_array6 = [~gm,~gm/2,~gm/1.5,~gm/3,~gm/4];*/
				~f_note_set = Array.fill(~number_of_notes, ~rseed_routine_notes);
				/*~f_note_set = {x = ~number_of_notes; Array.fill(~number_of_notes, {while({i = ~freqmap.choose; ((i > ~max_note) or: (i < ~min_note))}, {nil}); i.value;})};
				*//*if(~f_note_set == nil, {~f_note_set.value;});*/
				~f_note_change_array = ~f_note_set.value;/*[ 688.09938797254, 822.73593638317, 1044.0938275831, 1197.1378839734, 514.25291680986, 408.81823647269, 1409.4396800244, 341.16370743965 ]*//*[300, 400, 500, 600, 700, 800, 900];*/
				~ratio_array = (x = 0; Array.fill(12, {1.0594630943593**(x=x+1)}));
				/*
				~f_note_change_array = 3*[ 726.53450277921, 363.2672513896, 815.50740615698, 576.65081700145, 1153.3016340029, 484.90360486965, 384.86824623663, 544.28589355459 ]
				~f_note_change_array = {x = ~number_of_notes; y = 288.32540850072; Array.fill(~number_of_notes, {y=y*1.4983070768767})}.value;
				~f_note_change_array = {x = ~number_of_notes; y = 216; z = y = 216;
				[216]++Array.fill(~number_of_notes/4, {y=y*1.5874010519683})++
				Array.fill(~number_of_notes/4, {z=z*1.4983070768767});
				}.value;
				*/

				~random_seed_for_note_patterns = 10000.rand;

				if(~note_patterns_seed_array == nil, {
					~note_patterns_seed_array = []; ~note_patterns_seed_array = ~note_patterns_seed_array.add(~random_seed_for_note_patterns);
				}, {
					~note_patterns_seed_array_backup = ~note_patterns_seed_array; ~note_patterns_seed_array = ~note_patterns_seed_array.add(~random_seed_for_note_patterns);
				});

				(
					~rseed_routine_patterns = Routine({
						loop({~f_note_change_array.choose.yield })
					});
					~rseed_routine_patterns.randSeed = ~random_seed_for_note_patterns;
				);

				~random_seed_for_note_times = 10000.rand;

				if(~note_times_seed_array == nil, {
					~note_times_seed_array = []; ~note_times_seed_array = ~note_times_seed_array.add(~random_seed_for_note_times);
				}, {
					~note_times_seed_array_backup = ~note_times_seed_array; ~note_times_seed_array = ~note_times_seed_array.add(~random_seed_for_note_times);
				});

				(
					~rseed_routine_time = Routine({
						loop({~time_sig_array1.choose.yield })
					});
					~rseed_routine_time.randSeed = ~random_seed_for_note_times;
				);

/*~pattern_generator = {var x, y, z, w, v;
				~sets_num_array = (4..12);
				~notes_num_array = (2..16);

				(~sets_num_array.choose).do(x = 0; {
					w = [];
					i = [];
					x = x+1;
					(z = ~notes_num_array.choose).do(y = 0; {
						("s"++(x)++"f"++(y=y+1)).asSymbol.envirPut(v = ~f_note_change_array.choose;); w = w.add(v);
						("s"++(x)++"ft"++(y)).asSymbol.envirPut(o = ~time_sig_array1.choose;); i = i.add(o);

					});
				("notes_num_save_"++(x)).asSymbol.envirPut(z.value;);
					1.do({
						("s"++(x)++"f_pattern").asSymbol.envirPut(w.value;);
						("s"++(x)++"ft_pattern").asSymbol.envirPut(i.value;);
					});
				});
				~sets_num = x.value;
				~sets_id_array = (x = 0; Array.fill(~sets_num, {x=x+1}));
				/*~sf_pattern_array = [];*/
				/*~sets_num.do(y = 0; {~sf_pattern_array = ~sf_pattern_array.add(("s"++(y=y+1)++"f_pattern").asSymbol.envirGet;);});*/
			};
			~pattern_generator.value;*/


				~pattern_generator = {var x, y, z, w, v;
					~sets_num_array = (4..12);
					~notes_num_array = (2..16);


					(~sets_num_array.choose).do(x = 0; {
						/*w = [];
						i = [];*/
						x = x+1;
						/*(z = ~notes_num_array.choose).do(y = 0; {
						("s"++(x)++"f"++(y=y+1)).asSymbol.envirPut(v = ~f_note_change_array.choose;); w = w.add(v);
						("s"++(x)++"ft"++(y)).asSymbol.envirPut(o = ~time_sig_array1.choose;); i = i.add(o);

						});*/
						z = ~notes_num_array.choose;
						w = Array.fill(z, ~rseed_routine_patterns);
						i = Array.fill(z, ~rseed_routine_time);
						("notes_num_save_"++(x)).asSymbol.envirPut(z.value;);
						1.do({
							("s"++(x)++"f_pattern").asSymbol.envirPut(w.value;);
							("s"++(x)++"ft_pattern").asSymbol.envirPut(i.value;);
						});
					});
					~sets_num = x.value;
					~sets_id_array = (x = 0; Array.fill(~sets_num, {x=x+1}));
					/*~sf_pattern_array = [];*/
					/*~sets_num.do(y = 0; {~sf_pattern_array = ~sf_pattern_array.add(("s"++(y=y+1)++"f_pattern").asSymbol.envirGet;);});*/
				};
				~pattern_generator.value;
				/*~notes_num_save_7;
				~s1f3;
				~s5f_pattern;*/
			);
		);

		~notes_seed_array_backup;
		~note_patterns_seed_array_backup;
		~note_times_seed_array_backup;

		/*
		~time_sig_array1 = [0.2];
		~f_note_set = {x = ~number_of_notes; Array.fill(~number_of_notes, {while({i = ~freqmap.choose; ((i > ~max_note) or: (i < ~min_note))}, {nil}); i.value;})};
			/*if(~f_note_set == nil, {~f_note_set.value;});*/
			~f_note_change_array = ~f_note_set.value;
			~pattern_generator.value;
		*/

		/*Really cool song:

		Used specific numerology interval to generate note array with really high frequencies....
		...then generated patterns

		... then played the first 2 AI tasks.... *along* with 6 other AI tasks which just played one note chosen at random the entire time and did not change*/

		/*SynthDef(\SimpleSine, {|freq = 440, out| Out.ar(out, SinOsc.ar([freq,freq], 0, 0.2)) }).add;

// the above is essentially the same as the following:
d = SynthDef(\SimpleSine, {|freq = 440, out| Out.ar(out, SinOsc.ar(freq, 0, 0.2)) });
d.add;

// now make a synth from it, using the default value for freq, then another with a different value
~f1 = 432;
~f2 = 432;
~f3 = 432;
~aisynth1 = Synth(\SimpleSine);
~aisynth2 = Synth(\SimpleSine);
~aisynth3 = Synth(\SimpleSine);
y = Synth(\SimpleSine, [\freq, 660]);

(
SynthDef(\violin, {
	| freq=432, gate=1, amp=0.25 |
	var env = EnvGen.kr(Env.asr(0.1, 1, 0.1), gate, doneAction:2);
	var sig = VarSaw.ar(
		freq,
		width:LFNoise2.kr(1).range(0.2, 0.8)*SinOsc.kr(5, Rand(0.0, 1.0)).range(0.7,0.8))*0.25;
	sig = sig * env * amp;
	Out.ar(0, sig!2);
}).add;

~f1 = 432;
~f2 = 432;
~f3 = 432;
~aisynth1 = Synth(\violin);
~aisynth2 = Synth(\violin);
~aisynth3 = Synth(\violin);






(
// set them from outside later:
SynthDef(/synth, { |out|
    var freqs, ringtimes, signal;
    freqs = Control.names([\freqs]).kr([800, 1071, 1153, 1723]);
    ringtimes = Control.names([\ringtimes]).kr([1, 1, 1, 1]);
    signal = DynKlank.ar(`[freqs, nil, ringtimes ], Impulse.ar(2, 0, 0.1));
    Out.ar(out, signal);
}).add;
)

a = Synth(/synth);

a.setn(\freqs, Array.rand(4, 500, 2000));
a.setn(\ringtimes, Array.rand(4, 0.2, 4) );
a.setn(\ringtimes, Array.rand(4, 0.02, 0.4) );

~f1 = 432;
~f2 = 432;
~f3 = 432;
~aisynth1 = Synth(\synth);
~aisynth2 = Synth(\synth);
~aisynth3 = Synth(\synth);
)


*/

play({ Klang.ar(`[ Array.rand(3, 432, 543)!2, nil, nil ], 1, 0) * 0.05 });

~klangarray1 = Array.rand(4, (-20), 20);
~klangarray2 = Array.rand(4, (-20), 20);
~klangarray3 = Array.rand(4, (-20), 20);

SynthDef(\synth1, {arg freq = 432;
	var sig;
    sig = DynKlang.ar(`[ ~klangarray1+freq, nil, nil ], 1, 0) * 0.05;
    Out.ar(0, sig!2);
}).add;
SynthDef(\synth2, {arg freq = 432;
	var sig;
    sig = DynKlang.ar(`[ ~klangarray2+freq, nil, nil ], 1, 0) * 0.05;
    Out.ar(0, sig!2);
}).add;
SynthDef(\synth3, {arg freq = 432;
	var sig;
    sig = DynKlang.ar(`[ ~klangarray3+freq, nil, nil ], 1, 0) * 0.05;
    Out.ar(0, sig!2);
}).add;

~f1 = 432;
~f2 = 432;
~f3 = 432;
~aisynth1 = Synth(\synth1);
~aisynth2 = Synth(\synth2);
~aisynth3 = Synth(\synth3);


		/*
		~ai_stop.value;

        ~ai1_task1_f1.play(SystemClock);

		~ai_stop.value; ~synthfree.value;
		*/

		(
			~ai1_task1_f1 = Task({
				inf.do({var rs, l1;
					([l1 = 0,l1 = 1].wchoose([0.05,0.95])).do({var setnum1;
						setnum1 = ~sets_id_array.choose;
						~task_1_p_array = ("s"++(setnum1)++"f_pattern").asSymbol.envirGet;
						~ai1_task1_f1_time_array = ("s"++(setnum1)++"ft_pattern").asSymbol.envirGet;
						/*~task_1_p_array = ~sf_pattern_array.choose; ~ai1_task1_f1_time_array = [];*/
						(~task_1_p_array.size*1).do(~yt1 = (-1); {var time;
							~f1 = ~task_1_p_array.at(if(~yt1<(~task_1_p_array.size-1), {(~yt1=~yt1+1)}, {~yt1=0});); (~f1+" 1").postln;
							~f2 = [~f2, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.45,0.45,0.1]}
								{l1 == 0}{[0.7,0.2,0.1]};
								);
							(~f2+" 2").postln;
							~f3 = [~f3, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.75,0.25,0.1]}
								{l1 == 0}{[0.9,0.1,0.1]};
								);
							(~f3+" 3").postln;
							//add another layer of wchoose to the one above... so sometimes the weights change like..
							s.makeBundle(s.latency, {
						~aisynth1.set(\freq, ~f1);
						~aisynth2.set(\freq, ~f2);
						~aisynth3.set(\freq, ~f3);/*
						~aisynth1 = Synth("plucking", [freq: ~f1]);
						~aisynth2 = Synth("plucking", [freq: ~f2]);
						~aisynth3 = Synth("plucking", [freq: ~f3]);*/

					});
							/*("sf_note_"++(~yt1=~yt1+1)++"_time").asSymbol.envirPut(~time = ~time_sig_array1.choose;);*/
							/*time = ~time_sig_array1.choose;
							~ai1_task1_f1_time_array = ~ai1_task1_f1_time_array.add(time.value);
							time.wait;*/
							/*((0.25/2)*([1,0.25,0.5,1.5,2].wchoose([0.5,0.1,0.2,0.1,0.1])))*/(~ai1_task1_f1_time_array.at(~yt1)).wait;
						});
						rs = [0,1].wchoose([0.4,0.6]); /*[0.05+0.35+0.05+0.35+0.025+0.1333+0.0167+0.025]*/
						(0..7).wchoose([0.05,0.35,0.05,0.35,0.025,0.1333,0.0167,0.025]).do({var r;
							if(rs == 0, {r = 1}, {r = ~ratio_array.choose});
							(~task_1_p_array.size).do(~yt1 = (-1); {
								~f1 = ~task_1_p_array.at(if(~yt1<(~task_1_p_array.size-1), {(~yt1=~yt1+1)}, {~yt1=0});) * [r, r.reciprocal].choose; (~f1+" 1_1").postln;
								~f2 = [~f2, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.45,0.45,0.1]}
								{l1 == 0}{[0.7,0.2,0.1]};
								);
								(~f2+" 2_1").postln;
								~f3 = [~f3, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.75,0.25,0.1]}
								{l1 == 0}{[0.9,0.1,0.1]};
								);
								(~f3+" 3_1").postln;
								s.makeBundle(s.latency, {
						~aisynth1.set(\freq, ~f1);
						~aisynth2.set(\freq, ~f2);
						~aisynth3.set(\freq, ~f3);/*
						~aisynth1 = Synth("plucking", [freq: ~f1]);
						~aisynth2 = Synth("plucking", [freq: ~f2]);
						~aisynth3 = Synth("plucking", [freq: ~f3]);*/

					});
								/*((0.25/2)*([1,0.25,0.5,1.5,2].wchoose([0.5,0.1,0.2,0.1,0.1])))*/(~ai1_task1_f1_time_array.at(~yt1)).wait;
							});
						});
					});

					([0,1].wchoose([0.9,0.1])).do({
						~f1_ratio = ~ratio_array.choose; ~f1_o = ~f1;
						((2..6).choose).do({
							~f1 = [~f1*~f1_ratio, ~f1/~f1_ratio].choose; (~f1+" 1_2").postln;
							~f2 = [~f2, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.45,0.45,0.1]}
								{l1 == 0}{[0.7,0.2,0.1]};
							);
							(~f2+" 2_2").postln;
							~f3 = [~f3, /*~f1*[~ratio_array.choose, ~ratio_array.choose.reciprocal].choose*/~f_note_change_array.choose, 0].wchoose(
								case
								{l1 == 1}{[0.75,0.25,0.1]}
								{l1 == 0}{[0.9,0.1,0.1]};
								);
							(~f3+" 3_2").postln;
							s.makeBundle(s.latency, {
						~aisynth1.set(\freq, ~f1);
						~aisynth2.set(\freq, ~f2);
						~aisynth3.set(\freq, ~f3);/*
						~aisynth1 = Synth("plucking", [freq: ~f1]);
						~aisynth2 = Synth("plucking", [freq: ~f2]);
						~aisynth3 = Synth("plucking", [freq: ~f3]);*/

					});
							(~ai1_task1_f1_time_array.choose).wait;

						});
					});

				});
			});
			/*~ai1_task1_f2 = Task({
				inf.do({var rs;
					([0,1].wchoose([0.05,0.95])).do({var setnum2;
						setnum2 = ~sets_id_array.choose;
						~task_2_p_array = ("s"++(setnum2)++"f_pattern").asSymbol.envirGet;
						~ai1_task1_f2_time_array = ("s"++(setnum2)++"ft_pattern").asSymbol.envirGet;
						/*~task_2_p_array = ~sf_pattern_array.choose; ~ai1_task1_f2_time_array = [];*/
						(~task_2_p_array.size*1).do(~yt2 = (-1); {var time;
							~f2 = ~task_2_p_array.at(if(~yt2<(~task_2_p_array.size-1), {(~yt2=~yt2+1)}, {~yt2=0});); (~f2+" two").postln;
							s.makeBundle(s.latency, {~synthflow.value;});
							/*("sf_note_"++(~yt2=~yt2+1)++"_time").asSymbol.envirPut(~time = ~time_sig_array1.choose;);*/
							/*time = ~time_sig_array2.choose;
							~ai1_task1_f2_time_array = ~ai1_task1_f2_time_array.add(time.value);
							time.wait;*/
							(~ai1_task1_f2_time_array.at(~yt2)*2).wait;
						});
						rs = [0,1].wchoose([0.4,0.6]); /*[0.05+0.35+0.05+0.35+0.025+0.1333+0.0167+0.025]*/
						(0..7).wchoose([0.05,0.35,0.05,0.35,0.025,0.1333,0.0167,0.025]).do({var r;
							if(rs == 0, {r = 1}, {r = ~ratio_array.choose});
							(~task_2_p_array.size).do(~yt2 = (-1); {
								~f2 = ~task_2_p_array.at(if(~yt2<(~task_2_p_array.size-1), {(~yt2=~yt2+1)}, {~yt2=0});) * [r, r.reciprocal].choose; (~f2+" two_1").postln;
								s.makeBundle(s.latency, {~synthflow.value;});
								(~ai1_task1_f2_time_array.at(~yt2)*2).wait;
							});
						});
					});

					([0,1].wchoose([0.9,0.1])).do({
						~f2_ratio = ~ratio_array.choose; ~f2_o = ~f2;
						((2..6).choose).do({
							~f2 = [~f2*~f2_ratio, ~f2/~f2_ratio].choose; (~f2+" two_2").postln;
							s.makeBundle(s.latency, {~synthflow.value;});
							(~ai1_task1_f2_time_array.choose*2).wait;

						});
					});

				});
			});
		);*/

		/*~ai1_task1_f1 = Task({
		inf.do({var rs;
		([0,1].wchoose([0.05,0.95])).do(
		(~number_of_synths-1).do(~fchange = 1; {("f"++(~fchange=~fchange+1)).asSymbol.envirPut(~f_note_change_array.choose;);});
		{
		~task_1_p_array = ~sf_pattern_array.choose; ~ai1_task1_f1_time_array = [];
		(~task_1_p_array.size*1).do(~yt1 = (-1); {var time;
		~f1 = ~task_1_p_array.at(if(~yt1<(~task_1_p_array.size-1), {(~yt1=~yt1+1)}, {~yt1=0});); (~f1+" one").postln;
		s.makeBundle(s.latency, {~synthflow.value;});
		/*("sf_note_"++(~yt1=~yt1+1)++"_time").asSymbol.envirPut(~time = ~time_sig_array1.choose;);*/
		time = ~time_sig_array1.choose;
		~ai1_task1_f1_time_array = ~ai1_task1_f1_time_array.add(time.value);
		time.wait;
		});
		rs = [0,1].wchoose([0.4,0.6]);
		(0..7).wchoose([0.3,0.3,0.05,0.25,0.025,0.1333,0.0167,0.025]).do({var r;
		if(rs == 0, {r = 1}, {r = ~ratio_array.choose});
		(~task_1_p_array.size).do(~yt1 = (-1); {
		~f1 = ~task_1_p_array.at(if(~yt1<(~task_1_p_array.size-1), {(~yt1=~yt1+1)}, {~yt1=0});) * [r, r.reciprocal].choose; (~f1+" one_1").postln;
		s.makeBundle(s.latency, {~synthflow.value;});
		(~ai1_task1_f1_time_array.at(~yt1)).wait;
		});
		});
		});

		([0,1].wchoose([0.9,0.1])).do({
		~f1_ratio = ~ratio_array.choose; ~f1_o = ~f1;
		((2..6).choose).do({
		~f1 = [~f1*~f1_ratio, ~f1/~f1_ratio].choose; (~f1+" one_2").postln;
		s.makeBundle(s.latency, {~synthflow.value;});
		(~time_sig_array4.choose).wait;

		});
		});

		});
		});*/

		~ai1_task1_f3 = Task({
			inf.do({
				~f3 = ~f_note_change_array.choose; ~f3.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array2.choose).wait;
			});
		});
		~ai1_task1_f4 = Task({
			inf.do({
				~f4 = ~f_note_change_array.choose; ~f4.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f5 = Task({
			inf.do({
				~f5 = ~f_note_change_array.choose; ~f5.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f6 = Task({
			inf.do({
				~f6 = ~f_note_change_array.choose; ~f6.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f7 = Task({
			inf.do({
				~f7 = ~f_note_change_array.choose; ~f7.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f8 = Task({
			inf.do({
				~f8 = ~f_note_change_array.choose; ~f8.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f9 = Task({
			inf.do({
				~f9 = ~f_note_change_array.choose; ~f9.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f10 = Task({
			inf.do({
				~f10 = ~f_note_change_array.choose; ~f10.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f11 = Task({
			inf.do({
				~f11 = ~f_note_change_array.choose; ~f11.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});
		~ai1_task1_f12 = Task({
			inf.do({
				~f12 = ~f_note_change_array.choose; ~f12.postln;
				s.makeBundle(s.latency, {~synthflow.value;});

				(~time_sig_array.choose).wait;
			});
		});

		/*~ai1_task1_fall = Task({
		inf.do({
		~ytall = (z = 0; Array.fill(~number_of_synths, {z=z+1}));
		~ytall = ~ytall.scramble;
		~ytall.choose.do(x = (-1); {("f"++(a.at(x=x+1);)).asSymbol.envirPut(~f_note_change_array.choose);});
		"f all".postln;
		s.makeBundle(s.latency, {~synthflow.value;});

		((~time_sig_array5*8).wchoose([0.4, 0.3, 0.3]);).wait;
		});
		});*/

		/*12.do(x=0; {("~ai1_task1_f"++(x=x+1)).asSymbol.envirPut(
		Task({
		inf.do({
		("f"++(x)).asSymbol.envirPut = ~f_note_change_array.choose; ("f"++(x)).asSymbol.envirGet.postln;
		s.makeBundle(s.latency, {~synthflow.value;});

		(~time_sig_array.choose).wait;
		});
		});
		);});*/

		/*~ai_play_u = {s.makeBundle(0, {
		~ai1_task1_u.play(SystemClock);

		})};

		~ai_stop_u = {s.makeBundle(0, {
		~ai1_task1_u.stop; ~ai1_task1_u.reset;

		})};*/

		/*~ai_play = {s.makeBundle(0, {
			~ai1_task1_fall.play(SystemClock);
			if(~number_of_synths > 0, {~ai1_task1_f1.play(SystemClock);});
			if(~number_of_synths > 1, {~ai1_task1_f2.play(SystemClock);});
			if(~number_of_synths > 2, {~ai1_task1_f3.play(SystemClock);});
			if(~number_of_synths > 3, {~ai1_task1_f4.play(SystemClock);});
			if(~number_of_synths > 4, {~ai1_task1_f5.play(SystemClock);});
			if(~number_of_synths > 5, {~ai1_task1_f6.play(SystemClock);});
			if(~number_of_synths > 6, {~ai1_task1_f7.play(SystemClock);});
			if(~number_of_synths > 7, {~ai1_task1_f8.play(SystemClock);});
			if(~number_of_synths > 8, {~ai1_task1_f9.play(SystemClock);});
			if(~number_of_synths > 9, {~ai1_task1_f10.play(SystemClock);});
			if(~number_of_synths > 10, {~ai1_task1_f11.play(SystemClock);});
			if(~number_of_synths > 11, {~ai1_task1_f12.play(SystemClock);});

		})};

		~ai_stop = {s.makeBundle(0, {
			~ai1_task1_fall.stop; ~ai1_task1_fall.reset;
			if(~number_of_synths > 0, {~ai1_task1_f1.stop; ~ai1_task1_f1.reset;});
			if(~number_of_synths > 1, {~ai1_task1_f2.stop; ~ai1_task1_f2.reset;});
			if(~number_of_synths > 2, {~ai1_task1_f3.stop; ~ai1_task1_f3.reset;});
			if(~number_of_synths > 3, {~ai1_task1_f4.stop; ~ai1_task1_f4.reset;});
			if(~number_of_synths > 4, {~ai1_task1_f5.stop; ~ai1_task1_f5.reset;});
			if(~number_of_synths > 5, {~ai1_task1_f6.stop; ~ai1_task1_f6.reset;});
			if(~number_of_synths > 6, {~ai1_task1_f7.stop; ~ai1_task1_f7.reset;});
			if(~number_of_synths > 7, {~ai1_task1_f8.stop; ~ai1_task1_f8.reset;});
			if(~number_of_synths > 8, {~ai1_task1_f9.stop; ~ai1_task1_f9.reset;});
			if(~number_of_synths > 9, {~ai1_task1_f10.stop; ~ai1_task1_f10.reset;});
			if(~number_of_synths > 10, {~ai1_task1_f11.stop; ~ai1_task1_f11.reset;});
			if(~number_of_synths > 11, {~ai1_task1_f12.stop; ~ai1_task1_f12.reset;});

		})};*/
	)