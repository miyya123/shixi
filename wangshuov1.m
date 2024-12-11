% 计算GF域内两个码字的码距
function dist = gf_distance(a, b)
    a_temp = de2bi(gf2num(a), 3);
    b_temp = de2bi(gf2num(b), 3);
    temp = a_temp + b_temp;
    temp = mod(temp, 2);
    dist = sum(temp);
end

% 计算GF域内每个码元与“0”码字的码距，并映射成实数
function distance = gf2num(gf_a)
    distance = -1;
    if (gf_a == gf(0, 3)) distance = 0; end
    if (gf_a == gf(1, 3)) distance = 1; end
    if (gf_a == gf(2, 3)) distance = 2; end
    if (gf_a == gf(3, 3)) distance = 3; end
    if (gf_a == gf(4, 3)) distance = 4; end
    if (gf_a == gf(5, 3)) distance = 5; end
    if (gf_a == gf(6, 3)) distance = 6; end
    if (gf_a == gf(7, 3)) distance = 7; end
end