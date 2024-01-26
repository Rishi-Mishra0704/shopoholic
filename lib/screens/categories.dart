import 'package:flutter/material.dart';

import 'package:shopoholic/data/dummy_data.dart';
import 'package:shopoholic/screens/meals.dart';
import 'package:shopoholic/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(
          title: "some title",
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick a category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: (){
              _selectCategory(context);
            },),
        ],
      ),
    );
  }
}
