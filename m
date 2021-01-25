Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EC53028BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 18:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbhAYRWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 12:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729539AbhAYRSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:18:52 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24488C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:18:12 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id e70so13432660ote.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ezmAm6nOvax9k/hdZ3S4Bw2223KEqVuV2WE0GJMSK0I=;
        b=CDlaboiVoAK5xbM8BtWeOumETZLuJawZjwEn8LF2Ob+LXSFZgonwUcx/R6aQP/NLva
         aoe4OdcraYwSpo8ETIC9jTpcHbDFr2Pwc6mqYsg0RMfEH9NpzXCGi2kx0YCisQT3mla5
         N+XeVQMi2QcCP9+ayH2YhnP1xrplQCUrxsbNrszMJRK7ZIu1mQyVOSr2nkelvsjK8Kkt
         szwHDlISErvzRMIMJ6NMMzCCc07EkPSR9tW8iKob5LJ718ccvXzDSt8pSXH9eRDDdN8E
         niGlIdEdFECECoBQTfvUquR6LEOQIoMfUlbyDL8JyTjk93Rw/dZ+doh0Ywx4yPpqKcFV
         VOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ezmAm6nOvax9k/hdZ3S4Bw2223KEqVuV2WE0GJMSK0I=;
        b=iL9UWEbUcFNiwwsgCXOSC5A/GO+BS6rBAZdjrKDv6Cew5VDFxOYO66LEvKILCjXGlF
         DmrS34FJZFZyiDGXMBMuOge+I4yncwVjL6m7BOAiu16258T1bisQJug0SEko7kB1ajuV
         jyFFUyyeeIddVRVevtm0Ba8JyMb/DMc7R9QdF+oGk2LKYxkI3R7AUITu25nPrTkfV0if
         Ug64/htG5kxMuWYueXfqkk1QWrVkxos7dGqOyquVU8vywJzgFH51sJSwf6gQxo4OO9AQ
         1k6hBRJEsDvjwNP+YWru81+N14E8ZSt5TZDHsJEq78NVy8iM4NFmEC2TjgFH2Hj5Eq1R
         I6RA==
X-Gm-Message-State: AOAM531ZHIWctfLZxdz6d3Hs5OLB26OSp+HfgeTxmvl8O/96BT+xv5e3
        q6BuNjN04da9gcpauMxQeqij8g==
X-Google-Smtp-Source: ABdhPJxw/bosntKhmEmnnXkonTWsBXUcYE/ZJMm6awCzajkx5b61oK9PymMjB2S3P/0b+wNRmNYZjw==
X-Received: by 2002:a05:6830:309b:: with SMTP id f27mr1128443ots.118.1611595091314;
        Mon, 25 Jan 2021 09:18:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j8sm3612709oie.47.2021.01.25.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:18:10 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:18:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH v4 3/5] clk: qcom: clk-alpha-pll: Add support for Lucid
 5LPE PLL
Message-ID: <YA79UPODso3cmMFU@builder.lan>
References: <20210118044321.2571775-1-vkoul@kernel.org>
 <20210118044321.2571775-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118044321.2571775-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 17 Jan 22:43 CST 2021, Vinod Koul wrote:

