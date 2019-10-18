Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16AEDC741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 16:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408010AbfJROYN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 10:24:13 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36707 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731923AbfJROYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 10:24:12 -0400
Received: by mail-io1-f66.google.com with SMTP id b136so7670517iof.3;
        Fri, 18 Oct 2019 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DENpDMrOqkFGM8ssv1adoeb4nuIpXv4uirObltIf1dU=;
        b=k6UJVaOmskbtckDErTvhQ+AqBKkdFc+tDoyguEwEq3tK+B3Qxq7m3WRqyyNl/YVikk
         lbNX1jtDkLO7g2zON5hqeGSAn+mOwmipwCh0EdX6XNPOBne7CeOUkSmZ1OgIYtBkpDU9
         GncRKgRT6WcNNDhrtp3MFrbXhs2LX0lb16+6YtL5nOitqMjxio78KL4wcyOlhcHVLwDn
         6X+TbWmMXTYd2OfYhQrYqXjF+IpbZbAJJ4PcCikpu3H2wpH0wSFqMQ3yk3k+OBAeAdis
         95RmC5Y639L2QGWUwDfTkb56tpWvGsEzzNb9FsqUTBKM7G+wuyPuuEAUjvDapl+pQqsn
         QlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DENpDMrOqkFGM8ssv1adoeb4nuIpXv4uirObltIf1dU=;
        b=pjbj/1n3jcE/9+f4vd5OxoguvNNy/IzROSw1AAUH3916ixn1kJSvAiujdilFnwP21s
         sUTZhXHD+rW3ipd03lfb1cWOtlCcdKVgQnbefiN+XkclDS3mwwL7MK93UeeX3tq8LAF7
         tUm4tQnDJH4y0xVwpPWC9UKWSwYMUgjdHNrTEbJnUJT3XWK2/Fg1qo2ucr7eiSpq/Iqm
         JDX985gZ7tVrhAYyRm418KpVA/+2CTzBJe42XEzKQyjpXb+bttOFg+GyfeAkHQ8Uzupi
         v4yQwhE5cH6LgacO2ifXfJpHHbkP8YN/cPyg2zF6zIX3dBhSbVZTbkRvLiDhv+e4dMpU
         h9JA==
X-Gm-Message-State: APjAAAXcFD88mb6gsoLJjnBOff74gbVb8zwf1uMDeZ0BM3HutEgp02g2
        Co8YO0lZv5tZao3ezrGtseuyyklDgrrYCxPMZeK0KA==
X-Google-Smtp-Source: APXvYqx99CV9IiFviaZZNb2cMD0RXgtYmCZurgLfPR04OJXdqzGOhRTDkwsQNT8wzCAiuSXk6J0VACT84GLvNN82nrM=
X-Received: by 2002:a02:ab96:: with SMTP id t22mr9060783jan.19.1571408651562;
 Fri, 18 Oct 2019 07:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com>
 <20191002011640.36624-1-jeffrey.l.hugo@gmail.com> <353b0e3f-80fc-6950-004b-e34e4ebb62b4@codeaurora.org>
