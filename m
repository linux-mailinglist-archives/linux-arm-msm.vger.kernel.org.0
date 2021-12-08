Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5277146DE8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 23:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240640AbhLHWsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 17:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240636AbhLHWse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 17:48:34 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547EFC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 14:45:01 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4CB5C3ED5F;
        Wed,  8 Dec 2021 23:44:58 +0100 (CET)
Date:   Wed, 8 Dec 2021 23:44:51 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: qcom: gpucc-sdm660: use parent_hws instead of
 parent_data
Message-ID: <20211208224451.b64bxukxygunlceo@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:21, Dmitry Baryshkov wrote:
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gpucc-sdm660.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
> index 26e17f349a77..27a506a78a25 100644
> --- a/drivers/clk/qcom/gpucc-sdm660.c
> +++ b/drivers/clk/qcom/gpucc-sdm660.c
> @@ -65,8 +65,8 @@ static struct clk_alpha_pll gpu_pll0_pll_out_main = {
>  	.num_vco = ARRAY_SIZE(gpu_vco),
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gpu_pll0_pll_out_main",
> -		.parent_data =  &(const struct clk_parent_data){
> -			.hw = &gpucc_cxo_clk.clkr.hw,
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpucc_cxo_clk.clkr.hw,
>  		},
>  		.num_parents = 1,
>  		.ops = &clk_alpha_pll_ops,
> @@ -80,8 +80,8 @@ static struct clk_alpha_pll gpu_pll1_pll_out_main = {
>  	.num_vco = ARRAY_SIZE(gpu_vco),
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gpu_pll1_pll_out_main",
> -		.parent_data = &(const struct clk_parent_data){
> -			.hw = &gpucc_cxo_clk.clkr.hw,
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpucc_cxo_clk.clkr.hw,
>  		},
>  		.num_parents = 1,
>  		.ops = &clk_alpha_pll_ops,
> @@ -134,8 +134,8 @@ static struct clk_branch gpucc_gfx3d_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gpucc_gfx3d_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gfx3d_clk_src.rcg.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&gfx3d_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_ops,
> -- 
> 2.33.0
> 
