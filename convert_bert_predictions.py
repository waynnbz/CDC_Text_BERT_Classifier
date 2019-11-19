label_name = {}
for line in open('../challenge_data/code_dict.csv'):
    parts = line.strip().split(',')
    if len(parts) == 0:
        continue
    label_name[parts[0]] = parts[1]

pred_names = []
for line in open('bert_data/test_runs/run1/test_results.tsv'):
    pred = [float(token) for token in line.split('\t')]
    mv = max(pred)
    label = -1
    for i, v in enumerate(pred):
        if v == mv:
            label = i
    assert label != -1 and str(label) in label_name, label
    name = label_name[str(label)]
    pred_names.append(name)

out = open('baseline_submission.csv', 'w')
ptr = 0
for line in open('../challenge_data/test.csv'):
    line = line.strip()
    if line == 'text,sex,age':
        out.write('text,sex,age,event\n')
    else:
        out.write(line + ',' + pred_names[ptr] + '\n')
        ptr += 1

assert ptr == len(pred_names)

out.close()