module Models exposing (Route)

import Url
import Browser.Navigation


type Route
    = MovieListRoute
    | SerieListRoute
    | NotFoundRoute
