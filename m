Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193E23AAF44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 11:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhFQJFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 05:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFQJFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 05:05:15 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6E3C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 02:03:08 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id x19so2588865pln.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bul11zBN7cLg7iG3/hjjZ9JH3X0YSX6Y7UmrtsRd2E=;
        b=k8/oQ8/slyHt5Z9Ck9kG9dj44Jt8R6yZdnJdIKEOlY+jTwoC9UBtREMGVa0WGqVSQu
         jNj4ejPtRNp3wYsUVGXbwTFBLigGqrLgEt7sGrirQGgbZpND6CbtgIPufDHXhGSUSemO
         4avASrvfIUuGUud4oq42haR6xLAOb7SMmhDTUXJc5yyCMaoKryCLCTC0B61tmS99fpW5
         btTF6J0gFKuFhpHYpwNSAxVDCL6UeRVGjFZM6whlLHqpPCVhEz8VNhZ7MKwBrGm8CnaL
         XpiDfsBVc4mJOp5mGz5qmMeBGKmK3xxvv7ISIXBHKzSxFzO0VMRCKf/SHhRyoKZii4vj
         vs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bul11zBN7cLg7iG3/hjjZ9JH3X0YSX6Y7UmrtsRd2E=;
        b=Qiw4PY0Q6HDKHHNCQ7lMFvXLXYc/0mnI8ZCKx94BD2HUe4BP6zj+P+Xi8YvZqf+Yrc
         54Y0z/4/Lsu4WCMfrSU7bwNHaYEiyosNd9vnDosMs6IF0CxYMUx/zbPPMyt/kv+1hHq3
         4qyQYfW+AW1+DnsxYwLLi8zH66G2tR1kn5NSyFHVkWVHmIEjGssD/ItAJViAhWDLyulk
         V3NbQXffXvbjo62UvlSozIJTvpScggXh5CE9COB0HdGBYvAm9VXtyhQ9QIRlSCOzPTR8
         hmKhgWUx7smYq2IQNCvhiJkqpFrre5AnMJ46iFIDmQwAq8WtGzhs++rA95nJLg1NzE95
         ynag==
X-Gm-Message-State: AOAM532g1Z5hVShyhBwbNdxcEUG6xvoVvB1eQmF7OUOmrlUMxxeL1UKG
        U5dwzerPd/pnmhF3m3WbdZNpD31HbMS4ldyY1EtSUw==
X-Google-Smtp-Source: ABdhPJzVov5J6/7oNCnaLVHnIfgfSAOOz/z9l2l07BCMgXUsNZJgjJhqvG+7sZRceE0XHCcK6fbyS9hOHHLkKx8gyxk=
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr3543003pls.28.1623920587349; Thu, 17
 Jun 2021 02:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-7-robert.foss@linaro.org> <ca6ff020-cd13-e242-ab74-085958e9fc82@somainline.org>
In-Reply-To: <ca6ff020-cd13-e242-ab74-085958e9fc82@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 17 Jun 2021 11:02:55 +0200
Message-ID: <CAG3jFysRuF=xkTaPK3efDW20cQ3hXLqqsT7J5YVgYvO1dmFOvA@mail.gmail.com>
Subject: Re: [RFC v1 06/11] clk: qcom: Add display clock controller driver for SM8350
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

H ey Konrad,

