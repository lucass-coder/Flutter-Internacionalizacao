//Localição e internacionalização

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container.dart';

class LocalizationContainer extends BlocContainer {
  final Widget child;

  LocalizationContainer({@required Widget this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocaleCubit>(
      create: (context) => CurrentLocaleCubit(),
      child: this.child,
    );
  }
}

class CurrentLocaleCubit extends Cubit<String> {
  CurrentLocaleCubit() : super('pt-br');
}

class ViewI18N  {
  String _language;


  ViewI18N(BuildContext context){
    // O problema dessa abordagem
    // é o rebuild quando você troca a língua
    // o que você quer reconstruir quando trocar o currentlocalecubit?
    // em geral, é comum reinicializar o sistema, ou voltar para a tela inicial
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String localize(Map<String, String> values) {
    return values[_language];
  }

}