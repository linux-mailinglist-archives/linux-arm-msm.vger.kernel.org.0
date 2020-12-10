Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F14B2D6907
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389614AbgLJUod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:44:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:50040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730646AbgLJUod (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:44:33 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607633029;
        bh=OMPaq+tYmYSRKBEjtMPEd5yw0qqREEXqXta2+Xo5DAc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cw3e0t9hucwgIu7rti6gaUh1MYs6BulzCWe9OqofkbEI2ryzhAtdoc2eHmRUQ9mQe
         SY3CxTO+YX6fT6XTnDRzHkcIwOYGbaL5JlaTUh/rSIGJzTK3zuFGZBu+skAYaAhR8i
         G90VY4gbp5qL8WXeaPVKduNZ3JQ8Kkvd9xHH/4NGQpIU2y4tJ6YgX+ezZ6XlGnk4Tp
         uyAiBZRux/luV8vbDkRkHNiHJp79l08DdXeRKTGZ058qbzfeTg362Ybgz0JlW3ZQbk
         QITl5NyNTo5tmjFue6SZDEjDauYZTzUXddNKG1pNkRHDLFKsB8IHgnQZDRFHK/w46D
         +3abXJdun4M7w==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201208064702.3654324-6-vkoul@kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-6-vkoul@kernel.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: gcc: Add clock driver for SM8350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 12:43:47 -0800
Message-ID: <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-07 22:47:02)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3a965bd326d5..5015dd9332cd 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -437,6 +437,15 @@ config SM_GCC_8250
>           Say Y if you want to use peripheral devices such as UART,
>           SPI, I2C, USB, SD/UFS, PCIe etc.
> =20
> +config SM_GCC_8350
> +       tristate "SM8350 Global Clock Controller"
> +       select QCOM_GDSC
> +       help
> +         Support for the global clock controller on SM8350 devices.
> +         Say Y if you want to use peripheral devices such as UART,
> +         SPI, I2C, USB, SD/UFS, PCIe etc.
> +
> +

Why double newline?

>  config SM_GPUCC_8150
>         tristate "SM8150 Graphics Clock Controller"
>         select SM_GCC_8150
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 11ae86febe87..915794872e38 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_SDM_VIDEOCC_845) +=3D videocc-sdm845.o
>  obj-$(CONFIG_SM_DISPCC_8250) +=3D dispcc-sm8250.o
>  obj-$(CONFIG_SM_GCC_8150) +=3D gcc-sm8150.o
>  obj-$(CONFIG_SM_GCC_8250) +=3D gcc-sm8250.o
> +obj-$(CONFIG_SM_GCC_8350) +=3D gcc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8150) +=3D gpucc-sm8150.o
>  obj-$(CONFIG_SM_GPUCC_8250) +=3D gpucc-sm8250.o
>  obj-$(CONFIG_SM_VIDEOCC_8150) +=3D videocc-sm8150.o
> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> new file mode 100644
> index 000000000000..94ee9ef563af
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8350.c
> @@ -0,0 +1,3996 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Limited
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

Please add newline here

> +#include <dt-bindings/clock/qcom,gcc-sm8350.h>

Please add newline here

> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_GCC_GPLL0_OUT_EVEN,
> +       P_GCC_GPLL0_OUT_MAIN,
> +       P_GCC_GPLL4_OUT_MAIN,
> +       P_GCC_GPLL9_OUT_MAIN,
> +       P_PCIE_0_PIPE_CLK,
> +       P_PCIE_1_PIPE_CLK,
> +       P_SLEEP_CLK,
> +       P_UFS_CARD_RX_SYMBOL_0_CLK,
> +       P_UFS_CARD_RX_SYMBOL_1_CLK,
> +       P_UFS_CARD_TX_SYMBOL_0_CLK,
> +       P_UFS_PHY_RX_SYMBOL_0_CLK,
> +       P_UFS_PHY_RX_SYMBOL_1_CLK,
> +       P_UFS_PHY_TX_SYMBOL_0_CLK,
> +       P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
> +       P_USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK,
> +};
> +
> +static struct clk_alpha_pll gcc_gpll0 =3D {
> +       .offset =3D 0x0,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .clkr =3D {
> +               .enable_reg =3D 0x52018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gpll0",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fixed_lucid_5lpe_ops,
> +               },
> +       },
> +};
> +
> +static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] =
=3D {
> +       { 0x1, 2 },
> +       { }
> +};
> +
> +static struct clk_alpha_pll_postdiv gcc_gpll0_out_even =3D {
> +       .offset =3D 0x0,
> +       .post_div_shift =3D 8,
> +       .post_div_table =3D post_div_table_gcc_gpll0_out_even,
> +       .num_post_div =3D ARRAY_SIZE(post_div_table_gcc_gpll0_out_even),
> +       .width =3D 4,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_gpll0_out_even",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .hw =3D &gcc_gpll0.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_lucid_5lpe_ops,
> +       },
> +};
> +
> +static struct clk_alpha_pll gcc_gpll4 =3D {
> +       .offset =3D 0x76000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .clkr =3D {
> +               .enable_reg =3D 0x52018,
> +               .enable_mask =3D BIT(4),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gpll4",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                               .name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fixed_lucid_5lpe_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_alpha_pll gcc_gpll9 =3D {
> +       .offset =3D 0x1c000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .clkr =3D {
> +               .enable_reg =3D 0x52018,
> +               .enable_mask =3D BIT(9),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gpll9",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                               .name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fixed_lucid_5lpe_ops,
> +               },
> +       },
> +};
> +
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GCC_GPLL0_OUT_MAIN, 1 },
> +       { P_GCC_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .hw =3D &gcc_gpll0.clkr.hw },
> +       { .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },

Is this .fw_name in the binding? Please remove .name everywhere in this
driver as it shouldn't be necessary.

