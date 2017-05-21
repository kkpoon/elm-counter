module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


type Model
    = Model Int


type Msg
    = Increment
    | Decrement


init : Model
init =
    Model 0


view : Model -> Html Msg
view (Model num) =
    div [ style [ ( "display", "flex" ), ( "flex-direction", "column" ), ( "align-items", "center" ) ] ]
        [ h1 [] [ text "Counter" ]
        , h2 [] [ toString num |> text ]
        , button [ style [ ( "font-size", "2em" ), ( "width", "5em" ) ], onClick Increment ] [ text "+1" ]
        , button [ style [ ( "font-size", "2em" ), ( "width", "5em" ) ], onClick Decrement ] [ text "-1" ]
        ]


update : Msg -> Model -> Model
update msg (Model num) =
    case msg of
        Increment ->
            Model (num + 1)

        Decrement ->
            Model (num - 1)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }
