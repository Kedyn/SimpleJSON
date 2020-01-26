# SimpleJSON

Allows manipulation of JSON.

## Features

- Read from file.
- Read from text.
- Write to file.
- Add items to an object.
- Delete items from an object.
- Stringify.
- Type of keys.
- Name of keys.

## Dependencies

- [SimpleJScripts](https://github.com/Kedyn/SimpleJScripts)

## Installation

Load `SimpleJSON.mrc` located in the root folder onto mIRC.

## Usage

### Identifier $jsonCreate

```mirc-script
$jsonCreate(name[,file|text])
```

Parses the file or text and puts it in a JavaScript object.

Returns 1 if the creation was a success, 0 otherwise.

### Identifier $jsonSave

```mirc-script
$jsonSave(name,file)
```

Saves the JSON object to the specified file.

Returns 1 if success, 0 otherwise.

### Identifier $jsonAdd

```mirc-script
$jsonAdd(name,property[,property,...],value)
```

Adds or changes a property value.

Returns 1 if success, 0 otherwise.

### Identifier $jsonDelete

```mirc-script
$jsonDelete(name,property[,property,...])
```

Deletes an item.

Returns 1 if success, 0 otherwise.

### Identifier $jsonStringify

```mirc-script
$jsonStringify(name)
```

Returns the JSON object as a string.

### Identifier $jsonTypeof

```mirc-script
$jsonTypeof(name[,property,...])
```

Returns the type of the property or object.

### Identifer $jsonKey

```mirc-script
$jsonKey(name,N)
```

Returns the name of the N key.

### Identifier $jsonDestroy

```mirc-script
$jsonDestroy(name)
```

Returns 1 if success, 0 otherwise.

## License

This project is made available under the [MIT](https://choosealicense.com/licenses/mit/) License.

## Changelog

If you would like to see our changelog please read our [CHANGELOG.md](./CHANGELOG.md) file.
