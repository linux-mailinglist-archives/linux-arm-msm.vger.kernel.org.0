Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3656458C83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 11:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239298AbhKVKpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 05:45:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:33482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239256AbhKVKpd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 05:45:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEE3060E0B;
        Mon, 22 Nov 2021 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637577747;
        bh=sDzHHTXAilFmGEfHXu4g1asuLWZ3E7TXcTzEGZUzU5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G49sCuhZJjPuNRBuvQnTKTvPzctHFQZEg2cVRdvuByKtcDj2jPrvFKptqacqcL+GR
         AUvkp9yUz3auS0HueYxq8QfvTF5iIuFow3T0rnTvd+7AeOXEaycEub30KgeqgHvDTd
         Vj3KuS+NA4+oWxu6CCx1RY5rIWFRpqplsf1+RHnKeISvgmiirX6ExxbrEJ5K0/CDGd
         sml76Be3dQEa1wuxB96mVFMD+sqWM47WAK/1ayCsDlB0LfzDUIPtAj3P1w2RWXYj5Z
         LtdvuhLBi7z39+bZIHWwgY51Iun7GWjrAXTjDtlUjBHMRVz97J+baRZ38CliXqmnGt
         74aLzAJnqfEAA==
Date:   Mon, 22 Nov 2021 16:12:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v5 2/6] clk: qcom: Add LUCID_EVO PLL type for SDX65
Message-ID: <YZt0DtLZiFR0aV4N@matsya>
References: <cover.1637302009.git.quic_vamslank@quicinc.com>
 <a0b04869a20a0afef99dd457ebb6474f50591210.1637302009.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b04869a20a0afef99dd457ebb6474f50591210.1637302009.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-11-21, 22:11, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add a LUCID_EVO PLL type for SDX65 SoC from Qualcomm.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 204 +++++++++++++++++++++++++++----
