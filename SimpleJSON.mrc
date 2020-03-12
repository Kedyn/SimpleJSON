/**
*
* JavaScript JSON code extracted from Douglas Crockford json2.js Public Domain.
* https://github.com/douglascrockford/JSON-js
*
* @const $CODE
*
*/
alias -l CODE return "object"!=typeof JSON&&(JSON={}),function(){"use strict";var rx_one=/^[\],:{}\s]*$/,rx_two=/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,rx_three=/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,rx_four=/(?:^|:|,)(?:\s*\[)+/g,rx_escapable=/[\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,rx_dangerous=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,indent,meta,rep;function f(t){return t<10?"0"+t:t}function this_value(){return this.valueOf()}function quote(t){return rx_escapable.lastIndex=0,rx_escapable.test(t)?'"'+t.replace(rx_escapable,function(t){var e=meta[t];return"string"==typeof e?e:"\\u"+("0000"+t.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+t+'"'}function str(t,e){var r,n,o,u,f,a=gap,i=e[t];switch(i&&"object"==typeof i&&"function"==typeof i.toJSON&&(i=i.toJSON(t)),"function"==typeof rep&&(i=rep.call(e,t,i)),typeof i){case"string":return quote(i);case"number":return isFinite(i)?String(i):"null";case"boolean":case"null":return String(i);case"object":if(!i)return"null";if(gap+=indent,f=[],"[object Array]"===Object.prototype.toString.apply(i)){for(u=i.length,r=0;r<u;r+=1)f[r]=str(r,i)||"null";return o=0===f.length?"[]":gap?"[\n"+gap+f.join(",\n"+gap)+"\n"+a+"]":"["+f.join(",")+"]",gap=a,o}if(rep&&"object"==typeof rep)for(u=rep.length,r=0;r<u;r+=1)"string"==typeof rep[r]&&(o=str(n=rep[r],i))&&f.push(quote(n)+(gap?": ":":")+o);else for(n in i)Object.prototype.hasOwnProperty.call(i,n)&&(o=str(n,i))&&f.push(quote(n)+(gap?": ":":")+o);return o=0===f.length?"{}":gap?"{\n"+gap+f.join(",\n"+gap)+"\n"+a+"}":"{"+f.join(",")+"}",gap=a,o}}"function"!=typeof Date.prototype.toJSON&&(Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z":null},Boolean.prototype.toJSON=this_value,Number.prototype.toJSON=this_value,String.prototype.toJSON=this_value),"function"!=typeof JSON.stringify&&(meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},JSON.stringify=function(t,e,r){var n;if(gap="",indent="","number"==typeof r)for(n=0;n<r;n+=1)indent+=" ";else"string"==typeof r&&(indent=r);if(rep=e,e&&"function"!=typeof e&&("object"!=typeof e||"number"!=typeof e.length))throw new Error("JSON.stringify");return str("",{"":t})}),"function"!=typeof JSON.parse&&(JSON.parse=function(text,reviver){var j;function walk(t,e){var r,n,o=t[e];if(o&&"object"==typeof o)for(r in o)Object.prototype.hasOwnProperty.call(o,r)&&(void 0!==(n=walk(o,r))?o[r]=n:delete o[r]);return reviver.call(t,e,o)}if(text=String(text),rx_dangerous.lastIndex=0,rx_dangerous.test(text)&&(text=text.replace(rx_dangerous,function(t){return"\\u"+("0000"+t.charCodeAt(0).toString(16)).slice(-4)})),rx_one.test(text.replace(rx_two,"@").replace(rx_three,"]").replace(rx_four,"")))return j=eval("("+text+")"),"function"==typeof reviver?walk({"":j},""):j;throw new SyntaxError("JSON.parse")})}();

/**
*
* Function that will return all keys of a JSON object.
*
* @const $GET_KEYS
*
*/
alias -l GET_KEYS return function getKeys(obj){var keys=new Array();for(var i in obj){keys.push(i);}return keys;}

/**
*
* Global variable declaration of a JSON object.
*
* @const $OBJECT_DECLARATION
*
*/
alias -l OBJECT_DECLARATION return var json_obj={};

/**
*
* Global variable declaration of the keys in a JSON object.
*
* @const $OBJECT_KEYS
*
*/
alias -l OBJECT_KEYS return var json_obj_keys=[];

/**
*
* Function that returns a file contents as a string.
*
* @const $FILE_TO_STRING
*
*/
alias -l FILE_TO_STRING return function fileToString(file){var axo = new ActiveXObject("Scripting.FileSystemObject");var file_obj=axo.OpenTextFile(file,1,true);var file_string=file_obj.ReadAll();file_obj.Close();return file_string;}

/**
*
* Function that saves a string to a file.
*
* @const $STRING_TO_FILE
*
*/
alias -l STRING_TO_FILE return function stringToFile(str,file){var axo = new ActiveXObject("Scripting.FileSystemObject");var file_obj=axo.OpenTextFile(file,2,true);file_obj.Write(str);file_obj.Close();}

/**
*
* Current version of the project
*
* @const $SIMPLE_JSON_VERSION
*
* @global
*
*/
alias SIMPLE_JSON_VERSION return 1.0.0

/**
*
* Parses a file or text and adds the result into a container.
*
* @identifier $jsonCreate
*
* @param <name>       Name of the container.
* @param <file|text>  File or text to parse.
*
* @returns  1 on success, 0 otherwise.
*
* @global
*
*/
alias jsonCreate {
  if ($isid) {
    set -l %name $+(JSON,$1)

    if ($2 != $null) {
      if ($jsCreate(%name)) && ($jsAddCode(%name,$CODE)) {
        if ($jsAddCode(%name,$GET_KEYS)) && ($jsAddCode(%name,$OBJECT_KEYS)) && ($jsAddCode(%name,$OBJECT_DECLARATION)) && ($jsAddCode(%name,$STRING_TO_FILE)) {
          set -l %open $chr(40)
          set -l %close $chr(41)

          if ($isfile($2)) {
            if ($jsAddCode(%name,$FILE_TO_STRING)) && ($jsAddCode(%name,$+(json_obj=JSON.parse,%open,fileToString,%open,$qt($replace($qt($2-),\,\\)),%close,%close))) {
              if ($jsExecute(%name,json_obj_keys=getKeys(json_obj))) return 1
            }
          }
          else {
            if ($jsAddCode(%name,$+(json_obj=JSON.parse,%open,$qt($2),%close)) != 0) && ($jsExecute(%name,json_obj_keys=getKeys(json_obj))) return 1
          }
        }
      }

      !noop $jsDestroy(%name)
    }

    return 0
  }
  else {
    echo -ces info * jsonCreate: is not a command

    halt
  }
}

/**
*
* Writes the contents of a JSON object to a file.
*
* @identifier $jsonSave
*
* @param <name>  Name of the container.
* @param <file>  File name and path of where to save the object.
*
* @returns  1 on success, 0 otherwise.
*
* @global
*
*/
alias jsonSave {
  if ($isid) {
    set -l %open $chr(40)
    set -l %close $chr(41)
    set -l %comma $chr(44)

    return $jsExecute($+(JSON,$1),$+(stringToFile,%open,stringify,%open,json_obj,%close,%comma,$qt($replace($qt($2-),\,\\)),%close))
  }
  else {
    echo -ces info * jsonSave: is not a command

    halt
  }
}

/**
*
* Adds a property to a JSON object.
*
* @identifier $jsonAdd
*
* @param <name>      Name of the container.
* @param <property>  Property to be added.
* @param <value>     Value of the property.
*
* @returns  1 on success, 0 otherwise.
*
* @global
*
*/
alias jsonAdd {
  if ($isid) {
    if ($0 >= 3) {
      set -l %name $+(JSON,$1)
      set -l %properties
      set -l %property 2

      while (%property < $0) {
        if ($eval($chr(36) $+ %i,2) isnum) set -l %properties $+(%properties,[,$v1,])
        else set -l %properties = $+(%properties,[,$qt($v1),])

        inc %property
      }

      if ($jsExecute(%name,$+(json_obj,%properties) = $eval($chr(36) $+ $0,2))) && ($jsExecute(%name,json_obj_keys=getKeys(json_obj))) return 1
    }

    return 0
  }
  else {
    echo -ces info * jsonAdd: is not a command

    halt
  }
}

/**
*
* Gets the value of a property of a JSON object.
*
* @identifier $jsonGet
*
* @param <name>      Name of the container.
* @param <property>  Property to be deleted.
*
* @returns  The value of the property.
*
* @global
*
*/
alias -l jsonGet {
  if ($isid) {
    if ($0 >= 2) {
      set -l %name = $+(JSON,$1)
      set -l %properties
      set -l %property 2

      while (%property <= $0) {
        if ($eval($chr(36) $+ %property,2) isnum) set -l %properties $+(%properties,[,$v1,])
        else set -l %properties $+(%properties,[,$qt($v1),])

        inc %property
      }

      return $jsEvaluate($+(JSON,$$1),$+(json_obj,%properties))
    }

    return $null
  }
  else {
    echo -ces info * jsonGet: is not a command

    halt
  }
}

/**
*
* Deletes a property of a JSON object.
*
* @identifier $jsonDelete
*
* @param <name>      Name of the container.
* @param <property>  Property to be deleted.
*
* @returns  1 on success, 0 otherwise.
*
* @global
*
*/
alias jsonDelete {
  if ($isid) {
    if ($0 >= 2) {
      set -l %name $+(JSON,$1)
      set -l %properties
      set -l %property 2

      while (%property <= $0) {
        if ($eval($chr(36) $+ %i,2) isnum) set -l %properties = $+(%properties,[,$v1,])
        else set -l %properties $+(%properties,[,$qt($v1),])

        inc %property
      }

      if ($jsExecute(%name,delete $+(json_obj,%properties))) && ($jsExecute(%name,json_obj_keys=getKeys(json_obj))) return 1
    }

    return 0
  }
  else {
    echo -ces info * jsonDelete: is not a command

    halt
  }
}

/**
*
* Turns a JSON object to a string.
*
* @identifier $jsonStringify
*
* @param <name>  Name of the container.
*
* @returns  The stringified object.
*
* @global
*
*/
alias jsonStringify {
  if ($isid) return $jsEvaluate($+(JSON,$1),JSON.stringify(json_obj))
  else {
    echo -ces info * jsonStringify: is not a command

    halt
  }
}

/**
*
* Checks the type of the property or object.
*
* @identifier $jsonTypeof
*
* @param <name>      Name of the container.
* @param [property]  Property to be checked.
*
* @returns  Returns the type of property or object.
*
* @global
*
*/
alias jsonTypeof {
  if ($isid) {
    set -l %properties
    set -l %property 2

    while (%property <= $0) {
      if ($eval($chr(36) $+ %i,2) isnum) set -l %properties $+(%properties,[,$v1,])
      else set -l %properties $+(%properties,[,$qt($v1),])

      inc %property
    }

    return $jsEvaluate($+(JSON,$1),$+(json_obj,%properties,.length))
  }
  else {
    echo -ces info * jsonTypeof: is not a command

    halt
  }
}

/**
*
* Gets the name of the Nth key of an object.
*
* @identifier $jsonKey
*
* @param <name>  Name of the container.
* @param <N>     Position of the key.
*
* @returns  The name of the Nth key.
*
* @global
*
*/
alias jsonKey {
  if ($isid) return $jsEvaluate($+(JSON,$1),$+(json_obj_keys,[,$2,]))
  else {
    echo -ces info * jsonKey: is not a command

    halt
  }
}

/**
*
* Destroys a JSON object container.
*
* @identifier $jsonDestroy
*
* @param <name>  Name of the container.
*
* @returns  1 on success, 0 otherwise.
*
* @global
*
*/
alias jsonDestroy {
  if ($isid) return $jsDestroy($+(JSON,$1))
  else {
    echo -ces info * jsonDestroy: is not a command

    halt
  }
}
