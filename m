Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B685B4754F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241093AbhLOJQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:16:37 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:36979 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241064AbhLOJQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:16:37 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E1E451FA91;
        Wed, 15 Dec 2021 10:16:34 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:16:33 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 04/15] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead
 of specifying num_parents
Message-ID: <20211215091633.2cpqdlg5hjlqek4m@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-5-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-15 03:54:12, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/camcc-sc7180.c | 50 ++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index ce73ee9037cb..f6e303976a0d 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -303,7 +303,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_bps_clk_src",
>  		.parent_data = cam_cc_parent_data_2,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -324,7 +324,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_cci_0_clk_src",
>  		.parent_data = cam_cc_parent_data_5,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -338,7 +338,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_cci_1_clk_src",
>  		.parent_data = cam_cc_parent_data_5,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -359,7 +359,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_cphy_rx_clk_src",
>  		.parent_data = cam_cc_parent_data_3,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -378,7 +378,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi0phytimer_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -392,7 +392,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi1phytimer_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -406,7 +406,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi2phytimer_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -420,7 +420,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_csi3phytimer_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -442,7 +442,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_fast_ahb_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -465,7 +465,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_icp_clk_src",
>  		.parent_data = cam_cc_parent_data_2,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -487,7 +487,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_0_clk_src",
>  		.parent_data = cam_cc_parent_data_4,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -509,7 +509,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_0_csid_clk_src",
>  		.parent_data = cam_cc_parent_data_3,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -523,7 +523,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_1_clk_src",
>  		.parent_data = cam_cc_parent_data_4,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -537,7 +537,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_1_csid_clk_src",
>  		.parent_data = cam_cc_parent_data_3,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -551,7 +551,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_lite_clk_src",
>  		.parent_data = cam_cc_parent_data_4,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -566,7 +566,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ife_lite_csid_clk_src",
>  		.parent_data = cam_cc_parent_data_3,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -589,7 +589,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_ipe_0_clk_src",
>  		.parent_data = cam_cc_parent_data_2,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -612,7 +612,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_jpeg_clk_src",
>  		.parent_data = cam_cc_parent_data_2,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -634,7 +634,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_lrme_clk_src",
>  		.parent_data = cam_cc_parent_data_6,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -655,7 +655,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk0_clk_src",
>  		.parent_data = cam_cc_parent_data_1,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -669,7 +669,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk1_clk_src",
>  		.parent_data = cam_cc_parent_data_1,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -683,7 +683,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk2_clk_src",
>  		.parent_data = cam_cc_parent_data_1,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -697,7 +697,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk3_clk_src",
>  		.parent_data = cam_cc_parent_data_1,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -711,7 +711,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_mclk4_clk_src",
>  		.parent_data = cam_cc_parent_data_1,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -730,7 +730,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_slow_ahb_clk_src",
>  		.parent_data = cam_cc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> -- 
> 2.33.0
> 
