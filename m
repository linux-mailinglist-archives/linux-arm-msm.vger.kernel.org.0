Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55E6663D69D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiK3NXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbiK3NXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:23:47 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4265850D41
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:23:46 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id r12so26977704lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fQM7R454VR8mK6L7ejpGxkH3sbzn6pRcjKoOvq/tm0=;
        b=QM2deq+FIzdz1eW4YyYOf6vGQO8V7cxvWiTN+W96TevsJz11XwRHCYH5PVyMpdlzTb
         jY6cTzBXtsOPCLDusVrc7L9fMaI1QqZ8epl4Ocpig0VX9DmifIfXHfgVDLTBBKte12PR
         czJlv+F8z4zFd7S3UNguVn53jZGt5Mr/clP+MHQNl7tZi4yQcr0Sd+867nDqjyZPDidd
         9NO2LPICc672iPeD8tMQwBrvJbPh+Kqyz4EnUwcuZ/rXrhZVbtt8fEyVdjsFqB3QnkwN
         fUizddlzjRy6y23kGrIJRu62fbPJdSSwmXc6MpVXmtyBsWmhzhnm1CG4cjPeA1GhzBnV
         lwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fQM7R454VR8mK6L7ejpGxkH3sbzn6pRcjKoOvq/tm0=;
        b=NI7SxbTayq58cM8LLM1/qZxi0MfzTxTaZHUeq2APBHMWeiZAdovtvgp3RrjqxVQHDG
         S+frGuc1miHrOYMnK2joOXe8VMSTH/ywOzcax//a0JcOeQjER/sQlbZtOxfrOv8iqf1l
         EMa8WKsgArOhXZAj4TIb3qwYNkqLEgguvq3eyO5UFfssl4cRhKcKnJC0kbaFgmxcPKnw
         pLHHK77G4rwN4et0xvEQw+/iAr/bn/lkad4Ibbg2B374s2YwIrHyuJNdhyWQGyYp36z/
         gNN3Ti/hWfbPuKQTLI7xGZk5Cg0ZZiTX5qX8zIQTzSJNZjkY905MdUdHr3fumfkGZ6ts
         Trfg==
X-Gm-Message-State: ANoB5plvc2C7Jsaa0lcQo6PyAwQx7QjWfrbQMr/+qaPbPO3BEgt7MUCi
        wMV4vH7dllq8Gz/Xz8OjqJIwbg==
X-Google-Smtp-Source: AA0mqf6kt+1kUIuOGCMxXGqwqUvftlwcXdzNIqEIeIjBml+lEe8qEQVvB0cSOimbUoblwLkshnEVjA==
X-Received: by 2002:a05:6512:25a8:b0:4aa:a6f8:f042 with SMTP id bf40-20020a05651225a800b004aaa6f8f042mr19360353lfb.405.1669814624235;
        Wed, 30 Nov 2022 05:23:44 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id h2-20020a2ea482000000b0027713ef5360sm130058lji.71.2022.11.30.05.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:23:43 -0800 (PST)
Message-ID: <a080a67c-6bc2-c99f-c5e3-7b06411a660e@linaro.org>
Date:   Wed, 30 Nov 2022 14:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/8] clk: qcom: rpmh: remove platform names from BCM
 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.11.2022 14:09, Dmitry Baryshkov wrote:
> There are no platform-specific parts in the BCM clocks, drop the
> platform name from the clock definitions, replacing it with clk_rpmh to
> have the common prefix.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 00c0c8f851bd..5044f9fa156d 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -119,8 +119,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
> -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> +	static struct clk_rpmh clk_rpmh_##_name = {			\
>  		.res_name = _res_name,					\
>  		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>  		.div = 1,						\
> @@ -368,11 +368,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
>  
>  DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> -DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> +DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> +DEFINE_CLK_RPMH_BCM(ce, "CE0");
> +DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> +DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  
>  static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -387,8 +387,8 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
>  	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
>  	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> @@ -407,8 +407,8 @@ static struct clk_hw *sdm670_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> @@ -423,8 +423,8 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -463,7 +463,7 @@ static struct clk_hw *sc7180_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> @@ -528,9 +528,9 @@ static struct clk_hw *sm8350_rpmh_clocks[] = {
>  	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
>  	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
>  	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> @@ -543,9 +543,9 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
>  	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
>  	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> @@ -568,7 +568,7 @@ static struct clk_hw *sm8450_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> @@ -587,9 +587,9 @@ static struct clk_hw *sc7280_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> @@ -626,8 +626,8 @@ static struct clk_hw *sdx65_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
