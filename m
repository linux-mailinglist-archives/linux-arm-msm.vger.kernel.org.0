Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554AD63CAF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 23:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbiK2WH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 17:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiK2WH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 17:07:27 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EF26F349
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:26 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id h17so7315880ila.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzexLakNpquls7kWsuxvVbCtkfJ7G69Vhom8bc/ySNg=;
        b=ysvSp2dDXaZ5MgrnSksjZWLkC8IvHVnucCXIjGryoB8pmQ5OQkWstrgGxDW1SaWqfm
         o6mLpln798fcNTtjayxkG/Z10cEaQ8YR2lgTPA/KDHFjsakdWiY5t94cES7Hb2Hjda+R
         +aQ9UfgR1px5szIpq6Om6eV0vGYXGzvTlrf+cozIromx4sEeZ6yzWbBVU8janO7hYC9S
         l3zSP7ZHm5RKduIIEJT6Vmz7gYyx6AiXii4rOFuGPzrorwvrley59Fxi5Mpa27XuGUtS
         YF134GZOBCONcbjp/rxTLNZuaSZk8wlymSrOG5DIjmfH3id0LF0nHEplwi6xu4rvE+M9
         VcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzexLakNpquls7kWsuxvVbCtkfJ7G69Vhom8bc/ySNg=;
        b=W64YPQPcwJZHyXIDMsuhV8e72bGPnlIjH7TGOViSZGWikI5/EjX48qEHoddqaY9roV
         lg0s58E6GU4v8cb+0nsjz1OeU3v5wlsI3d6pNfZpsGIbUkr1zd4yuk7imqzC1AiQkmNH
         wziFUtN4so+2bF/zZCU6R1JMCbNvoHV18ApecFDc1L6zDtxWOoKG7XT4azG285pqeh0F
         Q20bHCO5LT/tyPO8vUssXhFCzZ2z4CPwpeREGvSU2RFHQHu587gawLd9EgCXkNhfSFpl
         kZUuJE4+tcaFBVRQ0zM3u2HKIrsmHT7cFl6Sl3vQZrMsir3z/X3AwGRHiAh67skErHCY
         Uj6Q==
X-Gm-Message-State: ANoB5pmhgQVvVoLhxBC01vu4n6BJbB1XUfAb5RC5zaMyEBIPTbZvlICn
        dWm+/lfneSYrV42x6i/SfSxxUQ==
X-Google-Smtp-Source: AA0mqf6etbRllRiARTec4snD4UG0v3858wcOV21VtPd7eSHon+1OqJltSe86Rwzp4RTq1BemyJUopw==
X-Received: by 2002:a92:d1c3:0:b0:302:b7fb:318f with SMTP id u3-20020a92d1c3000000b00302b7fb318fmr20164673ilg.130.1669759645736;
        Tue, 29 Nov 2022 14:07:25 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g12-20020a92cdac000000b003024a44cd95sm5042583ild.34.2022.11.29.14.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 14:07:25 -0800 (PST)
Message-ID: <9d4c660c-d3d8-dc8f-ad6e-c4dd1e9a74e3@linaro.org>
Date:   Tue, 29 Nov 2022 16:07:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] clk: qcom: rpmh: group clock definitions together
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
 <20221129101025.960110-2-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221129101025.960110-2-dmitry.baryshkov@linaro.org>
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
> In preparations to the further changes, group all RPMH clock definitions
> to ease review.

It isn't completely clear to me why these were grouped
in the way you did.  Do you happen to know what ARC and
VRM stand for?  BCM is bus clock manager, and RPMH might
be resource power manager--hardware.

Anyway, I can confirm you simply rearranged these definitions,
and that it still compiles, so...

Reviewed-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 55 ++++++++++++++++++-------------------
>   1 file changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1da45a6e2f29..f13c9bd610d0 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -342,19 +342,45 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>   };
>   
>   /* Resource name must match resource id present in cmd-db */
> +DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
>   DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
>   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
>   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +
> +DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> +
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> +
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
>   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
>   DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> +
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
>   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> +
> +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> +
>   DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> +DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> +DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
>   
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -398,11 +424,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> -
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -478,8 +499,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>   	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> -
>   static struct clk_hw *sm8250_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -500,12 +519,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> -
>   static struct clk_hw *sm8350_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -533,8 +546,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> -
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> @@ -550,12 +561,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>   	.num_clks = ARRAY_SIZE(sc8280xp_rpmh_clocks),
>   };
>   
> -/* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> -
>   static struct clk_hw *sm8450_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> @@ -600,10 +605,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>   	.num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> -
>   static struct clk_hw *sm6350_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> @@ -620,8 +621,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> @@ -644,8 +643,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>   	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
>   };
>   
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -
>   static struct clk_hw *qdu1000_rpmh_clocks[] = {
>   	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
>   	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,

