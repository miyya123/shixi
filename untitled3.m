% 主函数
function main()
    % 所有可能的信号
    all_possible_msgs = all_messages();
    all_possible_msgs_gf = gf(all_possible_msgs, 3); % 将所有信号映射到GF域
    all_encoded_msgs = rs_encode(all_possible_msgs_gf); % 对所有信号进行RS编码

    % 产生随机的5组信号
    random_msgs = floor(rand(5, 3) * 8);
    random_msgs_gf = gf(random_msgs, 3); % 将产生的5组信号映射到GF域
    encoded_msgs = rs_encode(random_msgs_gf); % 对5组信号进行编码

    % 产生噪声信号
    noise = [zeros(5, 5), floor(rand(5, 2) * 8)];
    noise_gf = gf(noise, 3);
    noisy_msgs = encoded_msgs + noise_gf; % 加噪

    % 对5组信号进行译码
    decoded_msgs = zeros(5, 3);
    for i = 1:5
        decoded_msgs(i, :) = rs_decode(noisy_msgs(i, :), all_encoded_msgs, all_possible_msgs);
    end
    disp('译码输出:');
    disp(decoded_msgs);

    % 计算译码正确率
    num_correct = count_correct(random_msgs, decoded_msgs);
    correct_rate = num_correct / 15;
    disp(['译码正确率: ', num2str(correct_rate)]);
end