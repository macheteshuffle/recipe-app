controllers = angular.module('controllers')
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource) ->
    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)
    Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)
    else
      $scope.recipes = []
])