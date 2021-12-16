Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B5C4768D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 04:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbhLPDtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 22:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbhLPDtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 22:49:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0FAC061574;
        Wed, 15 Dec 2021 19:49:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0087361C32;
        Thu, 16 Dec 2021 03:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFCBC36AE0;
        Thu, 16 Dec 2021 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639626549;
        bh=zcERsfi95BAqegZnp4hpX0EzZn97o2IqQf9fwrkb0vU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EsFqijvEb2ZV1IZYIDgPAlsRFCvznIbIwpeW251fQVeRc3rhb82AN5qQUGKJRnhsH
         C4iBdosC0J630hDvk9zYCWv08ZzrUFreVu5D5jhhw3LQ4d03OK9Jy2cBWm89UllLCh
         /3kyzACTHzpKlUCcsEqjh9UhM9M4Ik+KRHJysEYcDUjR0w0nOGtGETDxVM6a2b3krf
         +Fueipm0DL6CzivrXPfjavZGU8InzeHI5pFxXvXqtW4h7rVag74y1QlAq7WlwH3LDj
         XRw+i8xo0G+u4Hdf1LRPWclc+IFpi0Vx11w4lEkg7yklpEriFwUutzhhKLBXrMsXhJ
         BXnlfz+ZPioFQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: Add display clock controller driver for QCM2290
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Wed, 15 Dec 2021 19:49:07 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216034909.3EFCBC36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2021-12-09 06:09:10)
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> new file mode 100644
> index 00000000..8aa5d31
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -0,0 +1,602 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_DISP_CC_PLL0_OUT_MAIN,
> +       P_DSI0_PHY_PLL_OUT_BYTECLK,
> +       P_DSI0_PHY_PLL_OUT_DSICLK,
> +       P_DSI1_PHY_PLL_OUT_DSICLK,
> +       P_GPLL0_OUT_MAIN,
> +       P_SLEEP_CLK,
> +};
> +
> +static struct pll_vco spark_vco[] =3D {

const

> +       { 500000000, 1000000000, 2 },
> +};
> +
> +/* 768MHz configuration */
> +static const struct alpha_pll_config disp_cc_pll0_config =3D {
> +       .l =3D 0x28,
> +       .alpha =3D 0x0,
> +       .alpha_en_mask =3D BIT(24),
> +       .vco_val =3D 0x2 << 20,
> +       .vco_mask =3D GENMASK(21, 20),
> +       .main_output_mask =3D BIT(0),
> +       .config_ctl_val =3D 0x4001055B,
> +};
> +
> +static struct clk_alpha_pll disp_cc_pll0 =3D {
> +       .offset =3D 0x0,
> +       .vco_table =3D spark_vco,
> +       .num_vco =3D ARRAY_SIZE(spark_vco),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_pll0",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_ops,
> +               },
> +       },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "dsi0_phy_pll_out_byteclk" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_1[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_1[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_1_ao[] =3D {
> +       { .fw_name =3D "bi_tcxo_ao" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_2[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 4 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_2[] =3D {
> +       { .fw_name =3D "bi_tcxo_ao" },
> +       { .fw_name =3D "gcc_disp_gpll0_div_clk_src" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_3[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_DISP_CC_PLL0_OUT_MAIN, 1 },
> +       { P_GPLL0_OUT_MAIN, 4 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_3[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .hw =3D &disp_cc_pll0.clkr.hw },
> +       { .fw_name =3D "gcc_disp_gpll0_clk_src" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_4[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +       { P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_4[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "dsi0_phy_pll_out_dsiclk" },
> +       { .fw_name =3D "dsi1_phy_pll_out_dsiclk" },
> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static const struct parent_map disp_cc_parent_map_5[] =3D {
> +       { P_SLEEP_CLK, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data disp_cc_parent_data_5[] =3D {
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },

Please don't add .name to clk_parent_data if this is a new driver.

> +       { .fw_name =3D "core_bi_pll_test_se" },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src =3D {
> +       .cmd_rcgr =3D 0x20a4,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_byte0_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | C=
LK_OPS_PARENT_ENABLE,
> +               .ops =3D &clk_byte2_ops,
> +       },
> +};
> +
> +static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src =3D {
> +       .reg =3D 0x20bc,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "disp_cc_mdss_byte0_div_clk_src",
> +               .parent_hws =3D (const struct clk_hw*[]){
> +                       &disp_cc_mdss_byte0_clk_src.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .flags =3D CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_regmap_div_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0x2154,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_2,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_ahb_clk_src",
> +               .parent_data =3D disp_cc_parent_data_2,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_2),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_esc0_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_esc0_clk_src =3D {
> +       .cmd_rcgr =3D 0x20c0,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_esc0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_esc0_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(192000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
> +       F(256000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +       F(307200000, P_DISP_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +       F(384000000, P_DISP_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src =3D {
> +       .cmd_rcgr =3D 0x2074,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_3,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_mdp_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_mdp_clk_src",
> +               .parent_data =3D disp_cc_parent_data_3,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_3),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src =3D {
> +       .cmd_rcgr =3D 0x205c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_pclk0_clk_src",
> +               .parent_data =3D disp_cc_parent_data_4,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_4),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | C=
LK_OPS_PARENT_ENABLE,

These last two flags are needed for what?

> +               .ops =3D &clk_pixel_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_vsync_clk_src =3D {
> +       .cmd_rcgr =3D 0x208c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_esc0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_vsync_clk_src",
> +               .parent_data =3D disp_cc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_sleep_clk_src[] =3D {
> +       F(32764, P_SLEEP_CLK, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_sleep_clk_src =3D {
> +       .cmd_rcgr =3D 0x6050,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_5,
> +       .freq_tbl =3D ftbl_disp_cc_sleep_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_sleep_clk_src",
> +               .parent_data =3D disp_cc_parent_data_5,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_5),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_xo_clk_src =3D {
> +       .cmd_rcgr =3D 0x6034,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_esc0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_xo_clk_src",
> +               .parent_data =3D disp_cc_parent_data_1_ao,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_1_ao),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_ahb_clk =3D {
> +       .halt_reg =3D 0x2044,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2044,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_ahb_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_ahb_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_byte0_clk =3D {
> +       .halt_reg =3D 0x201c,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x201c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_byte0_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_byte0_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOC=
ACHE,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_byte0_intf_clk =3D {
> +       .halt_reg =3D 0x2020,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2020,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_byte0_intf_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOC=
ACHE,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_esc0_clk =3D {
> +       .halt_reg =3D 0x2024,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2024,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_esc0_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_esc0_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_mdp_clk =3D {
> +       .halt_reg =3D 0x2008,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_mdp_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_mdp_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_mdp_lut_clk =3D {
> +       .halt_reg =3D 0x2010,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2010,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_mdp_lut_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_mdp_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk =3D {
> +       .halt_reg =3D 0x4004,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x4004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_non_gdsc_ahb_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_ahb_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_pclk0_clk =3D {
> +       .halt_reg =3D 0x2004,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_pclk0_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_pclk0_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOC=
ACHE,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_mdss_vsync_clk =3D {
> +       .halt_reg =3D 0x2018,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_mdss_vsync_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_mdss_vsync_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_sleep_clk =3D {
> +       .halt_reg =3D 0x6068,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x6068,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_sleep_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_sleep_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch disp_cc_xo_clk =3D {
> +       .halt_reg =3D 0x604c,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x604c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_xo_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &disp_cc_xo_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

We need a comment why it's critical. Also I'm not sure why we would ever
turn this clk off or change the rate. Can't we just hit some registers
during probe to make sure it's on and drop this clk?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
