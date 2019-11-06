Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBF4F0B12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 01:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbfKFAa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 19:30:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:56720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729494AbfKFAa4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 19:30:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA8462178F;
        Wed,  6 Nov 2019 00:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573000254;
        bh=gZp+z/amWKS+opoT1nKVVWREQdTOQMs0bXoNemoIUy0=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=i3ZUsc/nJLdk/BggWLM5WyJY3F3qmoSIz8ZV4f2m4YFz9IEqRSBzoyto/qSoE+lJk
         11FXEHdFVaOc+ISHEququIn7KpdH8+9G/n0u2D0vg5BXZDnSxkWetRNN6PgnY0o3gz
         7YAZqtmx1OobHgEZNrUSHEQhjLn3jfc6J40WAxtc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572524473-19344-5-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 4/7] clk: qcom: Add graphics clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 16:30:53 -0800
Message-Id: <20191106003053.DA8462178F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-31 05:21:10)
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7=
180.c
> new file mode 100644
> index 0000000..0d893e6
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

Are these of includes used?

> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +
> +#define CX_GMU_CBCR_SLEEP_MASK         0xF
> +#define CX_GMU_CBCR_SLEEP_SHIFT                4
> +#define CX_GMU_CBCR_WAKE_MASK          0xF
> +#define CX_GMU_CBCR_WAKE_SHIFT         8
> +#define CLK_DIS_WAIT_SHIFT             12
> +#define CLK_DIS_WAIT_MASK              (0xf << CLK_DIS_WAIT_SHIFT)
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_GPLL0_OUT_MAIN,
> +       P_GPLL0_OUT_MAIN_DIV,
> +       P_GPU_CC_PLL1_OUT_EVEN,
> +       P_GPU_CC_PLL1_OUT_MAIN,
> +       P_GPU_CC_PLL1_OUT_ODD,
> +};
> +
> +static struct pll_vco fabia_vco[] =3D {

const?

> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static struct clk_alpha_pll gpu_cc_pll1 =3D {
> +       .offset =3D 0x100,
> +       .vco_table =3D fabia_vco,
> +       .num_vco =3D ARRAY_SIZE(fabia_vco),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpu_cc_pll1",
> +                       .parent_data =3D  &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                               .name =3D "bi_tcxo",

Do we need both? This is new so it should just work with .fw_name right?

> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fabia_ops,
> +               },
> +       },
> +};
> +
> +static const struct parent_map gpu_cc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPU_CC_PLL1_OUT_MAIN, 3 },
> +       { P_GPLL0_OUT_MAIN, 5 },
> +       { P_GPLL0_OUT_MAIN_DIV, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gpu_cc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +       { .hw =3D &gpu_cc_pll1.clkr.hw },
> +       { .fw_name =3D "gcc_gpu_gpll0_clk_src", .name =3D "gcc_gpu_gpll0_=
clk_src" },
> +       { .fw_name =3D "gcc_gpu_gpll0_div_clk_src",
> +                                       .name =3D "gcc_gpu_gpll0_div_clk_=
src" },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};

Same for these.

> +
> +static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
> +       { }
> +};
[..]
> +
> +
> +static int gpu_cc_sc7180_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct alpha_pll_config gpu_cc_pll_config =3D {};
> +       unsigned int value, mask;
> +
> +       regmap =3D qcom_cc_map(pdev, &gpu_cc_sc7180_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /* 360MHz Configuration */
> +       gpu_cc_pll_config.l =3D 0x12;
> +       gpu_cc_pll_config.alpha =3D 0xC000;
> +       gpu_cc_pll_config.config_ctl_val =3D 0x20485699;
> +       gpu_cc_pll_config.config_ctl_hi_val =3D 0x00002067;
> +       gpu_cc_pll_config.user_ctl_val =3D 0x00000001;
> +       gpu_cc_pll_config.user_ctl_hi_val =3D 0x00004805;
> +       gpu_cc_pll_config.test_ctl_hi_val =3D 0x40000000;

Is there a reason this is built on the stack? Save space or something?

> +
> +       clk_fabia_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll_config);
> +
> +       /* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
> +       mask =3D CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +       mask |=3D CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +       value =3D 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEE=
P_SHIFT;

mask and value can just be big constants? I'm not sure anyone cares to
tweak this later, but I guess it's fine this way too.

> +       regmap_update_bits(regmap, 0x1098, mask, value);
> +
> +       /* gpu_cc_ahb_clk */

What are we doing to gpu_cc_ahb_clk??

> +       regmap_update_bits(regmap, 0x1078, 0x1, 0x1);
> +
> +       /* Configure clk_dis_wait for gpu_cx_gdsc */
> +       regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
> +                                               8 << CLK_DIS_WAIT_SHIFT);
> +
> +       return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
> +}
> +
> +static struct platform_driver gpu_cc_sc7180_driver =3D {
> +       .probe =3D gpu_cc_sc7180_probe,
> +       .driver =3D {
> +               .name =3D "sc7180-gpucc",
> +               .of_match_table =3D gpu_cc_sc7180_match_table,
> +       },
> +};
> +
> +static int __init gpu_cc_sc7180_init(void)
> +{
> +       return platform_driver_register(&gpu_cc_sc7180_driver);
> +}
> +core_initcall(gpu_cc_sc7180_init);

Does it need to be core initcal? Maybe module_platform_driver() works
just as well?

> +
> +static void __exit gpu_cc_sc7180_exit(void)
> +{
> +       platform_driver_unregister(&gpu_cc_sc7180_driver);
> +}
> +module_exit(gpu_cc_sc7180_exit);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC SC7180 Driver");
> +MODULE_LICENSE("GPL v2");
