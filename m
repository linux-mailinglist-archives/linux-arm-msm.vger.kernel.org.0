Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE70640E78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 20:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiLBT3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 14:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbiLBT3x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 14:29:53 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE12EDD5C
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 11:29:51 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id cg5so6574478qtb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 11:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfCgpN7sNE6Fh/mo55gbbIcr1HwVHwBda/npHZn8VeY=;
        b=S5sN6EBvUcWKoGs6TFj6D++SEwxLg5JbP+mBHc0rTqvQlBvf6gUTzW41GeSYFQTplN
         b82IFl/tMUl9zSEZMl7bpCLJPHaj0Vzsv+JCBFdUYFWPMiMDl1sb+6jVGra4J75WIvMi
         r0jxY12K4GuetpdtvgGJOUtmasE3p4VrVz/K5dYvdVDFDv/V7IEPnQtjFy/Ihu9n5uE1
         2ZTl1sXy6mlZmfITatP97MPbGg6HRmiG6wWJCc1TYasJT0gKyFN3CKD7Oh/vGo8xRaA5
         cO36F/r8j2ZH3lY7wdwMXVxaIx1Gwcn6PFjzVUM2BvXDn623kYcT63gXnINdrePTwcOo
         2z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfCgpN7sNE6Fh/mo55gbbIcr1HwVHwBda/npHZn8VeY=;
        b=WeAjAsjxTNPluROb7+zMoNb34HK6EpB/hHqlTM1pzVjwQ3GSH1ua6AX9cK4wA54xeh
         ZGdOw2kOo2WGK19ygWmRiF8F4cNqpumNz0rKaAqkYOHVwOcKS/zO8GP6ksMsGhH0WoPR
         3/ecJExfPx1Q4coDDBZmb+l56vGGEgR0mHzs08FVkIVdIkiSIJp7ErEtfqtKnHIVArps
         hT5nQSKA+OtmPgfRF8OOM58cwUOrkEd0w4qRbfV0g1IPUblgUqOnTAmxMAVCZ6+RghUN
         9WuxK6Pv1IpX3c+TymTxrAGflNMenchQVo/0JwKJpDZ37q/V2wHQT3rN3Q2uZqJq0CUM
         aMJA==
X-Gm-Message-State: ANoB5pmP84tPEWkP/Dk1GnfMQkGTtAoQ2Hoo6l6Tof+sDhSWq91SpY4O
        HTTJ0EaIesoJFFbLIzgU8n922w==
X-Google-Smtp-Source: AA0mqf504IdAU2QffItpthueL6rO2ZHKSOMxdINNbhoCQyDdnMeL2sX6TftbX9LfcMP1Vb/BNhH19Q==
X-Received: by 2002:a05:620a:1238:b0:6fc:275:c20f with SMTP id v24-20020a05620a123800b006fc0275c20fmr49769844qkj.641.1670009390390;
        Fri, 02 Dec 2022 11:29:50 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id i11-20020a05620a248b00b006ee949b8051sm6369431qkn.51.2022.12.02.11.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 11:29:50 -0800 (PST)
Message-ID: <0d14b5eb-e087-e18d-cef5-035270e499b1@linaro.org>
Date:   Fri, 2 Dec 2022 13:29:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/8] clk: qcom: rpmh: rename VRM clock data
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
 <20221202185843.721673-8-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221202185843.721673-8-dmitry.baryshkov@linaro.org>
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

On 12/2/22 12:58 PM, Dmitry Baryshkov wrote:
> RPMH VRM clocks are frequently shared between several platfoms. It makes

s/platfoms/platforms/

> little sense to encode the SoC name into the clock name, if the same
> clock is used for other SoCs.
> 
> Rework the VRM clock defintions to add resource-specific suffix. Keep the

s/defintions/definitions/

> userspace-visible clock name, but encode the part of cmd resource and
> the divider into the variable name. This also make it obvious which
> variant is used, making the code less error-prone.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 258 ++++++++++++++++++------------------
>   1 file changed, 129 insertions(+), 129 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 439cace44bd1..b543939de1c8 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -115,8 +115,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
> +#define DEFINE_CLK_RPMH_VRM(_platform, _name, _suffix, _res_name, _div)	\
> +	__DEFINE_CLK_RPMH(_platform, _name, _name##_suffix, _res_name,	\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
>   #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> @@ -345,28 +345,28 @@ DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
>   DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
>   DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, _a2, "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, _a2, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, _a2, "lnbclka3", 2);
>   
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, _a4, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, _a4,  "lnbclka2", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, _g4, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, _g4, "lnbclkg3", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, _a, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, _a, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, _a, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, _a, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, _a, "rfclka5", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, _d, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, _d, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, _d, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, _d, "rfclkd4", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, _div2, "divclka1", 2);
>   
>   DEFINE_CLK_RPMH_BCM(ce, "CE0");
>   DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> @@ -377,16 +377,16 @@ DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
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
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
> @@ -399,14 +399,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   static struct clk_hw *sdm670_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
> @@ -419,10 +419,10 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
>   	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
> @@ -435,16 +435,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>   static struct clk_hw *sm8150_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
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
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -455,14 +455,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>   static struct clk_hw *sc7180_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
> @@ -474,16 +474,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>   static struct clk_hw *sc8180x_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
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
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
> +	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3_d.hw,
> +	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_d_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -494,16 +494,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>   static struct clk_hw *sm8250_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
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
> +	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -514,20 +514,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   static struct clk_hw *sm8350_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
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
> +	[RPMH_DIV_CLK1]		= &sm8350_div_clk1_div2.hw,
> +	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
> +	[RPMH_RF_CLK5]		= &sm8350_rf_clk5_a.hw,
> +	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
> @@ -541,8 +541,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_a2_ao.hw,
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> @@ -556,18 +556,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>   static struct clk_hw *sm8450_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
>   	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
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
> +	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2_a4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_a4_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
> @@ -579,14 +579,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>   static struct clk_hw *sc7280_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
>   	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> +	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]      = &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]      = &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]      = &sm8350_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
> @@ -600,10 +600,10 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>   static struct clk_hw *sm6350_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
>   	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2_g4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_g4_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3_g4.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_g4_ao.hw,
>   	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
>   	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
>   };
> @@ -616,16 +616,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
>   	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
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
> +	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_RF_CLK1]          = &sdm845_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]          = &sdm845_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]          = &sdm845_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]          = &sm8350_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>   	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>   };

