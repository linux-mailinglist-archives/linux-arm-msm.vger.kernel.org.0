Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5143C12AF37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 23:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfLZWZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 17:25:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:39952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbfLZWZj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 17:25:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AE60206CB;
        Thu, 26 Dec 2019 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577399138;
        bh=vujbv1A6xlDUz2g33Y+kPra2PiAgA/fV/uyBHWmtQ6Y=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=f7ktoGybsJOTU/FXJvQp6XsCinWkltPH/f82MaEdDRUwHWJyvbph23Zy8aPgNl0vG
         qgiB+PunZlEVeUKdEC2kfxqDXYPGUSeF0s/NEW05PyKqoMs6aMMajbCeHfAar2RK6N
         NDfrYvtnjRDsxnWAwM2acFt+Yn75kpo2oPPn9hm8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191015103221.51345-2-kholk11@gmail.com>
References: <20191015103221.51345-1-kholk11@gmail.com> <20191015103221.51345-2-kholk11@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, mturquette@baylibre.com,
        agross@kernel.org, bjorn.andersson@linaro.org, marijns95@gmail.com,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
User-Agent: alot/0.8.1
Date:   Thu, 26 Dec 2019 14:25:37 -0800
Message-Id: <20191226222538.2AE60206CB@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kholk11@gmail.com (2019-10-15 03:32:20)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 32dbb4f09492..f2a7743c53a1 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -188,6 +188,14 @@ config MSM_MMCC_8974
>           Say Y if you want to support multimedia devices such as display,
>           graphics, video encode/decode, camera, etc.
> =20
> +config MSM_GCC_8976
> +       tristate "MSM8956/76 Global Clock Controller"
> +       select QCOM_GDSC
> +       help
> +         Support for the global clock controller on msm8956/76 devices.
> +         Say Y if you want to use peripheral devices such as UART, SPI,
> +         i2c, USB, SD/eMMC, display, graphics, camera etc.

Does it have display and graphics and camera?

> +
>  config MSM_GCC_8994
>         tristate "MSM8994 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm897=
6.c
> new file mode 100644
> index 000000000000..c670b53f0b5f
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-msm8976.c
> @@ -0,0 +1,4215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm Global Clock Controller driver for MSM8956/76
> + *
> + * Copyright (C) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2018, AngeloGioacchino Del Regno <kholk11@gmail.com>
> + *
> + * Author: AngeloGioacchino Del Regno <kholk11@gmail.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/bitops.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>

Is this include used?

> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>

Is this include used?

> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8976.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "clk-pll.h"
> +#include "clk-regmap.h"
> +#include "clk-rcg.h"
> +#include "reset.h"
> +#include "gdsc.h"
[...]
> +
> +static struct clk_branch gcc_usb_fs_system_clk =3D {
> +       .halt_reg =3D 0x3F004,

Please use lowercase hex throughout the code.

> +       .clkr =3D {
> +               .enable_reg =3D 0x3F004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data) {
> +                       .name =3D "gcc_usb_fs_system_clk",
> +                       .parent_names =3D (const char*[]) {
> +                               "usb_fs_system_clk_src",
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static const struct of_device_id msm_clock_gcc_match_table[] =3D {

This name is super generic. Can you name it gcc_msm8976_match_table?

> +       { .compatible =3D "qcom,gcc-msm8976" },
> +       {},

Please drop the comma. This is the sentinel

> +};
> +
> +static int gcc_8976_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int i, ret;
> +       u32 val;
> +
> +       regmap =3D qcom_cc_map(pdev, &gcc_msm8976_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /* Vote for GPLL0 to turn on. Needed by acpuclock. */
> +       regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
> +
> +       /* Register the hws */

Please drop this useless comment.

> +       for (i =3D 0; i < ARRAY_SIZE(gcc_msm8976_hws); i++) {
> +               ret =3D devm_clk_hw_register(&pdev->dev, gcc_msm8976_hws[=
i]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D qcom_cc_really_probe(pdev, &gcc_msm8976_desc, regmap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register GCC clocks\n");

Please remove error print.

> +               return ret;
> +       }
> +
> +       clk_set_rate(apss_ahb_clk_src.clkr.hw.clk, 19200000);

Why? Isn't it 19.2MHz by default?

> +       clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);

Looks like the clk should be marked CLK_IS_CRITICAL. Also, document why
clks are marked CLK_IS_CRITICAL with a comment.

> +
> +       /* Configure Sleep and Wakeup cycles for GMEM clock */
> +       regmap_read(regmap, 0x59024, &val);
> +       val ^=3D 0xFF0;
> +       val |=3D (0 << 8);
> +       val |=3D (0 << 4);
> +       regmap_write(regmap, 0x59024, val);

This is regmap_update_bits()?

> +
> +       clk_pll_configure_sr_hpm_lp(&gpll3, regmap,
> +                                       &gpll3_config, true);
> +
> +       clk_set_rate(gpll3.clkr.hw.clk, 1100000000);

Don't think this is required. The PLL configuration should do this.

> +
> +       /* Enable AUX2 clock for APSS */
> +       regmap_update_bits(regmap, 0x60000, BIT(2), BIT(2));
> +
> +       /* Oxili Ocmem in GX rail: OXILI_GMEM_CLAMP_IO */
> +       regmap_update_bits(regmap, 0x5B00C, BIT(0), 0);
> +
> +       /* Configure Sleep and Wakeup cycles for OXILI clock */
> +       val =3D regmap_read(regmap, 0x59020, &val);
> +       val &=3D ~0xF0;
> +       val |=3D (0 << 4);
> +       regmap_write(regmap, 0x59020, val);

regmap_update_bits()?

> +
> +       dev_dbg(&pdev->dev, "Registered GCC-8976 clocks\n");

Please remove this. It's not useful.

> +
> +       return 0;
> +}
> +
> +static struct platform_driver gcc_8976_driver =3D {
> +       .probe =3D gcc_8976_probe,
> +       .driver =3D {
> +               .name =3D "gcc-msm8976",
> +               .of_match_table =3D msm_clock_gcc_match_table,
> +       },
> +};
> +
> +static int __init gcc_8976_init(void)
> +{
> +       return platform_driver_register(&gcc_8976_driver);
> +}
> +core_initcall_sync(gcc_8976_init);
> +
> +static void __exit gcc_8976_exit(void)
> +{
> +       platform_driver_unregister(&gcc_8976_driver);
> +}
> +module_exit(gcc_8976_exit);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <kholk11@gmail.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-msm8976");

I don't think we need MODULE_ALIAS anymore.

