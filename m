Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7D9467B4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 17:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352829AbhLCQ1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 11:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352767AbhLCQ1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 11:27:25 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9DDC061751
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 08:24:01 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so3918790otj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 08:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xACJuOXIrB8FTYoC3MHylDF07OdG/I2Q0C8TaQZfbw=;
        b=Bbmfm8rkuLgAje49u8sF2Ajj/30Ci3RhjLp3nkql1h9eWRDhLseqdqCb4jRHN7hyQR
         z3Nva42TdVaLbaBkYzwdDs/uNdw8Cnodr0T9Q+rz3pLFhNBVOz+CkTTdKgaCutiJ2auM
         OXvS4zqcyWtLAvfqKqjr5GZgeYEtud8dvdEkjM6am//n3bej+nxTCBk+Y5IKH67GSBF5
         a28xDKViHc8PUQH1J0ESfcRchT5E2o0SvtSEXW5DLOY5MArxJuxrj4azg8jrlgAfpmR8
         jG2MH2pw/wOzqpOWd0EZ/cSEy4dmOMfuowJWzVnofNWeL1tp4o0nQ+HOG4SaFA7NzNce
         fbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xACJuOXIrB8FTYoC3MHylDF07OdG/I2Q0C8TaQZfbw=;
        b=mhhp02hRNbqxQqc3CNpseeg0UTN6gBFtdiHMhZZdnxtsdqjHkyGnX8BjUSb95rk+Hb
         T2dJ2gM9WwPkTqVOKewkQHHMAYDPY6kPXxTE8BO6FFmUsYDhYysGbVAhsfzMCbK/Bvg6
         JAoP92csV+PzxGaSiB80BSaEBiXsFPiMtXNP6pewAUiEIJN/LjfG6QcZWehLLl4dezeZ
         JjZfoTGOFaEzFv4MzFkSKlk/ab/wA2VrdwplfvwFkB3omCvkBce9zMhx5ZnMI5lSCTlw
         +sVvnERJglL53ff0hBQkzJ1Gf4xzTEolbSKldHSeZ7p+BJLsSfpq2GcEU9tVx7H6Bzyv
         Azog==
X-Gm-Message-State: AOAM532uewExafuGeTgf0aTURckUiJVLMCcPdgFQSPsuol43NK8vZyMJ
        g/xhYIIKf+IkQi6fa+vZFzZ8mA==
X-Google-Smtp-Source: ABdhPJypLanQ4OMNp0yjPcUuMO08idH8aMtJK+/ehq9m13dhOyhPSsMxP381sLCbFlYqW65eBLY7Bw==
X-Received: by 2002:a9d:7cce:: with SMTP id r14mr16948126otn.114.1638548640504;
        Fri, 03 Dec 2021 08:24:00 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w5sm646756otk.70.2021.12.03.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 08:24:00 -0800 (PST)
Date:   Fri, 3 Dec 2021 10:23:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, tglx@linutronix.de, maz@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6 5/5] clk: qcom: Add support for SDX65 RPMh clocks
Message-ID: <YapEnd2d8Y9OXvvS@builder.lan>
References: <cover.1638402361.git.quic_vamslank@quicinc.com>
 <366448562ac52c600c45b5a15129d78b5e8dd5a7.1638402361.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366448562ac52c600c45b5a15129d78b5e8dd5a7.1638402361.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Dec 18:21 CST 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add support for clocks maintained by RPMh in SDX65 SoCs.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

The two RPMh patches are independent of the PLL/GCC patches, so I have
picked up the RPMh patches from this series.

Please respin the PLL & GCC patches per Stephen's feedback.


PS. checkpatch --strict complains that the author signature doesn't
match the Signed-off-by, because you have a lowercase 'k' in the From,
but uppercase in the s-o-b. Can you please make sure the two matches in
the future?

Thanks,
Bjorn

> ---
>  drivers/clk/qcom/clk-rpmh.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 441d7a20e6f3..30b26fb96514 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -556,6 +556,30 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>  	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
>  };
>  
> +DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +
> +static struct clk_hw *sdx65_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> +	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
> +	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> +	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> +	.clks = sdx65_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -643,6 +667,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>  	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
> +	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
>  	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
>  	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>  	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
> -- 
> 2.33.1
> 
