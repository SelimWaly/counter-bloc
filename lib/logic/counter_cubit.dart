import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemmx_bloc/logic/counter_state.dart';

class CounterCubit extends Cubit<CounterStates>{

  CounterCubit():super(CounterInit());

  int counter = 0;

  incrementCounter(){
    counter++;
    emit(CounterIncrement());
  }
}