Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0B8DEA1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbfJUKym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:54:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbfJUKym (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:54:42 -0400
Received: from localhost (unknown [122.167.89.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7C312084C;
        Mon, 21 Oct 2019 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571655281;
        bh=srwHuD0lo16NVSzjhCThWYlUnoPlX9YoO5j7NRULxdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RL3HCWhSQ2jGJEw9H6tsjmhgDA+z6Gm2zN9ErDotrROI5QMlSUMtYuva2i3HI1eK0
         Cdk4RmwHyG6z09grMmeK2Tj3cXz6blS1u/blWTOTJdDQbYAAe3824ZQG61g1jbhWsk
         t0F/yjMwrcQF5iIjZGoPVt+/rJ77xtQ8L/1xE5/M=
Date:   Mon, 21 Oct 2019 16:24:35 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Add missing clocks in SM8150
Message-ID: <20191021105435.GE2654@vkoul-mobl>
References: <20190917091623.3453-1-vkoul@kernel.org>
 <20190917161000.DAFF3206C2@mail.kernel.org>
 <20191016122343.GM2654@vkoul-mobl>
 <20191017174820.F08422089C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017174820.F08422089C@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-10-19, 10:48, Stephen Boyd wrote:
> > > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > > index 12ca2d14797f..13d4d14a5744 100644
> > > > --- a/drivers/clk/qcom/gcc-sm8150.c
> > > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > > @@ -1616,6 +1616,38 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
> > > >         },
> > > >  };
> > > >  
> > > > +static struct clk_branch gcc_gpu_gpll0_clk_src = {
> > > > +       .halt_check = BRANCH_HALT_SKIP,
> > > 
> > > Why skip?
> > 
> > I will explore and add comments for that
> > 
> > > > +       .clkr = {
> > > > +               .enable_reg = 0x52004,
> > > > +               .enable_mask = BIT(15),
> > > > +               .hw.init = &(struct clk_init_data){
> > > > +                       .name = "gcc_gpu_gpll0_clk_src",
> > > > +                       .parent_hws = (const struct clk_hw *[]){
> > > > +                               &gpll0.clkr.hw },
> > > > +                       .num_parents = 1,
> > > > +                       .flags = CLK_SET_RATE_PARENT,
> > > > +                       .ops = &clk_branch2_ops,
> > > > +               },
> > > > +       },
> > > > +};
> > > > +
> > > > +static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > > > +       .halt_check = BRANCH_HALT_SKIP,
> > > 
> > > Why skip?
> > > 
> 
> Any answer from the explorations?

Yeah so asking around the answer I got is that these are external
clocks and we need cannot rely on CLK_OFF bit for these clocks

Thanks

-- 
~Vinod
