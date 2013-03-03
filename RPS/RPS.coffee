$ ->
  $('button').click ->
    $('span#rock').css(
      "-webkit-animation": "start_1 1s ease-in",
      "-moz-animation": "start_1 1s ease-in",
      "animation": "start_1 1s ease-in"
    )
    $('span#paper').css(
      "-webkit-animation": "start_2 1s 1s ease-in",
      "-moz-animation": "start_2 1s 1s ease-in",
      "animation": "start_2 1s 1s ease-in"
    )
    $('span#scissors').css(
      "-webkit-animation": "start_1 1s 2s ease-in",
      "-moz-animation": "start_1 1s 2s ease-in",
      "animation": "start_1 1s 2s ease-in"
    )
    $("section:first-of-type").addClass('play_1')
    $("section:nth-of-type(2)").addClass('play_2')
    $('#compete h1').css('z-index': 5, '-webkit-animation' : "start_2 1s 3s ease-in",'-moz-animation' : "start_2 1s 3s ease-in","animation" : "start_2 1s 3s ease-in").text('SHOOT!')
    playerChoice = $(@).attr('id')

    setTimeout(-> 
    	computerChoice = Math.floor(Math.random() * 3)
	    computerChoice = switch computerChoice
	      when 0 then "rock"
	      when 1 then "paper"
	      when 2 then "scissors"
	      else 'error' 
	      
	    if computerChoice is "rock"
	      $('#compete section:nth-child(3)').css('background-position', '-400px 0')
	    else if computerChoice is "paper"
	      $('#compete section:nth-child(3)').css('background-position', ' 0 -303px ')
	    else if computerChoice is "scissors"
	      $('#compete section:nth-child(3)').css('background-position', '-402px -303px ')
	    else
	      alert('There seems to have been a error in my logic. Please try again.')
	      
	    tie = -> 
	      $('#compete h1').text("IT'S A TIE!").css(
	        "z-index": 5,
	        "-webkit-animation": "results 2s ease-in-out",
	        "-moz-animation": "results 2s ease-in-out",
	        "animation": "results 2s ease-in-out"
	      )
	      $('footer h1').css(
	      	"-webkit-animation" : "refresh 2s 3s ease-in-out",
	      	"-moz-animation" : "refresh 2s 3s ease-in-out",
	      	"animation" : "refresh 2s 3s ease-in-out"
	      	)
	      
	    winner1 = -> 
	      $('#compete section:first-child').addClass('winnerLeft')
	      $('#compete section:nth-child(3)').addClass('loserRight')
	      $('#compete h1').text('PLAYER 1 WINS!').css(
	        "z-index": 5,
	        "-webkit-animation": "results 2s ease-in-out",
	        "-moz-animation": "results 2s ease-in-out",
	        "animation": "results 2s ease-in-out"
	      )
	      $('footer h1').css(
	      	"-webkit-animation" : "refresh 2s 3s ease-in-out",
	      	"-moz-animation" : "refresh 2s 3s ease-in-out",
	      	"animation" : "refresh 2s 3s ease-in-out"
	      	)
	      
	    winner2 =  ->
	      $('#compete section:nth-child(3)').css('-webkit-animation' : 'winner_right 1.5s 2s forwards', '-moz-animation' : 'winner_right 1.5s 2s forwards', 'animation' : 'winner_right 1.5s 2s forwards')
	      $('#compete section:first-child').addClass('loserLeft')
	      $('#compete h1').text('COMPUTER WINS!').css(
	        "z-index": 5,
	        "-webkit-animation": "results 2s ease-in-out",
	        "-moz-animation": "results 2s ease-in-out",
	        "animation": "results 2s ease-in-out"
	      )
	      $('footer h1').css(
	      	"-webkit-animation" : "refresh 2s 3s ease-in-out",
	      	"-moz-animation" : "refresh 2s 3s ease-in-out",
	      	"animation" : "refresh 2s 3s ease-in-out"
	      	)
	      
	    #playerChoice = $('button').attr('id')
	    
	    if playerChoice is "rock"
	      $('#compete section:first-child').css('background-position', '-400px 0')
	    else if playerChoice is "paper"
	      $('#compete section:first-child').css('background-position', '0 -303px ')
	    else if playerChoice is 'scissors'
	      $('#compete section:first-child').css('background-position', '-402px -303px ')
	    else
	      alert('Oops! Looks there has been a mistake on my part. Please try again.')
	      
	    game = (choice1,choice2) ->
	      if choice1 is 'rock'
	        if choice2 is "scissors"
	          winner1()
	        else if choice2 is "paper"
	          winner2()
	        else
	          tie()
	      if choice1 is 'paper'
	        if choice2 is 'rock'
	          winner1()
	        else if choice2 is "scissors"
	          winner2()
	        else
	          tie()
	      if choice1 is 'scissors'
	        if choice2 is 'paper'
	          winner1()
	        else if choice2 is "rock"
	          winner2()
	        else
	          tie()

	    game(playerChoice, computerChoice)
	   , 4000)


   

   
