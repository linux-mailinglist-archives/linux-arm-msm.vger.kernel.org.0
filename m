Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D968148DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388967AbgAXSXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:23:53 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41749 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388750AbgAXSXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:23:52 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so1525497pgk.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FB73mrqCt92PRkoMgIfHIc3i5DaF5mIVmuVGa3E/Zk4=;
        b=XFZcXr0Mbc9cbXxGWD3t1l6day+SDmBaxkV8o9BrmVLP5YJHiTh4wpvYbDW1QvBUhg
         l9EkR3A/a5y3hitEA22h7qxctPDvJJHPiz1kMl13Mxniv9WILqfsh3rlU2teOXBya9M9
         QsyLYwGJ9PK/B9Ex+lLtMZBaZOnkBzL527E6SQ4AmpLmTz/3lKPHC/y6gzdhaPFYGOD+
         HjSFLT/s0zfQx3aUtom/9Jh5BWdjTic3+VMQ7okNDbhA2eNriQs4m0NbVtFAF0cQ8hc0
         6RR6auwYkDA45byQqwDFEZ3TQDwxj1wuoPXVDLS8GX3uasMUcrWfaEADnsbZkRr/ktWI
         J+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FB73mrqCt92PRkoMgIfHIc3i5DaF5mIVmuVGa3E/Zk4=;
        b=hnt5BVSv6DeI4A4kYuxcWIuLJW8TyXKsrUbQkvxigXzpsnJ2jf9YpwoYsSidDTTuBE
         JpDfsvv0Yv7r0NB9q22YwUjreMapm7qxOft0X6FbZqYmaWo+9QTLWjHNPxV58Nu5N6Oz
         zz+0plB/u2S/oPPccHKlaIdHveLDkKSP42bev1hrYK9+4b7cmVI/0/OJs6fGy+DaUNw/
         xV+g59F0HumdisSN53KRx+S2nRQIrnHUZpqwXY4kYS+9wdOmmhtTKKjKeZ9tA0Am6V5f
         ID1iEKsOdl4dk7XAuiUA5b4a53wk/na2SzbdjyMJcALxqWpD+O5hjSS6B3wux8h0tA51
         +5Zg==
X-Gm-Message-State: APjAAAVY5OdrW2BESQXwQjmoib/4KUQ6OA6/98qNmN8dHycuU4GnAhrj
        363Hj01hVzI34k28pxiAPs5ZjA==
X-Google-Smtp-Source: APXvYqz+mIWwzZXw57O+sNrAidLZN2GI6xpihZh/hdYdGqTTlvmKRqU9w936u1y0CiYalDrE4ff+fA==
X-Received: by 2002:a63:2901:: with SMTP id p1mr5370846pgp.396.1579890231782;
        Fri, 24 Jan 2020 10:23:51 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b1sm7146058pjw.4.2020.01.24.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:23:51 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:23:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] clk: qcom: clk-alpha-pll: Add support for
 controlling Lucid PLLs
