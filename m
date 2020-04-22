Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BD31B3AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 11:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDVJEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 05:04:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgDVJEX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 05:04:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF41320735;
        Wed, 22 Apr 2020 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587546262;
        bh=iodvWiMvLvn6GaULtni3VC0AD9QWqgVNJaaTAKMQ/7o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uh4uMrz8n6WGjDIRlgafWrfd3QKM+e52dJPUqvDFl/atI44pOlVJkjYxYtiETc6Pw
         dDbHLBfkJ7NZwpXlOgx9irih1UdxvpgbBr1KhsaObMO0Yw+L0loR3Gd22YsGWHTz1t
         drCCAeTI0CAyPs5wYXls8aDp+7eW4OYbqw6XQFMM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586832922-29191-6-git-send-email-sivaprak@codeaurora.org>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org> <1586832922-29191-6-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V3 5/8] clk: qcom: Add ipq apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 22 Apr 2020 02:04:22 -0700
Message-ID: <158754626202.132238.18279860573775399302@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-04-13 19:55:19)
> The CPU on Qualcomm's IPQ platform devices are clocked primarily by a
> PLL and xo which are connected to a mux and enable block, This patch adds

The comma should be a period? Don't write "This patch" in commit text.

> support for the mux and the enable.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig    |  10 +++++
>  drivers/clk/qcom/Makefile   |   1 +
>  drivers/clk/qcom/apss-ipq.c | 107 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 drivers/clk/qcom/apss-ipq.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 15cdcdc..8573f2e 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -89,6 +89,16 @@ config APQ_MMCC_8084
>           Say Y if you want to support multimedia devices such as display,
>           graphics, video encode/decode, camera, etc.
> =20
> +config IPQ_APSS
> +       tristate "IPQ APSS Clock Controller"
> +       default N

Drop this, it's already the default.

> +       help
> +         Support for APSS clock controller on ipq platform devices. The

Maybe say "IPQ platforms" and drop the devices part?

> +         APSS clock controller manages the Mux and enable block that fee=
ds the
> +         CPUs.
> +         Say Y if you want to support CPU frequency scaling on
> +         ipq based devices.
> +
>  config IPQ_GCC_4019
>         tristate "IPQ4019 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/apss-ipq.c b/drivers/clk/qcom/apss-ipq.c
> new file mode 100644
> index 0000000..a37cd98
> --- /dev/null
> +++ b/drivers/clk/qcom/apss-ipq.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-mux.h"
> +
> +enum {
> +       P_XO,
> +       P_APSS_PLL_EARLY,
> +};
> +
> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] =3D {
> +       { .fw_name =3D "xo" },
> +       { .fw_name =3D "pll" },
> +};
> +
> +static const struct parent_map parents_apcs_alias0_clk_src_map[] =3D {
> +       { P_XO, 0 },
> +       { P_APSS_PLL_EARLY, 5 },
> +};
> +
> +static struct clk_regmap_mux apcs_alias0_clk_src =3D {
> +       .reg =3D 0x0050,
> +       .width =3D 3,
> +       .shift =3D 7,
> +       .parent_map =3D parents_apcs_alias0_clk_src_map,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "apcs_alias0_clk_src",
> +               .parent_data =3D parents_apcs_alias0_clk_src,
> +               .num_parents =3D 2,
> +               .ops =3D &clk_regmap_mux_closest_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +/*required for cpufreq*/

This comment doesn't help in understanding.

> +static struct clk_branch apcs_alias0_core_clk =3D {
> +       .halt_reg =3D 0x0058,
> +       .clkr =3D {
> +               .enable_reg =3D 0x0058,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "apcs_alias0_core_clk",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &apcs_alias0_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Please comment why the clk is critical.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static const struct regmap_config apss_ipq_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .max_register   =3D 0x1000,
> +       .fast_io        =3D true,
> +};
> +
> +static struct clk_regmap *apss_ipq_clks[] =3D {
> +       [APCS_ALIAS0_CLK_SRC] =3D &apcs_alias0_clk_src.clkr,
> +       [APCS_ALIAS0_CORE_CLK] =3D &apcs_alias0_core_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc apss_ipq_desc =3D {
> +       .config =3D &apss_ipq_regmap_config,
> +       .clks =3D apss_ipq_clks,
> +       .num_clks =3D ARRAY_SIZE(apss_ipq_clks),
> +};
> +
> +static int apss_ipq_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +
> +       regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, &apss_ipq_desc, regmap);

What is this a child of?

> +}
> +
> +static struct platform_driver apss_ipq_driver =3D {
> +       .probe =3D apss_ipq_probe,
> +       .driver =3D {
> +               .name   =3D "qcom,apss-ipq-clk",
> +       },
> +};
