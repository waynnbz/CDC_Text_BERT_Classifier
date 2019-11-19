datadir="../challenge_data/"
modeldir="./bert_data/"

python bert/run_classifier.py \
    --task_name=cola \
    --do_predict=true \
    --data_dir=${datadir} \
    --vocab_file=${modeldir}/bert_models/uncased_base/vocab.txt \
    --bert_config_file=${modeldir}/bert_models/uncased_base/bert_config.json \
    --init_checkpoint=${modeldir}/train_runs/run1/model.ckpt-14433 \
    --max_seq_length=44 \
    --output_dir=${modeldir}/test_runs/run1/ \
