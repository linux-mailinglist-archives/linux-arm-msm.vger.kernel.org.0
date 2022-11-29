Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3519C63CAF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 23:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236084AbiK2WHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 17:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiK2WH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 17:07:29 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD1C6F0E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:28 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id b2so11103496iof.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7EfxhaSZlXFaNSBEWmkVXSoVw2xt6PiZfBpxydKKNY=;
        b=NqokfSYbFdyoSOMWZREUA7De0RITUPyhwddWKrwtIzsg2GI9VrHaKqxIIVO63gNKl2
         CVPGi8TT8DTRHfMe5QKlUMvyXa3vb6HRcLF1C4V7oaG57fImVkBh9Gn2KHH731VbvRvg
         PVbdgTWPI677pNE+yoMIpkv1VHjc3wUX+R7qV+WHjIItYtP/+J76TbJSodPUfViyNuIM
         P8de53Pxg+AhQC7icLSrcSL0mbkKmmD6T0y4dt4l0JNlAOCcc5HDXq2gtVUvGDBpO22M
         QMTmidKzBHCIfnSOVHiy59LjSJnx1kcnUb+RsbZqYIbZuNTNIRzjBQcC+NOsotkLfP0J
         oSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7EfxhaSZlXFaNSBEWmkVXSoVw2xt6PiZfBpxydKKNY=;
        b=ndrUi+07K3+y/r2cesaAao3Dgpm0RZNDCplJoQuju0s00kJRUZ5s/gvRC9MicASPTN
         0OqdiDYeIpgmzw5V9/tBf453stw45+73JBeWHQYNThsYrIJ0cwKesdXR4SZZvF3bHjHz
         WYA+Ohaqc8y091foddSAO8FoCbKun5F2eSfioMmewcNzku9iPAL67nK3/gtRcohmPrJe
         nCR33BU7dU9bTJqpC3rwoDLvKHDXPzMgN7ZAfBf83q5d2MGMBtBzp834V3c/sUqWkpor
         Mr+4jayCmhvj1/6jhAeQ+PafkieYV8fuUefkAMuDV6gqECrxqcZrMy3To3g7RWTHpW7D
         96pg==
X-Gm-Message-State: ANoB5plofZ0in7jfWsjCXXwVzUaEZlpMYvPUirKKA/P4QKoA9vTc7/zg
        W0jBDVBTtab2WTqUlCe7ZVREmQ==
X-Google-Smtp-Source: AA0mqf7eFHQOAaH1L+z/SwsSqFNsKVpsk6Cp+TMjiD0an9jO3NQWTNct8hQzaaFzmM2m5e+Tv1QF6A==
X-Received: by 2002:a05:6602:2184:b0:6bd:4e36:f4d6 with SMTP id b4-20020a056602218400b006bd4e36f4d6mr18578816iob.137.1669759647920;
        Tue, 29 Nov 2022 14:07:27 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id o21-20020a0566022e1500b006bbfb3856d6sm3785822iow.5.2022.11.29.14.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 14:07:27 -0800 (PST)
Message-ID: <25a47edc-de8b-e217-6470-682603ee31d6@linaro.org>
Date:   Tue, 29 Nov 2022 16:07:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: reuse common duplicate clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-3-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221129101025.960110-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/29/22 4:10 AM, Dmitry Baryshkov wrote:
> After the grouping it is obvious that some of the clock definitions are
> pure duplicates. Rename them to use a single common name for the clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This looks good.  One observation below.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index f13c9bd610d0..c4852bbd00bf 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -350,9 +350,7 @@ DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
>   DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
>   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
>   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
>   
> -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
>   DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
>   DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
>   
> @@ -362,7 +360,6 @@ DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);

So the above one was never used?  (The sdm845 one was already
used instead.)

>   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
>   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
>   
> @@ -370,14 +367,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>   
>   DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
>   
>   DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
>   DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
>   DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> @@ -427,12 +421,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
>   	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdx55_ipa.hw,
> +	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -549,8 +543,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sc8280xp_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sc8280xp_ln_bb_clk3_ao.hw,
> +	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
>   	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
>   	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
>   	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> @@ -624,8 +618,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
>   	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
>   	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
>   	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,

