Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA2664275C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiLELTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiLELTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:19:17 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB3F18399
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:19:15 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id d14so10333704edj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mnhsBOwnX2v/AdHMVKMUXfrKuSiW5I9EVCmgG8cuEw=;
        b=O8i7pdbKxw+yrIdk5g3kFhXIXcTUjx9gALjUtvV8BsAetyr49hC+W++nF8GQu97C3z
         MjpWfGVIKP67tqk/o4DJQNMh6zFzehdsn2nBQ5tnwjuE9/LBRsvTPUv9K5UiD6Y2EfjK
         OVDETZnCIQtnNp0CRK1f78tvnGwZne/ZQmgRHQnzn7I76ME1AZkck3jQJlrbc2qSISFL
         ijQjhhksxuHFjR/wbjoQNlgLwRMvPog69kMcD+XsB174vPwDst/R595NoHz1pcJy0rIO
         Npo1ApgCeFYE9ZmuR9LBMbO2KSlfIshqk/kkYhy0nvxeX42lzuT5heqEyRXGZmriKG3B
         IF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6mnhsBOwnX2v/AdHMVKMUXfrKuSiW5I9EVCmgG8cuEw=;
        b=wErWADWCu6uC3Ou3p9ABRn4g9YPXrFUcu9h2FuV6G/z0cCDYxh5r5eJdNclL/SIXSe
         z3J6ymSQQVmaQssHUOMitjUbgRhCOEJdLm/ynfD26UjLBoyAytL65gAShYO7w2l5XQ1C
         3kpdUrFGFP4Ggr7SWfzwluIvkM3DSwx1I7l25B4jRYLzPSHh22cB7d3cc86pKqy2TSX4
         iSb36XcVuZvXg8X1KPs6iOjClRnWbAHqXQAl7BXi7Ie0+DzGTWKHtndCnrvLbvSu5mS3
         odOODt2N4jh9sJO5IiooclRKH2zi06vxMWPXtsph/F+SkPE0cvgjuviW532CFLVgoeCT
         Zgiw==
X-Gm-Message-State: ANoB5pnWsObVqbBItg1FuZSsRLr4qCp57Rl6Ti/8DhC5gi3yUsF9tAPf
        K8++KgyM2V8Sj4qSl9XHcuh7DDAlwsCfChsH8iw=
X-Google-Smtp-Source: AA0mqf4d45L9N/SBPF618tlosUUfu6AyI0qcjVEBPLyV3STtF8l/N+QOECrER8dVBQS1A1LrLFDFxA==
X-Received: by 2002:aa7:c759:0:b0:46a:b8e0:f73a with SMTP id c25-20020aa7c759000000b0046ab8e0f73amr41734723eds.425.1670239154170;
        Mon, 05 Dec 2022 03:19:14 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ds2-20020a0564021cc200b0045c47b2a800sm6072715edb.67.2022.12.05.03.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:19:12 -0800 (PST)
Message-ID: <1377e1c4-7485-afdf-b8bd-7fbabcdc1d55@linaro.org>
Date:   Mon, 5 Dec 2022 12:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 06/16] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks
 to qcs404_ln_bb_*
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> Follow the usual practice and rename msm8992_ln_bb_* clocks to use
> qcs404_ln_bb_* prefix, since there is already a family of pin-controlled
> ln_bb_clk clocks defined for the latter platform. This is mostly a
> preparation step for the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 6af0753454ea..3a526a231684 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -635,7 +635,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
>   };
>   
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
>   
>   DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
>   DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
> @@ -673,8 +674,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> -	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
> +	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>   	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>   	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
> @@ -733,8 +734,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> -	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
> +	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>   	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>   	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
> @@ -798,8 +799,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
>   	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
> -	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
> +	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>   	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> @@ -822,7 +823,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
>   };
>   
>   DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
>   
>   static struct clk_smd_rpm *qcs404_clks[] = {
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
> @@ -841,8 +841,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
> -	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
> +	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
>   	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
>   };
> @@ -1014,8 +1014,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
>   	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
>   	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
>   	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
> -	[RPM_SMD_RF_CLK3]		= &msm8992_ln_bb_clk,
> -	[RPM_SMD_RF_CLK3_A]		= &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
> +	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
>   	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
>   	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
