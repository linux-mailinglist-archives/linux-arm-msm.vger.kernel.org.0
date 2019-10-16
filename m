Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F03D90B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 14:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389013AbfJPMXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 08:23:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387581AbfJPMXy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 08:23:54 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C34B6218DE;
        Wed, 16 Oct 2019 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571228632;
        bh=tpyw6dnWtRktL2mWFhpiJUG5Thn3Q7Jh+AkFL2KBI+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qa/l60b2JJTcUZ278R7jNoVGx28q8QiwPDjwOtI1jkSn/4IzfMZFipQJWoSj3cHm9
         324dSyDpVJWSuUWz58xXxLajnhCAGqgQS0rpyf2eNJ27gsgFeuLPyeymiCitTgXFGD
         O51IqEr0niNCj4CXPP4J2l59dA6ubVPC7XIUA5Vg=
Date:   Wed, 16 Oct 2019 17:53:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Add missing clocks in SM8150
Message-ID: <20191016122343.GM2654@vkoul-mobl>
References: <20190917091623.3453-1-vkoul@kernel.org>
 <20190917161000.DAFF3206C2@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917161000.DAFF3206C2@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve,

Looks like I missed replying to this one, apologies!

On 17-09-19, 09:09, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-09-17 02:16:23)
> > The initial upstreaming of SM8150 GCC driver missed few clock so add
> > them up now.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Should have some sort of fixes tag?

Not really, the drivers to use these clks are not upstream so we dont
miss it yet

> 
> >  drivers/clk/qcom/gcc-sm8150.c | 172 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > index 12ca2d14797f..13d4d14a5744 100644
> > --- a/drivers/clk/qcom/gcc-sm8150.c
> > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > @@ -1616,6 +1616,38 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
> >         },
> >  };
> >  
> > +static struct clk_branch gcc_gpu_gpll0_clk_src = {
> > +       .halt_check = BRANCH_HALT_SKIP,
> 
> Why skip?

I will explore and add comments for that

> > +       .clkr = {
> > +               .enable_reg = 0x52004,
> > +               .enable_mask = BIT(15),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_gpu_gpll0_clk_src",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gpll0.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> > +static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > +       .halt_check = BRANCH_HALT_SKIP,
> 
> Why skip?
> 
> > +       .clkr = {
> > +               .enable_reg = 0x52004,
> > +               .enable_mask = BIT(16),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_gpu_gpll0_div_clk_src",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gcc_gpu_gpll0_clk_src.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> >  static struct clk_branch gcc_gpu_iref_clk = {
> >         .halt_reg = 0x8c010,
> >         .halt_check = BRANCH_HALT,
> > @@ -1698,6 +1730,38 @@ static struct clk_branch gcc_npu_cfg_ahb_clk = {
> >         },
> >  };
> >  
> > +static struct clk_branch gcc_npu_gpll0_clk_src = {
> > +       .halt_check = BRANCH_HALT_SKIP,
> > +       .clkr = {
> > +               .enable_reg = 0x52004,
> > +               .enable_mask = BIT(18),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_npu_gpll0_clk_src",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gpll0.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> > +static struct clk_branch gcc_npu_gpll0_div_clk_src = {
> > +       .halt_check = BRANCH_HALT_SKIP,
> > +       .clkr = {
> > +               .enable_reg = 0x52004,
> > +               .enable_mask = BIT(19),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_npu_gpll0_div_clk_src",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gcc_npu_gpll0_clk_src.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> >  static struct clk_branch gcc_npu_trig_clk = {
> >         .halt_reg = 0x4d00c,
> >         .halt_check = BRANCH_VOTED,
> > @@ -2812,6 +2876,42 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_ctl_clk = {
> >         },
> >  };
> >  
> > +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk = {
> > +       .halt_check = BRANCH_HALT_SKIP,
> 
> Can't we fix the UFS driver to not require this anymore? This is the
> fourth or fifth time I've asked for this.

yeah Bjorn did tell me that and I think there was some other thread on
similar lines. So is this fine by you.

-- 
~Vinod
