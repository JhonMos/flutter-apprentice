import 'package:flutter/material.dart';
import 'package:flutter_apprentice/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 300.0,
                child: Image(image: AssetImage(widget.recipe.imageUrl))),
            const SizedBox(height: 14.0),
            const Text(
              'Ingredientes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}'),
                  );
                },
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _sliderValue.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue.round();
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.black26,
              label: '${_sliderValue * widget.recipe.servings} unidades',
            )
          ],
        ),
      ),
    );
  }
}
