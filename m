Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04872645B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiLGNtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiLGNs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:57 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CA063D3
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:50 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id k3so3587895qki.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI2Il+Fpy+2BzzL5gRUGbc//zps2256jfRclwubpINg=;
        b=O9D41HXLKa89XpkAAo6z+gAc+8F9n50Ym51bVFJ2SYbVG2BJP4v0VQrlryOS8zeUvV
         UcPZAPoTT9S9nBpZAfLi+QQE51F0IeP5gS2sdhRtM88oYerjek49iYbfbnpcjj/A3cYF
         SH/97cxzbyPqyeZJ4uKqIhQB7QtXDYJ2Zlb8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI2Il+Fpy+2BzzL5gRUGbc//zps2256jfRclwubpINg=;
        b=Y89jCHpvsYtK8Kv1G0eH1xFhJRWW+1lul+5KumGbGhvRma8FbSNZFERNsOw3ATdaDk
         GSFnB+IY9rn9H/8+IfJUTjUpw2QMm2iIVhN2AYCabOYvRmRYbLA+wiKYQ0GlzqNUhkT7
         2Ti01VcLK+h6fwrqLOnf49n5+xV1wQkLbUS3VZsN4BE/UZ84/ANGJ1KTmPnAxXXOPKL0
         Q/0Wg4cbvkALbZ0eAiNLQz7cLZj2hhZw0gWMklsYSeA/vHJPe2T5IKhMgxHyQmilPhIF
         bmAn7ZmjOUgf4YGfHwpPb9+LFjWwD7arSRGe0bfC7a3ZGKIs7a1JDECi4+xbnY5Q1aSQ
         eTWg==
X-Gm-Message-State: ANoB5pld/320fVjrf0b1AQRBTW1ZL7ehG7hWBTOwx5BU8yOra4IyGJgN
        WvWDGwUzErb50eLLZV1z7qPdLw==
X-Google-Smtp-Source: AA0mqf4y9IfVyReo/R/B4BzqvvtowVr4JPXenCgOIOKItSHUFe8Yr39czuikTSozApixewrY0+GtjQ==
X-Received: by 2002:a05:620a:22fa:b0:6fb:c38e:e5dd with SMTP id p26-20020a05620a22fa00b006fbc38ee5ddmr80084613qki.23.1670420929092;
        Wed, 07 Dec 2022 05:48:49 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ga23-20020a05622a591700b003a526675c07sm13675332qtb.52.2022.12.07.05.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:48 -0800 (PST)
Message-ID: <241e9b6e-b8f9-18ec-3496-4802fb630dbc@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 04/18] clk: qcom: smd-rpm: add missing ln_bb_clkN
 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-5-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/6/22 6:14 PM, Dmitry Baryshkov wrote:
> Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
> clocks. The driver already uses proper clock indices
> (RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.
> 
> Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
> Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Next time you could improve your description by saying what the
fix looks like.  E.g., "Some platforms include a 'ln_' prefix for
such clocks, some do not.  Add that prefix where it's missing
for consistency and clarity."  You could also mention that you
are moving a few of these definitions, to group them a certain
way.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 31ef6345ff01..a0bf58785921 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>   	.num_clks = ARRAY_SIZE(qcs404_clks),
>   };
>   
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> @@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
> @@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>   	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> -	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
>   	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   };
> @@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,

