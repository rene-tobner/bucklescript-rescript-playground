(* open Web_document *)
(* open Web_node *)
open Web

let () =
  let body   = Document.body () in

  let main   = Document.createElement "main" in
  let button = Document.createElement "button" in

  let hello  = Document.createTextNode "Hello" in
  
  (* let hlClick : Web.Node.event_cb = (fun [@bs] _ -> Js.log "World" |> ignore) in *)

  Node.appendChild body   main   |> ignore;
  Node.appendChild main   button |> ignore;
  Node.appendChild button hello  |> ignore;
  (* why do I need [@bs] here ? *)
  Node.addEventListener button "click" (fun [@bs] _ -> Js.log "World" |> ignore) false
  (* button##addEventListener "click" hlClick true *)
  (*
try last line w/o `ignore` and this error:
File "/home/rtb/ocaml/bs-playground/src/main.ml", line 7, characters 3-26:
Error: This expression has type Web_node.t
       but an expression was expected of type unit

appendChild returns Web_node.t, but no need to use the return value, a DOM node/element

the outermost `let` is like main routine in C, should return void/unit. `let ()` is not a binding of the name `()`, but a pattern match on the empty tuple, the value of the type void/unit

if one writes `let _ =`, it means one does not care about the return value and `ignore` is unnecessary, but one should care about return values...
   *)