Message-ID: <20200124182316.GU1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-5-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-5-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> Add programming sequence support for managing the Lucid PLLs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 190 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  12 +++
>  2 files changed, 202 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 1b073b2..4258ab0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -52,6 +52,7 @@
>  #define PLL_CONFIG_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
>  #define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
>  #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
> +#define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
>  #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
>  #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>  #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
> @@ -116,6 +117,22 @@
>  		[PLL_OFF_ALPHA_VAL] = 0x40,
>  		[PLL_OFF_CAL_VAL] = 0x44,
>  	},
> +	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
> +		[PLL_OFF_L_VAL] = 0x04,
> +		[PLL_OFF_CAL_L_VAL] = 0x08,
> +		[PLL_OFF_USER_CTL] = 0x0c,
> +		[PLL_OFF_USER_CTL_U] = 0x10,
> +		[PLL_OFF_USER_CTL_U1] = 0x14,
> +		[PLL_OFF_CONFIG_CTL] = 0x18,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
> +		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
> +		[PLL_OFF_TEST_CTL] = 0x24,
> +		[PLL_OFF_TEST_CTL_U] = 0x28,
> +		[PLL_OFF_TEST_CTL_U1] = 0x2c,
> +		[PLL_OFF_STATUS] = 0x30,
> +		[PLL_OFF_OPMODE] = 0x38,
> +		[PLL_OFF_ALPHA_VAL] = 0x40,
> +	},
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  
> @@ -139,6 +156,10 @@
>  #define PLL_OUT_MASK		0x7
>  #define PLL_RATE_MARGIN		500
>  
> +/* LUCID PLL specific settings and offsets */
> +#define LUCID_PLL_CAL_VAL	0x44
> +#define LUCID_PCAL_DONE		BIT(26)
> +
>  #define pll_alpha_width(p)					\
>  		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>  				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> @@ -1367,3 +1388,172 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
>  	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
> +
> +void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +			     const struct alpha_pll_config *config)
> +{
> +	if (config->l)
> +		regmap_write(regmap, PLL_L_VAL(pll), config->l);
> +
> +	regmap_write(regmap, PLL_CAL_L_VAL(pll), LUCID_PLL_CAL_VAL);
> +
> +	if (config->alpha)
> +		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +
> +	if (config->config_ctl_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL(pll),
> +			     config->config_ctl_val);
> +
> +	if (config->config_ctl_hi_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> +			     config->config_ctl_hi_val);
> +
> +	if (config->config_ctl_hi1_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
> +			     config->config_ctl_hi1_val);
> +
> +	if (config->user_ctl_val)
> +		regmap_write(regmap, PLL_USER_CTL(pll),
> +			     config->user_ctl_val);
> +
> +	if (config->user_ctl_hi_val)
> +		regmap_write(regmap, PLL_USER_CTL_U(pll),
> +			     config->user_ctl_hi_val);
> +
> +	if (config->user_ctl_hi1_val)
> +		regmap_write(regmap, PLL_USER_CTL_U1(pll),
> +			     config->user_ctl_hi1_val);
> +
> +	if (config->test_ctl_val)
> +		regmap_write(regmap, PLL_TEST_CTL(pll),
> +			     config->test_ctl_val);
> +
> +	if (config->test_ctl_hi_val)
> +		regmap_write(regmap, PLL_TEST_CTL_U(pll),
> +			     config->test_ctl_hi_val);
> +
> +	if (config->test_ctl_hi1_val)
> +		regmap_write(regmap, PLL_TEST_CTL_U1(pll),
> +			     config->test_ctl_hi1_val);
> +
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
> +			   PLL_UPDATE_BYPASS);
> +
> +	/* Disable PLL output */
> +	regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
> +
> +	/* Set operation mode to OFF */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +	/* PLL should be in OFF mode before continuing */
> +	wmb();
> +
> +	/* Place the PLL in STANDBY mode */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +}
> +EXPORT_SYMBOL_GPL(clk_lucid_pll_configure);
> +
> +/*
> + * The Lucid PLL requires a power-on self-calibration which happens when the
> + * PLL comes out of reset. Calibrate in case it is not completed.
> + */
> +static int alpha_pll_lucid_prepare(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	u32 regval;
> +	int ret;
> +
> +	/* Return early if calibration is not needed. */
> +	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
> +	if (regval & LUCID_PCAL_DONE)
> +		return 0;
> +
> +	ret = clk_trion_pll_enable(hw);
> +	if (ret)
> +		return ret;
> +
> +	clk_trion_pll_disable(hw);
> +
> +	return 0;
> +}
> +
> +static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long prate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	unsigned long rrate;
> +	u32 regval, l, alpha_width = pll_alpha_width(pll);
> +	u64 a;
> +	int ret;
> +
> +	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> +
> +	/*
> +	 * Due to a limited number of bits for fractional rate programming, the
> +	 * rounded up rate could be marginally higher than the requested rate.
> +	 */
> +	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
> +		pr_err("Call set rate on the PLL with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +
> +	/* Latch the PLL input */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +				 PLL_UPDATE, PLL_UPDATE);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for 2 reference cycles before checking the ACK bit. */
> +	udelay(1);
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> +	if (!(regval & ALPHA_PLL_ACK_LATCH)) {
> +		WARN(1, "PLL latch failed. Output may be unstable!\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Return the latch input to 0 */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +				 PLL_UPDATE, 0);
> +	if (ret)
> +		return ret;
> +
> +	if (clk_hw_is_enabled(hw)) {
> +		ret = wait_for_pll_enable_lock(pll);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Wait for PLL output to stabilize */
> +	udelay(100);
> +	return 0;
> +}
> +
> +const struct clk_ops clk_alpha_pll_lucid_ops = {
> +	.prepare = alpha_pll_lucid_prepare,
> +	.enable = clk_trion_pll_enable,
> +	.disable = clk_trion_pll_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = clk_trion_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = alpha_pll_lucid_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_ops);
> +
> +const struct clk_ops clk_alpha_pll_fixed_lucid_ops = {
> +	.enable = clk_trion_pll_enable,
> +	.disable = clk_trion_pll_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = clk_trion_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_ops);
> +
> +const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
> +	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
> +	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
> +	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index fbc1f67..704674a 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -14,6 +14,7 @@ enum {
>  	CLK_ALPHA_PLL_TYPE_BRAMMO,
>  	CLK_ALPHA_PLL_TYPE_FABIA,
>  	CLK_ALPHA_PLL_TYPE_TRION,
> +	CLK_ALPHA_PLL_TYPE_LUCID,
>  	CLK_ALPHA_PLL_TYPE_MAX,
>  };
>  
> @@ -30,6 +31,7 @@ enum {
>  	PLL_OFF_CONFIG_CTL_U1,
>  	PLL_OFF_TEST_CTL,
>  	PLL_OFF_TEST_CTL_U,
> +	PLL_OFF_TEST_CTL_U1,
>  	PLL_OFF_STATUS,
>  	PLL_OFF_OPMODE,
>  	PLL_OFF_FRAC,
> @@ -94,10 +96,13 @@ struct alpha_pll_config {
>  	u32 alpha_hi;
>  	u32 config_ctl_val;
>  	u32 config_ctl_hi_val;
> +	u32 config_ctl_hi1_val;
>  	u32 user_ctl_val;
>  	u32 user_ctl_hi_val;
> +	u32 user_ctl_hi1_val;
>  	u32 test_ctl_val;
>  	u32 test_ctl_hi_val;
> +	u32 test_ctl_hi1_val;
>  	u32 main_output_mask;
>  	u32 aux_output_mask;
>  	u32 aux2_output_mask;
> @@ -123,10 +128,17 @@ struct alpha_pll_config {
>  extern const struct clk_ops clk_alpha_pll_fixed_fabia_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_fabia_ops;
>  
> +extern const struct clk_ops clk_alpha_pll_lucid_ops;
> +extern const struct clk_ops clk_alpha_pll_fixed_lucid_ops;
> +extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
> +
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  				const struct alpha_pll_config *config);
> +void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +			     const struct alpha_pll_config *config);
> +
>  extern const struct clk_ops clk_trion_fixed_pll_ops;
>  extern const struct clk_ops clk_trion_pll_postdiv_ops;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