>  drivers/clk/qcom/clk-alpha-pll.h |   3 +
>  2 files changed, 181 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index eaedcceb766f..e0c67b76d8ac 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/kernel.h>
> @@ -139,6 +140,20 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>  		[PLL_OFF_OPMODE] = 0x28,
>  		[PLL_OFF_STATUS] = 0x38,
>  	},
> +	[CLK_ALPHA_PLL_TYPE_LUCID_EVO] = {
> +		[PLL_OFF_OPMODE] = 0x04,
> +		[PLL_OFF_STATUS] = 0x0c,
> +		[PLL_OFF_L_VAL] = 0x10,
> +		[PLL_OFF_ALPHA_VAL] = 0x14,
> +		[PLL_OFF_USER_CTL] = 0x18,
> +		[PLL_OFF_USER_CTL_U] = 0x1c,
> +		[PLL_OFF_CONFIG_CTL] = 0x20,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x24,
> +		[PLL_OFF_CONFIG_CTL_U1] = 0x28,
> +		[PLL_OFF_TEST_CTL] = 0x2c,
> +		[PLL_OFF_TEST_CTL_U] = 0x30,
> +		[PLL_OFF_TEST_CTL_U1] = 0x34,
> +        },
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  
> @@ -175,6 +190,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
>  #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
>  
> +/* LUCID EVO PLL specific settings and offsets */
> +#define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
> +#define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
> +
>  /* ZONDA PLL specific */
>  #define ZONDA_PLL_OUT_MASK	0xf
>  #define ZONDA_STAY_IN_CFA	BIT(16)
> @@ -1741,35 +1760,47 @@ static int alpha_pll_lucid_5lpe_set_rate(struct clk_hw *hw, unsigned long rate,
>  					  LUCID_5LPE_ALPHA_PLL_ACK_LATCH);
>  }
>  
> +static int __clk_lucid_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                            unsigned long parent_rate, unsigned long enable_vote_run)
> +{
> +        struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +        int i, val = 0, div, ret;
> +        u32 mask;
> +
> +        /*
> +         * If the PLL is in FSM mode, then treat set_rate callback as a
> +         * no-operation.
> +         */
> +        ret = regmap_read(regmap, PLL_USER_CTL(pll), &val);
> +        if (ret)
> +                return ret;
> +
> +        if (val & enable_vote_run)
> +                return 0;
> +
> +        if (!pll->post_div_table) {
> +                pr_err("Missing the post_div_table for the PLL\n");
> +                return -EINVAL;
> +        }
> +
> +        div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +        for (i = 0; i < pll->num_post_div; i++) {
> +                if (pll->post_div_table[i].div == div) {
> +                        val = pll->post_div_table[i].val;
> +                        break;
> +                }
> +        }
> +
> +        mask = GENMASK(pll->width + pll->post_div_shift - 1, pll->post_div_shift);
> +        return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +                                  mask, val << pll->post_div_shift);
> +}
> +
>  static int clk_lucid_5lpe_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
>  					       unsigned long parent_rate)
>  {
> -	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> -	int i, val = 0, div, ret;
> -	u32 mask;
> -
> -	/*
> -	 * If the PLL is in FSM mode, then treat set_rate callback as a
> -	 * no-operation.
> -	 */
> -	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> -	if (ret)
> -		return ret;
> -
> -	if (val & LUCID_5LPE_ENABLE_VOTE_RUN)
> -		return 0;
> -
> -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> -	for (i = 0; i < pll->num_post_div; i++) {
> -		if (pll->post_div_table[i].div == div) {
> -			val = pll->post_div_table[i].val;
> -			break;
> -		}
> -	}
> -
> -	mask = GENMASK(pll->width + pll->post_div_shift - 1, pll->post_div_shift);
> -	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> -				  mask, val << pll->post_div_shift);
> +	return __clk_lucid_pll_postdiv_set_rate(hw, rate, parent_rate, LUCID_5LPE_ENABLE_VOTE_RUN);
>  }
>  
>  const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
> @@ -1951,3 +1982,124 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
>  EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
> +
> +static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(regmap, PLL_USER_CTL(pll), &val);
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
> +	ret = trion_pll_is_enabled(pll, regmap);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret) {
> +		pr_warn("%s PLL is already enabled\n", clk_hw_get_name(&pll->clkr.hw));
> +		return 0;
> +	}
> +
> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +	if (ret)
> +		return ret;
> +
> +	/* Set operation mode to RUN */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +	ret = wait_for_pll_enable_lock(pll);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the PLL outputs */
> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, PLL_OUT_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the global PLL outputs */
> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure that the write above goes through before returning. */
> +	mb();
> +	return ret;
> +}
> +
> +static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(regmap, PLL_USER_CTL(pll), &val);
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
> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +	if (ret)
> +		return;
> +
> +	/* Disable the PLL outputs */
> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
> +	if (ret)
> +		return;
> +
> +	/* Place the PLL mode in STANDBY */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +}
> +
> +static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
> +						     unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +	u32 l, frac;
> +
> +	regmap_read(regmap, PLL_L_VAL(pll), &l);
> +	l &= LUCID_EVO_PLL_L_VAL_MASK;
> +	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
> +
> +	return alpha_pll_calc_rate(parent_rate, l, frac, pll_alpha_width(pll));
> +}
> +
> +static int clk_lucid_evo_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +					      unsigned long parent_rate)
> +{
> +	return __clk_lucid_pll_postdiv_set_rate(hw, rate, parent_rate, LUCID_EVO_ENABLE_VOTE_RUN);
> +}
> +
> +const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops = {
> +	.enable = alpha_pll_lucid_evo_enable,
> +	.disable = alpha_pll_lucid_evo_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_evo_ops);
> +
> +const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
> +	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
> +	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
> +	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 55e4fa47912f..6e9907deaf30 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -17,6 +17,7 @@ enum {
>  	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>  	CLK_ALPHA_PLL_TYPE_AGERA,
>  	CLK_ALPHA_PLL_TYPE_ZONDA,
> +	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
>  	CLK_ALPHA_PLL_TYPE_MAX,
>  };
>  
> @@ -151,6 +152,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
>  
>  extern const struct clk_ops clk_alpha_pll_zonda_ops;
>  #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
> +extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
> +extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
>  
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> -- 
> 2.33.1

-- 
~Vinod
