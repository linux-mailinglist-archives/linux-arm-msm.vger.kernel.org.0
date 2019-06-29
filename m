Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D3B5AB9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF2Nya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbfF2Nya (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:54:30 -0400
Received: from localhost (unknown [106.51.109.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A81BB2054F;
        Sat, 29 Jun 2019 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561816468;
        bh=EHxL98M55/xJkK41d2dTbtCQ1Wc0t80L58Pn3tMcQwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ov5vP0oofP82bplDtatRiHeMeD2qsye607IFDXLppgrmHeKp5rqYwf0lgP26Gam7D
         064h5kWASaPAEu9wo2f/7ZhvvTLaRuRCAJi016xUqxrLLLalD249rijLS7AV4QFsc6
         TaFtpfk30Zj8yg07+QKwucKa3hIK9Nb2Y6KtCNbA=
Date:   Sat, 29 Jun 2019 19:21:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: gcc: Add global clock controller
 driver for SM8150
Message-ID: <20190629135119.GF2911@vkoul-mobl>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-4-vkoul@kernel.org>
 <20190627213151.B94FA20B7C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627213151.B94FA20B7C@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-06-19, 14:31, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-24 23:31:40)
> > From: Deepak Katragadda <dkatraga@codeaurora.org>
> > 
> > Add the clocks supported in global clock controller which clock the
> > peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> > to the clock framework for the clients to be able to request for them.
> > 
> > Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > [vkoul: port to upstream and tidy-up]
> 
> This can say "changed to parent_data scheme"?
> 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
> >  drivers/clk/qcom/Kconfig                      |    7 +
> >  drivers/clk/qcom/Makefile                     |    1 +
> >  drivers/clk/qcom/gcc-sm8150.c                 | 3719 +++++++++++++++++
> >  include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
> >  5 files changed, 3971 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sm8150.c
> >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> > index 8661c3cd3ccf..1b39d949e63d 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> > @@ -23,6 +23,7 @@ Required properties :
> >                         "qcom,gcc-sdm630"
> >                         "qcom,gcc-sdm660"
> >                         "qcom,gcc-sdm845"
> > +                       "qcom,gcc-sm8150"
> >  
> >  - reg : shall contain base register location and length
> >  - #clock-cells : shall contain 1
> 
> I'd expect the binding to get a larger update indicating which clks come
> from outside the clk controller and need to be specified as 'clocks' and
> 'clock-names'.
> 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 18bdf34d5e64..076872d195fd 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -291,6 +291,13 @@ config SDM_LPASSCC_845
> >           Say Y if you want to use the LPASS branch clocks of the LPASS clock
> >           controller to reset the LPASS subsystem.
> >  
> > +config SM_GCC_8150
> > +       tristate "SM8150 Global Clock Controller"
> > +       help
> > +         Support for the global clock controller on SM8150 devices.
> > +         Say Y if you want to use peripheral devices such as UART,
> > +         SPI, I2C, USB, SD/eMMC, PCIe etc.
> 
> Is there eMMC support?
> 
> > +
> >  config SPMI_PMIC_CLKDIV
> >         tristate "SPMI PMIC clkdiv Support"
> >         depends on SPMI || COMPILE_TEST
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index f0768fb1f037..4a813b4055d0 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -50,6 +50,7 @@ obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
> >  obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
> >  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
> >  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> > +obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
> >  obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> >  obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
> >  obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
> > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > new file mode 100644
> > index 000000000000..11cd9e19f18d
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > @@ -0,0 +1,3719 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2017-19, The Linux Foundation. All rights reserved.
> 
> Is it really 2017-19 and not 2017-2019?

will update

> 
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/bitops.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/clk.h>
> 
> Is this include used?

will check and update

> 
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> > +
> > +#include <dt-bindings/clock/qcom,gcc-sm8150.h>
> > +
> > +#include "common.h"
> > +#include "clk-alpha-pll.h"
> > +#include "clk-branch.h"
> > +#include "clk-pll.h"
> > +#include "clk-rcg.h"
> > +#include "clk-regmap.h"
> > +#include "reset.h"
> > +
> > +#define GCC_NPU_MISC                           0x4d110
> > +#define GCC_GPU_MISC                           0x71028
> 
> Drop these defines please and inline the values.

Sure

> > +static const struct clk_parent_data gcc_parents_5[] = {
> > +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> > +       { .fw_name = "gpll0", .name = "gpll0" },
> > +       { .fw_name = "gpll7", .name = "gpll7" },
> > +       { .fw_name = "gpll0_out_even", .name = "gpll0_out_even" },
> 
> Aren't these gplls all created in this file? They shouldn't be listed in
> DT so I'm confused why we have .fw_name for them.

Yes they are and the DT doesnt provide these clock. From what I
understood from the name conversion to new schema was we should add it
like above, let me know if I missed something

> > +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> 
> If there isn't a legacy string name for core_bi_pll_test_se we should
> just leave it out and not have a .name field, just the .fw_name one.

Okay

> > +static const struct clk_parent_data gcc_parents_7[] = {
> > +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> > +       { .fw_name = "gpll0", .name = "gpll0" },
> > +       { .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
> > +       { .fw_name = "gpll0_out_even", .name = "gpll0_out_even" },
> > +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static struct pll_vco trion_vco[] = {
> 
> const?

will add

> > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > +       .offset = 0x0,
> > +       .post_div_shift = 8,
> > +       .post_div_table = post_div_table_trion_even,
> > +       .num_post_div = ARRAY_SIZE(post_div_table_trion_even),
> > +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
> > +       .width = 4,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "gpll0_out_even",
> > +               .parent_data = &(const struct clk_parent_data){
> > +                       .fw_name = "gpll0",
> > +                       .name = "gpll0",
> 
> Use a direct pointer? This applies in many places in the code.

okay will check here and other places

> > +static struct clk_branch gcc_video_ahb_clk = {
> > +       .halt_reg = 0xb004,
> > +       .halt_check = BRANCH_HALT_DELAY,
> > +       .hwcg_reg = 0xb004,
> > +       .hwcg_bit = 1,
> > +       .clkr = {
> > +               .enable_reg = 0xb004,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_video_ahb_clk",
> > +                       .flags = CLK_IS_CRITICAL,
> 
> Can you please add a comment around all CLK_IS_CRITICAL flags indicating
> why these clks can't be turned off?

okay will do

> > +static struct clk_branch gcc_video_axic_clk = {
> > +       .halt_reg = 0xb02c,
> > +       .halt_check = BRANCH_HALT,
> > +       .clkr = {
> > +               .enable_reg = 0xb02c,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_video_axic_clk",
> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> > +static struct clk_branch gcc_video_xo_clk = {
> > +       .halt_reg = 0xb040,
> > +       .halt_check = BRANCH_HALT_DELAY,
> 
> Why doesn't the halt bit work?

Not sure, will check and update

-- 
~Vinod
