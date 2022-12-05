Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3410642751
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiLELPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiLELPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:15:54 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3DF17880
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:15:53 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id vv4so26872546ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfVbf1HnBjRJeSc49fBim3XOYpwf1tSZHQixBJZFBWw=;
        b=fVq/nBrwM2cf+JJQAbH+Rv2uBeYHbwOcz+DdyP9xQLwqJrap+OhR2wp2eIIFZxCkde
         dqocq9G17+El7ect090M6o5Q00U+ALUO6byGQc4vw9SnB0XALpIchIe7e9kSVqSv/+Vd
         JYxAwL1tMY5sPeMGlxgTGRZtNUrweUYTlMdhqRJ2HyQR4D8gu7fgnKmMaXNwDgSiRtDz
         /xFr5townOvGd9Y4w5hecdQrhOkHl1q8TE4DjECO6nUdQvqJyFEFSZWKKiaJPujFVUyz
         Mzzb3DHCqnqBqJIL9xjlTpFYy/aaEZJm+EsJOWQIn170L4bamiE+If07wdDO91Nb99TF
         YmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EfVbf1HnBjRJeSc49fBim3XOYpwf1tSZHQixBJZFBWw=;
        b=Bq/N3r8ifoZ0i6/wf318izSSL4W/cCZHfvnJyx/pbwsWPys/fGM37QI4PQQED174rO
         q1eEXTCeICvQn9kdKUAPmhj5lGpolvJ+6Xf6RoKWNZXfaA0DP9fXIYZx8g1Mw0rfemNA
         iOXdeeeJFO42t6fABQIWp+/4IAE37tJpkNpFDaNiR6q4bB0DrEWr4iGMrac8KGREbXIG
         JPNQgzeJk4eTRLST3EN9IiuyDWmeE4uYAFfjyKu7E7ty0W9l96uV1tNucuhLpsSBi5Dh
         bJJRUdhBfuuJnX4fOkkdjUUylJSxu+i9QTL6n1ck7CNpmQtfVE0lEppT3Info8UbHiLq
         DdSg==
X-Gm-Message-State: ANoB5pkVAPWuASsAYeffUF9uk74db8u4UORBteENBHVgdMOlB4AJKoWA
        MwZfGCeLzR+BdRRzogHEvqLFhg==
X-Google-Smtp-Source: AA0mqf5PNWKRF2vdUdMz6ZbvCckIelXy7YbS0og6UYGuiL5Lo5MpIqxiY0cSB+QIacjPm8JivlQSuw==
X-Received: by 2002:a17:906:745:b0:7bd:f50f:a51c with SMTP id z5-20020a170906074500b007bdf50fa51cmr35600590ejb.285.1670238951777;
        Mon, 05 Dec 2022 03:15:51 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906309800b0078c1e174e11sm6125598ejv.136.2022.12.05.03.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:15:50 -0800 (PST)
Message-ID: <2374071d-b2e3-e77d-4d06-70b78bcb6300@linaro.org>
Date:   Mon, 5 Dec 2022 12:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
> 
> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 877ffda42ee9..26c4738eaacf 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1166,7 +1166,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
>   		   QCOM_SMD_RPM_MEM_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
> @@ -1201,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
> -	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
> +	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
> +	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
>   	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
>   	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
>   	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
>   	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
> -	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
> -	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
>   	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
>   	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
>   };
