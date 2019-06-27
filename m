Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C10958D15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 23:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfF0Vby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 17:31:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbfF0Vby (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 17:31:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B94FA20B7C;
        Thu, 27 Jun 2019 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561671111;
        bh=qM/uZn1nDLXXfNPy6rIRiPCgDPy7GnPbKZa+Orhiwus=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=ytPrjIH9WkTYEJ/ZgtKFj0D5Qd1A+YFUaU3ldI5Xzm7blXSVvsC0q5EItgQuiKEPK
         fTeuS2KveP08mky7OaFzLwm0HTZxf+zlF0JHcbR2Hkc/1H9PkVRwlywPiZOi4F09DH
         MS0Kj+KWzrWQ5ycK8hdZh7wTVGDh32VCBDGXZuNA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190625063140.17106-4-vkoul@kernel.org>
References: <20190625063140.17106-1-vkoul@kernel.org> <20190625063140.17106-4-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: gcc: Add global clock controller driver for SM8150
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:31:50 -0700
Message-Id: <20190627213151.B94FA20B7C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-24 23:31:40)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up]

This can say "changed to parent_data scheme"?

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm8150.c                 | 3719 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
>  5 files changed, 3971 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm8150.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Docum=
entation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3cd3ccf..1b39d949e63d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -23,6 +23,7 @@ Required properties :
>                         "qcom,gcc-sdm630"
>                         "qcom,gcc-sdm660"
>                         "qcom,gcc-sdm845"
> +                       "qcom,gcc-sm8150"
> =20
>  - reg : shall contain base register location and length
>  - #clock-cells : shall contain 1

I'd expect the binding to get a larger update indicating which clks come
from outside the clk controller and need to be specified as 'clocks' and
'clock-names'.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 18bdf34d5e64..076872d195fd 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -291,6 +291,13 @@ config SDM_LPASSCC_845
>           Say Y if you want to use the LPASS branch clocks of the LPASS c=
lock
>           controller to reset the LPASS subsystem.
> =20
> +config SM_GCC_8150
> +       tristate "SM8150 Global Clock Controller"
> +       help
> +         Support for the global clock controller on SM8150 devices.
> +         Say Y if you want to use peripheral devices such as UART,
> +         SPI, I2C, USB, SD/eMMC, PCIe etc.

Is there eMMC support?

> +
>  config SPMI_PMIC_CLKDIV
>         tristate "SPMI PMIC clkdiv Support"
>         depends on SPMI || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f0768fb1f037..4a813b4055d0 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_SDM_GCC_845) +=3D gcc-sdm845.o
>  obj-$(CONFIG_SDM_GPUCC_845) +=3D gpucc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) +=3D lpasscc-sdm845.o
>  obj-$(CONFIG_SDM_VIDEOCC_845) +=3D videocc-sdm845.o
> +obj-$(CONFIG_SM_GCC_8150) +=3D gcc-sm8150.o
>  obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div.o
>  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> new file mode 100644
> index 000000000000..11cd9e19f18d
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -0,0 +1,3719 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2017-19, The Linux Foundation. All rights reserved.

Is it really 2017-19 and not 2017-2019?

> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +
> +#include "common.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "reset.h"
> +
> +#define GCC_NPU_MISC                           0x4d110
> +#define GCC_GPU_MISC                           0x71028

Drop these defines please and inline the values.

> +
> +enum {
> +       P_BI_TCXO,
> +       P_AUD_REF_CLK,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_GPLL0_OUT_EVEN,
> +       P_GPLL0_OUT_MAIN,
> +       P_GPLL4_OUT_MAIN,
> +       P_GPLL7_OUT_MAIN,
> +       P_GPLL9_OUT_MAIN,
> +       P_SLEEP_CLK,
> +};
> +
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_0[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct clk_parent_data gcc_parents_0_ao[] =3D {
> +       { .fw_name =3D "bi_tcxo_ao", .name =3D "bi_tcxo_ao" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_1[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_SLEEP_CLK, 5 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_1[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
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
> +static const struct clk_parent_data gcc_parents_2[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_3[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_3[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_4[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_4[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_5[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL7_OUT_MAIN, 3 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_5[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "gpll7", .name =3D "gpll7" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },

Aren't these gplls all created in this file? They shouldn't be listed in
DT so I'm confused why we have .fw_name for them.

> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },

If there isn't a legacy string name for core_bi_pll_test_se we should
just leave it out and not have a .name field, just the .fw_name one.

> +};
> +
> +static const struct parent_map gcc_parent_map_6[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL9_OUT_MAIN, 2 },
> +       { P_GPLL4_OUT_MAIN, 5 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_6[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "gpll9", .name =3D "gpll9" },
> +       { .fw_name =3D "gpll4", .name =3D "gpll4" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_7[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_AUD_REF_CLK, 2 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parents_7[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> +       { .fw_name =3D "aud_ref_clk", .name =3D "aud_ref_clk" },
> +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static struct pll_vco trion_vco[] =3D {

const?

> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static struct clk_alpha_pll gpll0 =3D {
> +       .offset =3D 0x0,
> +       .vco_table =3D trion_vco,
> +       .num_vco =3D ARRAY_SIZE(trion_vco),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll0",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                               .name =3D "bi_tcxo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_trion_fixed_pll_ops,
> +               },
> +       },
> +};
> +
> +static const struct clk_div_table post_div_table_trion_even[] =3D {
> +       { 0x0, 1 },
> +       { 0x1, 2 },
> +       { 0x3, 4 },
> +       { 0x7, 8 },
> +       { }
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll0_out_even =3D {
> +       .offset =3D 0x0,
> +       .post_div_shift =3D 8,
> +       .post_div_table =3D post_div_table_trion_even,
> +       .num_post_div =3D ARRAY_SIZE(post_div_table_trion_even),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0_out_even",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "gpll0",
> +                       .name =3D "gpll0",

Use a direct pointer? This applies in many places in the code.

> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_trion_pll_postdiv_ops,
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch gcc_video_ahb_clk =3D {
> +       .halt_reg =3D 0xb004,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .hwcg_reg =3D 0xb004,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

Can you please add a comment around all CLK_IS_CRITICAL flags indicating
why these clks can't be turned off?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_axi0_clk =3D {
> +       .halt_reg =3D 0xb024,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb024,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_axi0_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_axi1_clk =3D {
> +       .halt_reg =3D 0xb028,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb028,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_axi1_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_axic_clk =3D {
> +       .halt_reg =3D 0xb02c,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb02c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_axic_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_video_xo_clk =3D {
> +       .halt_reg =3D 0xb040,
> +       .halt_check =3D BRANCH_HALT_DELAY,

Why doesn't the halt bit work?

> +       .clkr =3D {
> +               .enable_reg =3D 0xb040,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_video_xo_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
