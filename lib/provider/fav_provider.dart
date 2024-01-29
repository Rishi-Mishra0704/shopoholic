import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopoholic/models/meal.dart';

class favMealsNotifier extends StateNotifier<List<Meal>> {
  favMealsNotifier() : super([]);

  void toggleMealStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favmMealsProvider = StateNotifierProvider<favMealsNotifier, List<Meal>>((ref) {
  return favMealsNotifier();
});