> From: Vivek Aknurwar <viveka@codeaurora.org>
> 
> Lucid 5LPE is a slightly different Lucid PLL with different offsets and
> porgramming sequence so add support for these
> 
> Signed-off-by: Vivek Aknurwar <viveka@codeaurora.org>
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [vkoul: rebase and tidy up for upstream]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 173 +++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   4 +
>  2 files changed, 177 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index a30ea7b09224..f9c48da21bd1 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -156,6 +156,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  /* LUCID PLL specific settings and offsets */
>  #define LUCID_PCAL_DONE		BIT(27)
>  
> +/* LUCID 5LPE PLL specific settings and offsets */
> +#define LUCID_5LPE_PCAL_DONE		BIT(11)
> +#define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
> +#define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
> +#define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
> +
>  #define pll_alpha_width(p)					\
>  		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>  				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> @@ -1604,3 +1610,170 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
>  	.set_rate = clk_alpha_pll_agera_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
> +
> +static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	/* If in FSM mode, just vote for it */
> +	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> +		ret = clk_enable_regmap(hw);
> +		if (ret)
> +			return ret;
> +		return wait_for_pll_enable_lock(pll);
> +	}
> +
> +	/* Check if PLL is already enabled, return if enabled */
> +	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +	ret = wait_for_pll_enable_lock(pll);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the PLL outputs */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, PLL_OUT_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the global PLL outputs */
> +	return regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> +}
> +
> +static void alpha_pll_lucid_5lpe_disable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return;
> +
> +	/* If in FSM mode, just unvote it */
> +	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> +		clk_disable_regmap(hw);
> +		return;
> +	}
> +
> +	/* Disable the global PLL output */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +	if (ret)
> +		return;
> +
> +	/* Disable the PLL outputs */
> +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
> +	if (ret)
> +		return;
> +
> +	/* Place the PLL mode in STANDBY */
> +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +}
> +
> +/*
> + * The Lucid 5LPE PLL requires a power-on self-calibration which happens
> + * when the PLL comes out of reset. Calibrate in case it is not completed.
> + */
> +static int alpha_pll_lucid_5lpe_prepare(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *p;
> +	u32 val;
> +	int ret;
> +
> +	/* Return early if calibration is not needed. */
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);

I doubt this will ever fail, but static analysis tools would complain
about val possibly being uninitialized after this.

And the return value is checked in the other functions.

Regards,
Bjorn

> +	if (val & LUCID_5LPE_PCAL_DONE)
> +		return 0;
> +
> +	p = clk_hw_get_parent(hw);
> +	if (!p)
> +		return -EINVAL;
> +
> +	ret = alpha_pll_lucid_5lpe_enable(hw);
> +	if (ret)
> +		return ret;
> +
> +	alpha_pll_lucid_5lpe_disable(hw);
> +
> +	return 0;
> +}
> +
> +static int alpha_pll_lucid_5lpe_set_rate(struct clk_hw *hw, unsigned long rate,
> +					 unsigned long prate)
> +{
> +	return __alpha_pll_trion_set_rate(hw, rate, prate,
> +					  LUCID_5LPE_PLL_LATCH_INPUT,
> +					  LUCID_5LPE_ALPHA_PLL_ACK_LATCH);
> +}
> +
> +static int clk_lucid_5lpe_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +					       unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> +	int i, val = 0, div, ret;
> +	u32 mask;
> +
> +	/*
> +	 * If the PLL is in FSM mode, then treat set_rate callback as a
> +	 * no-operation.
> +	 */
> +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & LUCID_5LPE_ENABLE_VOTE_RUN)
> +		return 0;
> +
> +	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	for (i = 0; i < pll->num_post_div; i++) {
> +		if (pll->post_div_table[i].div == div) {
> +			val = pll->post_div_table[i].val;
> +			break;
> +		}
> +	}
> +
> +	mask = GENMASK(pll->width + pll->post_div_shift - 1, pll->post_div_shift);
> +	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +				  mask, val << pll->post_div_shift);
> +}
> +
> +const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
> +	.prepare = alpha_pll_lucid_5lpe_prepare,
> +	.enable = alpha_pll_lucid_5lpe_enable,
> +	.disable = alpha_pll_lucid_5lpe_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = clk_trion_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = alpha_pll_lucid_5lpe_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
> +
> +const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
> +	.enable = alpha_pll_lucid_5lpe_enable,
> +	.disable = alpha_pll_lucid_5lpe_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = clk_trion_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
> +
> +const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
> +	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
> +	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
> +	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 0ea30d2f3da1..6943e933be0f 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -144,6 +144,10 @@ extern const struct clk_ops clk_alpha_pll_lucid_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
>  extern const struct clk_ops clk_alpha_pll_agera_ops;
>  
> +extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
> +extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
> +extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
> +
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> -- 
> 2.26.2
> 
