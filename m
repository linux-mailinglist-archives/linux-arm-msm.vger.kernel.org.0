Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B4E156EEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 06:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgBJF4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 00:56:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:59808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgBJF4o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 00:56:44 -0500
Received: from localhost (unknown [106.201.32.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38D9820661;
        Mon, 10 Feb 2020 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581314203;
        bh=y8WJhCtjiUgmevlVF8bPnBitNPUgs1QbeGeB5mZDx5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qybtcXfORlwW2sh851QqwW7QwgE5offrIYVPKCK2+7adJuA1yK91UDooJSTbdTcnu
         HzEtBE8FJiRh7dcx3mo1l1uLAU0Uv1Yd1jRmHZ79h8DlfuxjWUzJtc0+CcLzY3VKMd
         3oB7ywD7EfdHX6SY79BNWygygdYv7V9/ohuCm3LE=
Date:   Mon, 10 Feb 2020 11:26:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vnkgutta@codeaurora.org
Subject: Re: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: Add support for
 controlling Lucid PLLs
Message-ID: <20200210055638.GT2618@vkoul-mobl>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
 <1579905147-12142-5-git-send-email-vnkgutta@codeaurora.org>
 <20200205193353.2BDCC20720@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205193353.2BDCC20720@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-02-20, 11:33, Stephen Boyd wrote:
> Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:24)
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 1b073b2..4258ab0 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -1367,3 +1388,172 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
> >         .set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
> >  };
> >  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
> > +
> > +void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> 
> Can we get some kernel documentation for this function?

Okay adding

> > +{
> > +       if (config->l)
> > +               regmap_write(regmap, PLL_L_VAL(pll), config->l);
> > +
> > +       regmap_write(regmap, PLL_CAL_L_VAL(pll), LUCID_PLL_CAL_VAL);
> > +
> > +       if (config->alpha)
> > +               regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> > +
> > +       if (config->config_ctl_val)
> > +               regmap_write(regmap, PLL_CONFIG_CTL(pll),
> > +                            config->config_ctl_val);
> > +
> > +       if (config->config_ctl_hi_val)
> > +               regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> > +                            config->config_ctl_hi_val);
> > +
> > +       if (config->config_ctl_hi1_val)
> > +               regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
> > +                            config->config_ctl_hi1_val);
> > +
> > +       if (config->user_ctl_val)
> > +               regmap_write(regmap, PLL_USER_CTL(pll),
> > +                            config->user_ctl_val);
> > +
> > +       if (config->user_ctl_hi_val)
> > +               regmap_write(regmap, PLL_USER_CTL_U(pll),
> > +                            config->user_ctl_hi_val);
> > +
> > +       if (config->user_ctl_hi1_val)
> > +               regmap_write(regmap, PLL_USER_CTL_U1(pll),
> > +                            config->user_ctl_hi1_val);
> > +
> > +       if (config->test_ctl_val)
> > +               regmap_write(regmap, PLL_TEST_CTL(pll),
> > +                            config->test_ctl_val);
> > +
> > +       if (config->test_ctl_hi_val)
> > +               regmap_write(regmap, PLL_TEST_CTL_U(pll),
> > +                            config->test_ctl_hi_val);
> > +
> > +       if (config->test_ctl_hi1_val)
> > +               regmap_write(regmap, PLL_TEST_CTL_U1(pll),
> > +                            config->test_ctl_hi1_val);
> > +
> > +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
> > +                          PLL_UPDATE_BYPASS);
> > +
> > +       /* Disable PLL output */
> > +       regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
> > +
> > +       /* Set operation mode to OFF */
> > +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> > +
> > +       /* PLL should be in OFF mode before continuing */
> > +       wmb();
> 
> How does the write above overtake the write below? This barrier looks
> wrong.

I think you are correct, it doesnt :), so removing this

> > +static int alpha_pll_lucid_prepare(struct clk_hw *hw)
> > +{
> > +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +       u32 regval;
> > +       int ret;
> > +
> > +       /* Return early if calibration is not needed. */
> > +       regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
> > +       if (regval & LUCID_PCAL_DONE)
> > +               return 0;
> > +
> > +       ret = clk_trion_pll_enable(hw);
> > +       if (ret)
> > +               return ret;
> > +
> > +       clk_trion_pll_disable(hw);
> > +
> > +       return 0;
> 
> Can you write this like:
> 
> 	/* On/off to calibrate */
> 	ret = clk_trion_pll_enable(hw);
> 	if (!ret)
> 		clk_trion_pll_disable(hw);
> 
> 	return ret;

Looks better, updated now.

> > +static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                                   unsigned long prate)
> > +{
> > +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +       unsigned long rrate;
> > +       u32 regval, l, alpha_width = pll_alpha_width(pll);
> > +       u64 a;
> > +       int ret;
> > +
> > +       rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> > +
> > +       /*
> > +        * Due to a limited number of bits for fractional rate programming, the
> > +        * rounded up rate could be marginally higher than the requested rate.
> > +        */
> > +       if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
> 
> Any chance this can be pushed into the alpha_pll_round_rate() API? It's
> duplicated in this driver.

Yes here and couple of fabia pll functions. Said that I see
alpha_pll_round_rate() is also invoked two places,
alpha_pll_fabia_set_rate() and __clk_alpha_pll_set_rate(), so should we
let these two also be updated, if you are okay with that I will update
this

> > +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> > +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> > +
> > +       /* Latch the PLL input */
> > +       ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> > +                                PLL_UPDATE, PLL_UPDATE);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Wait for 2 reference cycles before checking the ACK bit. */
> 
> Are reference cycles 2 * 1 / 19.2MHz?

Will check and update on this

> 
> > +       udelay(1);
> > +       regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> > +       if (!(regval & ALPHA_PLL_ACK_LATCH)) {
> > +               WARN(1, "PLL latch failed. Output may be unstable!\n");
> 
> Do we need a big WARN stack for this? How about pr_warn() instead?

Nope :), will move to a warn print :)

-- 
~Vinod
