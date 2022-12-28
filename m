Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A80657758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbiL1NkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbiL1NkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:40:16 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C9E10046
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:40:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so14154161lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjMe6Hk/H2Z+K1dtGdU6nbkHYyFGj6bcb51DBN1VflM=;
        b=M3vPB9CdwYuXtgKNXQRjbAsG0lEy70pTh+vX4FbjEcghFZsJcDCJmjSS046HE1+VwX
         eU9j+EpKXISUqL0k2FqIrae53h+Gu/DvMKkLZysc6Ys7/0eI+ACYRLznDFvAZOhTJMbm
         zFaeAff1V7UVliRmV05WtEKrs/9qAca6W3tPjh84kfh/ttYNVUUcMTuHGyFPMXYJQH5U
         uo0pvq4a5iiFsDas0FUrFZh1q+dqnLT6O2DrBgKhqWgyM+zFihQqWIYepzKHePyRm0Wg
         8w2Lv4jRHk3ddw6dWAEs43oUqk6ePcn2J+C+Yxmuw1afm0YqoqDO1h/b0wSpvoWVA8kt
         kUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjMe6Hk/H2Z+K1dtGdU6nbkHYyFGj6bcb51DBN1VflM=;
        b=uBqwBUFQIhfVV4Cg9gYIUxL77/dYBRNj1qPJtlvBc7yHH/IK8pp7JwQK6jw1Qa0F9T
         luIG8bX67QMh2WGyfvm0LzPL6ufXlmGKezgxwYZiyOJlz+jJHtbUjj4YQhRz0/xeJobK
         jf02H+T0+w5v3e6StJxVZzUNKtDx2EZWvyWcS11d6RD0u173pQIh/GnutgZrqjd5D6kf
         sLsDW1CpBobR9Vib13tlZBGuuRgFpn0pOwdECvot0naNWoZ8atE9rNGaZP+B2qxv2OuK
         zB4912OVFdIvEm1Kzbb0Vtl8SGjZWW58+S8WCejAUoC4UkOHmbHTWoqNVULo22VQ+1wv
         lK+g==
X-Gm-Message-State: AFqh2kpdjlTb+1qZYM7Nkfm3Gc6tKk+dniA78Jebzusqke+Ga0C0H0iV
        8JqHyd23e5UvofzjPU03G/D7Mg==
X-Google-Smtp-Source: AMrXdXuPERkrGFZwhsg6I8UMZsV2rzNhEaZUCqle0+Gm6zAsa6KVaiGCaQfMcu0VLWzlO7RDDUlBIA==
X-Received: by 2002:ac2:5e6a:0:b0:4b0:f376:225a with SMTP id a10-20020ac25e6a000000b004b0f376225amr9210320lfr.63.1672234812527;
        Wed, 28 Dec 2022 05:40:12 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004cb1a9d1f88sm119116lff.185.2022.12.28.05.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:40:12 -0800 (PST)
Message-ID: <d335750f-1b96-b7b8-38cc-d24806e73537@linaro.org>
Date:   Wed, 28 Dec 2022 14:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/16] clk: qcom: gcc-sdx55: get rid of test clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sdx55.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> index 758b295e1bfa..d5e17122698c 100644
> --- a/drivers/clk/qcom/gcc-sdx55.c
> +++ b/drivers/clk/qcom/gcc-sdx55.c
> @@ -22,7 +22,6 @@
>  
>  enum {
>  	P_BI_TCXO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_EVEN,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL4_OUT_EVEN,
> @@ -137,21 +136,18 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_0[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct clk_parent_data gcc_parents_0_ao[] = {
>  	{ .fw_name = "bi_tcxo_ao" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
> @@ -160,7 +156,6 @@ static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_GPLL4_OUT_EVEN, 2 },
>  	{ P_GPLL5_OUT_MAIN, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_2[] = {
> @@ -169,7 +164,6 @@ static const struct clk_parent_data gcc_parents_2[] = {
>  	{ .hw = &gpll4_out_even.clkr.hw },
>  	{ .hw = &gpll5.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
> @@ -177,7 +171,6 @@ static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_3[] = {
> @@ -185,19 +178,16 @@ static const struct clk_parent_data gcc_parents_3[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_4[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_5[] = {
> @@ -205,7 +195,6 @@ static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL4_OUT_EVEN, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_5[] = {
> @@ -213,7 +202,6 @@ static const struct clk_parent_data gcc_parents_5[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll4_out_even.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct freq_tbl ftbl_gcc_blsp1_qup1_i2c_apps_clk_src[] = {
