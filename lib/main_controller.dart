import 'package:di/annotations.dart';
import 'package:redstone_mapper/mapper.dart';
import 'dart:html';
import 'user.dart';
import 'package:fp/fp.dart';

@Injectable()
class MainController
{
    List<String> nombres = [];
    
    String _nombreSeleccionado;
    
    void set nombreSeleccionado (String value)
    {
        _nombreSeleccionado = value;
        seleccionarUsuario (value);
    }
    String get nombreSeleccionado => _nombreSeleccionado;
    
    Map<String, User> map = {};
    
    User user;
    
    
    MainController ()
    {
        init ();
    }
    
    init () async
    {
        String json = await HttpRequest.getString('json/info.json');
        
        List<User> users = decodeJson(json, User);
        
        nombres = users.map (getField (#nombre)).toList();
        
        for (User user in users)
        {
            map[user.nombre] = user; 
        }
    }
    
    seleccionarUsuario (String nombre)
    {
        user = map [nombre];
    }
}