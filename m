Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F19387CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 17:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350491AbhERP6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 11:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350480AbhERP6N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 11:58:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 618AC60725;
        Tue, 18 May 2021 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621353415;
        bh=OokC8+bnxFyFbf/GDIqIQeRgogXRic6z9luyu193nn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NSzQ7FoPd5T2GA0WI1QgC6PGR821TZrlCFmpayA/Yw4D9x5gwjLsS65qR+YQNyZIz
         lHerHfR7bORG8hCk460VKYPtMp0KEThg+Sw7k3mPUvgcnW4usRWYtAKWpVZRpUzae9
         tsbEknOqrvaFpMTySh6GVpxFdIsRZoL0K2CvXzbbIV4LcNzRnpvz7kMiUAPz6nDGiZ
         TctYxrYlv3eMg5JMgHHQbFbE6b3V59X8zj5yRrel/EjzFFHau6S1ba/5MaA3qkgbr8
         /qv4x7aTu5YGLET9x4p9O0ziUAPLObjFJMI85RtCf+k+QNFCNIU8RGVYSJguGtecsA
         wO4icOtwsSpMw==
Date:   Tue, 18 May 2021 21:26:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
Message-ID: <YKPjwvMh3sj56sOG@vkoul-mobl.Dlink>
References: <20210513175258.5842-1-jonathan@marek.ca>
 <20210513175258.5842-2-jonathan@marek.ca>
 <YKOltGEDEY1WXQN6@vkoul-mobl.Dlink>
 <abc662f3-8c36-862d-4d50-3628d3a02ee2@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc662f3-8c36-862d-4d50-3628d3a02ee2@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-21, 09:06, Jonathan Marek wrote:
> On 5/18/21 7:32 AM, Vinod Koul wrote:

> > > +static unsigned long
> > > +clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> > > +{
> > > +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > > +	u32 l, frac;
> > > +
> > > +	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> > > +	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
> > > +
> > > +	return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_BITWIDTH);
> > > +}
> > 
> > sounds like you could use clk_trion_pll_recalc_rate() instead
> > 
> 
> I had this thought as well, but alpha_width in clk_trion_pll_recalc()_rate
> is 16, here ALPHA_BITWIDTH is 32, so I just copied this from downstream.
> 
> I think changing pll_alpha_width() to return the right value for zonda will
> work and allow sharing the function, if you think that's a good idea?

Yes I thinking pll_alpha_width() should do the trick here

Thanks
-- 
~Vinod
