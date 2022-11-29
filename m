Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CD763C0F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiK2NYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbiK2NYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:24:46 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910AA627CD
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:24:45 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id a19so1169594ljk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02AcD2o7bYPQliVsipDWkKp9n6JbsaznzzWC3Wh96dI=;
        b=r7GzyjxtkQE1T18NayqfcvgvBAESipIZLev5bzpJRU6+bTSbEhq8idvSt68qLylzHF
         gT1hgzAz9edwFiNXjQz8Y3LnP0IODYwwgxXvR3iWrIkY7bIihfNjE2uz/FMJ14caB6JZ
         MPWt3xYr0IPoX5emEXPLbTKJtmR5NHWgWxphCVeeo0IrYgRbrRPkUbOX9VyzYcJgt6Po
         Uc5ZWrhF2aXJ6hCx8qCZEaXH/bcf+VU1tS+53OeJpqVyXKZECUh2LRTz18XlnU/pMJ0s
         9G84UOPn8TJ2NRoypnB6Mjgy+dbjfjNfoWYvnC4dURNkN/EYIlNXYQOQanwU5Y6C0hST
         PRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02AcD2o7bYPQliVsipDWkKp9n6JbsaznzzWC3Wh96dI=;
        b=VBYP2munsf1llOaxBT71o7eNBPwndZyRYRrV7yOerhBWlf7tZpr1yz4rOi55LEvLrf
         iN33YCXzNJHSzh+7XFonTyuHshHuIVEZh7od1jwiOK7I/44NTyQ9KvljWkf9yJ9zXUE1
         B1vY7Hu3lGjb9tvBF9YZmiwEwG6nOR9rt0MjgDr8AfmdHVyytgaxGB9s5LplYQyfQhB2
         l59L8dxW5xhzf8mNynUMd26JXIM61l4bYXcJFjFoq7HK8QB3w51p/q3wZXLQIUD8svR5
         W5dFxYIstiBhIX+L9wHSLUqihf2+SCILY4eN+oGExrzkBIFVfo0o5zP0bYqsu6NnYFpy
         dCkw==
X-Gm-Message-State: ANoB5pl1sXxkNKv5NS9nprko+DfynPOZeMn3dwOL1iBdr4F6Okjw/uMi
        Ds1luHa3y+T3HEDdPLAB4PW/Tg==
X-Google-Smtp-Source: AA0mqf4W+ceWDNlrc10zLFcPiHAh8IdLAC7Z+R9L3KExRB5xB6AH0pSt3iuSJ9c9UyRum7bhr2wn4Q==
X-Received: by 2002:ac2:518c:0:b0:4a2:4560:61e7 with SMTP id u12-20020ac2518c000000b004a2456061e7mr18471675lfi.170.1669728283958;
        Tue, 29 Nov 2022 05:24:43 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id n3-20020ac242c3000000b004ab98cd5644sm2186449lfl.182.2022.11.29.05.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:24:43 -0800 (PST)
Message-ID: <ca854c30-eb05-2651-622c-053ac1a24a0e@linaro.org>
Date:   Tue, 29 Nov 2022 14:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: reuse common duplicate clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129101025.960110-3-dmitry.baryshkov@linaro.org>
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



On 29.11.2022 11:10, Dmitry Baryshkov wrote:
> After the grouping it is obvious that some of the clock definitions are
> pure duplicates. Rename them to use a single common name for the clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index f13c9bd610d0..c4852bbd00bf 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -350,9 +350,7 @@ DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
>  DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
>  DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
>  DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
>  
> -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
>  DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
>  DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
>  
> @@ -362,7 +360,6 @@ DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
>  DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
>  DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
>  
> @@ -370,14 +367,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>  
>  DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
>  
>  DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
>  DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
>  DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> @@ -427,12 +421,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>  static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
>  	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdx55_ipa.hw,
> +	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -549,8 +543,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>  static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sc8280xp_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sc8280xp_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
>  	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
>  	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
>  	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> @@ -624,8 +618,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>  static struct clk_hw *sdx65_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
>  	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
>  	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
