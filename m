Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C83015D7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgBNNJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 08:09:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgBNNJa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 08:09:30 -0500
Received: from localhost (unknown [106.201.58.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D02F02086A;
        Fri, 14 Feb 2020 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581685769;
        bh=S1KcqlRgaFv8iW8vw5VXuHf37fRz7NJhUiPg/24MFmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ew9lNr986QqTsMdVyURhpqV13JrXJfHXSDcBF5HSqYvPETinKZMV+FMEHTwrmmt3U
         EIcpnBgGSAfUYY4ClcqTE+zYekP6sLxR/JYKRQEhz3TmEIqTSzBlWZuK7Ypjmj4uXs
         ukwSWiU+C5n8Je0aDM44pz4T1WHEwJoU6Ig29yDk=
Date:   Fri, 14 Feb 2020 18:39:23 +0530
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
Subject: Re: [PATCH v2 6/7] clk: qcom: gcc: Add global clock controller
 driver for SM8250
Message-ID: <20200214130923.GV2618@vkoul-mobl>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
 <1579905147-12142-7-git-send-email-vnkgutta@codeaurora.org>
 <20200205194022.C5E8C20730@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205194022.C5E8C20730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-02-20, 11:40, Stephen Boyd wrote:

> > +static const struct clk_parent_data gcc_parent_data_2[] = {
> > +       { .fw_name = "bi_tcxo" },
> > +       { .fw_name = "sleep_clk", .name = "sleep_clk" },
> 
> Please drop .name

Yup, will do

> > +static const struct clk_parent_data gcc_parent_data_5[] = {
> > +       { .fw_name = "bi_tcxo" },
> > +       { .hw = &gpll0.clkr.hw },
> > +       { .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
> 
> Why have .name? Pleas remove it.

Dropped...

> > +       { .hw = &gpll0_out_even.clkr.hw },
> > +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> 
> Please drop these test inputs. I don't see any reason why they're listed.

Dropped this and rest.

> > +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
> > +       .halt_reg = 0x48198,
> > +       .halt_check = BRANCH_HALT_VOTED,
> > +       .clkr = {
> > +               .enable_reg = 0x52000,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_sys_noc_cpuss_ahb_clk",
> > +                       .parent_data = &(const struct clk_parent_data){
> > +                               .hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
> > +                       },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> 
> Is there a need for this clk to be exposed? Why can't we just turn the
> bit on in probe and ignore it after that? I'd prefer to not have
> CLK_IS_CRITICAL in this driver unless necessary.

yeah moved it as setting a bit in probe..

> > +       /*
> > +        * Keep the clocks always-ON
> > +        * GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK, GCC_DISP_AHB_CLK,
> > +        * GCC_CPUSS_DVM_BUS_CLK, GCC_GPU_CFG_AHB_CLK
> > +        */
> > +       regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
> > +       regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
> > +       regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
> > +       regmap_update_bits(regmap, 0x4818c, BIT(0), BIT(0));
> > +       regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
> 
> These look like the AHB clks above that we just enabled and then ignore.

right, I think these are rest of the always-on clocks

-- 
~Vinod
