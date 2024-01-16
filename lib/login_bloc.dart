import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()){
    on<InitLogin>(_initLogin);
    on<ProsesLogin>(_prosesLogin);
    on<ProsesLogout>(_prosesLogout);
  }

  _initLogin(InitLogin event, Emitter emit) async{}

  _prosesLogout(ProsesLogout event, Emitter emit) async{
    emit(LoginLoading());
    emit(LoginInitial());
  }

  _prosesLogin(ProsesLogin event, Emitter emit) async{
    String username = event.username;
    String password = event.password;

    emit(LoginLoading());

    if(username == 'kurnia' && password == 'romadon'){
      emit(LoginSuccess(sessionToken: '21552011202'));
    } else {
      emit(LoginFailure(error: 'Login failed'));
    }
  }
}