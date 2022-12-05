Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80799642E2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiLEREp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbiLEREn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:43 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFBA193FA
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:41 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id z1so5459602qkl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zj4ndqwoRfeEZyZsc+DaznMqak+VQui+SY8LRFvU64=;
        b=iU/KlW6rV0PWfowfNOi104INNFdPPQhg6M0vnwpbHq6uHXzjvjWnysOlp7ho3V0SK3
         H4E9wHEpcjzo/DGTbIDB3WBOZnWqtpY1+b2+jAONtqgI70NcQFWR56/v/63IT3DsiQmJ
         LL5y4OjXVPm1soTFGGgbbAHU9hngHZWSonUOKcQUsVBtRWmJuEDqs3DEthMBmhWA0yG5
         dcHXWFha3D31bZf+Qjmjb6HBgfLy+jPCBD9fVaZxKCPUliK7DwlX4OlmyDCpgaPZEGZn
         uHK6TAtYJNNGpA2N4xfyzqp4GlxfF/kxrUTlQ5SKNuDQdQxnQ6FpVhV4tVGhps1GZLGx
         8vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zj4ndqwoRfeEZyZsc+DaznMqak+VQui+SY8LRFvU64=;
        b=D8qFbbQuYS6snj6xpdQ9SsUQb2bMzhJaTyEGbXv6hgtMhDVkuIDkRrxWc0j83iglUo
         1AzMzngblv9kG+ivC/y3nGDvCZXeZHchHC/rrirdDQeSdpkWuHFy/qsoH0XyQmsX2gNn
         WUTf394nhvijbAj8tcX5JXB8gGI6RRIRyj89nv613574NzcJebOqgvMGTSjQkl0vMeV6
         J5p5hdty4cJh8xKdHnWfwfapOrYV7/AsDF28OI2FNKOEJjRQxFPKjDWxeP+eOaSl+iSn
         2MGcOlCRD+jorDJ/VSVJcMBybsudNXL12XyN8QB5B0Er/cK2B+mIKT9wTmkFtFtPZ4WN
         LcHg==
X-Gm-Message-State: ANoB5plc9wYVlBgNLF+N8ZD3oLpX2K29ghE+eCHyNrKahxhAfMuLUyEe
        Ii1BZSBeC9sj0The03jcP3vOVqQVbdAf8gQb
X-Google-Smtp-Source: AA0mqf7dUd+QgjAcEn38qbbFuPEszL4PtiI2HrDh3ym7KVF7KVq2POlHrws8xu6GZj1jDgjgcI3rZQ==
X-Received: by 2002:ae9:c011:0:b0:6fa:77c0:ea01 with SMTP id u17-20020ae9c011000000b006fa77c0ea01mr14443491qkk.537.1670259880965;
        Mon, 05 Dec 2022 09:04:40 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v15-20020a05620a440f00b006fc2b672950sm13387343qkp.37.2022.12.05.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:40 -0800 (PST)
Message-ID: <7d56df1b-eb80-9e56-705f-c2d639ac1792@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/16] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks
 to qcs404_ln_bb_*
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
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

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> Follow the usual practice and rename msm8992_ln_bb_* clocks to use
> qcs404_ln_bb_* prefix, since there is already a family of pin-controlled
> ln_bb_clk clocks defined for the latter platform. This is mostly a
> preparation step for the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I notice something below.  I might be misunderstanding the code,
but please explain anyway.

> ---
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

You define the above clock(s), and comment out the qcs404 version below,
but there are no changes to these clock reference in this patch.  Is
that a mistake?  Should the pin control clock changes go in a different
patch (like the next one)?

					-Alex

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

