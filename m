Return-Path: <linux-arm-msm+bounces-34378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F378A99DA7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 02:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7301C213A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 00:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79942A29;
	Tue, 15 Oct 2024 00:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJ5fLB4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B1290F;
	Tue, 15 Oct 2024 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728950628; cv=none; b=niEX6Bhmry6Qj8o5GRKguQFdyTdjYg8BQ7rBT1NQbYx1G090MaC8cUCeMiez7wPaV1MmzcrIHVaUhqOyCpR9OPcHVkfR6BLL8a2IJHn9jgkF3OnDAOLE56WKk/Ffi3blJAdg7wNpnaoxnCw/9UgkyFSV3bJOfIqAiHpdsdG4qAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728950628; c=relaxed/simple;
	bh=7tMpbJ8Vu4P4hP2iot5d3hf7tVj4juqSjYBupVFsn3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVoU4Dptpsy8SpI/VugZ/Q4kNQFjvUcVddUI8mBOpVob5bX+fYRo5g2IBk+on81T0UziT/lbW5S7JH8WFMbVy1NlgCFqS3tu/Cp6KezWHXAZS7aP5+X/LKBTCiFGHdOb0VzcQpIHFi5AJTNqgS0fBenUN1cuXy8/4w0vF43bwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJ5fLB4E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26190C4CEC6;
	Tue, 15 Oct 2024 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728950627;
	bh=7tMpbJ8Vu4P4hP2iot5d3hf7tVj4juqSjYBupVFsn3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJ5fLB4ElHozodqX8Vxc2V/8LKISf2E3rmd4aIrKEGZNPprGXDzQn1r8CvH3TZ1wW
	 CXiuXP6OrCTfIk3sxmn0GPa+x4PYpfnuuNpJ1qfcdHUgaTwf3NDv2Y2ryu27jPGyDV
	 VSt+aj75c1c7XslYoYmCXjvGyjf7BG03k9eKyfOgdxUThjqqJ8VTdCThUc5Fapv3Xs
	 0aHgDm4LoNrjS2twTtOvUbj0o6qBqsg4QflVmba/ONuFr7wpvhTJbn/hD1H3WeRVXO
	 yksOtxpB2aTbQk/JtAGAMA2id0PbdmJHxXdGm3BbAPUX8ajIPdVyOQPuwAEXvLTXVn
	 9jXyefypGhGXg==
Date: Mon, 14 Oct 2024 19:03:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] gcc-sdm845: Add general purpose clock ops
Message-ID: <eatodbdrn532sjcvmuque5wznspo6rkydp3xkycaxzyoahsiqg@t4vuy3ulbdek>
References: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
 <20241007-starqltechn_integration_upstream-v6-2-dd75c06c708d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-2-dd75c06c708d@gmail.com>

On Mon, Oct 07, 2024 at 06:36:12PM GMT, Dzmitry Sankouski wrote:
> SDM845 has "General Purpose" clocks that can be muxed to
> SoC pins to clock various external devices.
> Those clocks may be used as e.g. PWM sources for external peripherals.
> 
> GPCLK can in theory have arbitrary value depending on the use case, so
> the concept of frequency tables, used in rcg2 clock driver, is not
> efficient, because it allows only defined frequencies.
> 
> Introduce clk_rcg2_gp_ops, which automatically calculate clock
> mnd values for arbitrary clock rate. The calculation done as follows:
> - upon determine rate request, we calculate m/n/pre_div as follows:
>   - find parent(from our client's assigned-clock-parent) rate
>   - find scaled rates by dividing rates on its greatest common divisor
>   - assign requested scaled rate to m
>   - factorize scaled parent rate, put multipliers to n till max value
>     (determined by mnd_width)
> - validate calculated values with *_width:
>   - if doesn't fit, delete divisor and multiplier by 2 until fit
> - return determined rate
> 
> Limitations:
> - The driver doesn't select a parent clock (it may be selected by client
>   in device tree with assigned-clocks, assigned-clock-parents properties)
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v6:
> - remove unused count variable
> - run sparse and smatch
> 
> Changes in v5:
> - replace '/' to div64_u64 to fix 32 bit gcc error
> - fix empty scalar initializer
> ---
>  drivers/clk/qcom/clk-rcg.h    |   1 +
>  drivers/clk/qcom/clk-rcg2.c   | 191 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  drivers/clk/qcom/gcc-sdm845.c |  11 +++-----
>  3 files changed, 189 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 8e0f3372dc7a..8817d14bbda4 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -189,6 +189,7 @@ struct clk_rcg2_gfx3d {
>  	container_of(to_clk_rcg2(_hw), struct clk_rcg2_gfx3d, rcg)
>  
>  extern const struct clk_ops clk_rcg2_ops;
> +extern const struct clk_ops clk_rcg2_gp_ops;
>  extern const struct clk_ops clk_rcg2_floor_ops;
>  extern const struct clk_ops clk_rcg2_fm_ops;
>  extern const struct clk_ops clk_rcg2_mux_closest_ops;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 0fc23a87b432..ba0cccdc73ec 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -8,11 +8,13 @@
>  #include <linux/err.h>
>  #include <linux/bug.h>
>  #include <linux/export.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/rational.h>
>  #include <linux/regmap.h>
>  #include <linux/math64.h>
> +#include <linux/gcd.h>
>  #include <linux/minmax.h>
>  #include <linux/slab.h>
>  
> @@ -32,6 +34,7 @@
>  
>  #define CFG_REG			0x4
>  #define CFG_SRC_DIV_SHIFT	0
> +#define CFG_SRC_DIV_LENGTH	8
>  #define CFG_SRC_SEL_SHIFT	8
>  #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
>  #define CFG_MODE_SHIFT		12
> @@ -148,6 +151,14 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
>  	return update_config(rcg);
>  }
>  
> +// Converts divisors to corresponding clock register values.
> +// @param f - Frequency table with pure m/n/pre_div parameters.

