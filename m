Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60BE63F80C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiLATU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiLATU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:20:58 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB54C23F6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 11:20:57 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id cg5so2140346qtb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 11:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X18oHOpn7IKX7MpMFFct1VWTp+hGJsvkhv9CZnjT28E=;
        b=r19CNIvNRJ7xYU5y/et/roEZZ9lyDZIPxoM6hjtt9KuwfnAoWnS7Ssngvxypz5xU64
         66/ZYCg6ySBHIx4z3TWc72iy136QcmgIfQpfz2RUKJpiMTQc1El+MT4yJ8hAcVx2Q9nc
         rdzq8ZLOPhcVuXmER3pvH+D36myj7fxdm+1JB5Pa++8pzVqkr8hHCPxaaaM3EfI86fwv
         Jw0TblbwFZMLq9sMtKC8JjTLtaNSAFQdjHYLGTd+RO733MFVjhMuqemhfVxnRdyPK70/
         TqMKdQhqC9jsgx+z2sT45VWD+DvZaVnQUqUb4xpVK9FSHBJLGKda6bv/6Mu8oAKcGncJ
         ai/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X18oHOpn7IKX7MpMFFct1VWTp+hGJsvkhv9CZnjT28E=;
        b=GPn+E6dPk39yrcxIGtfnmIETu8amedNENQUES6O+ixFcqip5xZJfhFlzYyJNeSZkhr
         a+LAW4B+RW/SPzPpbIH2O9sdFiLGkgNHBkH91t7yHfwua1HriJuhNNlrI4BuzhTi4FEI
         1BV5DKy/TKeJGvTq1yBGk9ugSBB6Fuw0W9xXy06IUsuU6Wx8CRUB0O73diZ+GJZSrzuq
         TjzXbrbQ2605PftSFaba3l1FGKPRQ2eyK3OTGYlOjjUzTKmP+5DLAGrMXIwHKgsA5nfa
         tDXfxjaMqRKnIXM5sEHPAkR1CjcAROfGoIOhIzb8UO18NirzzTjGzQ2JMDnwPMOMsgxL
         e7qg==
X-Gm-Message-State: ANoB5pliySDmafiMshFiIpNnS1WShVuC6vTeBx7I1wIh8nbjGI1sA9Op
        z+2C4z93ejWFlnzbZUWJjIOG4fRsiI45ig==
X-Google-Smtp-Source: AA0mqf7DDMwKORmmsnpM9LkzyDNWbVac7M77D67QB4H/s2vTHLluptqpLan/8PI0AsMWX5LbUDBVlg==
X-Received: by 2002:ac8:7318:0:b0:3a6:8f14:41a7 with SMTP id x24-20020ac87318000000b003a68f1441a7mr6877945qto.558.1669922456368;
        Thu, 01 Dec 2022 11:20:56 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id h1-20020a05620a400100b006fc2e2198easm4075455qko.95.2022.12.01.11.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 11:20:55 -0800 (PST)
Message-ID: <ed030c3f-edcc-0f53-cd3e-9f4f3de585d0@linaro.org>
Date:   Thu, 1 Dec 2022 13:20:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/8] clk: qcom: rpmh: remove platform names from BCM
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
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
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

On 11/30/22 7:09 AM, Dmitry Baryshkov wrote:
> There are no platform-specific parts in the BCM clocks, drop the
> platform name from the clock definitions, replacing it with clk_rpmh to
> have the common prefix.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.  I did not realize this was the case, and it's
good to make this fact explicit.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
>   1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 00c0c8f851bd..5044f9fa156d 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -119,8 +119,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
> -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> +	static struct clk_rpmh clk_rpmh_##_name = {			\
>   		.res_name = _res_name,					\
>   		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>   		.div = 1,						\
> @@ -368,11 +368,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
>   
>   DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
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
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -387,8 +387,8 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
>   	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
>   	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
>   	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> @@ -407,8 +407,8 @@ static struct clk_hw *sdm670_rpmh_clocks[] = {
>   	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>   	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>   	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> @@ -423,8 +423,8 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
>   	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
>   	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
>   	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -463,7 +463,7 @@ static struct clk_hw *sc7180_rpmh_clocks[] = {
>   	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>   	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>   	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> @@ -528,9 +528,9 @@ static struct clk_hw *sm8350_rpmh_clocks[] = {
>   	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
>   	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
>   	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> @@ -543,9 +543,9 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
>   	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
>   	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> @@ -568,7 +568,7 @@ static struct clk_hw *sm8450_rpmh_clocks[] = {
>   	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
>   	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
>   	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> @@ -587,9 +587,9 @@ static struct clk_hw *sc7280_rpmh_clocks[] = {
>   	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
>   	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
>   	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> @@ -626,8 +626,8 @@ static struct clk_hw *sdx65_rpmh_clocks[] = {
>   	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
>   	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
>   	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdx65 = {

