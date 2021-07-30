Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FD53DB135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 04:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhG3CjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 22:39:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229949AbhG3CjM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 22:39:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B1DE60F4A;
        Fri, 30 Jul 2021 02:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627612748;
        bh=6B3cVhx4nV2A6xXvK3y3d2QgXJRAdj2dPPUe5a3+gR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YvR6wk3vhV0GEB5HSt4Hv9ev7AY7CtQVerfzNu4BbRtfcYBZvOfomHCO4C8Sav45r
         H51hdMv2RXso7C/PTknw9rbSltwZHK3wjX8F9e9qOtbkRN2VO1Bsh4PqA8R/gTlrFA
         /u+uv/T957dYErrqAuSjAo7p6wZTxhky0ZWmIkUk5/6h/zdn4aHVeOJT/IRZ5iF1b/
         h+95gimEfe1hzLnVdC2O5BTosamqmjEkMLQcovyb6xsuJvWR/ArhaydtmuFJBrwFEa
         DlsvAwh5MC7OwQSB7o14QRn9UfvqM6Bsu52qWsphHS0uMTRqVJKLbo9E840/AAXGmP
         995J1gGEBhJzw==
Date:   Fri, 30 Jul 2021 08:09:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: Add new PLL type for SDX65
Message-ID: <YQNmR27CQnN1snyK@matsya>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
 <223a1d8020d50c35ff2621f95d69b4a626b6893b.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <223a1d8020d50c35ff2621f95d69b4a626b6893b.1626986805.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Vamsi,

On 22-07-21, 14:09, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Can you please add the type of pll in patch title. Something like Add
LUCID_EVO pll

> 
> Add a new PLL type for SDX65 SoC from Qualcomm.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   4 +
>  2 files changed, 174 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index c6eb99169ddc..93c8917b7273 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
>   */
>  
> @@ -126,6 +127,20 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>  		[PLL_OFF_TEST_CTL_U] = 0x1c,
>  		[PLL_OFF_STATUS] = 0x2c,
>  	},
> +        [CLK_ALPHA_PLL_TYPE_LUCID_EVO] = {
> +                [PLL_OFF_OPMODE] = 0x04,
> +                [PLL_OFF_STATUS] = 0x0c,
> +                [PLL_OFF_L_VAL] = 0x10,
> +                [PLL_OFF_ALPHA_VAL] = 0x14,
> +                [PLL_OFF_USER_CTL] = 0x18,
> +                [PLL_OFF_USER_CTL_U] = 0x1c,
> +                [PLL_OFF_CONFIG_CTL] = 0x20,
> +                [PLL_OFF_CONFIG_CTL_U] = 0x24,
> +                [PLL_OFF_CONFIG_CTL_U1] = 0x28,
> +                [PLL_OFF_TEST_CTL] = 0x2c,
> +                [PLL_OFF_TEST_CTL_U] = 0x30,
> +                [PLL_OFF_TEST_CTL_U1] = 0x34,
> +        },
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  
> @@ -155,12 +170,14 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  
>  /* LUCID PLL specific settings and offsets */
>  #define LUCID_PCAL_DONE		BIT(27)
> +#define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
>  
>  /* LUCID 5LPE PLL specific settings and offsets */
>  #define LUCID_5LPE_PCAL_DONE		BIT(11)
>  #define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
>  #define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
>  #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
> +#define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
>  
>  #define pll_alpha_width(p)					\
>  		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
> @@ -1777,3 +1794,156 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
>  	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
>  };
>  EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> +
> +static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);

Use a regmap ptr like we do for other functions here?

> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	/* If in FSM mode, just vote for it */
> +	if (val & LUCID_EVO_ENABLE_VOTE_RUN) {
> +		ret = clk_enable_regmap(hw);
> +		if (ret)
> +			return ret;
> +		return wait_for_pll_enable_lock(pll);
> +	}
> +
> +	/* Check if PLL is already enabled */
> +	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret) {
> +		pr_warn("%s PLL is already enabled\n",
> +				clk_hw_get_name(&pll->clkr.hw));
> +		return 0;
> +	}
> +
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +			PLL_RESET_N, PLL_RESET_N);

this and others should fit in a single line (with regmap ptr)

> +	if (ret)
> +		return ret;
> +
> +	/* Set operation mode to RUN */
> +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +	ret = wait_for_pll_enable_lock(pll);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the PLL outputs */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +			PLL_OUT_MASK, PLL_OUT_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the global PLL outputs */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +			PLL_OUTCTRL, PLL_OUTCTRL);
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure that the write above goes through before returning. */
> +	mb();

why is this required?

> +	return ret;
> +}
> +
> +static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);

regmap here too

> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return;
> +
> +	/* If in FSM mode, just unvote it */
> +	if (val & LUCID_EVO_ENABLE_VOTE_RUN) {
> +		clk_disable_regmap(hw);
> +		return;
> +	}
> +
> +	/* Disable the global PLL output */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +			PLL_OUTCTRL, 0);
> +	if (ret)
> +		return;
> +
> +	/* Disable the PLL outputs */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +			PLL_OUT_MASK, 0);
> +	if (ret)
> +		return;
> +
> +	/* Place the PLL mode in STANDBY */
> +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll),
> +			PLL_STANDBY);
> +}
> +
> +static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)

too long pls split to two lines!

> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	u32 l, frac;
> +
> +	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +	l &= LUCID_EVO_PLL_L_VAL_MASK;
> +	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
> +
> +	return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_REG_16BIT_WIDTH);
> +}

looks like you should reuse clk_trion_pll_recalc_rate() instead...

> +
> +static int clk_lucid_evo_pll_postdiv_set_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> +	int i, val = 0, div, ret;
> +
> +	/*
> +	 * If the PLL is in FSM mode, then treat set_rate callback as a
> +	 * no-operation.
> +	 */
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & LUCID_EVO_ENABLE_VOTE_RUN)
> +		return 0;
> +
> +	if (!pll->post_div_table) {
> +		pr_err("Missing the post_div_table for the PLL\n");
> +		return -EINVAL;
> +	}
> +
> +	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	for (i = 0; i < pll->num_post_div; i++) {
> +		if (pll->post_div_table[i].div == div) {
> +			val = pll->post_div_table[i].val;
> +			break;
> +		}
> +	}
> +
> +	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +			(BIT(pll->width) - 1) << pll->post_div_shift,
> +			val << pll->post_div_shift);
> +}

clk_lucid_5lpe_pll_postdiv_set_rate() looks similar?

-- 
~Vinod
