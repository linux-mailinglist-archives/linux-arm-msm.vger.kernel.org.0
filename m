Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D5C46DEBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 23:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhLHW6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 17:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbhLHW6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 17:58:30 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54EDC0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 14:54:57 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C42CE3EEC7;
        Wed,  8 Dec 2021 23:54:55 +0100 (CET)
Date:   Wed, 8 Dec 2021 23:54:54 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 11/11] clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of
 specifying num_parents
Message-ID: <20211208225454.dqjukcn3iijd3xfm@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-12-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:30, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gcc-msm8996.c | 122 ++++++++++++++++-----------------
>  1 file changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 186e682e730f..204c1f4c68c4 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -263,7 +263,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "system_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -283,7 +283,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "config_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -305,7 +305,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "periph_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -326,7 +326,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_master_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -344,7 +344,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_mock_utmi_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -362,7 +362,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb3_phy_aux_clk_src",
>  		.parent_data = gcc_xo_sleep_clk,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -381,7 +381,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb20_master_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -394,7 +394,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb20_mock_utmi_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -420,7 +420,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc1_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -440,7 +440,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc1_ice_core_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -465,7 +465,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc2_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -479,7 +479,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc3_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -503,7 +503,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc4_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -528,7 +528,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -547,7 +547,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -580,7 +580,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart1_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -594,7 +594,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -607,7 +607,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -621,7 +621,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart2_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -635,7 +635,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -648,7 +648,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -662,7 +662,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart3_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -676,7 +676,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -689,7 +689,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -703,7 +703,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart4_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -717,7 +717,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -730,7 +730,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -744,7 +744,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart5_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -758,7 +758,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -771,7 +771,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -785,7 +785,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart6_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -799,7 +799,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup1_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -812,7 +812,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup1_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -826,7 +826,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart1_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -840,7 +840,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup2_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -853,7 +853,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup2_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -867,7 +867,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart2_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -881,7 +881,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup3_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -894,7 +894,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup3_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -908,7 +908,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart3_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -922,7 +922,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup4_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -935,7 +935,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup4_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -949,7 +949,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart4_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -963,7 +963,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup5_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -976,7 +976,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup5_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -990,7 +990,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart5_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1004,7 +1004,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup6_spi_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1017,7 +1017,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup6_i2c_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1031,7 +1031,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart6_apps_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1049,7 +1049,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pdm2_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1068,7 +1068,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "tsif_ref_clk_src",
>  		.parent_data = gcc_xo_gpll0_aud_ref_clk,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_aud_ref_clk),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1080,7 +1080,7 @@ static struct clk_rcg2 gcc_sleep_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sleep_clk_src",
>  		.parent_data = gcc_sleep_clk,
> -		.num_parents = 1,
> +		.num_parents = ARRAY_SIZE(gcc_sleep_clk),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1093,7 +1093,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hmss_rbcpr_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1105,7 +1105,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hmss_gpll0_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1126,7 +1126,7 @@ static struct clk_rcg2 gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp1_clk_src",
>  		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1140,7 +1140,7 @@ static struct clk_rcg2 gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp2_clk_src",
>  		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1154,7 +1154,7 @@ static struct clk_rcg2 gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp3_clk_src",
>  		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1173,7 +1173,7 @@ static struct clk_rcg2 pcie_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pcie_aux_clk_src",
>  		.parent_data = gcc_xo_sleep_clk,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1194,7 +1194,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ufs_axi_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1214,7 +1214,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ufs_ice_core_clk_src",
>  		.parent_data = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1235,7 +1235,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "qspi_ser_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> -- 
> 2.33.0
> 
