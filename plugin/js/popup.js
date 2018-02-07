var form = document.forms.connect;
var con = form.elements.connect;

chrome.storage.sync.get('name', function (result)
{
	form.elements.name.value = result.name;
});

chrome.storage.sync.get('room', function (result)
{
	form.elements.room.value = result.room;
});

con.onclick = function()
{
	var name = form.elements.name.value;
	var room = form.elements.room.value;

 	chrome.storage.sync.set(
 	{
 		'name': name,
 		'room': room
 	});

  chrome.runtime.sendMessage(
  {
    from: 'join',
    name: name,
    room: room
  });
}