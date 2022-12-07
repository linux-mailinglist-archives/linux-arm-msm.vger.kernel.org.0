Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEBA645B4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiLGNtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiLGNs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:57 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915035215C
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:52 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id a16so995693qtw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KV6SIl8FNKe8NV968qlW2BnRuuMmjY1sZjZJ/6B2/fI=;
        b=bEXmQZI3JuLY+v0JW+ZESTWFPb0ojtr0uKxOVbUHldzemetEwgPs8kQMlo9AmWDLxn
         DKfzLQMcbfm//WYhO6xCpxRwgO5h016dLo4DogbNLJnNfDsx3ewKPfCZRjH5Bb7TxYn8
         iIMGGkbmMyfs5edPQ7upcQQ9wA9blBtNq4BBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV6SIl8FNKe8NV968qlW2BnRuuMmjY1sZjZJ/6B2/fI=;
        b=YLPwge/ysB9OgTDyYZFF9Et8drlE98hcQMf+s2jYcIY0t0Olqeaz+YSBICyJJj1HXf
         Hd8Eg+PwQjdHwRRdOKOcUc4hSCf6CTpEl9ADPmQU/hjdYdIKcEGXeq9NM3cnRYIDwmA8
         anoUz4ndPZQAyV9YbPns1E/bUvZns25tm6S3rNsx4HNosXcSzHJ39+4R62fkPyfyjLC0
         4WNDSNPKY25+T/LYbeEmcKu0PEcvei//pUwK2081+jacqC/7rBkZBn8+WN4kHDhrWc2d
         QzD5msSvhLflPNqK+suY8W1fVU1Je6Njiv+OqpNbkXAw7nx7O38D5Xhnfhu+ENZCIdxV
         4ziw==
X-Gm-Message-State: ANoB5plVU/YYL3UyckrUrHbNWD9REWguEJAt6e9VwCpq+k5PPSCQHWO0
        PuTrx0UgSFBRJpBAvhzBeugevA==
X-Google-Smtp-Source: AA0mqf7dRUhZIvfJ7fEnZys7Z5LQZE+VPpWzg5u2ortOJWD7vIBJgZXZgQMF14pfZWmnPOdZcvem0A==
X-Received: by 2002:a05:622a:602f:b0:3a7:e66a:28f8 with SMTP id he47-20020a05622a602f00b003a7e66a28f8mr9367458qtb.563.1670420931702;
        Wed, 07 Dec 2022 05:48:51 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id t21-20020ac87395000000b003a7eb5baf3csm3151665qtp.69.2022.12.07.05.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:51 -0800 (PST)
Message-ID: <c17a8d36-5499-8250-fe5b-dc90ec03a848@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/18] clk: qcom: smd-rpm: rename msm8992_ln_bb_*
 clocks to qcs404_ln_bb_*
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
 <20221207001503.93790-7-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-7-dmitry.baryshkov@linaro.org>
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
> For each of XO_BUFFER_PINCTRL clocks there is a corresponding XO_BUFFER clock

For each XO_BUFFER_PINCTRL clock...

> with the similar name (e.g. msm8998_ln_bb_clk3_pin vs
> msm8998_ln_bb_clk3). For qcs404_ln_bb_clk_pin there is no
> qcs404_ln_bb_clk, since the msm8992_ln_bb_clk was used instead (even for
> qcs404 platform).
> Follow the usual practice and rename msm8992_ln_bb_clk clocks to
> qcs404_ln_bb_clk (and rename active-only clock in a similar way).
> 
> This is a preparation step for the next patch, which will merge
> XO_BUFFER and XO_BUFFER_PINCTRL definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 7dffc30ddb61..add92ecd513d 100644
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

