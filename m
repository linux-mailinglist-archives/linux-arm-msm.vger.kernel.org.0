Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A4F63C0F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiK2NYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiK2NYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:24:03 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3295C75D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:24:01 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n1so12229875ljg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnZECWhdzXwfCGv5Xj5TMHlq2M37RciAm/VXBpoWUwI=;
        b=foJoCBbMyQIUapPkXJ6UMJnBEJh23sVeopXqqs/JhyqkBr6Qx2C+iMElRqWsO4/3AK
         K75XL/xHZPDMbZjKZQkSFvbo3vZuC8cetyphtBxxQ2cmsUM9vJ5vD5S+9I7eW2ut5z66
         9Aw9zKrw4OwsIMTPI+jg6mK9iPBO7Yk1bV2pif+MxPDdYas6X8Vwnia+EWyz1GzhiHev
         cjtkPRdE1DlDJ84ym71SmrcZqXJktuCiZLo+MuKPc1lBz6INcpPXpCgJawV1JiGjzSbY
         20rXDX4sF9HSS7iHThbUTAjrYr5LNwZcfRNKgnuoN2JyJCvWJgNNd0e2xdddOi4sHxsn
         O9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnZECWhdzXwfCGv5Xj5TMHlq2M37RciAm/VXBpoWUwI=;
        b=CkM3SC1B4CS3Zu0xyf71QdJr4vxb0aYXM6aA1oRlK3EnVVAOSvzxRRMWBzFb/cE99x
         8ncAhdx2zb54kFMUfG5YXdrEXW6ZFDYwMblRBrYwc9DUlkX766qS6aFp5tdyrjjfvKNF
         tTHn7CVA1iv/v9mu1XufVzR0EvwORDLsjTWoozavIFil/btf+avHQnxpqV/2zT27I1Cn
         Eyb0j/n/E+W4jk+QYtsTVHJ0HKJ+bGMN96tIpGSQo7nHSUHzxVQJyBCn1Bt7/DVPXMny
         n8/HEIlCrxkxd0PhvpE2t2pU2k/FNnYtvJDAtHZTWViK0uhDTweqBI2ZjBHwiprxoFpQ
         3rLA==
X-Gm-Message-State: ANoB5pkdfYuStsHKGDsW6+vit9+KiO1Lg6/8DcFDzqZF2G5bFDpE2RJR
        jWAD6S+atZsQJExLCrPi7yIFtfuC2jNEFw==
X-Google-Smtp-Source: AA0mqf6t+tFgU8amZPMbxpkuRnuCMYyYfMeForoQYArQDj4teOLt1lwB8yEJWN8WHFlIPkv4D7NYBw==
X-Received: by 2002:a05:6512:3f29:b0:4b4:af05:4a8d with SMTP id y41-20020a0565123f2900b004b4af054a8dmr18260593lfa.415.1669728240093;
        Tue, 29 Nov 2022 05:24:00 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eba08000000b002776eb5b1ccsm1546978lja.4.2022.11.29.05.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:23:59 -0800 (PST)
Message-ID: <f1cd9f8e-6b8b-7192-a02a-febba350d026@linaro.org>
Date:   Tue, 29 Nov 2022 14:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/4] clk: qcom: rpmh: group clock definitions together
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
 <20221129101025.960110-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129101025.960110-2-dmitry.baryshkov@linaro.org>
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
> In preparations to the further changes, group all RPMH clock definitions
> to ease review.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 55 ++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1da45a6e2f29..f13c9bd610d0 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -342,19 +342,45 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>  };
>  
>  /* Resource name must match resource id present in cmd-db */
> +DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
>  DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
>  DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
>  DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +
> +DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> +
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> +
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
>  DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
>  DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> +
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
>  DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> +
> +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> +
>  DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> +DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> +DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
>  
>  static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -398,11 +424,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>  	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> -
>  static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -478,8 +499,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>  	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> -
>  static struct clk_hw *sm8250_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -500,12 +519,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>  	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> -
>  static struct clk_hw *sm8350_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -533,8 +546,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>  	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> -
>  static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -550,12 +561,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>  	.num_clks = ARRAY_SIZE(sc8280xp_rpmh_clocks),
>  };
>  
> -/* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> -
>  static struct clk_hw *sm8450_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> @@ -600,10 +605,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>  	.num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> -
>  static struct clk_hw *sm6350_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> @@ -620,8 +621,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>  	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -
>  static struct clk_hw *sdx65_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> @@ -644,8 +643,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>  	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
>  };
>  
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -
>  static struct clk_hw *qdu1000_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
>  	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