In-Reply-To: <353b0e3f-80fc-6950-004b-e34e4ebb62b4@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 08:24:00 -0600
Message-ID: <CAOCk7NraMpxpu5opK0JrFzY1UkMFi=U+Npq8jJWbRo15q8z4jA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add MSM8998 GPU Clock Controller
 (GPUCC) driver
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 17, 2019 at 10:11 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Jeffrey,
>
> On 10/2/2019 6:46 AM, Jeffrey Hugo wrote:
> > The GPUCC manages the clocks for the Adreno GPU found on MSM8998.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >   drivers/clk/qcom/Kconfig         |   9 +
> >   drivers/clk/qcom/Makefile        |   1 +
> >   drivers/clk/qcom/gpucc-msm8998.c | 346 +++++++++++++++++++++++++++++++
> >   3 files changed, 356 insertions(+)
> >   create mode 100644 drivers/clk/qcom/gpucc-msm8998.c
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 96efee18fa6c..31a70168327c 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -230,6 +230,15 @@ config MSM_MMCC_8998
> >         Say Y if you want to support multimedia devices such as display,
> >         graphics, video encode/decode, camera, etc.
> >
> > +config MSM_GPUCC_8998
> > +     tristate "MSM8998 Graphics Clock Controller"
> > +     select MSM_GCC_8998
> > +     select QCOM_GDSC
> > +     help
> > +       Support for the graphics clock controller on MSM8998 devices.
> > +       Say Y if you want to support graphics controller devices and
> > +       functionality such as 3D graphics.
> > +
> >   config QCS_GCC_404
> >       tristate "QCS404 Global Clock Controller"
> >       help
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 0ac3c1459313..616b68f91db6 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -33,6 +33,7 @@ obj-$(CONFIG_MSM_GCC_8994) += gcc-msm8994.o
> >   obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
> >   obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
> >   obj-$(CONFIG_MSM_GCC_8998) += gcc-msm8998.o
> > +obj-$(CONFIG_MSM_GPUCC_8998) += gpucc-msm8998.o
> >   obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
> >   obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
> >   obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
> > diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> > new file mode 100644
> > index 000000000000..f0ccb4963885
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gpucc-msm8998.c
> > @@ -0,0 +1,346 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019, Jeffrey Hugo
> > + */
> > +
>
> Copyright (c) 2019, The Linux Foundation. All rights reserved.

No, what I have is correct.  I'll send you the resources regarding
this issue since its not really relevant to the community.

