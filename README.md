# databricks_repo_test

## Databricks API using curl
#### Set environment variables
```sh
export DB_HOSTNAME="<databricks_server_hostname>"
export DB_ACCESS_TOKEN="<databricks_access_token>"
```
<br>

#### Update repo or change branch
- https://docs.databricks.com/api/workspace/repos/update
```sh
curl --request PATCH "https://${DB_HOSTNAME}/api/2.0/repos/<repo_id>" \
    --header "Authorization: Bearer ${<DB_ACCESS_TOKEN>}" \
    --data '{"branch": "<branch>"}'
```
<br>

#### Trigger databricks notebook from remote repo as a adhoc job
- https://docs.databricks.com/api/workspace/jobs/submit
- This is to execute using existing cluster 
```sh
curl --request POST "https://${DB_HOSTNAME}/api/2.1/jobs/runs/submit" \
    --header "Authorization: Bearer ${DB_ACCESS_TOKEN}" \
    --data '{
        "run_name": "db_test_run",
        "tasks": {
            "task_key": "run_create_tbl", 
            "existing_cluster_id": "<cluster_id>",
            "notebook_task": {
                "notebook_path": "tesing_api_repo",
                "source": "GIT"
            }
        },
        "git_source": {
            "git_url": "https://github.com/progrkaushl/databricks_repo_test.git", 
            "git_provider": "gitHub", 
            "git_branch": "main"
        },
        "timeout_seconds": 3600,
        "max_retries": 0
    }' 
```
<br>

- Create new cluster for adhoc task
  - Auto-Scaling tags can be added in `new_cluster` to achieve auto-scaling.
```sh
curl --request POST "https://${DB_HOSTNAME}/api/2.1/jobs/runs/submit" \
    --header "Authorization: Bearer ${DB_ACCESS_TOKEN}" \
    --data '{
        "run_name": "db_test_run",
        "tasks": {
            "task_key": "run_create_tbl", 
            "new_cluster": {
                "num_workers": 1, 
                "cluster_name": "databricks_test"
            },
            "notebook_task": {
                "notebook_path": "</relative/path/to/notebook>",
                "source": "GIT"
            }
        },
        "git_source": {
            "git_url": "https://github.com/progrkaushl/databricks_repo_test.git", 
            "git_provider": "gitHub", 
            "git_branch": "main"
        },
        "timeout_seconds": 3600,
        "max_retries": 0
    }' 
```

#### Trigger databricks notebook from workspace as a adhoc job
```sh
curl --request POST "https://${DB_HOSTNAME}/api/2.1/jobs/runs/submit" \
    --header "Authorization: Bearer ${DB_ACCESS_TOKEN}" \
    --data '{
        "run_name": "db_test_run",
        "tasks": {
            "task_key": "run_create_tbl", 
            "new_cluster": {
                "num_workers": 1, 
                "cluster_name": "databricks_test"
            },
            "notebook_task": {
                "notebook_path": "</path/to/notebook>",
                "source": "WORKSPACE"
            }
        },
        "timeout_seconds": 3600,
        "max_retries": 0
    }' 
```