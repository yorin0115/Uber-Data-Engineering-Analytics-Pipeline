from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.bigquery import BigQuery
from os import path

if "data_exporter" not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data_to_big_query(data, **kwargs) -> None:
    """
    將 Transformer 回傳的 8 張 DataFrame 自動寫入 BigQuery
    """
    config_path = path.join(get_repo_path(), "io_config.yaml")
    config_profile = "default"

    project_id = "uber-data-analytics-509202"
    dataset_id = "uber_data_analytics_project"

    for table_name, df in data.items():
        table_id = f"{project_id}.{dataset_id}.{table_name}"
        
        print(f"正在匯出 {table_name} 至 BigQuery: {table_id}...")
        
        BigQuery.with_config(ConfigFileLoader(config_path, config_profile)).export(
            df,
            table_id,
            if_exists="replace",
        )
        
    print("所有資料表已成功匯出至 BigQuery")