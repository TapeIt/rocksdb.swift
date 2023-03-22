// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let osEnvRocks: String
#if os(Linux)
osEnvRocks = "OS_LINUX"
#else
osEnvRocks = "OS_MACOSX"
#endif

let package = Package(
    name: "RocksDB",
    products: [
        .library(
            name: "RocksDB",
            targets: ["RocksDB"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "librocksdb",
            path: "Sources/librocksdb",
            exclude: [
                // this list was generated via  `ls -1 upstream/**/*{bench,test}*.cc` in `Sources/librocksdb/`.
                "upstream/cache/cache_bench.cc",
                "upstream/cache/cache_bench_tool.cc",
                "upstream/cache/cache_reservation_manager_test.cc",
                "upstream/cache/cache_test.cc",
                "upstream/cache/lru_cache_test.cc",
                "upstream/db/blob/blob_counting_iterator_test.cc",
                "upstream/db/blob/blob_file_addition_test.cc",
                "upstream/db/blob/blob_file_builder_test.cc",
                "upstream/db/blob/blob_file_cache_test.cc",
                "upstream/db/blob/blob_file_garbage_test.cc",
                "upstream/db/blob/blob_file_reader_test.cc",
                "upstream/db/blob/blob_garbage_meter_test.cc",
                "upstream/db/blob/db_blob_basic_test.cc",
                "upstream/db/blob/db_blob_compaction_test.cc",
                "upstream/db/blob/db_blob_corruption_test.cc",
                "upstream/db/blob/db_blob_index_test.cc",
                "upstream/db/column_family_test.cc",
                "upstream/db/compact_files_test.cc",
                "upstream/db/compaction/clipping_iterator_test.cc",
                "upstream/db/compaction/compaction_iterator_test.cc",
                "upstream/db/compaction/compaction_job_stats_test.cc",
                "upstream/db/compaction/compaction_job_test.cc",
                "upstream/db/compaction/compaction_picker_test.cc",
                "upstream/db/compaction/compaction_service_test.cc",
                "upstream/db/comparator_db_test.cc",
                "upstream/db/corruption_test.cc",
                "upstream/db/cuckoo_table_db_test.cc",
                "upstream/db/db_basic_test.cc",
                "upstream/db/db_block_cache_test.cc",
                "upstream/db/db_bloom_filter_test.cc",
                "upstream/db/db_compaction_filter_test.cc",
                "upstream/db/db_compaction_test.cc",
                "upstream/db/db_dynamic_level_test.cc",
                "upstream/db/db_encryption_test.cc",
                "upstream/db/db_flush_test.cc",
                "upstream/db/db_inplace_update_test.cc",
                "upstream/db/db_io_failure_test.cc",
                "upstream/db/db_iter_stress_test.cc",
                "upstream/db/db_iter_test.cc",
                "upstream/db/db_iterator_test.cc",
                "upstream/db/db_kv_checksum_test.cc",
                "upstream/db/db_log_iter_test.cc",
                "upstream/db/db_logical_block_size_cache_test.cc",
                "upstream/db/db_memtable_test.cc",
                "upstream/db/db_merge_operand_test.cc",
                "upstream/db/db_merge_operator_test.cc",
                "upstream/db/db_options_test.cc",
                "upstream/db/db_properties_test.cc",
                "upstream/db/db_range_del_test.cc",
                "upstream/db/db_secondary_test.cc",
                "upstream/db/db_sst_test.cc",
                "upstream/db/db_statistics_test.cc",
                "upstream/db/db_table_properties_test.cc",
                "upstream/db/db_tailing_iter_test.cc",
                "upstream/db/db_test.cc",
                "upstream/db/db_test2.cc",
                "upstream/db/db_test_util.cc",
                "upstream/db/db_universal_compaction_test.cc",
                "upstream/db/db_wal_test.cc",
                "upstream/db/db_with_timestamp_basic_test.cc",
                "upstream/db/db_with_timestamp_compaction_test.cc",
                "upstream/db/db_write_buffer_manager_test.cc",
                "upstream/db/db_write_test.cc",
                "upstream/db/dbformat_test.cc",
                "upstream/db/deletefile_test.cc",
                "upstream/db/error_handler_fs_test.cc",
                "upstream/db/external_sst_file_basic_test.cc",
                "upstream/db/external_sst_file_test.cc",
                "upstream/db/fault_injection_test.cc",
                "upstream/db/file_indexer_test.cc",
                "upstream/db/filename_test.cc",
                "upstream/db/flush_job_test.cc",
                "upstream/db/forward_iterator_bench.cc",
                "upstream/db/import_column_family_test.cc",
                "upstream/db/listener_test.cc",
                "upstream/db/log_test.cc",
                "upstream/db/manual_compaction_test.cc",
                "upstream/db/memtable_list_test.cc",
                "upstream/db/merge_helper_test.cc",
                "upstream/db/merge_test.cc",
                "upstream/db/obsolete_files_test.cc",
                "upstream/db/options_file_test.cc",
                "upstream/db/perf_context_test.cc",
                "upstream/db/periodic_work_scheduler_test.cc",
                "upstream/db/plain_table_db_test.cc",
                "upstream/db/prefix_test.cc",
                "upstream/db/range_del_aggregator_bench.cc",
                "upstream/db/range_del_aggregator_test.cc",
                "upstream/db/range_tombstone_fragmenter_test.cc",
                "upstream/db/repair_test.cc",
                "upstream/db/table_properties_collector_test.cc",
                "upstream/db/version_builder_test.cc",
                "upstream/db/version_edit_test.cc",
                "upstream/db/version_set_test.cc",
                "upstream/db/wal_edit_test.cc",
                "upstream/db/wal_manager_test.cc",
                "upstream/db/write_batch_test.cc",
                "upstream/db/write_callback_test.cc",
                "upstream/db/write_controller_test.cc",
                "upstream/db_stress_tool/db_stress_test_base.cc",
                "upstream/env/env_basic_test.cc",
                "upstream/env/env_test.cc",
                "upstream/env/io_posix_test.cc",
                "upstream/env/mock_env_test.cc",
                "upstream/env/mock_env_test.cc",
                "upstream/file/delete_scheduler_test.cc",
                "upstream/file/prefetch_test.cc",
                "upstream/file/random_access_file_reader_test.cc",
                "upstream/java/rocksjni/native_comparator_wrapper_test.cc",
                "upstream/java/rocksjni/rocksdb_exception_test.cc",
                "upstream/java/rocksjni/testable_event_listener.cc",
                "upstream/java/rocksjni/write_batch_test.cc",
                "upstream/logging/auto_roll_logger_test.cc",
                "upstream/logging/env_logger_test.cc",
                "upstream/logging/event_logger_test.cc",
                "upstream/memory/arena_test.cc",
                "upstream/memory/memory_allocator_test.cc",
                "upstream/memtable/inlineskiplist_test.cc",
                "upstream/memtable/memtablerep_bench.cc",
                "upstream/memtable/skiplist_test.cc",
                "upstream/memtable/write_buffer_manager_test.cc",
                "upstream/microbench/db_basic_bench.cc",
                "upstream/microbench/ribbon_bench.cc",
                "upstream/monitoring/histogram_test.cc",
                "upstream/monitoring/iostats_context_test.cc",
                "upstream/monitoring/statistics_test.cc",
                "upstream/monitoring/stats_history_test.cc",
                "upstream/options/configurable_test.cc",
                "upstream/options/customizable_test.cc",
                "upstream/options/options_settable_test.cc",
                "upstream/options/options_test.cc",
                "upstream/table/block_based/block_based_filter_block_test.cc",
                "upstream/table/block_based/block_based_table_reader_test.cc",
                "upstream/table/block_based/block_test.cc",
                "upstream/table/block_based/data_block_hash_index_test.cc",
                "upstream/table/block_based/full_filter_block_test.cc",
                "upstream/table/block_based/partitioned_filter_block_test.cc",
                "upstream/table/block_fetcher_test.cc",
                "upstream/table/cleanable_test.cc",
                "upstream/table/cuckoo/cuckoo_table_builder_test.cc",
                "upstream/table/cuckoo/cuckoo_table_reader_test.cc",
                "upstream/table/merger_test.cc",
                "upstream/table/sst_file_reader_test.cc",
                "upstream/table/table_reader_bench.cc",
                "upstream/table/table_test.cc",
                "upstream/test_util/testharness.cc",
                "upstream/test_util/testutil.cc",
                "upstream/test_util/testutil_test.cc",
                "upstream/test_util/transaction_test_util.cc",
                "upstream/third-party/gtest-1.8.1/fused-src/gtest/gtest-all.cc",
                "upstream/third-party/gtest-1.8.1/fused-src/gtest/gtest_main.cc",
                "upstream/tools/block_cache_analyzer/block_cache_trace_analyzer_test.cc",
                "upstream/tools/db_bench.cc",
                "upstream/tools/db_bench_tool.cc",
                "upstream/tools/db_bench_tool_test.cc",
                "upstream/tools/db_bench_tool_test.cc",
                "upstream/tools/db_sanity_test.cc",
                "upstream/tools/io_tracer_parser_test.cc",
                "upstream/tools/ldb_cmd_test.cc",
                "upstream/tools/reduce_levels_test.cc",
                "upstream/tools/sst_dump_test.cc",
                "upstream/tools/trace_analyzer_test.cc",
                "upstream/trace_replay/block_cache_tracer_test.cc",
                "upstream/trace_replay/io_tracer_test.cc",
                "upstream/util/autovector_test.cc",
                "upstream/util/bloom_test.cc",
                "upstream/util/coding_test.cc",
                "upstream/util/crc32c_test.cc",
                "upstream/util/defer_test.cc",
                "upstream/util/dynamic_bloom_test.cc",
                "upstream/util/file_reader_writer_test.cc",
                "upstream/util/filelock_test.cc",
                "upstream/util/filter_bench.cc",
                "upstream/util/hash_test.cc",
                "upstream/util/heap_test.cc",
                "upstream/util/log_write_bench.cc",
                "upstream/util/random_test.cc",
                "upstream/util/rate_limiter_test.cc",
                "upstream/util/repeatable_thread_test.cc",
                "upstream/util/ribbon_test.cc",
                "upstream/util/slice_test.cc",
                "upstream/util/slice_transform_test.cc",
                "upstream/util/thread_list_test.cc",
                "upstream/util/thread_local_test.cc",
                "upstream/util/timer_queue_test.cc",
                "upstream/util/timer_test.cc",
                "upstream/util/work_queue_test.cc",
                "upstream/utilities/backupable/backupable_db_test.cc",
                "upstream/utilities/blob_db/blob_db_test.cc",
                "upstream/utilities/cassandra/cassandra_format_test.cc",
                "upstream/utilities/cassandra/cassandra_functional_test.cc",
                "upstream/utilities/cassandra/cassandra_row_merge_test.cc",
                "upstream/utilities/cassandra/cassandra_serialize_test.cc",
                "upstream/utilities/cassandra/test_utils.cc",
                "upstream/utilities/checkpoint/checkpoint_test.cc",
                "upstream/utilities/env_librados_test.cc",
                "upstream/utilities/env_mirror_test.cc",
                "upstream/utilities/env_timed_test.cc",
                "upstream/utilities/memory/memory_test.cc",
                "upstream/utilities/merge_operators/string_append/stringappend_test.cc",
                "upstream/utilities/object_registry_test.cc",
                "upstream/utilities/option_change_migration/option_change_migration_test.cc",
                "upstream/utilities/options/options_util_test.cc",
                "upstream/utilities/persistent_cache/hash_table_bench.cc",
                "upstream/utilities/persistent_cache/hash_table_test.cc",
                "upstream/utilities/persistent_cache/persistent_cache_bench.cc",
                "upstream/utilities/persistent_cache/persistent_cache_test.cc",
                "upstream/utilities/simulator_cache/cache_simulator_test.cc",
                "upstream/utilities/simulator_cache/sim_cache_test.cc",
                "upstream/utilities/table_properties_collectors/compact_on_deletion_collector_test.cc",
                "upstream/utilities/transactions/lock/point/point_lock_manager_test.cc",
                "upstream/utilities/transactions/lock/range/range_locking_test.cc",
                "upstream/utilities/transactions/optimistic_transaction_test.cc",
                "upstream/utilities/transactions/transaction_test.cc",
                "upstream/utilities/transactions/write_prepared_transaction_test.cc",
                "upstream/utilities/transactions/write_unprepared_transaction_test.cc",
                "upstream/utilities/ttl/ttl_test.cc",
                "upstream/utilities/util_merge_operators_test.cc",
                "upstream/utilities/write_batch_with_index/write_batch_with_index_test.cc",

                // rados
                "upstream/utilities/env_librados.cc",

                // PowerPC assembly
                "upstream/util/crc32c_ppc_asm.S",

                // This relies on gtest, and it doesn't seem like we need it. We do need mock_env, though.
                "upstream/table/mock_table.cc",

                // build version
                "upstream/util/build_version.cc.in",

                // Text files
                "upstream/README.md",
                "upstream/docs/README.md",
                "upstream/examples/README.md",
                "upstream/fuzz/README.md",
                "upstream/hdfs/README",
                "upstream/java/jmh/README.md",
                "upstream/plugin/README.md",
                "upstream/port/README",
                "upstream/tools/advisor/README.md",
                "upstream/tools/rdb/README.md",
                "upstream/utilities/transactions/lock/range/range_tree/lib/README",

                "upstream/COPYING",
                "upstream/utilities/transactions/lock/range/range_tree/lib/COPYING.AGPLv3",
                "upstream/utilities/transactions/lock/range/range_tree/lib/COPYING.APACHEv2",
                "upstream/utilities/transactions/lock/range/range_tree/lib/COPYING.GPLv2",

                "upstream/CODE_OF_CONDUCT.md",
                "upstream/CONTRIBUTING.md",
                "upstream/DEFAULT_OPTIONS_HISTORY.md",
                "upstream/DUMP_FORMAT.md",
                "upstream/HISTORY.md",
                "upstream/INSTALL.md",
                "upstream/LANGUAGE-BINDINGS.md",
                "upstream/PLUGINS.md",
                "upstream/README.md",
                "upstream/ROCKSDB_LITE.md",
                "upstream/USERS.md",
                "upstream/WINDOWS_PORT.md",
                "upstream/docs/CONTRIBUTING.md",
                "upstream/docs/README.md",
                "upstream/docs/TEMPLATE-INFORMATION.md",
                "upstream/docs/_docs/faq.md",
                "upstream/docs/_docs/getting-started.md",
                "upstream/docs/_top-level/support.md",
                "upstream/docs/doc-type-examples/2016-04-07-blog-post-example.md",
                "upstream/docs/doc-type-examples/docs-hello-world.md",
                "upstream/docs/doc-type-examples/top-level-example.md",
                "upstream/docs/index.md",
                "upstream/examples/README.md",
                "upstream/fuzz/README.md",
                "upstream/issue_template.md",
                "upstream/java/HISTORY-JAVA.md",
                "upstream/java/RELEASE.md",
                "upstream/java/jmh/README.md",
                "upstream/java/understanding_options.md",
                "upstream/plugin/README.md",
                "upstream/tools/advisor/README.md",
                "upstream/tools/rdb/API.md",
                "upstream/tools/rdb/README.md",
                "upstream/utilities/env_librados.md",
            ],
            sources: [
                "upstream/cache",
                "upstream/db",
                "upstream/env",
                "upstream/file",
                "upstream/include",
                "upstream/logging",
                "upstream/memory",
                "upstream/memtable",
                "upstream/monitoring",
                "upstream/options",
                "upstream/port",
                "upstream/table",
                "upstream/test_util",
                "upstream/trace_replay",
                "upstream/util",
                "upstream/utilities",

                // workaround for the cmake-configured build_version.cc.in
                "patches",
            ],
            publicHeadersPath: "public_headers",
            cxxSettings: [
                .headerSearchPath("upstream"),
                .headerSearchPath("upstream/include"),
                .define("ROCKSDB_PLATFORM_POSIX"),
                .define("ROCKSDB_LIB_IO_POSIX"),
                .define("NPERF_CONTEXT"),
                .define("NIOSTATS_CONTEXT"),
                .define("PORTABLE"),
                .define(osEnvRocks),
            ]),
        // .target(
        //     name: "RocksDB",
        //     dependencies: ["librocksdb"],
        //     path: "Sources/RocksDB"),
        .binaryTarget(
            name: "RocksDB",
            url: "https://github.com/TapeIt/rocksdb.swift/releases/download/v6.29.5/RocksDB.zip",
            checksum: "aeb246ad26709aebfe08a824d27ffd4e6293b9aa64290eae646de2147032b37e"),
        .testTarget(
            name: "RocksDBTests",
            dependencies: ["RocksDB"]),
    ],
    cxxLanguageStandard: .cxx11
)
