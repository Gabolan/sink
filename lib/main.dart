import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sink/redux/actions.dart';
import 'package:sink/redux/middleware.dart';
import 'package:sink/redux/reducers.dart';
import 'package:sink/redux/state.dart';
import 'package:sink/theme/icons.dart';
import 'package:sink/ui/home.dart';

void main() {
  final Store store = Store<AppState>(
    reduce,
    distinct: true,
    initialState: AppState(areCategoriesLoading: true),
    middleware: [SinkMiddleware()],
  );

  runApp(Sink(store));
}

class Sink extends StatelessWidget {
  final Store<AppState> store;

  Sink(this.store);

  @override
  Widget build(BuildContext context) {
    store.dispatch(RehydrateState());

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Sink',
        theme: ThemeData(
            backgroundColor: Colors.purple,
            iconTheme: IconThemeData(
              size: ICON_SIZE,
            )),
        home: HomeScreen(),
      ),
    );
  }
}
