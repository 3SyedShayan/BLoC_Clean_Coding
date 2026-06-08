import 'package:bloc_clean_coding/bloc/counter/counter_bloc.dart';
import 'package:bloc_clean_coding/bloc/counter/counter_event.dart';
import 'package:bloc_clean_coding/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Value of counter is ${state.counter.toString()}');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementCounter()),
              child: Text('Increment'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(DecrementCounter()),
              child: Text('Decrement'),
            ),
          ],
        ),
      ],
    );
  }
}