Please use kernel-doc formatting for these.

> +static void convert_to_reg_val(struct freq_tbl *f)
> +{
> +	f->pre_div *= 2;
> +	f->pre_div -= 1;
> +}
> +
>  /*
>   * Calculate m/n:d rate
>   *
> @@ -400,16 +411,115 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
>  	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
>  }
>  
> -static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
> -				u32 *_cfg)

Could you split this patch into one that affects the non-gp rcg2
operations, and then one that adds and uses the gp-ops?

I'd expect that would make it easier to assess the risk to all other
rcg2 use cases.

> +// Split multiplier that doesn't fit in n neither in pre_div.
> +//
> +// @param multiplier - multiplier to split between n and pre_div
> +// @param pre_div - pointer to pre divisor value
> +// @param n - pointer to n divisor value
> +// @param pre_div_max - pre divisor maximum value
> +//
> +static inline void clk_rcg2_split_div(int multiplier, unsigned int *pre_div,
> +				      u16 *n, unsigned int pre_div_max)
> +{
> +	*n = mult_frac(multiplier * *n, *pre_div, pre_div_max);
> +	*pre_div = pre_div_max;
> +}
> +
> +static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
> +			unsigned int mnd_max, unsigned int pre_div_max)
> +{
> +	int i = 2;
> +	unsigned int pre_div = 1;
> +	unsigned long rates_gcd, scaled_parent_rate;
> +	u16 m, n = 1, n_candidate = 1, n_max;
> +
> +	rates_gcd = gcd(parent_rate, rate);
> +	m = div64_u64(rate, rates_gcd);
> +	scaled_parent_rate = div64_u64(parent_rate, rates_gcd);
> +	while (scaled_parent_rate > (mnd_max + m) * pre_div_max) {
> +		// we're exceeding divisor's range, trying lower scale.
> +		if (m > 1) {
> +			m--;
> +			scaled_parent_rate = mult_frac(scaled_parent_rate, m, (m + 1));
> +		} else {
> +			f->n = mnd_max + m;
> +			f->pre_div = pre_div_max;
> +			f->m = m;
> +		}
> +	}
> +
> +	n_max = m + mnd_max;
> +
> +	while (scaled_parent_rate > 1) {
> +		while (scaled_parent_rate % i == 0) {
> +			n_candidate *= i;
> +			if (n_candidate < n_max)
> +				n = n_candidate;
> +			else if (pre_div * i < pre_div_max)
> +				pre_div *= i;
> +			else
> +				clk_rcg2_split_div(i, &pre_div, &n, pre_div_max);
> +
> +			scaled_parent_rate /= i;
> +		}
> +		i++;
> +	}
> +
> +	f->m = m;
> +	f->n = n;
> +	f->pre_div = pre_div > 1 ? pre_div : 0;
> +}
> +
> +static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
> +				   struct clk_rate_request *req)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	struct freq_tbl *f;
> +	int mnd_max = BIT(rcg->mnd_width) - 1;
> +	int hid_max = BIT(rcg->hid_width) - 1;
> +	struct clk_hw *parent;
> +	u64 parent_rate;
> +
> +	parent = clk_hw_get_parent(hw);
> +	parent_rate = clk_get_rate(parent->clk);
> +	if (!parent_rate)
> +		return -EINVAL;
> +
> +	f = kzalloc(sizeof(*f), GFP_KERNEL);

As far as I can tell sizeof(*f) is 16, so should be fine to just put it
on the stack?

Regards,
Bjorn

> +
> +	if (!f)
> +		return -ENOMEM;
> +
> +	clk_rcg2_calc_mnd(parent_rate, req->rate, f, mnd_max, hid_max / 2);
> +	convert_to_reg_val(f);
> +	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
> +
> +	kfree(f);
> +
> +	return 0;
> +}
> +
> +static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, u8 src, u32 *_cfg)
>  {
> -	u32 cfg, mask, d_val, not2d_val, n_minus_m;
>  	struct clk_hw *hw = &rcg->clkr.hw;
> -	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
> +	u32 mask = CFG_SRC_SEL_MASK;
> +	int index = qcom_find_src_index(hw, rcg->parent_map, src);
>  
>  	if (index < 0)
>  		return index;
>  
> +	*_cfg &= ~mask;
> +	*_cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> +
> +	return 0;
> +}
> +
> +static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct freq_tbl *f,
> +				u32 *_cfg)
> +{
> +	u32 cfg, mask, d_val, not2d_val, n_minus_m;
> +	int ret;
> +
>  	if (rcg->mnd_width && f->n) {
>  		mask = BIT(rcg->mnd_width) - 1;
>  		ret = regmap_update_bits(rcg->clkr.regmap,
> @@ -438,9 +548,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
>  	}
>  
>  	mask = BIT(rcg->hid_width) - 1;
> -	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
> +	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
>  	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
> -	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>  	if (rcg->mnd_width && f->n && (f->m != f->n))
>  		cfg |= CFG_MODE_DUAL_EDGE;
>  	if (rcg->hw_clk_ctrl)
> @@ -452,6 +561,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
>  	return 0;
>  }
>  
> +static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
> +				u32 *_cfg)
> +{
> +	int ret;
> +
> +	ret = __clk_rcg2_configure_parent(rcg, f->src, _cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = __clk_rcg2_configure_mnd(rcg, f, _cfg);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>  {
>  	u32 cfg;
> @@ -472,6 +597,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>  	return update_config(rcg);
>  }
>  
> +static int clk_rcg2_configure_gp(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> +{
> +	u32 cfg;
> +	int ret;
> +
> +	ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = __clk_rcg2_configure_mnd(rcg, f, &cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +	if (ret)
> +		return ret;
> +
> +	return update_config(rcg);
> +}
> +
>  static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
>  			       enum freq_policy policy)
>  {
> @@ -525,6 +670,28 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return __clk_rcg2_set_rate(hw, rate, CEIL);
>  }
>  
> +static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	int mnd_max = BIT(rcg->mnd_width) - 1;
> +	int hid_max = BIT(rcg->hid_width) - 1;
> +	struct freq_tbl *f;
> +	int ret;
> +
> +	f = kzalloc(sizeof(*f), GFP_KERNEL);
> +
> +	if (!f)
> +		return -ENOMEM;
> +
> +	clk_rcg2_calc_mnd(parent_rate, rate, f, mnd_max, hid_max / 2);
> +	convert_to_reg_val(f);
> +	ret = clk_rcg2_configure_gp(rcg, f);
> +	kfree(f);
> +
> +	return ret;
> +}
> +
>  static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
>  				   unsigned long parent_rate)
>  {
> @@ -652,6 +819,18 @@ const struct clk_ops clk_rcg2_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_ops);
>  
> +const struct clk_ops clk_rcg2_gp_ops = {
> +	.is_enabled = clk_rcg2_is_enabled,
> +	.get_parent = clk_rcg2_get_parent,
> +	.set_parent = clk_rcg2_set_parent,
> +	.recalc_rate = clk_rcg2_recalc_rate,
> +	.determine_rate = clk_rcg2_determine_gp_rate,
> +	.set_rate = clk_rcg2_set_gp_rate,
> +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_gp_ops);
> +
>  const struct clk_ops clk_rcg2_floor_ops = {
>  	.is_enabled = clk_rcg2_is_enabled,
>  	.get_parent = clk_rcg2_get_parent,
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index dc3aa7014c3e..0def0fc0e009 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -284,11 +284,6 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> -	F(19200000, P_BI_TCXO, 1, 0, 0),
> -	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
> -	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
> -	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> -	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>  	{ }
>  };
>  
> @@ -302,7 +297,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>  		.name = "gcc_gp1_clk_src",
>  		.parent_data = gcc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_gp_ops,
>  	},
>  };
>  
> @@ -316,7 +311,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>  		.name = "gcc_gp2_clk_src",
>  		.parent_data = gcc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_gp_ops,
>  	},
>  };
>  
> @@ -330,7 +325,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>  		.name = "gcc_gp3_clk_src",
>  		.parent_data = gcc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_gp_ops,
>  	},
>  };
>  
> 
> -- 
> 2.39.2
> 

