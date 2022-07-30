import 'package:flutter/material.dart';
import 'package:flutter_apprentice/recipe.dart';
import 'package:flutter_apprentice/recipe_detail.dart';

class HomeScreem extends StatefulWidget {
  final String title;
  const HomeScreem({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RecipeDetail(
                    recipe: Recipe.samples[index],
                  );
                }));
              },
              child: RecipeCard(
                recipe: Recipe.samples[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image(image: AssetImage(recipe.imageUrl)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipe.label,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
