# BackEnd for Todo APP

Rest API for todo list application.
### Setting up
 `python -m pip3 install -r requirement.txt `
After installing dependencies.

### Example

Simple Get list: curl http://localhost:5000/todos

Get single task: curl http://localhost:5000/todos/todo3

Delete task: curl http://localhost:5000/todos/todo2 -X DELETE -v

Add new task: curl http://localhost:5000/todos -d "task=something new" -X POST -v

Update task: curl http://localhost:5000/todos/todo3 -d "task=something different" -X PUT -v
