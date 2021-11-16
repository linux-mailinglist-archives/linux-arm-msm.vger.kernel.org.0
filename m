Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8944A452CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 09:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhKPIiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 03:38:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:42522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhKPIih (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 03:38:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1DC61546;
        Tue, 16 Nov 2021 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051741;
        bh=6UEMniBpaAJ5Dwl9raOQlbq9LAMjWxCnyAv1eqCVkkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFkl9MdzfQJtkABQ98KJ9v6c09S5lcIhSnEMyfbuc/CK/oKcBfXQSQ2AfsHOgXOSz
         vJAcrv71St/nAQu5Mbg5OVAPtcfyw5gXBdOsw+acBgHW0GR8xY7oQ1LPkaqIuwObEr
         BW/nnRenlEzH8mliKRk7zXTN2e2EN9WJLJI7G307fI7m8PpNr+h+9ehiT5VCq70zQ7
         5PXVE9TW2PeFptS6rtV+2GzZB+qxxHNRKGkV+KgXsdelpKNq8DTnBaN2D6AgHpM0zY
         TUjelo8fToLgE8o3XGueJAnHl/I6UkBucaA0oI4nDLjKlogCiVnkDJzfLZJVziR59f
         LpN3QXuU4isaA==
Date:   Tue, 16 Nov 2021 14:05:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v4 5/6] clk: qcom: Add support for SDX65 RPMh clocks
Message-ID: <YZNtWHRGNYBRukyw@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <1a5ef6e6c9b2e232ff328bb4d68faf1242678f43.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5ef6e6c9b2e232ff328bb4d68faf1242678f43.1637047731.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add support for clocks maintained by RPMh in SDX65 SoCs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

-- 
~Vinod
