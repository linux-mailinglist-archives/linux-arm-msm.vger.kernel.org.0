Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8541A657753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiL1Nji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbiL1NjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:39:11 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C85F11836
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:39:10 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id g14so16542575ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcKen0J7JLXc8AJssAYDPcyCoxuXJNE686k3Qe7FeVM=;
        b=slQkbgGGpcjdGUEeMWBdjPKKWnNHoUqsdo0/qAqeQtPiHRaOykPcudohMddes3KwAS
         aJ0rc0b+NtyFN4wxnpfF239wMlC2S9Sg+i900cbwdtoQl1FE7DwiAefpX3YW4/ff8O3F
         VnZ/QHsRxLhZ0z+xWb2YaGsIqrC4Cdw/bm7tzIolDT6sSnVaa4tdxqOGzrrETv4/8YFd
         WH0AIYQrgDzoQNVcXJbND/93dgbBD2ku5hP/NI668hMqeKf5lipkuU0NOW7LZ0StLDi5
         J6fsmSsehkaedFuy7NqIV9Au0+T0o+rOWzZjZlTzn3nRVdjRqkxyfICkQWGvk+O1yqUH
         C4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcKen0J7JLXc8AJssAYDPcyCoxuXJNE686k3Qe7FeVM=;
        b=tcuYGsOUzp1tkS5ymsT+gQYQufn/MW1C2XejBJdwEmoMlYnpHYnR3lVvI3BsopIVNv
         z04EX27ZxT0veKJWcue/30Gflh7I5z1ztg69JrV8BiD6rQPbP+214kMkp92sdHvzGdxM
         AW6GLWdkyc7rTDLI4rAAiC3mIJCat4HzvudmFJ6tIUkYxV/8sEt7M+wtpWCrS8igzG2M
         z6reJLMLveqW8h/QFWNxlZuE0KJXZ84lv0feavKUPXaD7ugWqKtxFlGjJtjjpsG/BtjF
         dGdzdU4WRqP2wJ/hR20KbgcaIEfY6sZq6izFcqjfvGRs01Hg0C6/KQNmw5S/yDTOX7Kq
         Oinw==
X-Gm-Message-State: AFqh2kqTSiGuaT6DbCuK4fVp2dwfsERIlh9IIZil22+Dk5o/SUJHs+PA
        PcdW8G06/sMxkd+V+R3U+hKYpg==
X-Google-Smtp-Source: AMrXdXu5eH1aTciuLX4InQBydZvwF7QKqLvdZ5VmOc5AbW085q0to0JxhXzlQ7xFwMlPPTnURu1/1g==
X-Received: by 2002:a2e:a583:0:b0:27f:b941:53ba with SMTP id m3-20020a2ea583000000b0027fb94153bamr4969680ljp.23.1672234748870;
        Wed, 28 Dec 2022 05:39:08 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id bd8-20020a05651c168800b0027781448499sm1976368ljb.85.2022.12.28.05.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:39:08 -0800 (PST)
Message-ID: <d61e8bc5-89a6-a8b1-167a-aff865b88172@linaro.org>
Date:   Wed, 28 Dec 2022 14:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 10/16] clk: qcom: gcc-sc7180: get rid of test clock
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
 <20221228133243.3052132-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
>  drivers/clk/qcom/gcc-sc7180.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index 2d3980251e78..105c4762ca84 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -23,7 +23,6 @@
>  
>  enum {
>  	P_BI_TCXO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_EVEN,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL1_OUT_MAIN,
> @@ -162,21 +161,18 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0_ao[] = {
>  	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -184,7 +180,6 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL6_OUT_MAIN, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_1[] = {
> @@ -192,7 +187,6 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll6.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
> @@ -201,7 +195,6 @@ static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_GPLL1_OUT_MAIN, 4 },
>  	{ P_GPLL4_OUT_MAIN, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_2[] = {
> @@ -210,19 +203,16 @@ static const struct clk_parent_data gcc_parent_data_2[] = {
>  	{ .hw = &gpll1.clkr.hw },
>  	{ .hw = &gpll4.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
> @@ -230,7 +220,6 @@ static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_4[] = {
> @@ -238,7 +227,6 @@ static const struct clk_parent_data gcc_parent_data_4[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_5[] = {
> @@ -246,7 +234,6 @@ static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL7_OUT_MAIN, 3 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_5[] = {
> @@ -254,21 +241,18 @@ static const struct clk_parent_data gcc_parent_data_5[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll7.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_6[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
