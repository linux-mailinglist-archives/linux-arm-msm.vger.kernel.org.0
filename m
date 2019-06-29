Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F1A5AAF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 14:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfF2Mbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 08:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbfF2Mbc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 08:31:32 -0400
Received: from localhost (unknown [106.51.109.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65733214AF;
        Sat, 29 Jun 2019 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561811491;
        bh=UutNK23f1qA5A/3q2Xw5HEUUXGymUirMrS/TYddBjqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rpy6GKPzoOyVy5Zdz5BwpBiPHvlQMKaaUO7LJMYYbBFQ+Fl1uc416wy32r+VQQDAf
         uJI4a1c7krbC1wyXsoe6yGljlhXxAGTBaEaUvln0lI0aWO3oo1xcxpgowgnveGrgU2
         fZwg42TX1snYNdm+oCfUToUZoenws7rw9F7B7dmk=
Date:   Sat, 29 Jun 2019 17:58:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: clk-alpha-pll: Add support for Trion
 PLLs
Message-ID: <20190629122822.GE2911@vkoul-mobl>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-3-vkoul@kernel.org>
 <20190627215027.757982063F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627215027.757982063F@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-06-19, 14:50, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-24 23:31:39)
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 2c6773188761..30210f5c6726 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -32,6 +32,7 @@
> >  # define PLL_LOCK_DET          BIT(31)
> >  
> >  #define PLL_L_VAL(p)           ((p)->offset + (p)->regs[PLL_OFF_L_VAL])
> > +#define PLL_CAL_L_VAL(p)       ((p)->offset + (p)->regs[PLL_OFF_CAL_L_VAL])
> >  #define PLL_ALPHA_VAL(p)       ((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL])
> >  #define PLL_ALPHA_VAL_U(p)     ((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL_U])
> >  
> > @@ -44,14 +45,17 @@
> >  # define PLL_VCO_MASK          0x3
> >  
> >  #define PLL_USER_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_USER_CTL_U])
> > +#define PLL_USER_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_USER_CTL_U1])
> >  
> >  #define PLL_CONFIG_CTL(p)      ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
> >  #define PLL_CONFIG_CTL_U(p)    ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
> > +#define PLL_CONFIG_CTL_U1(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U11])
> 
> This looks like a typo, U11 vs U1. So I don't think this has been
> compile tested....

Not sure how this has happened, I have this in my test br too. Will fix
this

> >  #define PLL_TEST_CTL(p)                ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
> >  #define PLL_TEST_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
> >  #define PLL_STATUS(p)          ((p)->offset + (p)->regs[PLL_OFF_STATUS])
> >  #define PLL_OPMODE(p)          ((p)->offset + (p)->regs[PLL_OFF_OPMODE])
> >  #define PLL_FRAC(p)            ((p)->offset + (p)->regs[PLL_OFF_FRAC])
> > +#define PLL_CAL_VAL(p)         ((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
> >  
> >  const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
> >         [CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
> >  const struct clk_ops clk_alpha_pll_ops = {
> >         .enable = clk_alpha_pll_enable,
> >         .disable = clk_alpha_pll_disable,
> > @@ -1053,6 +1210,77 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
> [...]
> > +
> > +static int
> > +clk_trion_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                              unsigned long parent_rate)
> > +{
> > +       struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
> > +       struct regmap *regmap = pll->clkr.regmap;
> > +       int i, val = 0, div, ret;
> > +
> > +       /*
> > +        * If the PLL is in FSM mode, then treat the set_rate callback
> > +        * as a no-operation.
> 
> And this is OK? Shouldn't we fail because we can't change to the rate
> that's desired?

Agreed, we should error out.
Also looking at other PLLs I see we check for FSM in clk enabled
and I guess we should do it there for this as well, will move

-- 
~Vinod
