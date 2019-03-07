module Routing exposing (matchers, movieListPath, parseLocation, serieListPath)

import Models
import Url
import Url.Parser exposing ((</>))
import Browser.Navigation


movieListPath : String
movieListPath =
    "/movies"


serieListPath : String
serieListPath =
    "/series"

matchers : Url.Parser.Parser (Models.Route -> a) a
matchers =
    Url.Parser.oneOf
        [ Url.Parser.map Models.MovieListRoute Url.Parser.top
        , Url.Parser.map Models.MovieListRoute (Url.Parser.s "movies")
        , Url.Parser.map Models.EpisodeListRoute (Url.Parser.s "series" </> Url.Parser.string)
        ]


parseLocation : Url.Url -> Models.Route
parseLocation location =
    case Url.Parser.parse matchers location of
        Just route ->
            route

        Nothing ->
            Models.NotFoundRoute
