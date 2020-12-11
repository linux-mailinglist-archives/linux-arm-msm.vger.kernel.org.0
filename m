Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70CB2D6FD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 06:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390350AbgLKFoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 00:44:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:45316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389684AbgLKFof (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 00:44:35 -0500
Date:   Fri, 11 Dec 2020 11:13:49 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607665434;
        bh=PljJxLBJRPp6E9yafYMRiexgxji55Oj5nbr6TTUvD6w=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtw4RwBetRI6XFhvIO0k3EeTJvPe8aSth2o+58zOJLgjEuVjDMmz5s/QXjfW91bRU
         6u41+hN3GnFx6n+qGey9i4tp+L9zWQncY75mYOpCMMcOhKOVV9V5TgplDXJeJS9q5V
         j2x1CTxn7Ojwai8XS+gjjZsET/mDJxHgKatmd6ESq4QSAMo2e9rzQ9NzuHUaPQAV5q
         3CSjroFUaH9Wq8h+nXuxGLtKQl66e+Vb9Bsdp07FRH2YPorqygoNkIpzD+AsCoqoSj
         emdcQhtSrT8vcGD2KhNZIOw/3gi3L6nH7+03Um6nCX0Xg+FZi6V+jHDC7Hfcg8EOap
         CNcOs+aL3k4zg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: gcc: Add clock driver for SM8350
Message-ID: <20201211054349.GS8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-6-vkoul@kernel.org>
 <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-12-20, 12:43, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-12-07 22:47:02)

> > +config SM_GCC_8350
> > +       tristate "SM8350 Global Clock Controller"
> > +       select QCOM_GDSC
> > +       help
> > +         Support for the global clock controller on SM8350 devices.
> > +         Say Y if you want to use peripheral devices such as UART,
> > +         SPI, I2C, USB, SD/UFS, PCIe etc.
> > +
> > +
> 
> Why double newline?

Will drop

> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> 
> Is this include used?

Will check this and others and drop unused ones

> 
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> 
> Please add newline here
> 
> > +#include <dt-bindings/clock/qcom,gcc-sm8350.h>
> 
> Please add newline here

Ok to both

> > +static const struct clk_parent_data gcc_parent_data_0[] = {
> > +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> > +       { .hw = &gcc_gpll0.clkr.hw },
> > +       { .hw = &gcc_gpll0_out_even.clkr.hw },
> > +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> 
> Is this .fw_name in the binding? Please remove .name everywhere in this
> driver as it shouldn't be necessary.

Ack will drop

> > +static const struct clk_parent_data gcc_parent_data_13[] = {
> > +       { .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk", .name =
> 
> Is this documented in the binding?

Not yet, will update

> > +static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
> > +       .cmd_rcgr = 0x1400c,
> > +       .mnd_width = 8,
> > +       .hid_width = 5,
> > +       .parent_map = gcc_parent_map_6,
> > +       .freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "gcc_sdcc2_apps_clk_src",
> > +               .parent_data = gcc_parent_data_6,
> > +               .num_parents = 6,
> > +               .flags = CLK_SET_RATE_PARENT,
> > +               .ops = &clk_rcg2_ops,
> 
> Please use floor ops per Doug's recent patch.

Yes

> > +static struct clk_branch gcc_camera_ahb_clk = {
> > +       .halt_reg = 0x26004,
> > +       .halt_check = BRANCH_HALT_DELAY,
> > +       .hwcg_reg = 0x26004,
> > +       .hwcg_bit = 1,
> > +       .clkr = {
> > +               .enable_reg = 0x26004,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_camera_ahb_clk",
> > +                       .flags = CLK_IS_CRITICAL,
> 
> Why is it critical? Can we just enable it in driver probe and stop
> modeling it as a clk?

it does not have a parent we control, yeah it would make sense to do
that. Tanya do you folks agree ..?

> > +static struct clk_branch gcc_video_axi0_clk = {
> > +       .halt_reg = 0x28010,
> > +       .halt_check = BRANCH_HALT_SKIP,
> 
> Do these need to be halt skip? Is the video axi clk stuff still broken?

I will check on this and update accordingly

> > +static int gcc_sm8350_probe(struct platform_device *pdev)
> > +{
> > +       struct regmap *regmap;
> > +       int ret;
> > +
> > +       regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
> > +       if (IS_ERR(regmap)) {
> > +               dev_err(&pdev->dev, "Failed to map gcc registers\n");
> > +               return PTR_ERR(regmap);
> > +       }
> > +
> > +       ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> 
> Why?

So I understood that this needs to be set so that ufs clocks can
propagate to ufs mem stuff..

-- 
~Vinod
