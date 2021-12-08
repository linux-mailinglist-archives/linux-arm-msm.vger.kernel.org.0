Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7289446DEE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 00:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbhLHXPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 18:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241091AbhLHXPd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 18:15:33 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F349AC0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 15:12:00 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BDACD3E962;
        Thu,  9 Dec 2021 00:11:58 +0100 (CET)
Date:   Thu, 9 Dec 2021 00:11:57 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/11] clk: qcom: camcc-sc7180: use parent_hws instead of
 parent_data
Message-ID: <20211208231157.cuhzstalr6woldwz@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:25, Dmitry Baryshkov wrote:
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/camcc-sc7180.c | 156 ++++++++++++++++----------------
>  1 file changed, 79 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index 3c15e551419f..e2b4804695f3 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -126,7 +126,9 @@ static struct clk_fixed_factor cam_cc_pll2_out_early = {
>  	.div = 2,
>  	.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_pll2_out_early",
> -		.parent_names = (const char *[]){ "cam_cc_pll2" },
> +		.parent_hws = (const struct clk_hw*[]){
> +			&cam_cc_pll2.clkr.hw,
> +		},
>  		.num_parents = 1,
>  		.ops = &clk_fixed_factor_ops,
>  	},
> @@ -146,8 +148,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux = {
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_AGERA],
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_pll2_out_aux",
> -		.parent_data = &(const struct clk_parent_data){
> -			.hw = &cam_cc_pll2.clkr.hw,
> +		.parent_hws = (const struct clk_hw*[]){
> +			&cam_cc_pll2.clkr.hw,
>  		},
>  		.num_parents = 1,
>  		.flags = CLK_SET_RATE_PARENT,
> @@ -729,8 +731,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_bps_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -747,8 +749,8 @@ static struct clk_branch cam_cc_bps_areg_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_bps_areg_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -778,8 +780,8 @@ static struct clk_branch cam_cc_bps_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_bps_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_bps_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_bps_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -809,8 +811,8 @@ static struct clk_branch cam_cc_cci_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_cci_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cci_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cci_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -827,8 +829,8 @@ static struct clk_branch cam_cc_cci_1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_cci_1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cci_1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cci_1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -845,8 +847,8 @@ static struct clk_branch cam_cc_core_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_core_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -863,8 +865,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_cpas_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -881,8 +883,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csi0phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_csi0phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_csi0phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -899,8 +901,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csi1phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_csi1phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_csi1phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -917,8 +919,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csi2phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_csi2phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_csi2phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -935,8 +937,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csi3phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_csi3phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_csi3phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -953,8 +955,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csiphy0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -971,8 +973,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csiphy1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -989,8 +991,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csiphy2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1007,8 +1009,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_csiphy3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1025,8 +1027,8 @@ static struct clk_branch cam_cc_icp_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_icp_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_icp_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_icp_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1056,8 +1058,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1074,8 +1076,8 @@ static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_0_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1092,8 +1094,8 @@ static struct clk_branch cam_cc_ife_0_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_0_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_0_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_0_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1110,8 +1112,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_0_dsp_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1141,8 +1143,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1159,8 +1161,8 @@ static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_1_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1177,8 +1179,8 @@ static struct clk_branch cam_cc_ife_1_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_1_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_1_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_1_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1195,8 +1197,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_1_dsp_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1213,8 +1215,8 @@ static struct clk_branch cam_cc_ife_lite_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_lite_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_lite_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_lite_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1231,8 +1233,8 @@ static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_lite_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1249,8 +1251,8 @@ static struct clk_branch cam_cc_ife_lite_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ife_lite_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ife_lite_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1267,8 +1269,8 @@ static struct clk_branch cam_cc_ipe_0_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ipe_0_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1285,8 +1287,8 @@ static struct clk_branch cam_cc_ipe_0_areg_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ipe_0_areg_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1316,8 +1318,8 @@ static struct clk_branch cam_cc_ipe_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_ipe_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_ipe_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_ipe_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1334,8 +1336,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_jpeg_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_jpeg_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_jpeg_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1352,8 +1354,8 @@ static struct clk_branch cam_cc_lrme_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_lrme_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_lrme_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_lrme_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1370,8 +1372,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_mclk0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_mclk0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_mclk0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1388,8 +1390,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_mclk1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_mclk1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_mclk1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1406,8 +1408,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_mclk2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_mclk2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_mclk2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1424,8 +1426,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_mclk3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_mclk3_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_mclk3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1442,8 +1444,8 @@ static struct clk_branch cam_cc_mclk4_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "cam_cc_mclk4_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &cam_cc_mclk4_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&cam_cc_mclk4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> -- 
> 2.33.0
> 
