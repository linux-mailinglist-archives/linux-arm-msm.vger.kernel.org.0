Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6246DF02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 00:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237948AbhLHX1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 18:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237964AbhLHX1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 18:27:07 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3569C061746;
        Wed,  8 Dec 2021 15:23:34 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3A64820407;
        Thu,  9 Dec 2021 00:23:33 +0100 (CET)
Date:   Thu, 9 Dec 2021 00:23:32 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/11] clk: qcom: gcc-msm8996: drop unsupported clock
 sources
Message-ID: <20211208232332.opace4qmdcukl4uv@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-9-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:27, Dmitry Baryshkov wrote:
> In preparation of updating the msm8996 gcc driver, drop all unsupported
> GPLL sources (gpll1/gpll1_early_div, gpll2/gpll2_early and gpll3).
> Downstream kernel also does not provide support for these GPLL sources,
> so it is safe to drop them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 55 ++++------------------------------
>  1 file changed, 6 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 9b1674b28d45..3acefe16355c 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -27,15 +27,10 @@
>  enum {
>  	P_XO,
>  	P_GPLL0,
> -	P_GPLL2,
> -	P_GPLL3,
> -	P_GPLL1,
> -	P_GPLL2_EARLY,
>  	P_GPLL0_EARLY_DIV,
>  	P_SLEEP_CLK,
>  	P_GPLL4,
>  	P_AUD_REF_CLK,
> -	P_GPLL1_EARLY_DIV
>  };
>  
>  static const struct parent_map gcc_sleep_clk_map[] = {
> @@ -130,44 +125,6 @@ static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
>  	"gpll0_early_div"
>  };
>  
> -static const struct parent_map gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL1_EARLY_DIV, 3 },
> -	{ P_GPLL1, 4 },
> -	{ P_GPLL4, 5 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll1_early_div",
> -	"gpll1",
> -	"gpll4",
> -	"gpll0_early_div"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL2, 2 },
> -	{ P_GPLL3, 3 },
> -	{ P_GPLL1, 4 },
> -	{ P_GPLL2_EARLY, 5 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll2",
> -	"gpll3",
> -	"gpll1",
> -	"gpll2_early",
> -	"gpll0_early_div"
> -};
> -
>  static struct clk_fixed_factor xo = {
>  	.mult = 1,
>  	.div = 1,
> @@ -285,12 +242,12 @@ static const struct freq_tbl ftbl_system_noc_clk_src[] = {
>  static struct clk_rcg2 system_noc_clk_src = {
>  	.cmd_rcgr = 0x0401c,
>  	.hid_width = 5,
> -	.parent_map = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map,
> +	.parent_map = gcc_xo_gpll0_gpll0_early_div_map,
>  	.freq_tbl = ftbl_system_noc_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "system_noc_clk_src",
> -		.parent_names = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div,
> -		.num_parents = 7,
> +		.parent_names = gcc_xo_gpll0_gpll0_early_div,
> +		.num_parents = 3,

Is it perhaps preferred to perform the ARRAY_SIZE conversion _before_
this patch, such that num_parents doesn't need to be updated
temporarily?  That said, yes the name would have to be updated in two
places then, but that seems less fragile than the hardcoded numbers we'd
like to avoid.

>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1257,12 +1214,12 @@ static const struct freq_tbl ftbl_qspi_ser_clk_src[] = {
>  static struct clk_rcg2 qspi_ser_clk_src = {
>  	.cmd_rcgr = 0x8b00c,
>  	.hid_width = 5,
> -	.parent_map = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map,
> +	.parent_map = gcc_xo_gpll0_gpll4_gpll0_early_div_map,
>  	.freq_tbl = ftbl_qspi_ser_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "qspi_ser_clk_src",
> -		.parent_names = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div,
> -		.num_parents = 6,
> +		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> -- 
> 2.33.0
> 
