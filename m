Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460BC2A755C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732329AbgKECXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:23:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:46880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729163AbgKECXk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:23:40 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD81220735;
        Thu,  5 Nov 2020 02:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543019;
        bh=oixDUU7a1AUEjrvMCBwRGSbqLiFTn1BvjnqSx7DY654=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q6KqcNJ2KDmRebBHSoQyI7LNXAtmcYJjeuwIqQFzN4NEub7/+5OphvpIBmEZDEYgK
         0Ncu6Utr93ymiKUKt4jMN4t3kMFet4WCczEh818i81UaV4+ynLgsCUQWJGk/qsvheq
         RPNQ4zmDyJO5LhRZo3uC/5KVf4ueZKGEjVD6oBWM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201028074232.22922-3-manivannan.sadhasivam@linaro.org>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org> <20201028074232.22922-3-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/4] clk: qcom: Add SDX55 GCC support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 04 Nov 2020 18:23:37 -0800
Message-ID: <160454301723.3965362.9504622582275389041@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-10-28 00:42:30)
> From: Naveen Yadav <naveenky@codeaurora.org>
>=20
> Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.
>=20
> Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
> [mani: converted to parent_data, commented critical clocks, cleanups]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig     |    8 +
>  drivers/clk/qcom/Makefile    |    1 +
>  drivers/clk/qcom/gcc-sdx55.c | 1667 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1676 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3a965bd326d5..dbca8debc06f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -502,4 +502,12 @@ config KRAITCC
>           Support for the Krait CPU clocks on Qualcomm devices.
>           Say Y if you want to support CPU frequency scaling.
> =20
> +config GCC_SDX55

Please sort instead of add at end.

> +       tristate "SDX55 Global Clock Controller"
> +       depends on ARM

Why?

> +       help
> +         Support for the global clock controller on SDX55 devices.
> +         Say Y if you want to use peripheral devices such as UART,
> +         SPI, I2C, USB, SD/UFS, PCIe etc.
> +
>  endif
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 11ae86febe87..3e27d67f95aa 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -75,3 +75,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div.o
>  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
>  obj-$(CONFIG_KRAITCC) +=3D krait-cc.o
> +obj-$(CONFIG_GCC_SDX55) +=3D gcc-sdx55.o

Please sort this instead of add at end.

> diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> new file mode 100644
> index 000000000000..75831c829202
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sdx55.c
> @@ -0,0 +1,1667 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-sdx55.h>
> +
> +#include "common.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "reset.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_GPLL0_OUT_EVEN,
> +       P_GPLL0_OUT_MAIN,
> +       P_GPLL4_OUT_EVEN,
> +       P_GPLL5_OUT_MAIN,
> +       P_SLEEP_CLK,
> +};
> +
> +static struct pll_vco lucid_vco[] =3D {

const

> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static struct clk_alpha_pll gpll0 =3D {
> +       .offset =3D 0x0,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .vco_table =3D lucid_vco,
> +       .num_vco =3D ARRAY_SIZE(lucid_vco),
> +       .clkr =3D {
> +               .enable_reg =3D 0x6d000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll0",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fixed_lucid_ops,
> +               },
> +       },
> +};
> +
> +static const struct clk_div_table post_div_table_lucid_even[] =3D {
> +       { 0x0, 1 },
> +       { 0x1, 2 },
> +       { 0x3, 4 },
> +       { 0x7, 8 },
> +       { }
> +};

I think this table is common to all lucid plls? Maybe we can push it
into the clk_ops somehow and stop duplicating it here?

> +
> +static struct clk_alpha_pll_postdiv gpll0_out_even =3D {
> +       .offset =3D 0x0,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .post_div_shift =3D 8,
> +       .post_div_table =3D post_div_table_lucid_even,
> +       .num_post_div =3D ARRAY_SIZE(post_div_table_lucid_even),
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0_out_even",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "gpll0",
> +               },

If this is gpll0 in this file, then this should be a clk_hws pointer
instead and directly pointing to the parent.

> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_lucid_ops,
> +       },
> +};
> +
> +static struct clk_alpha_pll gpll4 =3D {
> +       .offset =3D 0x76000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .vco_table =3D lucid_vco,
> +       .num_vco =3D ARRAY_SIZE(lucid_vco),
> +       .clkr =3D {
> +               .enable_reg =3D 0x6d000,
> +               .enable_mask =3D BIT(4),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll4",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fixed_lucid_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll4_out_even =3D {
> +       .offset =3D 0x76000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .post_div_shift =3D 8,
> +       .post_div_table =3D post_div_table_lucid_even,
> +       .num_post_div =3D ARRAY_SIZE(post_div_table_lucid_even),
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll4_out_even",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "gpll4",

If this is gpll4 in this file, then this should be a clk_hws pointer
instead and directly pointing to the parent.

> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_lucid_ops,
> +       },
> +};
> +
> +static struct clk_alpha_pll gpll5 =3D {
> +       .offset =3D 0x74000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +       .vco_table =3D lucid_vco,
> +       .num_vco =3D ARRAY_SIZE(lucid_vco),
[...]
> +                       .name =3D "gcc_sdcc1_ahb_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_sdcc1_apps_clk =3D {
> +       .halt_reg =3D 0xf004,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xf004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_sdcc1_apps_clk",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gcc_sdcc1_apps_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +/* For CPUSS functionality the SYS NOC clock needs to be left enabled */
> +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk =3D {
> +       .halt_reg =3D 0x4010,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x6d008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_sys_noc_cpuss_ahb_clk",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gcc_cpuss_ahb_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

These CLK_IS_CRITICAL clks can't be set once at driver probe time and
forgotten about? It would be nice to not allocate memory for things that
never matter.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_usb30_master_clk =3D {
> +       .halt_reg =3D 0xb010,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb010,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb30_master_clk",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gcc_usb30_master_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
[...]
> +
> +static const struct qcom_cc_desc gcc_sdx55_desc =3D {
> +       .config =3D &gcc_sdx55_regmap_config,
> +       .clks =3D gcc_sdx55_clocks,
> +       .num_clks =3D ARRAY_SIZE(gcc_sdx55_clocks),
> +       .resets =3D gcc_sdx55_resets,
> +       .num_resets =3D ARRAY_SIZE(gcc_sdx55_resets),

No gdscs?

> +};
> +
> +static const struct of_device_id gcc_sdx55_match_table[] =3D {
> +       { .compatible =3D "qcom,gcc-sdx55" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
> +
> +static int gcc_sdx55_probe(struct platform_device *pdev)
> +{
> +       return qcom_cc_probe(pdev, &gcc_sdx55_desc);

Wow haven't seen this in some time. There isn't some sort of PLL that
needs configuring or some clks that need to be slammed on with a couple
register writes?

> +}
> +
