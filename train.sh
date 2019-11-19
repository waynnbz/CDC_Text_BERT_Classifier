datadir="../challenge_data/"
modeldir="./bert_data/"

python ./src/preprocessing.py --data_dir ${datadir}

python ./bert/run_classifier.py \
    --task_name=cola \
    --do_train=true \
    --do_eval=false \
    --data_dir=${datadir} \
    --vocab_file=${modeldir}/bert_models/uncased_base/vocab.txt \
    --bert_config_file=${modeldir}/bert_models/uncased_base/bert_config.json \
    --init_checkpoint=${modeldir}/bert_models/uncased_base/bert_model.ckpt \
    --max_seq_length=44 \
    --train_batch_size=32 \
    --learning_rate=2e-5 \
    --num_train_epochs=3 \
    --output_dir=${modeldir}/train_runs/run1/
