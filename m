Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D3747553D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241192AbhLOJcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:32:50 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:43579 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbhLOJcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:32:50 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1AA79201BB;
        Wed, 15 Dec 2021 10:32:49 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:32:47 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 09/15] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead
 of specifying num_parents
Message-ID: <20211215093247.z74pmw5qwrycqeqw@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-10-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-15 03:54:17, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Patch is good on its own, but it needs to be moved before patch 07/15 to
make that patch valid, too.

- Marijn

> ---
>  drivers/clk/qcom/camcc-sdm845.c | 50 ++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index f5b43dce3295..bc2fb8453911 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -187,7 +187,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_bps_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -210,7 +210,7 @@ static struct clk_rcg2 cam_cc_cci_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_cci_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -230,7 +230,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_cphy_rx_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -251,7 +251,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi0phytimer_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -266,7 +266,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi1phytimer_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -281,7 +281,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi2phytimer_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -296,7 +296,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi3phytimer_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -321,7 +321,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_fast_ahb_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -344,7 +344,7 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_fd_core_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -367,7 +367,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_icp_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -391,7 +391,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_0_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -414,7 +414,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_0_csid_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -428,7 +428,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_1_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -443,7 +443,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_1_csid_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -457,7 +457,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_lite_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -472,7 +472,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_lite_csid_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -497,7 +497,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ipe_0_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -512,7 +512,7 @@ static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ipe_1_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -527,7 +527,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_jpeg_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -552,7 +552,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_lrme_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -575,7 +575,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk0_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -590,7 +590,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk1_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -605,7 +605,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk2_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -620,7 +620,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk3_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -644,7 +644,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_slow_ahb_clk_src",
>  		.parent_names = cam_cc_parent_names_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_ops,
>  	},
> -- 
> 2.33.0
> 
