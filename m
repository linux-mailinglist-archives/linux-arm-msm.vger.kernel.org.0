Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9955563D6C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiK3NbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbiK3Nal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:30:41 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADEB6F0D8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:30:18 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id l8so20837690ljh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w33RQGShxo98r0L5t0LjSqJKEdAYqMmYJ1my5uiuF3s=;
        b=Igpb5g4UN4NLVp1nDYI1t1EcYSesC4QqBilVfRZtu+DO3R4x47SnBM2r8EP4fA5p3/
         6VP1Lk+bVtEx5Fu4kTj2hGg6IXRWXl4ocJWe3Llu20mUhXHiqkz9EUxVjmAKK2s6Wv5Z
         KRTkhQ7VlQHGrgmstMcy84z+q3YO1BjSkYmrB6iqOV9XpkRUekcw55vcMnEFnGV7HhIz
         RNNJY43oBzXJrhDvIB9zb2axHSGevjP8BV0NBUlhbDg/TSV2ZGVBPlppEpboFEuvCa4M
         aSXX/0pM5NwC33CDUr9Ga5sQuj4r8OUQ3Eqy2I0SDSlAaJRRSLqLeWlZPuihsAKmXJ12
         HEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w33RQGShxo98r0L5t0LjSqJKEdAYqMmYJ1my5uiuF3s=;
        b=N8Ikq9Bjhb2QSC/lZtgCyBgIf2QMcCfpFekkz+kuAceVBlWBHE7g+ORqxuJmmT5HOU
         QlFO5w2p07mcRN7dvqh06Msp67RjBFU9ryAlp1LmuNasmyxMynEstDqfD84ePJxBvb6Y
         MlyXdQWenhuBGNBeirs7nkeSHK48iyz1wpt2pfS7h2M3qWTDaRaLfc27nrE23uiZnPVD
         NyHHiMeQJNWm+czP9r6F0OnRC9eTjqLOmbLiJYhJXb0mLXKI99NcBP/GisMkMHSgC5Ua
         0dP8ZtryYz7wmRt+pyHwpvrmlfoXGpY97/cFmdH5s/KYi4Ngh9lNeiuPNm8CCYB3yo6q
         jleQ==
X-Gm-Message-State: ANoB5pk0unIHmU0jpMBcL+1Q4IxB8SVio3rnUPMEFPUiPqJkHYnqpGni
        ToUhD2woTg/mAe1V8axZJVpQIQ==
X-Google-Smtp-Source: AA0mqf6GfbPHTQER2WV9lju6h60pCG+57+tH04xqJO3Wd7TKz5eXN3761oEOx1Yd5BRzyo3UDzaEkg==
X-Received: by 2002:a2e:b0d3:0:b0:279:cc65:b7e7 with SMTP id g19-20020a2eb0d3000000b00279cc65b7e7mr312512ljl.175.1669815017214;
        Wed, 30 Nov 2022 05:30:17 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651c130500b0027740a1b854sm135878lja.52.2022.11.30.05.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:30:16 -0800 (PST)
Message-ID: <c10c2550-05ed-4a1a-5274-c94cecda0b4b@linaro.org>
Date:   Wed, 30 Nov 2022 14:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 6/8] clk: qcom: rpmh: rename VRM clock data
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
 <20221130131001.20912-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130131001.20912-7-dmitry.baryshkov@linaro.org>
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
> RPMH VRM clocks are frequently shared between several platfoms. It makes
> little sense to encode the SoC name into the clock name, if the same
> clock is used for other SoCs.
> 
> Rework the VRM clocks defintions to remove the SoC name. Keep the
> userspace-visible clock name, but encode the part of cmd resource and
> the divider into the variable name. This also make it obvious which
> variant is used, making the code less error-prone.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 258 ++++++++++++++++++------------------
>  1 file changed, 129 insertions(+), 129 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index bd6cb07b6154..dcac84614b06 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -115,8 +115,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
>  			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>  
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
> +#define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
> +	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_suffix, _res_name,	\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
>  #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> @@ -345,28 +345,28 @@ DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
>  DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
>  DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
>  
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
>  
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a4, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a4, "lnbclka2", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _g4, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _g4, "lnbclkg3", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a, "rfclka5", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, _d, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>  
>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> @@ -377,16 +377,16 @@ DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
> @@ -399,14 +399,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>  static struct clk_hw *sdm670_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
> @@ -419,10 +419,10 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>  static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
>  	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
> @@ -435,16 +435,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>  static struct clk_hw *sm8150_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -455,14 +455,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>  static struct clk_hw *sc7180_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
> @@ -474,16 +474,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>  static struct clk_hw *sc8180x_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -494,16 +494,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>  static struct clk_hw *sm8250_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -514,20 +514,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>  static struct clk_hw *sm8350_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
> -	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
> -	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1_div2.hw,
> +	[RPMH_DIV_CLK1_A]	= &clk_rpmh_div_clk1_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
> +	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a_ao.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
> @@ -541,8 +541,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>  static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a2_ao.hw,
>  	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> @@ -556,18 +556,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>  static struct clk_hw *sm8450_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a4_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
>  	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
> @@ -579,14 +579,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>  static struct clk_hw *sc7280_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
>  	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> +	[RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_a_ao.hw,
>  	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
> @@ -600,10 +600,10 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>  static struct clk_hw *sm6350_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
>  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_g4_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
>  	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
>  	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
>  };
> @@ -616,16 +616,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>  static struct clk_hw *sdx65_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
>  	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
> -	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> +	[RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_a_ao.hw,
>  	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>  	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>  };
