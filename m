Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FD6FF734
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 02:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfKQBlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 20:41:07 -0500
Received: from onstation.org ([52.200.56.107]:37386 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfKQBlH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 20:41:07 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 0C4BB3E994;
        Sun, 17 Nov 2019 01:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573954866;
        bh=XmvS7+nA1dTzQrdTxpuAt0vIN4tPeUuLw5YOA55oyuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pBzPFo5K801SvxfGM43XxkYE5zanhlelEKYj2o0HQQw6mE9blX3fAGG+Cl2mRL7LO
         50M0vaQrG0NgD7zt7wBMj8a6nRbTCy89uPZ5oqJPArRcOxBHhZpbCiA25MuwwURSxt
         d5JEFXyISymPcxhD7PRuCOgnIKPLjv7MbI9mfJE0=
Date:   Sat, 16 Nov 2019 20:41:05 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to
 rpm
Message-ID: <20191117014105.GA13775@onstation.org>
References: <20191115123931.18919-1-masneyb@onstation.org>
 <20191116185457.GA11601@onstation.org>
 <20191117012737.CED5B20730@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117012737.CED5B20730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 16, 2019 at 05:27:36PM -0800, Stephen Boyd wrote:
> Quoting Brian Masney (2019-11-16 10:54:57)
> > > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> > > index bcb0a397ef91..015426262d08 100644
> > > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > > @@ -2411,7 +2399,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
> > >       [VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
> > >       [VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
> > >       [MDP_CLK_SRC] = &mdp_clk_src.clkr,
> > > -     [GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
> > >       [JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
> > >       [JPEG1_CLK_SRC] = &jpeg1_clk_src.clkr,
> > >       [JPEG2_CLK_SRC] = &jpeg2_clk_src.clkr,
> > 
> > I just realized that I also need to remove the GFX3D_CLK_SRC #define
> > from include/dt-bindings/clock/qcom,mmcc-msm8974.h. I'll send out a v2
> > tomorrow evening.
> > 
> 
> Please don't change the binding. In reality the define will never be
> used but also in reality the clk exists, so it's fine to leave it in the
> binding.

OK, that makes sense. Thanks for your help on this.

Brian
