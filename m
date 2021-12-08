Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADD946DEE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 00:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240853AbhLHXOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 18:14:39 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:59825 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbhLHXOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 18:14:38 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1848A3E962;
        Thu,  9 Dec 2021 00:11:05 +0100 (CET)
Date:   Thu, 9 Dec 2021 00:11:03 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 09/11] clk: qcom: gcc-msm8996: move clock parent tables
 down
Message-ID: <20211208231103.6nh66fq2staoyzv5@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-10-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:28, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the GPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gcc-msm8996.c | 184 ++++++++++++++++-----------------
>  1 file changed, 92 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 3acefe16355c..c2f9ae729d1e 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -33,98 +33,6 @@ enum {
>  	P_AUD_REF_CLK,
>  };
>  
> -static const struct parent_map gcc_sleep_clk_map[] = {
> -	{ P_SLEEP_CLK, 5 }
> -};
> -
> -static const char * const gcc_sleep_clk[] = {
> -	"sleep_clk"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 }
> -};
> -
> -static const char * const gcc_xo_gpll0[] = {
> -	"xo",
> -	"gpll0"
> -};
> -
> -static const struct parent_map gcc_xo_sleep_clk_map[] = {
> -	{ P_XO, 0 },
> -	{ P_SLEEP_CLK, 5 }
> -};
> -
> -static const char * const gcc_xo_sleep_clk[] = {
> -	"xo",
> -	"sleep_clk"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll0_early_div"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL4, 5 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll4[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll4"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_AUD_REF_CLK, 2 }
> -};
> -
> -static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
> -	"xo",
> -	"gpll0",
> -	"aud_ref_clk"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_SLEEP_CLK, 5 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"sleep_clk",
> -	"gpll0_early_div"
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL4, 5 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll4",
> -	"gpll0_early_div"
> -};
> -
>  static struct clk_fixed_factor xo = {
>  	.mult = 1,
>  	.div = 1,
> @@ -229,6 +137,98 @@ static struct clk_alpha_pll_postdiv gpll4 = {
>  	},
>  };
>  
> +static const struct parent_map gcc_sleep_clk_map[] = {
> +	{ P_SLEEP_CLK, 5 }
> +};
> +
> +static const char * const gcc_sleep_clk[] = {
> +	"sleep_clk"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 }
> +};
> +
> +static const char * const gcc_xo_gpll0[] = {
> +	"xo",
> +	"gpll0"
> +};
> +
> +static const struct parent_map gcc_xo_sleep_clk_map[] = {
> +	{ P_XO, 0 },
> +	{ P_SLEEP_CLK, 5 }
> +};
> +
> +static const char * const gcc_xo_sleep_clk[] = {
> +	"xo",
> +	"sleep_clk"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_GPLL0_EARLY_DIV, 6 }
> +};
> +
> +static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
> +	"xo",
> +	"gpll0",
> +	"gpll0_early_div"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_GPLL4, 5 }
> +};
> +
> +static const char * const gcc_xo_gpll0_gpll4[] = {
> +	"xo",
> +	"gpll0",
> +	"gpll4"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_AUD_REF_CLK, 2 }
> +};
> +
> +static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
> +	"xo",
> +	"gpll0",
> +	"aud_ref_clk"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_SLEEP_CLK, 5 },
> +	{ P_GPLL0_EARLY_DIV, 6 }
> +};
> +
> +static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
> +	"xo",
> +	"gpll0",
> +	"sleep_clk",
> +	"gpll0_early_div"
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_GPLL4, 5 },
> +	{ P_GPLL0_EARLY_DIV, 6 }
> +};
> +
> +static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
> +	"xo",
> +	"gpll0",
> +	"gpll4",
> +	"gpll0_early_div"
> +};
> +
>  static const struct freq_tbl ftbl_system_noc_clk_src[] = {
>  	F(19200000, P_XO, 1, 0, 0),
>  	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
> -- 
> 2.33.0
> 