> +};
> +
> +static const struct parent_map gcc_parent_map_1[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GCC_GPLL0_OUT_MAIN, 1 },
> +       { P_SLEEP_CLK, 5 },
> +       { P_GCC_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_1[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .hw =3D &gcc_gpll0.clkr.hw },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },
> +       { .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_2[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_SLEEP_CLK, 5 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_2[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_3[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_3[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_4[] =3D {
> +       { P_PCIE_0_PIPE_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_4[] =3D {
> +       { .fw_name =3D "pcie_0_pipe_clk", .name =3D "pcie_0_pipe_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_5[] =3D {
> +       { P_PCIE_1_PIPE_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_5[] =3D {
> +       { .fw_name =3D "pcie_1_pipe_clk", .name =3D "pcie_1_pipe_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_6[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GCC_GPLL0_OUT_MAIN, 1 },
> +       { P_GCC_GPLL9_OUT_MAIN, 2 },
> +       { P_GCC_GPLL4_OUT_MAIN, 5 },
> +       { P_GCC_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_6[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .hw =3D &gcc_gpll0.clkr.hw },
> +       { .hw =3D &gcc_gpll9.clkr.hw },
> +       { .hw =3D &gcc_gpll4.clkr.hw },
> +       { .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_7[] =3D {
> +       { P_UFS_CARD_RX_SYMBOL_0_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_7[] =3D {
> +       { .fw_name =3D "ufs_card_rx_symbol_0_clk", .name =3D
> +               "ufs_card_rx_symbol_0_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_8[] =3D {
> +       { P_UFS_CARD_RX_SYMBOL_1_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_8[] =3D {
> +       { .fw_name =3D "ufs_card_rx_symbol_1_clk", .name =3D
> +               "ufs_card_rx_symbol_1_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_9[] =3D {
> +       { P_UFS_CARD_TX_SYMBOL_0_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_9[] =3D {
> +       { .fw_name =3D "ufs_card_tx_symbol_0_clk", .name =3D

Is this documented in the binding?

> +               "ufs_card_tx_symbol_0_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_10[] =3D {
> +       { P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_10[] =3D {
> +       { .fw_name =3D "ufs_phy_rx_symbol_0_clk", .name =3D
> +               "ufs_phy_rx_symbol_0_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_11[] =3D {
> +       { P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_11[] =3D {
> +       { .fw_name =3D "ufs_phy_rx_symbol_1_clk", .name =3D
> +               "ufs_phy_rx_symbol_1_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_12[] =3D {
> +       { P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_12[] =3D {
> +       { .fw_name =3D "ufs_phy_tx_symbol_0_clk", .name =3D
> +               "ufs_phy_tx_symbol_0_clk" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_13[] =3D {
> +       { P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 1 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_13[] =3D {
> +       { .fw_name =3D "usb3_phy_wrapper_gcc_usb30_pipe_clk", .name =3D

Is this documented in the binding?

> +               "usb3_phy_wrapper_gcc_usb30_pipe_clk" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_14[] =3D {
> +       { P_USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 1 },
> +       { P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_14[] =3D {
> +       { .fw_name =3D "usb3_uni_phy_sec_gcc_usb30_pipe_clk", .name =3D

Is this documented in the binding?

> +               "usb3_uni_phy_sec_gcc_usb30_pipe_clk" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +};
> +
> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src =3D {
> +       .reg =3D 0x6b054,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_4,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_pcie_0_pipe_clk_src",
> +                       .parent_data =3D gcc_parent_data_4,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor pcie_0_pipe_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "pcie_0_pipe_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src =3D {
> +       .reg =3D 0x8d054,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_5,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_pcie_1_pipe_clk_src",
> +                       .parent_data =3D gcc_parent_data_5,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor pcie_1_pipe_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "pcie_1_pipe_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_card_rx_symbol_0_clk_src =3D {
> +       .reg =3D 0x75058,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_7,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_0_clk_src",
> +                       .parent_data =3D gcc_parent_data_7,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_card_rx_symbol_0_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_card_rx_symbol_0_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_card_rx_symbol_1_clk_src =3D {
> +       .reg =3D 0x750c8,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_8,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_1_clk_src",
> +                       .parent_data =3D gcc_parent_data_8,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_card_rx_symbol_1_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_card_rx_symbol_1_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_card_tx_symbol_0_clk_src =3D {
> +       .reg =3D 0x75048,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_9,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_tx_symbol_0_clk_src",
> +                       .parent_data =3D gcc_parent_data_9,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_card_tx_symbol_0_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_card_tx_symbol_0_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src =3D {
> +       .reg =3D 0x77058,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_10,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_phy_rx_symbol_0_clk_src",
> +                       .parent_data =3D gcc_parent_data_10,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_phy_rx_symbol_0_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_phy_rx_symbol_0_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src =3D {
> +       .reg =3D 0x770c8,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_11,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_phy_rx_symbol_1_clk_src",
> +                       .parent_data =3D gcc_parent_data_11,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_phy_rx_symbol_1_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_phy_rx_symbol_1_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src =3D {
> +       .reg =3D 0x77048,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_12,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_phy_tx_symbol_0_clk_src",
> +                       .parent_data =3D gcc_parent_data_12,
> +                       .num_parents =3D 2,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor ufs_phy_tx_symbol_0_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "ufs_phy_tx_symbol_0_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src =3D {
> +       .reg =3D 0xf060,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_13,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb3_prim_phy_pipe_clk_src",
> +                       .parent_data =3D gcc_parent_data_13,
> +                       .num_parents =3D 3,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor usb3_phy_wrapper_gcc_usb30_pipe_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "usb3_phy_wrapper_gcc_usb30_pipe_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_fixed_factor core_bi_pll_test_se =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "core_bi_pll_test_se",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src =3D {
> +       .reg =3D 0x10060,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .parent_map =3D gcc_parent_map_14,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb3_sec_phy_pipe_clk_src",
> +                       .parent_data =3D gcc_parent_data_14,
> +                       .num_parents =3D 3,
> +                       .ops =3D &clk_regmap_mux_closest_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor usb3_uni_phy_sec_gcc_usb30_pipe_clk =3D {
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "usb3_uni_phy_sec_gcc_usb30_pipe_clk",
> +               .ops =3D &clk_fixed_factor_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_gp1_clk_src[] =3D {
> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +       F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_gp1_clk_src =3D {
> +       .cmd_rcgr =3D 0x64004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_1,
> +       .freq_tbl =3D ftbl_gcc_gp1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_gp1_clk_src",
> +               .parent_data =3D gcc_parent_data_1,
> +               .num_parents =3D 5,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_gp2_clk_src =3D {
> +       .cmd_rcgr =3D 0x65004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_1,
> +       .freq_tbl =3D ftbl_gcc_gp1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_gp2_clk_src",
> +               .parent_data =3D gcc_parent_data_1,
> +               .num_parents =3D 5,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_gp3_clk_src =3D {
> +       .cmd_rcgr =3D 0x66004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_1,
> +       .freq_tbl =3D ftbl_gcc_gp1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_gp3_clk_src",
> +               .parent_data =3D gcc_parent_data_1,
> +               .num_parents =3D 5,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] =3D {
> +       F(9600000, P_BI_TCXO, 2, 0, 0),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_pcie_0_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x6b058,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_gcc_pcie_0_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_pcie_0_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D 3,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_pcie_0_phy_rchng_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_pcie_0_phy_rchng_clk_src =3D {
> +       .cmd_rcgr =3D 0x6b03c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_pcie_0_phy_rchng_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_pcie_0_phy_rchng_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_pcie_1_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x8d058,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_gcc_pcie_0_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_pcie_1_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D 3,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_pcie_1_phy_rchng_clk_src =3D {
> +       .cmd_rcgr =3D 0x8d03c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_pcie_0_phy_rchng_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_pcie_1_phy_rchng_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] =3D {
> +       F(60000000, P_GCC_GPLL0_OUT_MAIN, 10, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_pdm2_clk_src =3D {
> +       .cmd_rcgr =3D 0x33010,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_pdm2_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_pdm2_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] =3D {
> +       F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
> +       F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
> +       F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
> +       F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
> +       F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
> +       F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +       F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
> +       F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
> +       F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +       { }
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s0_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src =3D {
> +       .cmd_rcgr =3D 0x17010,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s0_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s1_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src =3D {
> +       .cmd_rcgr =3D 0x17140,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s1_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s2_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src =3D {
> +       .cmd_rcgr =3D 0x17270,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s2_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s3_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src =3D {
> +       .cmd_rcgr =3D 0x173a0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s3_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s4_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src =3D {
> +       .cmd_rcgr =3D 0x174d0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s4_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s5_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src =3D {
> +       .cmd_rcgr =3D 0x17600,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s5_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s6_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src =3D {
> +       .cmd_rcgr =3D 0x17730,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s6_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap0_s7_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src =3D {
> +       .cmd_rcgr =3D 0x17860,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap0_s7_clk_src_init,
> +};
> +
> +static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s0_clk_src[] =3D {
> +       F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
> +       F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
> +       F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
> +       F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
> +       F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
> +       F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +       F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
> +       F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
> +       F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +       F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
> +       F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
> +       F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
> +       F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
> +       { }
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s0_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src =3D {
> +       .cmd_rcgr =3D 0x18010,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap1_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s0_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s1_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src =3D {
> +       .cmd_rcgr =3D 0x18140,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s1_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s2_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src =3D {
> +       .cmd_rcgr =3D 0x18270,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s2_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s3_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src =3D {
> +       .cmd_rcgr =3D 0x183a0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s3_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s4_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src =3D {
> +       .cmd_rcgr =3D 0x184d0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s4_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap1_s5_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src =3D {
> +       .cmd_rcgr =3D 0x18600,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap1_s5_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s0_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e010,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap1_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s0_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s1_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e140,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap1_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s1_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s2_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e270,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s2_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s3_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e3a0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s3_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s4_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e4d0,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s4_clk_src_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init =3D {
> +       .name =3D "gcc_qupv3_wrap2_s5_clk_src",
> +       .parent_data =3D gcc_parent_data_0,
> +       .num_parents =3D 4,
> +       .flags =3D CLK_SET_RATE_PARENT,
> +       .ops =3D &clk_rcg2_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src =3D {
> +       .cmd_rcgr =3D 0x1e600,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
> +       .clkr.hw.init =3D &gcc_qupv3_wrap2_s5_clk_src_init,
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] =3D {
> +       F(400000, P_BI_TCXO, 12, 1, 4),
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x1400c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_6,
> +       .freq_tbl =3D ftbl_gcc_sdcc2_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc2_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_6,
> +               .num_parents =3D 6,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

Please use floor ops per Doug's recent patch.

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] =3D {
> +       F(400000, P_BI_TCXO, 12, 1, 4),
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc4_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x1600c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_sdcc4_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc4_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

Please use floor ops per Doug's recent patch.

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_ufs_card_axi_clk_src[] =3D {
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +       F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_ufs_card_axi_clk_src =3D {
> +       .cmd_rcgr =3D 0x75024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_axi_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_card_axi_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_ufs_card_ice_core_clk_src[] =3D {
> +       F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +       F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src =3D {
> +       .cmd_rcgr =3D 0x7506c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_ice_core_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_card_ice_core_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_ufs_card_phy_aux_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x750a0,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_3,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_phy_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_card_phy_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_3,
> +               .num_parents =3D 2,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src =3D {
> +       .cmd_rcgr =3D 0x75084,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_ice_core_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_card_unipro_core_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_axi_clk_src =3D {
> +       .cmd_rcgr =3D 0x77024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_axi_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_phy_axi_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src =3D {
> +       .cmd_rcgr =3D 0x7706c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_ice_core_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_phy_ice_core_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x770a0,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_3,
> +       .freq_tbl =3D ftbl_gcc_pcie_0_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_phy_phy_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_3,
> +               .num_parents =3D 2,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src =3D {
> +       .cmd_rcgr =3D 0x77084,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_ice_core_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_ufs_phy_unipro_core_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_usb30_prim_master_clk_src[] =3D {
> +       F(66666667, P_GCC_GPLL0_OUT_EVEN, 4.5, 0, 0),
> +       F(133333333, P_GCC_GPLL0_OUT_MAIN, 4.5, 0, 0),
> +       F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
> +       F(240000000, P_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_usb30_prim_master_clk_src =3D {
> +       .cmd_rcgr =3D 0xf020,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_usb30_prim_master_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb30_prim_master_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src =3D {
> +       .cmd_rcgr =3D 0xf038,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_phy_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb30_prim_mock_utmi_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_usb30_sec_master_clk_src =3D {
> +       .cmd_rcgr =3D 0x10020,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_usb30_prim_master_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb30_sec_master_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src =3D {
> +       .cmd_rcgr =3D 0x10038,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_0,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_phy_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb30_sec_mock_utmi_clk_src",
> +               .parent_data =3D gcc_parent_data_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0xf064,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_phy_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb3_prim_phy_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D 3,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x10064,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_gcc_ufs_card_phy_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_usb3_sec_phy_aux_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D 3,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src =
=3D {
> +       .reg =3D 0xf050,
> +       .shift =3D 0,
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "gcc_usb30_prim_mock_utmi_postdiv_clk_src",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .hw =3D &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_regmap_div_ro_ops,
> +       },
> +};
> +
> +static struct clk_regmap_div gcc_usb30_sec_mock_utmi_postdiv_clk_src =3D=
 {
> +       .reg =3D 0x10050,
> +       .shift =3D 0,
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "gcc_usb30_sec_mock_utmi_postdiv_clk_src",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .hw =3D &gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_regmap_div_ro_ops,
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_noc_pcie_0_axi_clk =3D {
> +       .halt_reg =3D 0x6b080,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(12),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_noc_pcie_0_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_noc_pcie_1_axi_clk =3D {
> +       .halt_reg =3D 0x8d084,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(11),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_noc_pcie_1_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_noc_pcie_tbu_clk =3D {
> +       .halt_reg =3D 0x9000c,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x9000c,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(18),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_noc_pcie_tbu_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_ufs_card_axi_clk =3D {
> +       .halt_reg =3D 0x750cc,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x750cc,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x750cc,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_ufs_card_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_ufs_card_axi_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_ufs_card_axi_hw_ctl_clk =3D {
> +       .halt_reg =3D 0x750cc,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x750cc,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x750cc,
> +               .enable_mask =3D BIT(1),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_ufs_card_axi_hw_ctl_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_ufs_card_axi_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_ufs_phy_axi_clk =3D {
> +       .halt_reg =3D 0x770cc,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x770cc,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x770cc,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_ufs_phy_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_ufs_phy_axi_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_ufs_phy_axi_hw_ctl_clk =3D {
> +       .halt_reg =3D 0x770cc,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x770cc,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x770cc,
> +               .enable_mask =3D BIT(1),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_ufs_phy_axi_hw_ctl_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_ufs_phy_axi_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_usb3_prim_axi_clk =3D {
> +       .halt_reg =3D 0xf080,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0xf080,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0xf080,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_usb3_prim_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb30_prim_master_clk_src.cl=
kr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_aggre_usb3_sec_axi_clk =3D {
> +       .halt_reg =3D 0x10080,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x10080,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x10080,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_aggre_usb3_sec_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb30_sec_master_clk_src.clk=
r.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_boot_rom_ahb_clk =3D {
> +       .halt_reg =3D 0x38004,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x38004,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(10),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_boot_rom_ahb_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_camera_ahb_clk =3D {
> +       .halt_reg =3D 0x26004,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .hwcg_reg =3D 0x26004,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x26004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_camera_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

Why is it critical? Can we just enable it in driver probe and stop
modeling it as a clk?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_camera_hf_axi_clk =3D {
> +       .halt_reg =3D 0x26010,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x26010,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x26010,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_camera_hf_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_camera_sf_axi_clk =3D {
> +       .halt_reg =3D 0x26014,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x26014,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x26014,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_camera_sf_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_camera_xo_clk =3D {
> +       .halt_reg =3D 0x26018,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .clkr =3D {
> +               .enable_reg =3D 0x26018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_camera_xo_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

Same critical clk comment.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk =3D {
> +       .halt_reg =3D 0xf07c,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0xf07c,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0xf07c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_cfg_noc_usb3_prim_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb30_prim_master_clk_src.cl=
kr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk =3D {
> +       .halt_reg =3D 0x1007c,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x1007c,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x1007c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_cfg_noc_usb3_sec_axi_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb30_sec_master_clk_src.clk=
r.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_ddrss_gpu_axi_clk =3D {
> +       .halt_reg =3D 0x71154,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x71154,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x71154,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ddrss_gpu_axi_clk",
> +                       .ops =3D &clk_branch2_aon_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_ddrss_pcie_sf_tbu_clk =3D {
> +       .halt_reg =3D 0x8d080,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x8d080,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(19),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ddrss_pcie_sf_tbu_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_disp_ahb_clk =3D {
> +       .halt_reg =3D 0x27004,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .hwcg_reg =3D 0x27004,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x27004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_disp_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

Can we just enable them forever and forget about it?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_disp_hf_axi_clk =3D {
> +       .halt_reg =3D 0x2700c,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x2700c,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2700c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_disp_hf_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_disp_sf_axi_clk =3D {
> +       .halt_reg =3D 0x27014,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x27014,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x27014,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_disp_sf_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_disp_xo_clk =3D {
> +       .halt_reg =3D 0x2701c,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .clkr =3D {
> +               .enable_reg =3D 0x2701c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_disp_xo_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

It keeps going! If not, please comment why they're critical.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_gp1_clk =3D {
> +       .halt_reg =3D 0x64000,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x64000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gp1_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_gp1_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb3_sec_phy_aux_clk_src.clk=
r.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_usb3_sec_phy_pipe_clk =3D {
> +       .halt_reg =3D 0x1005c,
> +       .halt_check =3D BRANCH_HALT_DELAY,

Yay this again!

> +       .clkr =3D {
> +               .enable_reg =3D 0x1005c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb3_sec_phy_pipe_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_usb3_sec_phy_pipe_clk_src.cl=
kr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_ahb_clk =3D {
> +       .halt_reg =3D 0x28004,
> +       .halt_check =3D BRANCH_HALT_DELAY,

Why delay?

> +       .hwcg_reg =3D 0x28004,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x28004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_axi0_clk =3D {
> +       .halt_reg =3D 0x28010,
> +       .halt_check =3D BRANCH_HALT_SKIP,

Do these need to be halt skip? Is the video axi clk stuff still broken?

> +       .hwcg_reg =3D 0x28010,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x28010,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_axi0_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_axi1_clk =3D {
> +       .halt_reg =3D 0x28018,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .hwcg_reg =3D 0x28018,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x28018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_axi1_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_xo_clk =3D {
> +       .halt_reg =3D 0x28020,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .clkr =3D {
> +               .enable_reg =3D 0x28020,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_xo_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static int gcc_sm8350_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       regmap =3D qcom_cc_map(pdev, &gcc_sm8350_desc);
> +       if (IS_ERR(regmap)) {
> +               dev_err(&pdev->dev, "Failed to map gcc registers\n");
> +               return PTR_ERR(regmap);
> +       }
> +
> +       ret =3D qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SI=
ZE(gcc_dfs_clocks));
> +       if (ret)
> +               return ret;
> +
> +       /* FORCE_MEM_CORE_ON for ufs phy ice core clocks */

Why?

> +       regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT=
(14), BIT(14));
> +
> +       return qcom_cc_really_probe(pdev, &gcc_sm8350_desc, regmap);
> +}
> +