On Wed, 16 Jun 2021 at 17:42, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 16.06.2021 16:11, Robert Foss wrote:
> > Add support for the display clock controller found on SM8350.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig         |    9 +
> >  drivers/clk/qcom/Makefile        |    1 +
> >  drivers/clk/qcom/dispcc-sm8350.c | 1402 ++++++++++++++++++++++++++++++
> >  3 files changed, 1412 insertions(+)
> >  create mode 100644 drivers/clk/qcom/dispcc-sm8350.c
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 45646b867cdb..f7c99f97fa57 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -492,6 +492,15 @@ config SM_DISPCC_8250
> >         Say Y if you want to support display devices and functionality such as
> >         splash screen.
> >
> > +config SM_DISPCC_8350
> > +     tristate "SM8350 Display Clock Controller"
> > +     depends on SM_GCC_8350
> > +     help
> > +       Support for the display clock controller on Qualcomm Technologies, Inc
> > +       SM8350 devices.
> > +       Say Y if you want to support display devices and functionality such as
> > +       splash screen.
> > +
> >  config SM_GCC_8150
> >       tristate "SM8150 Global Clock Controller"
> >       help
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index c8291312e723..69dc2a9f43d7 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -74,6 +74,7 @@ obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
> >  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> >  obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
> >  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
> > +obj-$(CONFIG_SM_DISPCC_8350) += dispcc-sm8350.o
> >  obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
> >  obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
> >  obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
> > diff --git a/drivers/clk/qcom/dispcc-sm8350.c b/drivers/clk/qcom/dispcc-sm8350.c
> > new file mode 100644
> > index 000000000000..ba53d682e174
> > --- /dev/null
> > +++ b/drivers/clk/qcom/dispcc-sm8350.c
> > @@ -0,0 +1,1402 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
> > +
> > +#include "clk-alpha-pll.h"
> > +#include "clk-branch.h"
> > +#include "clk-rcg.h"
> > +#include "clk-regmap-divider.h"
> > +#include "common.h"
> > +#include "gdsc.h"
> > +#include "reset.h"
> > +
> > +enum {
> > +     P_BI_TCXO,
> > +     P_CORE_BI_PLL_TEST_SE,
>
> Is the test clock any useful in practice? Many drivers don't include it.
>

Possibly not, I'm not familiar with this specific clock. I'll remove it.

>
>
> > +     P_DISP_CC_PLL0_OUT_MAIN,
> > +     P_DISP_CC_PLL1_OUT_EVEN,
> > +     P_DISP_CC_PLL1_OUT_MAIN,
> > +     P_DP_PHY_PLL_LINK_CLK,
> > +     P_DP_PHY_PLL_VCO_DIV_CLK,
> > +     P_DPTX1_PHY_PLL_LINK_CLK,
> > +     P_DPTX1_PHY_PLL_VCO_DIV_CLK,
> > +     P_DPTX2_PHY_PLL_LINK_CLK,
> > +     P_DPTX2_PHY_PLL_VCO_DIV_CLK,
> > +     P_DSI0_PHY_PLL_OUT_BYTECLK,
> > +     P_DSI0_PHY_PLL_OUT_DSICLK,
> > +     P_DSI1_PHY_PLL_OUT_BYTECLK,
> > +     P_DSI1_PHY_PLL_OUT_DSICLK,
> > +     P_EDP_PHY_PLL_LINK_CLK,
> > +     P_EDP_PHY_PLL_VCO_DIV_CLK,
> > +     P_SLEEP_CLK,
> > +};
> > +
> > +static struct pll_vco vco_table[] = {
> > +     { 249600000, 1750000000, 0 },
> > +};
> > +
> > +static const struct alpha_pll_config disp_cc_pll0_config = {
> > +     .l = 0x47,
>
> Is the ".cal_l = 0x44," part from downstream not necessary?

Yes it is. I went back and forth about  'cal_l', but in the end the
only value it is ever set to is 0x44, which is also what the default
value is. So there is no need for representing it explicitly at the
moment.

>
>
> > +     .alpha = 0xE000,
> > +     .config_ctl_val = 0x20485699,
> > +     .config_ctl_hi_val = 0x00002261,
> > +     .config_ctl_hi1_val = 0x2A9A699C,
> > +     .test_ctl_val = 0x00000000,
> > +     .test_ctl_hi_val = 0x00000000,
> > +     .test_ctl_hi1_val = 0x01800000,
> > +     .user_ctl_val = 0x00000000,
> > +     .user_ctl_hi_val = 0x00000805,
> > +     .user_ctl_hi1_val = 0x00000000,
> > +};
> > +
> > +static struct clk_init_data disp_cc_pll0_init = {
> > +     .name = "disp_cc_pll0",
> > +     .parent_data = &(const struct clk_parent_data){
> > +             .fw_name = "bi_tcxo",
> > +     },
> > +     .num_parents = 1,
> > +     .ops = &clk_alpha_pll_lucid_5lpe_ops,
> > +};
> > +
> > +static struct clk_alpha_pll disp_cc_pll0 = {
> > +     .offset = 0x0,
> > +     .vco_table = vco_table,
> > +     .num_vco = ARRAY_SIZE(vco_table),
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr.hw.init = &disp_cc_pll0_init
> > +};
> > +
> > +static const struct alpha_pll_config disp_cc_pll1_config = {
> > +     .l = 0x1F,
>
> Ditto

Sorry, ditto what?

>
>
>
> > +     .alpha = 0x4000,
> > +     .config_ctl_val = 0x20485699,
> > +     .config_ctl_hi_val = 0x00002261,
> > +     .config_ctl_hi1_val = 0x2A9A699C,
> > +     .test_ctl_val = 0x00000000,
> > +     .test_ctl_hi_val = 0x00000000,
> > +     .test_ctl_hi1_val = 0x01800000,
> > +     .user_ctl_val = 0x00000000,
> > +     .user_ctl_hi_val = 0x00000805,
> > +     .user_ctl_hi1_val = 0x00000000,
> > +};
> > +
> > +static struct clk_init_data disp_cc_pll1_init = {
> > +     .name = "disp_cc_pll1",
> > +     .parent_data = &(const struct clk_parent_data){
> > +             .fw_name = "bi_tcxo",
> > +     },
> > +     .num_parents = 1,
> > +     .ops = &clk_alpha_pll_lucid_5lpe_ops,
> > +};
> > +
> > +static struct clk_alpha_pll disp_cc_pll1 = {
> > +     .offset = 0x1000,
> > +     .vco_table = vco_table,
> > +     .num_vco = ARRAY_SIZE(vco_table),
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr.hw.init = &disp_cc_pll1_init
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_0[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_DP_PHY_PLL_LINK_CLK, 1 },
> > +     { P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> > +     { P_DPTX1_PHY_PLL_LINK_CLK, 3 },
> > +     { P_DPTX1_PHY_PLL_VCO_DIV_CLK, 4 },
> > +     { P_DPTX2_PHY_PLL_LINK_CLK, 5 },
> > +     { P_DPTX2_PHY_PLL_VCO_DIV_CLK, 6 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_0[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "dp_phy_pll_link_clk" },
> > +     { .fw_name = "dp_phy_pll_vco_div_clk" },
> > +     { .fw_name = "dptx1_phy_pll_link_clk" },
> > +     { .fw_name = "dptx1_phy_pll_vco_div_clk" },
> > +     { .fw_name = "dptx2_phy_pll_link_clk" },
> > +     { .fw_name = "dptx2_phy_pll_vco_div_clk" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_1[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_1[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_1_ao[] = {
> > +     { .fw_name = "bi_tcxo_ao" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_2[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> > +     { P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_2[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "dsi0_phy_pll_out_byteclk" },
> > +     { .fw_name = "dsi1_phy_pll_out_byteclk", },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_3[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_EDP_PHY_PLL_LINK_CLK, 1 },
> > +     { P_EDP_PHY_PLL_VCO_DIV_CLK, 2 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_3[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "edp_phy_pll_link_clk" },
> > +     { .fw_name = "edp_phy_pll_vco_div_clk" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_4[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_DISP_CC_PLL0_OUT_MAIN, 1 },
> > +     { P_DISP_CC_PLL1_OUT_MAIN, 4 },
> > +     { P_DISP_CC_PLL1_OUT_EVEN, 5 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_4[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .hw = &disp_cc_pll0.clkr.hw },
> > +     { .hw = &disp_cc_pll1.clkr.hw },
> > +     { .hw = &disp_cc_pll1.clkr.hw },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_5[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> > +     { P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_5[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "dsi0_phy_pll_out_dsiclk" },
> > +     { .fw_name = "dsi1_phy_pll_out_dsiclk" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_6[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_DISP_CC_PLL1_OUT_MAIN, 4 },
> > +     { P_DISP_CC_PLL1_OUT_EVEN, 5 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_6[] = {
> > +     { .fw_name = "bi_tcxo" },
> > +     { .hw = &disp_cc_pll1.clkr.hw },
> > +     { .hw = &disp_cc_pll1.clkr.hw },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct parent_map disp_cc_parent_map_7[] = {
> > +     { P_SLEEP_CLK, 0 },
> > +     { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data disp_cc_parent_data_7[] = {
> > +     { .fw_name = "sleep_clk" },
> > +     { .fw_name = "core_bi_pll_test_se" },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
> > +     F(19200000, P_BI_TCXO, 1, 0, 0),
> > +     F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
> > +     F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
> > +     .cmd_rcgr = 0x22a0,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_6,
> > +     .freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
> > +     .flags = HW_CLK_CTRL_MODE,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_ahb_clk_src",
> > +             .parent_data = disp_cc_parent_data_6,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_mdss_byte0_clk_src[] = {
> > +     F(19200000, P_BI_TCXO, 1, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
> > +     .cmd_rcgr = 0x210c,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_2,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_byte0_clk_src",
> > +             .parent_data = disp_cc_parent_data_2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_byte2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
> > +     .cmd_rcgr = 0x2128,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_2,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_byte1_clk_src",
> > +             .parent_data = disp_cc_parent_data_2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_byte2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_aux1_clk_src = {
> > +     .cmd_rcgr = 0x223c,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_1,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_aux1_clk_src",
> > +             .parent_data = disp_cc_parent_data_1,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
> > +     .cmd_rcgr = 0x21d8,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_1,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_aux_clk_src",
> > +             .parent_data = disp_cc_parent_data_1,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] = {
> > +     F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> > +     F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> > +     F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> > +     F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
> > +     .cmd_rcgr = 0x2208,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_0,
> > +     .freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_link1_clk_src",
> > +             .parent_data = disp_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
> > +     .cmd_rcgr = 0x2174,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_0,
> > +     .freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_link_clk_src",
> > +             .parent_data = disp_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
> > +     .cmd_rcgr = 0x21c0,
> > +     .mnd_width = 16,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_0,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_pixel1_clk_src",
> > +             .parent_data = disp_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_dp_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_pixel2_clk_src = {
> > +     .cmd_rcgr = 0x21f0,
> > +     .mnd_width = 16,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_0,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_pixel2_clk_src",
> > +             .parent_data = disp_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_dp_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
> > +     .cmd_rcgr = 0x21a8,
> > +     .mnd_width = 16,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_0,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_dp_pixel_clk_src",
> > +             .parent_data = disp_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_dp_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_edp_aux_clk_src = {
> > +     .cmd_rcgr = 0x2288,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_1,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_edp_aux_clk_src",
> > +             .parent_data = disp_cc_parent_data_1,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_edp_link_clk_src = {
> > +     .cmd_rcgr = 0x226c,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_3,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_edp_link_clk_src",
> > +             .parent_data = disp_cc_parent_data_3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_edp_pixel_clk_src = {
> > +     .cmd_rcgr = 0x2254,
> > +     .mnd_width = 16,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_3,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_edp_pixel_clk_src",
> > +             .parent_data = disp_cc_parent_data_3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_dp_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
> > +     .cmd_rcgr = 0x2144,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_2,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_esc0_clk_src",
> > +             .parent_data = disp_cc_parent_data_2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
> > +     .cmd_rcgr = 0x215c,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_2,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_esc1_clk_src",
> > +             .parent_data = disp_cc_parent_data_2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
> > +     F(19200000, P_BI_TCXO, 1, 0, 0),
> > +     F(85714286, P_DISP_CC_PLL1_OUT_MAIN, 7, 0, 0),
> > +     F(100000000, P_DISP_CC_PLL1_OUT_MAIN, 6, 0, 0),
> > +     F(150000000, P_DISP_CC_PLL1_OUT_MAIN, 4, 0, 0),
> > +     F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
> > +     F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
> > +     F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
> > +     F(460000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
> > +     .cmd_rcgr = 0x20c4,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_4,
> > +     .freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> > +     .flags = HW_CLK_CTRL_MODE,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_mdp_clk_src",
> > +             .parent_data = disp_cc_parent_data_4,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
> > +     .cmd_rcgr = 0x2094,
> > +     .mnd_width = 8,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_5,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_pclk0_clk_src",
> > +             .parent_data = disp_cc_parent_data_5,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_pixel_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
> > +     .cmd_rcgr = 0x20ac,
> > +     .mnd_width = 8,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_5,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_pclk1_clk_src",
> > +             .parent_data = disp_cc_parent_data_5,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_pixel_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_mdss_rot_clk_src[] = {
> > +     F(19200000, P_BI_TCXO, 1, 0, 0),
> > +     F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
> > +     F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
> > +     F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
> > +     F(460000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
> > +     .cmd_rcgr = 0x20dc,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_4,
> > +     .freq_tbl = ftbl_disp_cc_mdss_rot_clk_src,
> > +     .flags = HW_CLK_CTRL_MODE,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_rot_clk_src",
> > +             .parent_data = disp_cc_parent_data_4,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
> > +     .cmd_rcgr = 0x20f4,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_1,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_mdss_vsync_clk_src",
> > +             .parent_data = disp_cc_parent_data_1,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_disp_cc_sleep_clk_src[] = {
> > +     F(32000, P_SLEEP_CLK, 1, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_sleep_clk_src = {
> > +     .cmd_rcgr = 0x6060,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_7,
> > +     .freq_tbl = ftbl_disp_cc_sleep_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_sleep_clk_src",
> > +             .parent_data = disp_cc_parent_data_7,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_xo_clk_src = {
> > +     .cmd_rcgr = 0x6044,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = disp_cc_parent_map_1,
> > +     .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "disp_cc_xo_clk_src",
> > +             .parent_data = disp_cc_parent_data_1_ao,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1_ao),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
> > +     .reg = 0x2124,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_byte0_div_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_regmap_div_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
> > +     .reg = 0x2140,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_byte1_div_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_regmap_div_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div disp_cc_mdss_dp_link1_div_clk_src = {
> > +     .reg = 0x2220,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_dp_link1_div_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
> > +     .reg = 0x218c,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_dp_link_div_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div disp_cc_mdss_edp_link_div_clk_src = {
> > +     .reg = 0x2284,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_edp_link_div_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .hw = &disp_cc_mdss_edp_link_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_ahb_clk = {
> > +     .halt_reg = 0x207c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x207c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_ahb_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_byte0_clk = {
> > +     .halt_reg = 0x2028,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2028,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_byte0_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
> > +     .halt_reg = 0x202c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x202c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_byte0_intf_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_byte1_clk = {
> > +     .halt_reg = 0x2030,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2030,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_byte1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
> > +     .halt_reg = 0x2034,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2034,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_byte1_intf_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_aux1_clk = {
> > +     .halt_reg = 0x2068,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2068,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_aux1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_aux1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_aux_clk = {
> > +     .halt_reg = 0x2054,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2054,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_aux_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_link1_clk = {
> > +     .halt_reg = 0x205c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x205c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_link1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_link1_intf_clk = {
> > +     .halt_reg = 0x2060,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2060,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_link1_intf_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_link1_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_link_clk = {
> > +     .halt_reg = 0x2040,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2040,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_link_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
> > +     .halt_reg = 0x2044,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2044,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_link_intf_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
> > +                     },
>
> I think using parent_hws for single-parent clocks is the way to go now.
>
>
>

Ack.

> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
> > +     .halt_reg = 0x2050,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2050,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_pixel1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_pixel2_clk = {
> > +     .halt_reg = 0x2058,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2058,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_pixel2_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_pixel2_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
> > +     .halt_reg = 0x204c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x204c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_dp_pixel_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_edp_aux_clk = {
> > +     .halt_reg = 0x2078,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2078,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_edp_aux_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_edp_aux_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_edp_link_clk = {
> > +     .halt_reg = 0x2070,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2070,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_edp_link_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_edp_link_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
> > +     .halt_reg = 0x2074,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2074,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_edp_link_intf_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_edp_link_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_edp_pixel_clk = {
> > +     .halt_reg = 0x206c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x206c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_edp_pixel_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_edp_pixel_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_esc0_clk = {
> > +     .halt_reg = 0x2038,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2038,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_esc0_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_esc1_clk = {
> > +     .halt_reg = 0x203c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x203c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_esc1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_mdp_clk = {
> > +     .halt_reg = 0x200c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x200c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_mdp_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
> > +     .halt_reg = 0x201c,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x201c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_mdp_lut_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
> > +     .halt_reg = 0x4004,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x4004,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_non_gdsc_ahb_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_pclk0_clk = {
> > +     .halt_reg = 0x2004,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2004,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_pclk0_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_pclk1_clk = {
> > +     .halt_reg = 0x2008,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2008,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_pclk1_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_rot_clk = {
> > +     .halt_reg = 0x2014,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2014,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_rot_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
> > +     .halt_reg = 0x400c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x400c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_rscc_ahb_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
> > +     .halt_reg = 0x4008,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x4008,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_rscc_vsync_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     }, &
> > +};
> > +
> > +static struct clk_branch disp_cc_mdss_vsync_clk = {
> > +     .halt_reg = 0x2024,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x2024,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_mdss_vsync_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch disp_cc_sleep_clk = {
> > +     .halt_reg = 0x6078,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x6078,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "disp_cc_sleep_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .hw = &disp_cc_sleep_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct gdsc mdss_gdsc = {
> > +     .gdscr = 0x3000,
> > +     .pd = {
> > +             .name = "mdss_gdsc",
> > +     },
> > +     .pwrsts = PWRSTS_OFF_ON,
> > +     .flags = HW_CTRL,
>
> Downstream source [1] has "qcom,retain-regs;" here, doesn't that
>
> imply need for RETAIN_FF_ENABLE?
>
>

I don't actually know how "qcom,retain-regs;" & RETAIN_FF_ENABLE are related.

I looked at dispcc-sm8250 for inspiration, but upon further
investigation I'm not finding the corresponding gdsc
(disp_cc_mdss_core_gdsc) for sm8250.

Either way, I'm happy to add this flag, but I don't know if it would
be correct to add.



>
> > +     .supply = "mmcx",
> > +};
> > +
> > +static struct clk_regmap *disp_cc_sm8350_clocks[] = {
> > +     [DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
> > +     [DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
> > +     [DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
> > +     [DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
> > +     [DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
> > +     [DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
> > +     [DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
> > +     [DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
> > +     [DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
> > +     [DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
> > +     [DISP_CC_MDSS_DP_AUX1_CLK] = &disp_cc_mdss_dp_aux1_clk.clkr,
> > +     [DISP_CC_MDSS_DP_AUX1_CLK_SRC] = &disp_cc_mdss_dp_aux1_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_AUX_CLK] = &disp_cc_mdss_dp_aux_clk.clkr,
> > +     [DISP_CC_MDSS_DP_AUX_CLK_SRC] = &disp_cc_mdss_dp_aux_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_LINK1_CLK] = &disp_cc_mdss_dp_link1_clk.clkr,
> > +     [DISP_CC_MDSS_DP_LINK1_CLK_SRC] = &disp_cc_mdss_dp_link1_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = &disp_cc_mdss_dp_link1_div_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_LINK1_INTF_CLK] = &disp_cc_mdss_dp_link1_intf_clk.clkr,
> > +     [DISP_CC_MDSS_DP_LINK_CLK] = &disp_cc_mdss_dp_link_clk.clkr,
> > +     [DISP_CC_MDSS_DP_LINK_CLK_SRC] = &disp_cc_mdss_dp_link_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dp_link_div_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_LINK_INTF_CLK] = &disp_cc_mdss_dp_link_intf_clk.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL1_CLK] = &disp_cc_mdss_dp_pixel1_clk.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL1_CLK_SRC] = &disp_cc_mdss_dp_pixel1_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL2_CLK] = &disp_cc_mdss_dp_pixel2_clk.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL2_CLK_SRC] = &disp_cc_mdss_dp_pixel2_clk_src.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL_CLK] = &disp_cc_mdss_dp_pixel_clk.clkr,
> > +     [DISP_CC_MDSS_DP_PIXEL_CLK_SRC] = &disp_cc_mdss_dp_pixel_clk_src.clkr,
> > +     [DISP_CC_MDSS_EDP_AUX_CLK] = &disp_cc_mdss_edp_aux_clk.clkr,
> > +     [DISP_CC_MDSS_EDP_AUX_CLK_SRC] = &disp_cc_mdss_edp_aux_clk_src.clkr,
> > +     [DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
> > +     [DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
> > +     [DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_edp_link_div_clk_src.clkr,
> > +     [DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
> > +     [DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
> > +     [DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
> > +     [DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
> > +     [DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
> > +     [DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
> > +     [DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
> > +     [DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
> > +     [DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
> > +     [DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
> > +     [DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
> > +     [DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
> > +     [DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
> > +     [DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
> > +     [DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
> > +     [DISP_CC_MDSS_ROT_CLK] = &disp_cc_mdss_rot_clk.clkr,
> > +     [DISP_CC_MDSS_ROT_CLK_SRC] = &disp_cc_mdss_rot_clk_src.clkr,
> > +     [DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
> > +     [DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
> > +     [DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
> > +     [DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
> > +     [DISP_CC_PLL0] = &disp_cc_pll0.clkr,
> > +     [DISP_CC_PLL1] = &disp_cc_pll1.clkr,
> > +     [DISP_CC_SLEEP_CLK] = &disp_cc_sleep_clk.clkr,
> > +     [DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
> > +     [DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
> > +};
> > +
> > +static const struct qcom_reset_map disp_cc_sm8350_resets[] = {
> > +     [DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
> > +     [DISP_CC_MDSS_RSCC_BCR] = { 0x4000 },
> > +};
> > +
> > +static struct gdsc *disp_cc_sm8350_gdscs[] = {
> > +     [MDSS_GDSC] = &mdss_gdsc,
> > +};
> > +
> > +static const struct regmap_config disp_cc_sm8350_regmap_config = {
> > +     .reg_bits = 32,
> > +     .reg_stride = 4,
> > +     .val_bits = 32,
> > +     .max_register = 0x10000,
> > +     .fast_io = true,
> > +}; at
> > +
> > +static struct qcom_cc_desc disp_cc_sm8350_desc = {
> > +     .config = &disp_cc_sm8350_regmap_config,
> > +     .clks = disp_cc_sm8350_clocks,
> > +     .num_clks = ARRAY_SIZE(disp_cc_sm8350_clocks),
> > +     .resets = disp_cc_sm8350_resets,
> > +     .num_resets = ARRAY_SIZE(disp_cc_sm8350_resets),
> > +     .gdscs = disp_cc_sm8350_gdscs,
> > +     .num_gdscs = ARRAY_SIZE(disp_cc_sm8350_gdscs),
> > +};
> > +
> > +static const struct of_device_id disp_cc_sm8350_match_table[] = {
> > +     { .compatible = "qcom,sm8350-dispcc" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, disp_cc_sm8350_match_table);
> > +
> > +static int disp_cc_sm8350_probe(struct platform_device *pdev)
> > +{
> > +     struct regmap *regmap;
> > +     int ret;
> > +
> > +     regmap = qcom_cc_map(pdev, &disp_cc_sm8350_desc);
> > +     if (IS_ERR(regmap))
> > +             return PTR_ERR(regmap);
> > +
> > +     ret = qcom_cc_runtime_init(pdev, &disp_cc_sm8350_desc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = pm_runtime_resume_and_get(&pdev->dev);
> > +     if (ret)
> > +             goto err_pm;
> > +
> > +     clk_lucid_5lpe_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> > +     clk_lucid_5lpe_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
> > +
> > +     /* Enable clock gating for MDP clocks */
> > +     regmap_update_bits(regmap, 0x8000, 0x10, 0x10);
> > +
> > +     /*
> > +      * Keep clocks always enabled:
> > +      *      disp_cc_xo_clk
> > +      */
> > +     regmap_update_bits(regmap, 0x605c, BIT(0), BIT(0));
> > +
> > +     ret = qcom_cc_really_probe(pdev, &disp_cc_sm8350_desc, regmap);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "Failed to register DISPCC clocks\n");
>
> qcom_cc_really_probe already has a fail message I think.

I'm not finding any prints in qcom_cc_really_probe()

>
>
> > +             goto err_pm;
> > +     }
> > +
> > +     pm_runtime_put_sync(&pdev->dev);
>
> What's up with all that pm_ stuff on 8350 specifically? Does it apply
>
> to other SoCs too?

I think it could be implemented for other SOCs, I opted to keep it in
since it that's what downstream does.

>
>
>
> > +     dev_info(&pdev->dev, "Registered DISPCC clocks\n");
>
> That's redundant.

Ack.

>
>
> [1] https://github.com/MiCode/kernel_devicetree/blob/venus-r-oss/qcom/lahaina.dtsi#L2369
>
>
> Konrad


After sending this series out Jonathan pointed me to his series
implementing dispcc support for sm8350, which is a lot more minimal.
His series does not implement videocc support, so that remains to be
done.

https://lore.kernel.org/linux-arm-msm/20210608142707.19637-2-jonathan@marek.ca/#r