>
> > +#include <linux/kernel.h>
> > +#include <linux/bitops.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/clk.h>
> > +
> > +#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
> > +
> > +#include "common.h"
> > +#include "clk-regmap.h"
> > +#include "clk-regmap-divider.h"
> > +#include "clk-alpha-pll.h"
> > +#include "clk-rcg.h"
> > +#include "clk-branch.h"
> > +#include "reset.h"
> > +#include "gdsc.h"
> > +
> > +enum {
> > +     P_XO,
> > +     P_GPLL0,
> > +     P_GPUPLL0_OUT_EVEN,
> > +};
> > +
> > +/* Instead of going directly to the block, XO is routed through this branch */
> > +static struct clk_branch gpucc_cxo_clk = {
> > +     .halt_reg = 0x1020,
> > +     .clkr = {
> > +             .enable_reg = 0x1020,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpucc_cxo_clk",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .fw_name = "xo",
> > +                             .name = "xo"
> > +                     },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_branch2_ops,
> > +                     .flags = CLK_IS_CRITICAL,
> > +             },
> > +     },
> > +};
> > +
> > +static const struct clk_div_table post_div_table_fabia_even[] = {
> > +     { 0x0, 1 },
> > +     { 0x1, 2 },
> > +     { 0x3, 4 },
> > +     { 0x7, 8 },
> > +     { }
> > +};
> > +
> > +static struct clk_alpha_pll gpupll0 = {
> > +     .offset = 0x0,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gpupll0",
> > +             .parent_hws = (const struct clk_hw *[]){ &gpucc_cxo_clk.clkr.hw },
> > +             .num_parents = 1,
> > +             .ops = &clk_alpha_pll_fixed_fabia_ops,
> > +     },
> > +};
> > +
> > +static struct clk_alpha_pll_postdiv gpupll0_out_even = {
> > +     .offset = 0x0,
> > +     .post_div_shift = 8,
> > +     .post_div_table = post_div_table_fabia_even,
> > +     .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
> > +     .width = 4,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gpupll0_out_even",
> > +             .parent_hws = (const struct clk_hw *[]){ &gpupll0.clkr.hw },
> > +             .num_parents = 1,
> > +             .ops = &clk_alpha_pll_postdiv_fabia_ops,
> > +     },
> > +};
> > +
> > +static const struct parent_map gpu_xo_gpll0_map[] = {
> > +     { P_XO, 0 },
> > +     { P_GPLL0, 5 },
> > +};
> > +
> > +static const struct clk_parent_data gpu_xo_gpll0[] = {
> > +     { .hw = &gpucc_cxo_clk.clkr.hw },
> > +     { .fw_name = "gpll0", .name = "gpll0" },
> > +};
> > +
> > +static const struct parent_map gpu_xo_gpupll0_map[] = {
> > +     { P_XO, 0 },
> > +     { P_GPUPLL0_OUT_EVEN, 1 },
> > +};
> > +
> > +static const struct clk_parent_data gpu_xo_gpupll0[] = {
> > +     { .hw = &gpucc_cxo_clk.clkr.hw },
> > +     { .hw = &gpupll0_out_even.clkr.hw },
> > +};
> > +
> > +static const struct freq_tbl ftbl_rbcpr_clk_src[] = {
> > +     F(19200000, P_XO, 1, 0, 0),
> > +     F(50000000, P_GPLL0, 12, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 rbcpr_clk_src = {
> > +     .cmd_rcgr = 0x1030,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_xo_gpll0_map,
> > +     .freq_tbl = ftbl_rbcpr_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "rbcpr_clk_src",
> > +             .parent_data = gpu_xo_gpll0,
> > +             .num_parents = 2,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
> > +     F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 gfx3d_clk_src = {
> > +     .cmd_rcgr = 0x1070,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_xo_gpupll0_map,
> > +     .freq_tbl = ftbl_gfx3d_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gfx3d_clk_src",
> > +             .parent_data = gpu_xo_gpupll0,
> > +             .num_parents = 2,
> > +             .ops = &clk_rcg2_ops,
> > +             .flags = CLK_OPS_PARENT_ENABLE,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_rbbmtimer_clk_src[] = {
> > +     F(19200000, P_XO, 1, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 rbbmtimer_clk_src = {
> > +     .cmd_rcgr = 0x10b0,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_xo_gpll0_map,
> > +     .freq_tbl = ftbl_rbbmtimer_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "rbbmtimer_clk_src",
> > +             .parent_data = gpu_xo_gpll0,
> > +             .num_parents = 2,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_gfx3d_isense_clk_src[] = {
> > +     F(19200000, P_XO, 1, 0, 0),
> > +     F(40000000, P_GPLL0, 15, 0, 0),
> > +     F(200000000, P_GPLL0, 3, 0, 0),
> > +     F(300000000, P_GPLL0, 2, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 gfx3d_isense_clk_src = {
> > +     .cmd_rcgr = 0x1100,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_xo_gpll0_map,
> > +     .freq_tbl = ftbl_gfx3d_isense_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gfx3d_isense_clk_src",
> > +             .parent_data = gpu_xo_gpll0,
> > +             .num_parents = 2,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_branch rbcpr_clk = {
> > +     .halt_reg = 0x1054,
> > +     .clkr = {
> > +             .enable_reg = 0x1054,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "rbcpr_clk",
> > +                     .parent_hws = (const struct clk_hw *[]){ &rbcpr_clk_src.clkr.hw },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_branch2_ops,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +             },
> > +     },
> > +};
> > +
>
> If unused by consumer it would good to drop this clock.

This gets used, hence why I have it listed.

>
> > +static struct clk_branch gfx3d_clk = {
> > +     .halt_reg = 0x1098,
> > +     .clkr = {
> > +             .enable_reg = 0x1098,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gfx3d_clk",
> > +                     .parent_hws = (const struct clk_hw *[]){ &gfx3d_clk_src.clkr.hw },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_branch2_ops,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch rbbmtimer_clk = {
> > +     .halt_reg = 0x10d0,
> > +     .clkr = {
> > +             .enable_reg = 0x10d0,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "rbbmtimer_clk",
> > +                     .parent_hws = (const struct clk_hw *[]){ &rbbmtimer_clk_src.clkr.hw },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_branch2_ops,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gfx3d_isense_clk = {
> > +     .halt_reg = 0x1124,
> > +     .clkr = {
> > +             .enable_reg = 0x1124,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gfx3d_isense_clk",
> > +                     .parent_hws = (const struct clk_hw *[]){ &gfx3d_isense_clk_src.clkr.hw },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct gdsc gpu_cx_gdsc = {
> > +     .gdscr = 0x1004,
> > +     .pd = {
> > +             .name = "gpu_cx",
> > +     },
> > +     .pwrsts = PWRSTS_OFF_ON,
> > +};
> > +
> > +static struct gdsc gpu_gx_gdsc = {
> > +     .gdscr = 0x1094,
> > +     .clamp_io_ctrl = 0x130,
> > +     .pd = {
> > +             .name = "gpu_gx",
> > +     },
> > +     .parent = &gpu_cx_gdsc.pd,
> > +     .pwrsts = PWRSTS_OFF_ON,
> > +     .flags = CLAMP_IO | AON_RESET,
> > +};
> > +
> > +static struct clk_regmap *gpucc_msm8998_clocks[] = {
> > +     [GPUPLL0] = &gpupll0.clkr,
> > +     [GPUPLL0_OUT_EVEN] = &gpupll0_out_even.clkr,
> > +     [RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
> > +     [GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
> > +     [RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
> > +     [GFX3D_ISENSE_CLK_SRC] = &gfx3d_isense_clk_src.clkr,
> > +     [RBCPR_CLK] = &rbcpr_clk.clkr,
> > +     [GFX3D_CLK] = &gfx3d_clk.clkr,
> > +     [RBBMTIMER_CLK] = &rbbmtimer_clk.clkr,
> > +     [GFX3D_ISENSE_CLK] = &gfx3d_isense_clk.clkr,
> > +     [GPUCC_CXO_CLK] = &gpucc_cxo_clk.clkr,
> > +};
> > +
> > +static struct gdsc *gpucc_msm8998_gdscs[] = {
> > +     [GPU_CX_GDSC] = &gpu_cx_gdsc,
> > +     [GPU_GX_GDSC] = &gpu_gx_gdsc,
> > +};
> > +
> > +static const struct qcom_reset_map gpucc_msm8998_resets[] = {
> > +     [GPU_CX_BCR] = { 0x1000 },
> > +     [RBCPR_BCR] = { 0x1050 },
> > +     [GPU_GX_BCR] = { 0x1090 },
> > +     [GPU_ISENSE_BCR] = { 0x1120 },
> > +};
> > +
> > +static const struct regmap_config gpucc_msm8998_regmap_config = {
> > +     .reg_bits       = 32,
> > +     .reg_stride     = 4,
> > +     .val_bits       = 32,
> > +     .max_register   = 0x9000,
> > +     .fast_io        = true,
> > +};
> > +
> > +static const struct qcom_cc_desc gpucc_msm8998_desc = {
> > +     .config = &gpucc_msm8998_regmap_config,
> > +     .clks = gpucc_msm8998_clocks,
> > +     .num_clks = ARRAY_SIZE(gpucc_msm8998_clocks),
> > +     .resets = gpucc_msm8998_resets,
> > +     .num_resets = ARRAY_SIZE(gpucc_msm8998_resets),
> > +     .gdscs = gpucc_msm8998_gdscs,
> > +     .num_gdscs = ARRAY_SIZE(gpucc_msm8998_gdscs),
> > +};
> > +
> > +static const struct of_device_id gpucc_msm8998_match_table[] = {
> > +     { .compatible = "qcom,gpucc-msm8998" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, gpucc_msm8998_match_table);
> > +
> > +static int gpucc_msm8998_probe(struct platform_device *pdev)
> > +{
> > +     struct regmap *regmap;
> > +
> > +     regmap = qcom_cc_map(pdev, &gpucc_msm8998_desc);
> > +     if (IS_ERR(regmap))
> > +             return PTR_ERR(regmap);
> > +
> > +     /* force periph logic on to avoid perf counter corruption */
> > +     regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
> > +     /* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> > +     regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> > +
> > +     return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
> > +}
> > +
> > +static struct platform_driver gpucc_msm8998_driver = {
> > +     .probe          = gpucc_msm8998_probe,
> > +     .driver         = {
> > +             .name   = "gpucc-msm8998",
> > +             .of_match_table = gpucc_msm8998_match_table,
> > +     },
> > +};
> > +module_platform_driver(gpucc_msm8998_driver);
> > +
> > +MODULE_DESCRIPTION("QCOM GPUCC MSM8998 Driver");
> > +MODULE_LICENSE("GPL v2");
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
> --
