import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/counter_cubit.dart';
import 'logic/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){return CounterCubit();},
      child: BlocBuilder<CounterCubit,CounterStates>(
        builder: (context,state){
          return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Counter App'),
          ),
          body: Center(
            child: BlocBuilder<CounterCubit,CounterStates>(
              builder: (context,state){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${BlocProvider.of<CounterCubit>(context).counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){BlocProvider.of<CounterCubit>(context).incrementCounter();},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
          },
      ),
    );
  }
}
