Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2825F30450C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 18:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390549AbhAZRVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 12:21:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:43878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729094AbhAZIAO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 03:00:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 419AC206D7;
        Tue, 26 Jan 2021 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611647974;
        bh=ndO0PMKXJOqvpOvK3ZfF6AN3TVTIqf62iPD8PKPIV64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nfa38lZYBYPy3CRuYp5nri0FGpaDkLPA0mMhc2zNJAAR/oTwAlu388u7agEK2/ZQj
         iOaPKSv4RKXM+f62m//GrWChQtRXA2qNV1KvxE1M6h752qq0G7l3KzzKx5ar3pSgJg
         zrw/QTXEfAjfn7eocwlP34P9iPkxN+infrtdfJOh6Dvhgm3/gxEYc6GRozPcnSOtUc
         e6RJcKV9WQvkjz99JKbFxq/11a5f8QgWiP7J6wdECOHg7UAE0V+EKbW/n/UYFyiK/g
         kitr/0ux0fe3koWJxE271FwtJO8clhldffSDWc+Bk9/kqKVuRB74LorFDplsyixq+b
         Jkyg74UKbUp7Q==
Date:   Tue, 26 Jan 2021 13:29:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Message-ID: <20210126075929.GM2771@vkoul-mobl>
References: <20210118044321.2571775-1-vkoul@kernel.org>
 <20210118044321.2571775-4-vkoul@kernel.org>
 <YA79UPODso3cmMFU@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA79UPODso3cmMFU@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-01-21, 11:18, Bjorn Andersson wrote:
> On Sun 17 Jan 22:43 CST 2021, Vinod Koul wrote:
> 
> > From: Vivek Aknurwar <viveka@codeaurora.org>
> > 
> > Lucid 5LPE is a slightly different Lucid PLL with different offsets and
> > porgramming sequence so add support for these
> > 
> > Signed-off-by: Vivek Aknurwar <viveka@codeaurora.org>
> > Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> > [vkoul: rebase and tidy up for upstream]
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 173 +++++++++++++++++++++++++++++++
> >  drivers/clk/qcom/clk-alpha-pll.h |   4 +
> >  2 files changed, 177 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index a30ea7b09224..f9c48da21bd1 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -156,6 +156,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
> >  /* LUCID PLL specific settings and offsets */
> >  #define LUCID_PCAL_DONE		BIT(27)
> >  
> > +/* LUCID 5LPE PLL specific settings and offsets */
> > +#define LUCID_5LPE_PCAL_DONE		BIT(11)
> > +#define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
> > +#define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
> > +#define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
> > +
> >  #define pll_alpha_width(p)					\
> >  		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
> >  				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> > @@ -1604,3 +1610,170 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
> >  	.set_rate = clk_alpha_pll_agera_set_rate,
> >  };
> >  EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
> > +
> > +static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
> > +{
> > +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* If in FSM mode, just vote for it */
> > +	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> > +		ret = clk_enable_regmap(hw);
> > +		if (ret)
> > +			return ret;
> > +		return wait_for_pll_enable_lock(pll);
> > +	}
> > +
> > +	/* Check if PLL is already enabled, return if enabled */
> > +	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_RUN);
> > +
> > +	ret = wait_for_pll_enable_lock(pll);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable the PLL outputs */
> > +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, PLL_OUT_MASK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable the global PLL outputs */
> > +	return regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> > +}
> > +
> > +static void alpha_pll_lucid_5lpe_disable(struct clk_hw *hw)
> > +{
> > +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> > +	if (ret)
> > +		return;
> > +
> > +	/* If in FSM mode, just unvote it */
> > +	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> > +		clk_disable_regmap(hw);
> > +		return;
> > +	}
> > +
> > +	/* Disable the global PLL output */
> > +	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> > +	if (ret)
> > +		return;
> > +
> > +	/* Disable the PLL outputs */
> > +	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
> > +	if (ret)
> > +		return;
> > +
> > +	/* Place the PLL mode in STANDBY */
> > +	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_STANDBY);
> > +}
> > +
> > +/*
> > + * The Lucid 5LPE PLL requires a power-on self-calibration which happens
> > + * when the PLL comes out of reset. Calibrate in case it is not completed.
> > + */
> > +static int alpha_pll_lucid_5lpe_prepare(struct clk_hw *hw)
> > +{
> > +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +	struct clk_hw *p;
> > +	u32 val;
> > +	int ret;
> > +
> > +	/* Return early if calibration is not needed. */
> > +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> 
> I doubt this will ever fail, but static analysis tools would complain
> about val possibly being uninitialized after this.
> 
> And the return value is checked in the other functions.

Yes agreed, will update this. Somehow I dont this my checked W=1
complained about this, maybe some others would..

-- 
~Vinod
