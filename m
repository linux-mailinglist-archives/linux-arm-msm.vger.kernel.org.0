Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54392E6D2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 08:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfJ1HXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 03:23:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730346AbfJ1HXv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 03:23:51 -0400
Received: from localhost (unknown [106.51.111.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55C0520862;
        Mon, 28 Oct 2019 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572247430;
        bh=MnY9sr8I3bfHyxgfhK6PlMUwTFXVF6KB9th48q+55hU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b4ogPxgTJgDpixpNUnqTsRoNGC1DZ7c+avhWfncU8E7wECw5hkNIAKMpPMhrCCMYb
         lUHpbcv1h1zW2biieeveCL6fPYhgTgiv0XyEp7CJV55DkWxcFgLRfvNe8gZVxZO9Si
         053upwrbsrLLsx12wMUyp4VJ4LTEP3dOVNRIxbsY=
Date:   Mon, 28 Oct 2019 12:53:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Add missing clocks in SM8150
Message-ID: <20191028072347.GJ2620@vkoul-mobl>
References: <20190917091623.3453-1-vkoul@kernel.org>
 <20190917161000.DAFF3206C2@mail.kernel.org>
 <20191016122343.GM2654@vkoul-mobl>
 <20191017174820.F08422089C@mail.kernel.org>
 <20191021105435.GE2654@vkoul-mobl>
 <20191027212527.AE3D021783@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191027212527.AE3D021783@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-10-19, 14:25, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-10-21 03:54:35)
> > On 17-10-19, 10:48, Stephen Boyd wrote:
> > > > > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > > > > index 12ca2d14797f..13d4d14a5744 100644
> > > > > > --- a/drivers/clk/qcom/gcc-sm8150.c
> > > > > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > > > > @@ -1616,6 +1616,38 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
> > > > > >         },
> > > > > >  };
> > > > > >  
> > > > > > +static struct clk_branch gcc_gpu_gpll0_clk_src = {
> > > > > > +       .halt_check = BRANCH_HALT_SKIP,
> > > > > 
> > > > > Why skip?
> > > > 
> > > > I will explore and add comments for that
> > > > 
> > > > > > +       .clkr = {
> > > > > > +               .enable_reg = 0x52004,
> > > > > > +               .enable_mask = BIT(15),
> > > > > > +               .hw.init = &(struct clk_init_data){
> > > > > > +                       .name = "gcc_gpu_gpll0_clk_src",
> > > > > > +                       .parent_hws = (const struct clk_hw *[]){
> > > > > > +                               &gpll0.clkr.hw },
> > > > > > +                       .num_parents = 1,
> > > > > > +                       .flags = CLK_SET_RATE_PARENT,
> > > > > > +                       .ops = &clk_branch2_ops,
> > > > > > +               },
> > > > > > +       },
> > > > > > +};
> > > > > > +
> > > > > > +static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > > > > > +       .halt_check = BRANCH_HALT_SKIP,
> > > > > 
> > > > > Why skip?
> > > > > 
> > > 
> > > Any answer from the explorations?
> > 
> > Yeah so asking around the answer I got is that these are external
> > clocks and we need cannot rely on CLK_OFF bit for these clocks
> > 
> 
> The parents are from some other clk controller? Not external to the
> chip, right? If so, I still don't get it. Please add some sort of
> comment here in the code.


Yeah I have added a comment and posted v2 few days back.

Thanks
-- 
~Vinod
