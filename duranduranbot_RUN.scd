(
/*

Hello!

To run this program... simply click once anywhere on this page,
and press "cmd/ctrl - enter" on your keyboard.

And if that does not work for some reason, click on the "Language" tab
above, and click on "Evaluate File".

*/

// GUI

~duranduranbot_GUI_func = {

	var w, /*~firstview,*/ firstviewtext1, firstviewtext2, firstviewtext3, firstviewtext4, firstviewnextbutton, mainview, mainviewtext, maincolor, randseedEZText1, randseedEZText2, randseedEZText3, randseed_1_make, randseed_2_make, randseed_3_make, randseedviewtext1,randseedviewtext2,
	randseedviewtext3, numerologynameEZText1, numerologynameEZText2, numerologynameEZText3, numerologynameviewtext1, numerologynameviewtext2, numerologynameviewtext3,
	generatepiecebutton, playbutton;
	w = Window("DuranDuranbot",
		Rect(Window.availableBounds.width/4, Window.availableBounds.height/4, Window.availableBounds.width/2, Window.availableBounds.height/2),
		resizable: true, border:true);

	maincolor = Color.white;

	~front_page_func = {

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;


		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/3.4774535809019));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Hello. This is DuranDuranbot. \n\nTo enhance the creativity of this AI bot... please consider providing it with some personal creative inspiration of yours by entering 3 number values into the 3 fields below, numerical values up to 8 digits long, and hit Enter. Consider writing down the 3 values you gave it to be able to replicate exactly the music made by this AI in this specific instance at a later date - although they will still be saved in the "++"duranduranbot_saved_random _seeds.scd".quote++" file, accessible on the next page.";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);


		randseedEZText1 = TextField(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText1.string = "random seed 1";
		randseedEZText1.background_(Color.black);
		randseedEZText1.stringColor_(Color.white);
		randseedEZText1.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText1.action = {
			randseed_1_make = randseedEZText1.value;
			randseed_1_make = randseed_1_make.asString++"";
			randseed_1_make = randseed_1_make.separate;
			if(randseed_1_make.size > 8, {randseed_1_make = nil; randseedEZText1.string = "must be 8 digits or less";}, {
				randseed_1_make = randseed_1_make.join.asString.interpret;
				randseedviewtext1.string = if(randseed_1_make.isNumber == true, {
					randseed_1_make = randseed_1_make.asFloat; randseed_1_make.postln; ~randseed_1 = randseed_1_make; ~randseed_1.asString++" entered";}, {
					randseed_1_make = nil; randseedEZText1.string = "enter numerical value";
				});
			});
		};

		randseedEZText2 = TextField(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText2.string = "random seed 2";
		randseedEZText2.background_(Color.black);
		randseedEZText2.stringColor_(Color.white);
		randseedEZText2.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText2.action = {
			randseed_2_make = randseedEZText2.value;
			randseed_2_make = randseed_2_make.asString++"";
			randseed_2_make = randseed_2_make.separate;
			if(randseed_2_make.size > 8, {randseed_2_make = nil; randseedEZText2.string = "must be 8 digits or less";}, {
				randseed_2_make = randseed_2_make.join.asString.interpret;
				randseedviewtext2.string = if(randseed_2_make.isNumber == true, {
					randseed_2_make = randseed_2_make.asFloat; randseed_2_make.postln; ~randseed_2 = randseed_2_make; ~randseed_2.asString++" entered";}, {
					randseed_2_make = nil; randseedEZText2.string = "enter numerical value";
				});
			});
		};

		randseedEZText3 = TextField(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText3.string = "random seed 3";
		randseedEZText3.background_(Color.black);
		randseedEZText3.stringColor_(Color.white);
		randseedEZText3.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText3.action = {
			randseed_3_make = randseedEZText3.value;
			randseed_3_make = randseed_3_make.asString++"";
			randseed_3_make = randseed_3_make.separate;
			if(randseed_3_make.size > 8, {randseed_3_make = nil; randseedEZText3.string = "must be 8 digits or less";}, {
				randseed_3_make = randseed_3_make.join.asString.interpret;
				randseedviewtext3.string = if(randseed_3_make.isNumber == true, {
					randseed_3_make = randseed_3_make.asFloat; randseed_3_make.postln; ~randseed_3 = randseed_3_make; ~randseed_3.asString++" entered";}, {
					randseed_3_make = nil; randseedEZText3.string = "enter numerical value";
				});
			});
		};

		randseedviewtext1 = TextField(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext1.background=maincolor;
		randseedviewtext1.string = if(~randseed_1 != nil, {~randseed_1.asString++" entered"}, {"number not entered"});
		randseedviewtext1.align = \topLeft;
		randseedviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		randseedviewtext2 = TextField(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105,~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext2.background=maincolor;
		randseedviewtext2.string = if(~randseed_2 != nil, {~randseed_2.asString++" entered"}, {"number not entered"});
		randseedviewtext2.align = \topLeft;
		randseedviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		randseedviewtext3 = TextField(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext3.background=maincolor;
		randseedviewtext3.string = if(~randseed_3 != nil, {~randseed_3.asString++" entered"}, {"number not entered"});
		randseedviewtext3.align = \topLeft;
		randseedviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);



		firstviewtext2 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.0743670886076, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/3.4774535809019));
		firstviewtext2.background=maincolor;
		firstviewtext2.string = "Also, you can change the names of the instrumentalists for further customization, utilizing numerology of the names to help generate a piece. Current defaults are shown.";
		firstviewtext2.align = \topLeft;
		firstviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);


		~numer_calc_function.value;


		numerologynameEZText1 = TextField(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.6764705882353, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameEZText1.string = "bass";
		numerologynameEZText1.background_(Color.black);
		numerologynameEZText1.stringColor_(Color.white);
		numerologynameEZText1.font = Font(size: ~firstviewboundsWIDTH/48);
		numerologynameEZText1.action = {//bass
			~numer_string_1 = numerologynameEZText1.value;
			numerologynameviewtext1.string = ~numer_string_1.asString;
			~numer_calc_function.value;
		};

		numerologynameEZText2 = TextField(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105, ~firstviewboundsHEIGHT/1.6764705882353, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameEZText2.string = "keyboards";
		numerologynameEZText2.background_(Color.black);
		numerologynameEZText2.stringColor_(Color.white);
		numerologynameEZText2.font = Font(size: ~firstviewboundsWIDTH/48);
		numerologynameEZText2.action = {//keyboards
			~numer_string_2 = numerologynameEZText2.value;
			numerologynameviewtext2.string = ~numer_string_2.asString;
			~numer_calc_function.value;
		};

		numerologynameEZText3 = TextField(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/1.6764705882353, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameEZText3.string = "vocal";
		numerologynameEZText3.background_(Color.black);
		numerologynameEZText3.stringColor_(Color.white);
		numerologynameEZText3.font = Font(size: ~firstviewboundsWIDTH/48);
		numerologynameEZText3.action = {//vocal
			~numer_string_3 = numerologynameEZText3.value;
			numerologynameviewtext3.string = ~numer_string_3.asString;
			~numer_calc_function.value;
		};


		numerologynameviewtext1 = TextField(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.5459905660377, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameviewtext1.background=maincolor;
		numerologynameviewtext1.string = if(~numer_string_1 != nil, {~numer_string_1.asString;}, {"number not entered"});
		numerologynameviewtext1.align = \topLeft;
		numerologynameviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		numerologynameviewtext2 = TextField(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105, ~firstviewboundsHEIGHT/1.5459905660377, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameviewtext2.background=maincolor;
		numerologynameviewtext2.string = if(~numer_string_2 != nil, {~numer_string_2.asString;}, {"number not entered"});
		numerologynameviewtext2.align = \topLeft;
		numerologynameviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		numerologynameviewtext3 = TextField(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/1.5459905660377, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		numerologynameviewtext3.background=maincolor;
		numerologynameviewtext3.string = if(~numer_string_3 != nil, {~numer_string_3.asString;}, {"number not entered"});
		numerologynameviewtext3.align = \topLeft;
		numerologynameviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);


		firstviewtext3 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.3215725806452, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/21.85));
		firstviewtext3.background=maincolor;
		firstviewtext3.string = "Or you can do none of that, and just click on "++"next".quote++" below...";
		firstviewtext3.align = \topLeft;
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewnextbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.2, ~firstviewboundsHEIGHT/1.2116451016636, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/10.925)).states_([["next",Color.white,Color.black],["next",Color.white,Color.black]]).action_({arg button;

			if(~randseed_1 == nil, {~randseed_1 =  99999999.rand;});
			if(~randseed_2 == nil, {~randseed_2 =  99999999.rand;});
			if(~randseed_3 == nil, {~randseed_3 =  99999999.rand;});

			~numer_calc_function.value;

			~save_random_seeds_func.value;

			~main_page_func.value;
		});
		firstviewnextbutton.font = Font(size: ~firstviewboundsWIDTH/48);

	};

	// randseedEZText1 = NumberBox(~firstview, Rect(10, w.bounds.height/3-20+20, 150, 20));
	// /*randseedEZText1.clipHi(99999999);*/
	// randseedEZText1.action = {~randseed_1 = randseedEZText1.value; ~randseed_1.postln;};



	/*w=Window("ez", Rect(300, 300, 300, 50)).front;
	g=EZText(w, 290@40," test  ", textWidth: 220,layout:\horz);
	g.setColors(Color.grey,Color.white);*/

	~main_page_func = {var arrow, newrandomseedsbutton, reversenewrandomseedsbutton, currentrandomseedstrext, playnil, see_saved_seeds_file_button;

		~firstview.close;

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;

		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/2.2857142857143, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Main Page";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext2 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/16, ~firstviewboundsHEIGHT/21.85)).states_([["back",Color.white,Color.black],["back",Color.white,Color.black]]).action_({arg button;
			~firstview.close;
			~front_page_func.value;
		});
		firstviewtext2.background=Color.grey;
		firstviewtext2.string = "back";
		firstviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext3 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.3584905660377, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/21.85)).states_([["click here for instructions",Color.white,Color.black],["click here for instructions",Color.white,Color.black]]).action_({arg button;
			~instructions_page_func.value;

		});
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);

		generatepiecebutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/6.5454545454545, ~firstviewboundsHEIGHT/21.85)).states_([["generate piece",Color.white,Color.black],["generate piece",Color.white,Color.black]]).action_({arg button;
			var piecegenerated;
			~piecegenerated = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsWIDTH/7.5, ~firstviewboundsWIDTH/6.2608695652174, ~firstviewboundsWIDTH/36));
			~piecegenerated.background=maincolor;
			~piecegenerated.string = "please wait";
			if(~piece_created == "true", {~playbutton.close; ~arrow.close;});
			~piece_generator_func.value;

		});
		generatepiecebutton.font = Font(size: ~firstviewboundsWIDTH/48);


		/*if(playnil == nil, {nil}, {*/
		/*~play_visible_func = {
		~play_visible_func_verify*/

		~playbutton_func = {
			~playbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/5.1063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["play piece",Color.white,Color.black],["stop piece",Color.white,Color.black]]).action_({arg button;
				if(button.value == 1, {
					~run_piece_func.value;
					~pausebuttonfunc.value;
				}, {
					~duranduranbotsynth1.free;
					~duranduranbotsynth2.free;
					~duranduranbotsynth3.free;
					~duranduranbot_routine.stop;
					Server.freeAll;
					~pausebutton.close;
				});

			});
			~playbutton.font = Font(size: ~firstviewboundsWIDTH/48);
			/*};*/
			~arrow = StaticText(~firstview, Rect(~firstviewboundsWIDTH/5.9016393442623, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/36, ~firstviewboundsHEIGHT/21.85));
			~arrow.background=maincolor;
			~arrow.string = "---";
			~arrow.font = Font(size: ~firstviewboundsWIDTH/48);
		};

		~playbutton_func.value;

		if(~piece_created == nil, {~playbutton.close; ~arrow.close;});

		~pausebuttonfunc = {~pausebutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/3.063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["pause piece",Color.white,Color.black],["resume",Color.white,Color.black]]).action_({arg button;
			if(button.value == 1, {
				~duranduranbot_routine.pause;
				s.makeBundle(s.latency, {
					~duranduranbotsynth1.set(\freq, 0);
					~duranduranbotsynth2.set(\freq, 0);
					~duranduranbotsynth3.set(\freq, 0);
				});
			}, {~duranduranbot_routine.resume;});
		});

		~pausebutton.font = Font(size: ~firstviewboundsWIDTH/48);
		};

		if(~duranduranbot_routine.isPlaying == true, {~playbutton.value = 1; ~pausebuttonfunc.value;}, {~playbutton.value = 0});

		newrandomseedsbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/5.1428571428571, ~firstviewboundsHEIGHT/21.85)).states_([["new random seeds",Color.white,Color.black],["new random seeds",Color.white,Color.black]]).action_({arg button;
			~randseed_1_backup = ~randseed_1;
			~randseed_2_backup = ~randseed_2;
			~randseed_3_backup = ~randseed_3;
			~randseed_1 =  99999999.rand;
			~randseed_2 =  99999999.rand;
			~randseed_3 =  99999999.rand;
			~save_random_seeds_func.value;
			z = "Current random seeds:\n"++
			"randseed 1 - "++~randseed_1++"\n"++
			"randseed 2 - "++~randseed_2++"\n"++
			"randseed 3 - "++~randseed_3.asString++
			"\n(also posted in post window)"++"\n"++
			"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
			z.postln;
			currentrandomseedstrext.string = z;

		});
		newrandomseedsbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		reversenewrandomseedsbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.1059907834101, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["reverse",Color.white,Color.black],["reverse",Color.white,Color.black]]).action_({arg button;
			~randseed_1_backup2 = ~randseed_1;
			~randseed_2_backup2 = ~randseed_2;
			~randseed_3_backup2 = ~randseed_3;
			~randseed_1 =  ~randseed_1_backup;
			~randseed_2 =  ~randseed_2_backup;
			~randseed_3 =  ~randseed_3_backup;
			~randseed_1_backup = ~randseed_1_backup2;
			~randseed_2_backup = ~randseed_2_backup2;
			~randseed_3_backup = ~randseed_3_backup2;
			~save_random_seeds_func.value;
			z = "Current random seeds:\n"++
			"randseed 1 - "++~randseed_1++"\n"++
			"randseed 2 - "++~randseed_2++"\n"++
			"randseed 3 - "++~randseed_3.asString++
			"\n(also posted in post window)"++"\n"++
			"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
			z.postln;
			currentrandomseedstrext.string = z;


		});
		reversenewrandomseedsbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		currentrandomseedstrext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/4.6, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/3.6416666666667));
		currentrandomseedstrext.background=maincolor;
		currentrandomseedstrext.string ="Current random seeds:\n"++
		"randseed 1 - "++~randseed_1++"\n"++
		"randseed 2 - "++~randseed_2++"\n"++
		"randseed 3 - "++~randseed_3.asString++
		"\n(also posted in post window)"++"\n"++
		"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
		currentrandomseedstrext.align = \topLeft;
		currentrandomseedstrext.font = Font(size: ~firstviewboundsWIDTH/58.384615384615);

		see_saved_seeds_file_button = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/1.9422222222222, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/21.85)).states_([["see saved random seeds",Color.white,Color.black],["see saved random seeds",Color.white,Color.black]]).action_({arg button;

			h = Document.open(Document.current.dir++"/duranduranbot_saved_random_seeds.scd");


		});
		see_saved_seeds_file_button.font = Font(size: ~firstviewboundsWIDTH/48);
	};

	~instructions_page_func = {

		~firstview.close;

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;

		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/2.2857142857143, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Instructions";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext2 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/16, ~firstviewboundsHEIGHT/21.85)).states_([["back",Color.white,Color.black],["back",Color.white,Color.black]]).action_({arg button;
			~firstview.close;
			~main_page_func.value;
		});
		firstviewtext2.background=Color.grey;
		firstviewtext2.string = "back";
		firstviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext3 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.5652173913043, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/2.88, ~firstviewboundsHEIGHT/4.37));
		firstviewtext3.background=maincolor;
		firstviewtext3.string = "*Important Note*... You can kill all sounds and processes by hitting "++"cmd/ctrl - period".quote++"on your keyboard.";
		firstviewtext3.align = \topLeft;
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/65.454545454545);

		firstviewtext4 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/0.54625));
		firstviewtext4.background=maincolor;
		firstviewtext4.string =
		"Play a DuranDuranbot piece by clicking the "++"generate piece".quote++"  button on the Main Page, and then by clicking the "++"play piece".quote++"  button. Once random seeds are input into the program on the front page (the very first page of this program), you can only generate a song once using the same random seeds. If you click on the "++"generate piece".quote++"  button more than once without inputting new random seeds the same piece will always be generated. To generate a new piece, you can go back to the first page and input new random seeds, or you can click the "++"new random seeds".quote++"  button across from the "++"generate piece".quote++"  button on the right side of the main page.

