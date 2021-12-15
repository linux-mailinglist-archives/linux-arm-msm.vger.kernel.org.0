Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D17D4762D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 21:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbhLOUMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 15:12:07 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:35637 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhLOUMA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 15:12:00 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 531932020E;
        Wed, 15 Dec 2021 21:11:55 +0100 (CET)
Date:   Wed, 15 Dec 2021 21:11:53 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 16/16] clk: qcom: gcc-msm8996: start getting rid of xo
 clk
Message-ID: <20211215201153.orgyt6mlmxryrdpn@SoMainline.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
 <20211215193704.2821775-17-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215193704.2821775-17-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-15 22:37:04, Dmitry Baryshkov wrote:
> The "xo" fixed_factor clock is a leftover/hack from a time when we
> couldn't make rpmhcc the root of all clocks. It is going to be removed
> once all users of this clock are converted to use clocks specified
> through the DTS. Replace internal usage of the xo clock with the cxo
> (RPM_SMD_BB_CLK1) parent, specifying xo_board as a fallback.

Nit: as mentioned in another reply I don't think rpmhcc is the sole
problem why "xo" exists (xo_board exists to subustitute it for now).
Rather, "xo" seems to be a remnant from an era where clock dependencies
were not (fully) specified in DT but instead relied on fixed, well known
global names for these inter-driver (inter-clock) dependencies.  Maybe
this alias was needed to streamline the use of xo_board until rpmcc
could be used though?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gcc-msm8996.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 204c1f4c68c4..8da5ad2ad563 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -54,8 +54,8 @@ static struct clk_alpha_pll gpll0_early = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gpll0_early",
> -			.parent_hws = (const struct clk_hw*[]){
> -				&xo.hw,
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "cxo", .name = "xo_board",
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_alpha_pll_ops,
> @@ -131,8 +131,8 @@ static struct clk_alpha_pll gpll4_early = {
>  		.enable_mask = BIT(4),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gpll4_early",
> -			.parent_hws = (const struct clk_hw*[]){
> -				&xo.hw,
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "cxo", .name = "xo_board",
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_alpha_pll_ops,
> @@ -167,7 +167,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw }
>  };
>  
> @@ -177,7 +177,7 @@ static const struct parent_map gcc_xo_sleep_clk_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_sleep_clk[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" }
>  };
>  
> @@ -188,7 +188,7 @@ static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0_gpll0_early_div[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_early_div.hw }
>  };
> @@ -200,7 +200,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll4.clkr.hw }
>  };
> @@ -212,7 +212,7 @@ static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0_aud_ref_clk[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" }
>  };
> @@ -225,7 +225,7 @@ static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  	{ .hw = &gpll0_early_div.hw }
> @@ -239,7 +239,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
>  };
>  
>  static const struct clk_parent_data gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
> -	{ .hw = &xo.hw },
> +	{ .fw_name = "cxo", .name = "xo_board" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll4.clkr.hw },
>  	{ .hw = &gpll0_early_div.hw }
> -- 
> 2.33.0
> 
