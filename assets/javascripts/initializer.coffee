$ ->

  $("#show-form").on 'click', ->
    $('#intro').animate({opacity: 0}, 300, ->
      $('#intro').hide()
      $('.form').show()
      $('.form').animate({opacity: 1}, 300)
    )



  $('#order-button').on 'click', ->

    username = $('input[name=username]')
    phone = $('input[name=phone]')
    email = $('input[name=email]')
    message = $('input[name=message]')

    shake_fields = []

    if username.val() < 2
      shake_fields.push username

    if phone.val() < 10
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/orders.json',
      {
        'order[username]': username.val(),
        'order[phone]': phone.val(),
        'order[email]': email.val(),
        'order[message]': message.val()
      },
      (data) =>

    )

    show_thank_you()
    reachGoal 'new_order'

  $('.add-message').on 'click', ->
    $(@).hide()
    $('input.long').show()

window.show_thank_you = ->

  form_block = $('.form').find('.form-block')

  form_block.animate({opacity: 0}, 1000, ->
    form_block.hide()
    thank_you_block = $('.form').find('.form-thank-you')
    thank_you_block.show()
    thank_you_block.animate({opacity: 1}, 1000, ->
      $('input[type=text]').val('')
    )
  )


window.shake_field = (field) ->
  shake(field, i) for i in [1..10]


window.shake = (field, i) ->

  if i%2
    field.animate({height: '-=15'}, 100)
  else
    field.animate({height: '+=15'}, 100)


window.reachGoal = (goal) ->
  yaCounter24427955.reachGoal goal


