Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8958341B7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 07:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730527AbfFLFNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 01:13:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfFLFNc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 01:13:32 -0400
Received: from localhost (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7BDD2086A;
        Wed, 12 Jun 2019 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560316411;
        bh=pjKLLa6fq6+zEJ2xlibCltc+p1HsSk01Pj5/MlY2ZJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iYYxV8F6CPWY6jYRCAxFVekOXxjV6WSlfOmq3HrlFylIR/l0p+NMLFFRO0Ng/HobZ
         2HhHc1AA14PHqQZade24jDts7hKXRf/3+i9+9NNhe30osAKB+V8aWnmedaXKv5SDum
         Pz6YeNmMVIa3ebGceiOEa207ktGusnctmqHNjM7I=
Date:   Wed, 12 Jun 2019 10:40:23 +0530
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
Message-ID: <20190612051023.GB9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607175542.D9D56208C0@mail.kernel.org>
 <20190608091436.GF9160@vkoul-mobl.Dlink>
 <20190610150646.2003720859@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610150646.2003720859@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-19, 08:06, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-08 02:14:36)
> > On 07-06-19, 10:55, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-06-07 03:12:33)
> > 
> > > >  const struct clk_ops clk_alpha_pll_ops = {
> > > >         .enable = clk_alpha_pll_enable,
> > > >         .disable = clk_alpha_pll_disable,
> > > > @@ -902,6 +1079,10 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
> > > >         ret = regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
> > > >         if (ret)
> > > >                 return ret;
> > > > +       ret = regmap_update_bits(regmap, PLL_MODE(pll),
> > > > +                                PLL_BYPASSNL, PLL_BYPASSNL);
> > > > +       if (ret)
> > > > +               return ret;
> > > 
> > > What is this?
> > 
> > Sorry am not sure I understood the question. care to elaborate please?
> 
> The bypass bit of a PLL is very generic so I'm confused why the enable
> function is only gaining this bit setting logic now. Plus, it's all
> grouped together with the previous line so it looks like a possible
> stray addition to the code? And after this there's an early exit from
> the function if the PLL is already running, so we would put the PLL into
> bypass and then return? What's going on here?

Thanks for spotting that is wrong. I am not sure why this crept in , I
am not supposed to change this, will fix it in v2

-- 
~Vinod