ifsdf";
		firstviewtext4.align = \topLeft;
		firstviewtext4.font = Font(size: ~firstviewboundsWIDTH/51.428571428571);

	};

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// NUMEROLOGY CALCULATOR

	~numer_calc_function = {

		if(~num_numerology_calc == nil, {~num_numerology_calc = 3;});
		if(~numer_string_1 == nil, {
			~numer_string_1 = "John Taylor";
		});
		if(~numer_string_2 == nil, {
			~numer_string_2 = "Nick Rhodes";
		});
		if(~numer_string_3 == nil, {
			~numer_string_3 = "Simon Le Bon";
		});

		//numerology caclulator function

		//Counts the number of each letter (example: "~string_20_letter_22") in each numerology string ("~numer_string_20")
		//result is "~string_1_letter_1", onwards


		/*~numer_string_1 = "John Taylor";
		~numer_string_2 = "Nick Rhodes";
		~numer_string_3 = "Simon Le Bon";*/

		/*~numer_string_1 = ~dbase_string;*/

		~num_numerology_calc.do(y=0; {("numer_string_"++(y=y+1)++"_ascii").asSymbol.envirPut(("numer_string_"++(y)).asSymbol.envirGet.asString.ascii;);});
		~num_numerology_calc.do(y=0; {if(("numer_string_"++(y=y+1)).asSymbol.envirGet == nil, {("numer_string_"++(y)).asSymbol.envirPut("".asString;)});});
		~num_numerology_calc.do(y=0; {if(("numer_string_"++(y=y+1)++"_ascii").asSymbol.envirGet == nil, {("numer_string_"++(y)++"_ascii").asSymbol.envirPut("".asString.ascii;)});});
		~num_numerology_calc.do(y=0; {
			("numer_string_"++(y=y+1)++"_value").asSymbol.envirPut(0);
			26.do(x = 0; {
				("string_"++(y)++"_letter_"++(x=x+1)).asSymbol.envirPut(0);
			});
			9.do(x = 0; {
				("string_"++(y)++"_number_"++(x=x+1)).asSymbol.envirPut(0);
			});
		});

		~num_numerology_calc.do(y = 1; {
			26.do(x = 0; {("string_"++(y)++"_letter_"++(x=x+1)).asSymbol.envirPut(
				("numer_string_"++(y)++"_ascii").asSymbol.envirGet.count({ arg item; (item == (97+(x-1))) or: (item == (65+(x-1)));});
			)});
			9.do(x = 0; {("string_"++(y)++"_number_"++(x=x+1)).asSymbol.envirPut(
				("numer_string_"++(y)++"_ascii").asSymbol.envirGet.count({ arg item; (item == (49+(x-1)));});
			)});
			y=y+1;
		});

		//adds all letters in each string.... resulting in (ex: ~numer_string_16_value)

		~num_numerology_calc.do(y=1; {
			26.do(x = 0; {
				("numer_string_"++(y)++"_value").asSymbol.envirPut(("numer_string_"++(y)++"_value").asSymbol.envirGet + ((x=x+1)*("string_"++(y)++"_letter_"++(x)).asSymbol.envirGet;));
				/*~numer_string_1_value = ~numer_string_1_value + ((x=x+1)*~string_1_letter_1);*/
			});
			9.do(x = 0; {
				("numer_string_"++(y)++"_value").asSymbol.envirPut(("numer_string_"++(y)++"_value").asSymbol.envirGet + ((x=x+1)*("string_"++(y)++"_number_"++(x)).asSymbol.envirGet;));
				/*example.... ~numer_string_1_value = ~numer_string_1_value + ((x=x+1)*~string_1_number_1);*/
			});
			y=y+1;
		});

		//find digital root of all "~numer_string_x_value"'s

		~num_numerology_calc.do(x = 0; {if(("numer_string_"++(x=x+1)++"_value").asSymbol.envirGet != 0, {("numer_string_"++(x)++"_value").asSymbol.envirPut(1 + ((("numer_string_"++(x)++"_value").asSymbol.envirGet - 1) % 9));});});

	};

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// SAVE RANDOM SEEDS TO FILE

	~save_random_seeds_func = {

		a = Date.getDate;

		h = File.new(Document.current.dir++"/duranduranbot_saved_random_seeds.scd", "a+");

		h.write("\n\n"++a.asString++
			"\nrandom seed 1 - "++~randseed_1.asString++
			"\nrandom seed 2 - "++~randseed_2.asString++
			"\nrandom seed 3 - "++~randseed_3.asString++
			"\nbass - "++~numer_string_1.asString++
			"\nkeyboards - "++~numer_string_2.asString++
			"\nvocal - "++~numer_string_3.asString
		);

		h.close;
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// BUILD/GENERATE/COMPOSE PIECE

	~piece_generator_func = {

		(
			(

				~tuning_frequency = 440; //default 440 hz
				~freqmap = (i = ~tuning_frequency / (2 ** (69 / 12)); a = (-1); b = (-1); Array.fill(128, {i * (2 ** (((a=a+1) / 12).trunc)) * ( (2 ** (12.reciprocal)) ** ((b=b+1)  % 12));}));/*~freqmap = (i = 8.0271480262684/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(128, { i = i*~stepratio;}));*/
				~freqmap = ~freqmap.cpsmidi;
				/*~freqmap2 = (i = ~freqmap.at(58)/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(24, { i = i*~stepratio;}));*/
				~freqmap2 = (n = 57; Array.fill(24, { i = ~freqmap.at(n=n+1);}));
				~time_sig_array1 = [2, 1, 0.5];
				/*~ratio_array = (x = 0; Array.fill(12, {1.0594630943593**(x=x+1)}));*/
				~midi_ratio_array = (1..12);


				thisThread.randSeed = ~randseed_1;

				~numer_calc_function.value;
				~bass_numerology = (0..~numer_string_1_value);
				~keys_numerology = (0..~numer_string_2_value);
				~vocal_numerology = (0..~numer_string_3_value);

				~instrument_array = ["bass", "keys", "vocal"];
				~instrument_1 = ~instrument_array.removeAt(([0,1,2]).wchoose([0.4,0.4,0.2]));
				~instrument_2 = ~instrument_array.removeAt(([0,1]).wchoose(case{~instrument_1 == "bass"}{[0.4,0.2]}{~instrument_1 == "keys"}{[0.4,0.2]}{~instrument_1 == "vocal"}{[0.4,0.4]};));
				~instrument_3 = ~instrument_array.removeAt(0);


				~instrument_1_array_part_1 = [];
				~instrument_2_array_part_1 = [];
				~instrument_3_array_part_1 = [];

				~dna_array = (x = File.readAllString(Document.current.dir++"/duranduranbot_dna.scd"); x = x.separate;);
				~dna_x = (-1);
				~dna_index_choice_func = {~dna_array.at(if(~dna_x < (~dna_array.size-1), {~dna_x=~dna_x+1;}, {~dna_x = 0}))};
				~dna_index_choice = ~dna_index_choice_func.value;
				~dna_clock_y = 0;
				~midi_ratio_x = 0;


				if(~number_of_instruments == nil, {~number_of_instruments = 3;});



				/*~instrument_1_freq = 45;
				~instrument_2_freq = 65;
				~instrument_3_freq = 35;

				45+65+35/3*/



				~inst_clock_func = {

					//What this part does -

					//*IF* a single digit in the duranduranbot DNA has iterated the number of times of that single digit during piece composition.... (Find duranduranbot DNA in this file (highlight the code in between the arrows and press "cmd/ctrl - enter": < Document.open(Document.current.dir++"/duranduranbot_dna.scd"); >) - Do not edit the DNA file manually.)

					//To create next "bit" in compositiion for the current instrument....

					//Takes midi notes of all instruments, adds them, then divides that sum by the total number of instruments.
					//Then rounds the dividend.
					//Then adds: the current "~midi_ratio_x" value plus the numerology value of name of intrumentalist... made positive or negative.

					//If it doesn't do what is stated above, it chooses to either stay on current note or makes note 0 hz.

					~put1 = if(~dna_clock_y == ~dna_index_choice.asInteger, {
						([(("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(
							~number_of_instruments.do(x = 0; y = 0; {y = y + (("instrument_"++(x=x+1)++"_freq").asSymbol.envirGet)});
							a = y;
							a = a/(~number_of_instruments);
							a = a.round;
							a = a + (x = ~midi_ratio_array.wrapAt(~midi_ratio_x+[
								("numer_string_"++(~inst_num)++"_value").asSymbol.envirGet,
								("numer_string_"++(~inst_num)++"_value").asSymbol.envirGet.neg].choose);
							x = [x, x.neg].choose;);
						);
						/*if(~midi_ratio_x == (~midi_ratio_array.size-1), {("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet*[~midi_ratio_array.at(5), ~midi_ratio_array.at(5).reciprocal].choose;);});
						*/case
						{("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet > 89}{("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet-12)}
						{("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet < 58}{("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet+12)}
						{(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet >= 58) and: (("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet <= 89)}{("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;)};
						("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;
						),

						("~instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;),

						(0)

						]).wchoose([0.45,0.45,0.1]);
					},
					{("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;});
					~put1.value;
				};

				~instrument_1_array_starting_func = {

					("instrument_1_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_1_array_part_"++(~part_num)).asSymbol.envirGet.add(

							case
							{~instrument_1 == "bass"}{~instrument_1_freq = ~freqmap2.choose}
							{~instrument_1 == "keys"}{~instrument_1_freq = ~freqmap2.choose}
							{~instrument_1 == "vocal"}{~instrument_1_freq = ~freqmap2.choose};
						)
					);
					if(~instrument_2_freq == nil, {~instrument_2_freq = ~instrument_1_freq;});
					if(~instrument_3_freq == nil, {~instrument_3_freq = ~instrument_1_freq;});
				};

				~instrument_1_array_func = {
					("instrument_1_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_1_array_part_"++(~part_num)).asSymbol.envirGet.add(
							case
							{~instrument_1 == "bass"}{~inst_num = 1; ~inst_clock_func.value;}
							{~instrument_1 == "keys"}{~inst_num = 1; ~inst_clock_func.value;}
							{~instrument_1 == "vocal"}{~inst_num = 1; ~inst_clock_func.value;};
					));
				};

				~instrument_2_array_func = {
					("instrument_2_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_2_array_part_"++(~part_num)).asSymbol.envirGet.add(
							case
							{~instrument_2 == "bass"}{~inst_num = 2; ~inst_clock_func.value;}
							{~instrument_2 == "keys"}{~inst_num = 2; ~inst_clock_func.value;}
							{~instrument_2 == "vocal"}{~inst_num = 2; ~inst_clock_func.value;};
					));
				};

				~instrument_3_array_func = {
					("instrument_3_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_3_array_part_"++(~part_num)).asSymbol.envirGet.add(

							case
							{~instrument_3 == "bass"}{~inst_num = 3; ~inst_clock_func.value;}
							{~instrument_3 == "keys"}{~inst_num = 3; ~inst_clock_func.value;}
							{~instrument_3 == "vocal"}{~inst_num = 3; ~inst_clock_func.value;};
					));
				};

			);

			//Piece creation in parts. Only reason to have parts is to determine length of piece.

			(

				~create_piece_function = {

					thisThread.randSeed = ~randseed_2;

					~part_bit_size = 64;
					~bit_duration = rrand(0.05, 0.3);
					~max_number_of_parts = 200; //max 120 parts. random probability choice decreases linearly from "~max_number_of_parts" value to 1.
					~number_of_parts_in_piece = (~max_number_of_parts.linrand - ~max_number_of_parts).neg;
					~numerology_step = (-1);
					~create_piece_routine = Routine({

						thisThread.randSeed = ~randseed_3;

						//part 1

						1.do({~part_num = 1;

							1.do({

								~dna_clock_y = ~dna_clock_y + 1;
								~midi_ratio_x = ~midi_ratio_x + 1;

								~instrument_1_array_starting_func.value;
								~instrument_2_array_func.value;
								~instrument_3_array_func.value;

								if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
								if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

								/*~instrument_1_freq.postln;
								~instrument_2_freq.postln;
								~instrument_3_freq.postln;*/

								0.0005.wait;

							});

							(~part_bit_size-1).do({

								~dna_clock_y = ~dna_clock_y + 1;
								~midi_ratio_x = ~midi_ratio_x + 1;

								~instrument_1_array_func.value;
								~instrument_2_array_func.value;
								~instrument_3_array_func.value;

								if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
								if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

								/*~instrument_1_freq.postln;
								~instrument_2_freq.postln;
								~instrument_3_freq.postln;*/

								0.0005.wait;

							});
						});

						//rest of parts

						z = 1;
						(~number_of_parts_in_piece-1).do({

							1.do({~part_num = z=z+1;

								~part_bit_size.do({

									~dna_clock_y = ~dna_clock_y + 1;
									~midi_ratio_x = ~midi_ratio_x + 1;

									~instrument_1_array_func.value;
									~instrument_2_array_func.value;
									~instrument_3_array_func.value;

									if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
									if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

									0.0005.wait;

								});
							});

						});

						"Piece Creation Is Finsihed".postln;

						//create pseq arrays function

						(
							~create_pseq_arrays_func = {

								h = 0.midicps;

								1.do({

									~instrument_1_full_pseq_array = [];
									~instrument_2_full_pseq_array = [];
									~instrument_3_full_pseq_array = [];

									x = 0;
									~number_of_parts_in_piece.do({~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.add(("instrument_1_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.flatten;
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.midicps;
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.replace(h, 0);

									x = 0;
									~number_of_parts_in_piece.do({~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.add(("instrument_2_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.flatten;
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.midicps;
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.replace(h, 0);

									x = 0;
									~number_of_parts_in_piece.do({~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.add(("instrument_3_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.flatten;
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.midicps;
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.replace(h, 0);

									"pseq arrays created".postln;
									if(~piece_created == nil, {~piece_created = "true";});
									AppClock.sched(0, {
										~playbutton_func.value;
										~piecegenerated.string = "piece generated";
										AppClock.sched(3, {~piecegenerated.close});
									});

								});
							};

							~create_pseq_arrays_func.value;
						);

					});

					~create_piece_routine.play;
				};

				~create_piece_function.value;

			);

			/*~create_piece_routine.isPlaying*/

		);
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// RUN/PLAY PIECE

	~run_piece_func = {

		(

			~klangarray1 = Array.rand(3, 0, 20);
			~klangarray2 = Array.rand(3, 0, 20);
			~klangarray3 = Array.rand(3, 0, 20);
			~klangarray4 = Array.rand(3, 0, 20);

			SynthDef(\synth1, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray1+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;
			SynthDef(\synth2, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray2+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;
			SynthDef(\synth3, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray3+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;

			/*b = Buffer.read(s, Document.current.dir++"/samples/Alesis-Sanctuary-QCard-Promenade-C3-loop5.wav");

			~synth = {
			SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0, freq = 1 |
			Out.ar(out,
			(PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq, startPos: 0, loop: 1))!2
			)
			}).play(s, [\out, 0]);
			};

			~synth = {
			SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0, s1,s2,s3,s4, freq1 = 1, freq2 = 1.3, freq3 = 1.5 |
			s1 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq1, startPos: 0, loop: 1);
			s2 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq2, startPos: 0, loop: 1);
			s3 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq3, startPos: 0, loop: 1);
			s4 = Mix.new([s1, s2, s3]);
			Out.ar(out, s4!2);
			}).play(s, [\out, 0]);
			};*/

			/*
			~duranduranbotsynth1 = ~synth.value;
			~duranduranbotsynth2 = ~synth.value;
			~duranduranbotsynth3 = ~synth.value;

			~duranduranbotsynth1.set(\freq, 2);
			*/

			~duranduranbot_routine = Task({x = 0;

				1.do({

					s.makeBundle(s.latency, {

						~duranduranbotsynth1 = Synth(
							(
								case
								{~instrument_1 == "bass"}{\synth1}
								{~instrument_1 == "keys"}{\synth2}
								{~instrument_1 == "vocal"}{\synth3};
							), [freq: ~instrument_1_full_pseq_array.at(x)]);

						~duranduranbotsynth2 = Synth(
							(
								case
								{~instrument_2 == "bass"}{\synth1}
								{~instrument_2 == "keys"}{\synth2}
								{~instrument_2 == "vocal"}{\synth3};
							), [freq: ~instrument_2_full_pseq_array.at(x)]);

						~duranduranbotsynth3 = Synth(
							(
								case
								{~instrument_3 == "bass"}{\synth1}
								{~instrument_3 == "keys"}{\synth2}
								{~instrument_3 == "vocal"}{\synth3};
							), [freq: ~instrument_3_full_pseq_array.at(x)]);

						/*~duranduranbotsynth1 = ~synth.value;
						~duranduranbotsynth2 = ~synth.value;
						~duranduranbotsynth3 = ~synth.value;
						~duranduranbotsynth1.set(\freq, ~instrument_1_full_pseq_array.at(x));
						~duranduranbotsynth2.set(\freq, ~instrument_2_full_pseq_array.at(x));
						~duranduranbotsynth3.set(\freq, ~instrument_3_full_pseq_array.at(x));*/
					});

					~bit_duration.wait;

				});

				(~instrument_1_full_pseq_array.size-1).do({

					s.makeBundle(s.latency, {
						~duranduranbotsynth1.set(\freq, ~instrument_1_full_pseq_array.at(x=x+1).postln);
						~duranduranbotsynth2.set(\freq, ~instrument_2_full_pseq_array.at(x).postln);
						~duranduranbotsynth3.set(\freq, ~instrument_3_full_pseq_array.at(x).postln);

					});

					~bit_duration.wait;

				});

				~duranduranbotsynth1.free;
				~duranduranbotsynth2.free;
				~duranduranbotsynth3.free;
				~duranduranbot_routine.stop;
				Server.freeAll;

			});


			~duranduranbot_routine.start;
		);
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// CREATE NEW DNA

	~enter_database_func = {

		~dbase_string_map = "Vertigo (Do The Demolition)";

		~dbase_string = "Hey guys, turn it up to get sleazy.
Twist it in a vice
Nobody said it was easy.
Just use your naked eyes, oh.
How to see and how to hide it.
How to save it. Well, maybe. Maybe. Maybe.
You can take it and eat it, and chew your life supply.

Where's the real life in your illusion?
On the dark side your power's in confusion.
Do the dance. Do the demolition.
And lose the chance to hear when you don't listen.

Don't you feel edgy?
Bite your lips and bleed.
Conversation is empty;
Abandoned in the freeze.
Freedom is your condemnation.
Free to say well, maybe. Maybe. Maybe. Maybe.
You can take it or leave it.
Just need a little hit tonight.

Where's the real life in your illusion?
On the dark of power in confusion.
Do the dance. Do the demolition.
Don't lose the chance to hear 'cause you don't listen.

Maybe. Maybe. Maybe you can try to believe it.
Just need a little help tonight.

Where's the real life in your illusion?
On the dark side of power in confusion.
Do the dance. Do the demolition.
And lose the chance to hear when you don't listen.

Where's the real life in your illusion?
On the dark side of power in confusion.
Do the dance. Do the demolition.
And lose the chance to hear when you don't listen.

Hear it when you listen.
You don't hear when you don't listen.

;".replace(" ", "");
		~dbase_string = ~dbase_string.replace("\n", "");

		h = File.new(Document.current.dir++"/duranduranbot_inspiration_database.scd", "a+");
		h.write("\n\n"++~dbase_string.asString; );
		h.close;

		~numer_string_1 = ~dbase_string;
		~num_numerology_calc = 1;
		~numer_calc_function.value;

		h = File.new(Document.current.dir++"/duranduranbot_dna.scd", "a+");
		h.write(~numer_string_1_value.asString; );
		h.close;

		h = File.new(Document.current.dir++"/duranduranbot_inspiration_database_map.scd", "a+");
		h.write("\n\n"++~dbase_string_map.asString; );
		h.close;

	};


	w.front;

	~front_page_func.value;

};

if(Server.default.serverRunning == false, {s.boot; s.waitForBoot({~duranduranbot_GUI_func.value;});}, {~duranduranbot_GUI_func.value;});








/*

// editor preference settings


(Platform.userConfigDir +/+ "sc_ide_conf.yaml").openDocument;

IDE:
editor:
blinkDuration: 600
disableBlinkingCursor: false
font:
antialias: 2
family: Courier 10 Pitch
size: 9
highlightBracketContents: true
highlightCurrentLine: false
inactiveEditorFadeAlpha: 64
indentWidth: 4
insertMatchingTokens: false
lineWrap: false
spaceIndent: false
stepForwardEvaluation: false
theme: My old theme
themes:
My old theme:
built-in: !textFormat
color: "#6b6bbf"
italic: false
char: !textFormat
color: "#92d38e"
italic: false
class: !textFormat
color: "#6066d2"
italic: false
comment: !textFormat
color: "#bf5454"
italic: false
currentLine: !textFormat
color: "#000000"
background: "#f4f4f4"
italic: false
env-var: !textFormat
color: "#8c654f"
italic: false
evaluatedCode: !textFormat
color: "#000000"
background: "#f8a200"
keyword: !textFormat
color: "#676fe6"
bold: true
italic: false
lineNumbers: !textFormat
color: "#6f6f6f"
background: "#000000"
italic: false
matchingBrackets: !textFormat
color: "#ff0000"
bold: true
mismatchedBrackets: !textFormat
color: "#ffffff"
background: "#960000"
italic: false
number: !textFormat
color: "#9d43a7"
italic: false
postwindowemphasis: !textFormat
color: "#edd400"
bold: true
italic: false
postwindowerror: !textFormat
color: "#d11c24"
italic: false
postwindowsuccess: !textFormat
color: "#738a05"
italic: false
postwindowtext: !textFormat
color: "#ffffff"
italic: false
postwindowwarning: !textFormat
color: "#a57706"
italic: false
primitive: !textFormat
color: "#3333bf"
italic: false
searchResult: !textFormat
color: "#7f7f7f"
background: "#783b23"
selection: !textFormat
{}
string: !textFormat
color: "#bababa"
italic: false
symbol: !textFormat
color: "#87c87e"
italic: false
text: !textFormat
color: "#ffffff"
background: "#000000"
whitespace: !textFormat
color: "#7f7f7f"
italic: false
useComboBox: false
useComboBoxWhenSplitting: false
interpreter:
autoStart: true
configFile: ""
runtimeDir: ""
standalone: false
mainWindow:
detached: !QVariantMap
documents-dock: ""
help-dock: AQHZ0MsAAgAAAAAAdAAAAI8AAAKzAAADBAAAAHQAAACtAAACswAAAwQAAAAAAAAAAAWg
post-dock: ""
geometry: AdnQywACAAAAAAAAAAAAGwAABZ8AAAODAAAAAAAAAC8AAAK/AAAChgAAAAACAAAABaA=
state: AAAA/wAAAAD9AAAAAgAAAAAAAAAAAAAAAPwCAAAAAfsAAAAcAGQAbwBjAHUAbQBlAG4AdABzAC0AZABvAGMAawAAAAAA/////wAAAF8A////AAAAAQAAANYAAAMa/AIAAAAC+wAAABIAaABlAGwAcAAtAGQAbwBjAGsAAAAAFgAAAbUAAAATAP////sAAAASAHAAbwBzAHQALQBkAG8AYwBrAQAAABYAAAMaAAAATQD///8AAATJAAADGgAAAAEAAAACAAAAAQAAAAL8AAAAAA==
postWindow:
lineWrap: false
scrollback: 1000
recentDocuments: !QVariantList
- /home/ken/Documents/duranduranbot/duranduranbot_9000/duranduranbot_9000/duranduranbot_9000_PROGRAM/duranduranbot_RUN.scd
- /home/ken/.config/SuperCollider/sc_ide_conf.yaml
- /home/ken/Downloads/timewavesynth.scd
startWithSession: last


*/

);