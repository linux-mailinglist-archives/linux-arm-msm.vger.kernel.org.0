Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA7439C0C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 11:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfFHJRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jun 2019 05:17:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:43174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbfFHJRx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jun 2019 05:17:53 -0400
Received: from localhost (unknown [106.200.229.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7FE52146E;
        Sat,  8 Jun 2019 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559985471;
        bh=OftYUILSnDdb/eqT0/mxG5cpnPjnXo5UUH4VESLsgxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OyBe/S96kbRlP3oPh4qyC0R2dRR3COe/FfU2XcqwzES7pCOwrFh8slCMMJmvSwOCm
         d1zFhqYDiyu73LHpSu5LVqHTgVJoxc+QYKarEmB7Xpnudtv2/PYPbgIlSKRvCmEmjm
         UuUijOxRZQKe9c9Iwg3SnxtbXBt9HZT/8kk94x8M=
Date:   Sat, 8 Jun 2019 14:44:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: qcom: clk-alpha-pll: Add support for Trion PLLs
Message-ID: <20190608091436.GF9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607175542.D9D56208C0@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607175542.D9D56208C0@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for a quick review

On 07-06-19, 10:55, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-07 03:12:33)
> > From: Deepak Katragadda <dkatraga@codeaurora.org>
> > 
> > Add programming sequence support for managing the Trion
> > PLLs.
> > 
> > Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > [vkoul: port to upstream and tidy-up]
> 
> This tag isn't very useful. Maybe you can list out what you actually did
> instead of just "tidying"?

First was to port and in process remove bunch of code which cant be
upstreamed and has no user in current work. Had to rewrite bunch of
stuff while upstreaming. Then fix format and style issue

I will try to list..

> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 0ced4a5a9a17..bf36a929458b 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -120,6 +140,15 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
> >  #define FABIA_PLL_OUT_MASK     0x7
> >  #define FABIA_PLL_RATE_MARGIN  500
> >  
> > +#define TRION_PLL_CAL_VAL      0x44
> > +#define TRION_PLL_STANDBY      0x0
> > +#define TRION_PLL_RUN          0x1
> > +#define TRION_PLL_OUT_MASK     0x7
> > +#define TRION_PCAL_DONE                BIT(26)
> > +#define TRION_PLL_RATE_MARGIN  500
> 
> These last two aren't used. Do we need them?

Not anymore, I removed the user as that was required for this, I will
> 
> > +
> > +#define XO_RATE                        19200000
> 
> Please remove this define. It isn't used (thankfully!).

Yes will remove this and other is the series :)

> >  #define pll_alpha_width(p)                                     \
> >                 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ? \
> >                                  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> > @@ -392,6 +421,15 @@ alpha_pll_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a,
> >         u64 remainder;
> >         u64 quotient;
> >  
> > +       /*
> > +        * The PLLs parent rate is zero probably since the parent hasn't
> > +        * registered yet. Return early with the requested rate.
> > +        */
> > +       if (!prate) {
> 
> This hasn't been a problem before. Why is it a problem now?

Good point, some how downstream thinks so, I will remove these checks

> > +static int clk_trion_pll_enable(struct clk_hw *hw)
> > +{
> > +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +       struct regmap *regmap = pll->clkr.regmap;
> > +       u32 val;
> > +       int ret;
> > +
> > +       ret = regmap_read(regmap, PLL_MODE(pll), &val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* If in FSM mode, just vote for it */
> > +       if (val & PLL_VOTE_FSM_ENA) {
> > +               ret = clk_enable_regmap(hw);
> > +               if (ret)
> > +                       return ret;
> > +               return wait_for_pll_enable_active(pll);
> > +       }
> > +
> > +       /* Set operation mode to RUN */
> > +       regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
> > +
> > +       ret = wait_for_pll_enable_lock(pll);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Enable the PLL outputs */
> > +       ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> > +                                TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Enable the global PLL outputs */
> > +       ret = regmap_update_bits(regmap, PLL_MODE(pll),
> > +                                PLL_OUTCTRL, PLL_OUTCTRL);
> > +       if (ret)
> > +               return ret;
> 
> This if (ret) can be removed.

Yes we should return!

> > +
> > +       /* Ensure that the write above goes through before returning. */
> > +       mb();
> 
> As far as I recall mb() does nothing to ensure the write above goes
> through, just that writes after this one are ordered with the write
> above.

Agreed someone wasn't convinced, will remove this.

> > +static int clk_trion_pll_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > +
> > +       return trion_pll_is_enabled(pll, pll->clkr.regmap);
> > +}
> 
> Can you move this function right below trion_pll_is_enabled()?

Sure

> >  const struct clk_ops clk_alpha_pll_ops = {
> >         .enable = clk_alpha_pll_enable,
> >         .disable = clk_alpha_pll_disable,
> > @@ -902,6 +1079,10 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
> >         ret = regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
> >         if (ret)
> >                 return ret;
> > +       ret = regmap_update_bits(regmap, PLL_MODE(pll),
> > +                                PLL_BYPASSNL, PLL_BYPASSNL);
> > +       if (ret)
> > +               return ret;
> 
> What is this?

Sorry am not sure I understood the question. care to elaborate please?

> > +static long
> > +clk_trion_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
> > +                                unsigned long *prate)
> > +{
> > +       struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> > +
> > +       if (!pll->post_div_table) {
> > +               pr_err("Missing the post_div_table for the PLL\n");
> > +               return -EINVAL;
> 
> Does this ever happen? I'd rather see this removed and the code blow up
> if the driver author didn't test this.

Sounds right! will remove this and others.

> > +               return -EINVAL;
> > +       }
> > +
> > +       div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> 
> Is the cast necessary?

Dont think so, will remove
-- 
~Vinod
