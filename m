Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B461D4005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgENVbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:31:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgENVbC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:31:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A994D2065D;
        Thu, 14 May 2020 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589491861;
        bh=TP5R1Ls94fClOtnKL6qicXkxkmd66c9n7XY4ithYPeY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TJagVHWSUGRPvnEroLw1kjGPEvfh1SLUtiSRlmDAFowhEF0Ej369Tj3zZu7Y/T7LU
         HhSbBDM+yjNZNiP84mczhNxo/NyAID64q2H7/k1WnXEOy/1symwS0bLC2m2cpcbRUw
         n8+JcMIAHriZ46lcC112nKLzMHgswOyLYGh18SVU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200512115023.2856617-3-bryan.odonoghue@linaro.org>
References: <20200512115023.2856617-1-bryan.odonoghue@linaro.org> <20200512115023.2856617-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 2/2] clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        vincent.knecht@mailoo.org, konradybcio@gmail.com,
        bryan.odonoghue@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Thu, 14 May 2020 14:31:00 -0700
Message-ID: <158949186096.215346.4442403798485610696@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-05-12 04:50:23)
> This patch adds support for the MSM8939 GCC. The MSM8939 is based on the
> MSM8916. MSM8939 is compatible in several ways with MSM8916 but, has
> additional functional blocks added which require additional PLL sources. =
In
> some cases functional blocks from the MSM8916 have different clock sources
> or different supported frequencies.
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Is this a co-developed-by tag?

> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm893=
9.c
> new file mode 100644
> index 000000000000..71081eb23081
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -0,0 +1,3999 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Linaro Limited
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +#include <dt-bindings/reset/qcom,gcc-msm8939.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_XO,
> +       P_GPLL0,
> +       P_GPLL0_AUX,
> +       P_BIMC,
> +       P_GPLL1,
> +       P_GPLL1_AUX,
> +       P_GPLL2,
> +       P_GPLL2_AUX,
> +       P_GPLL3,
> +       P_GPLL3_AUX,
> +       P_GPLL4,
> +       P_GPLL5,
> +       P_GPLL5_AUX,
> +       P_GPLL5_EARLY,
> +       P_GPLL6,
> +       P_GPLL6_AUX,
> +       P_SLEEP_CLK,
> +       P_DSI0_PHYPLL_BYTE,
> +       P_DSI0_PHYPLL_DSI,
> +       P_EXT_PRI_I2S,
> +       P_EXT_SEC_I2S,
> +       P_EXT_MCLK,
> +};
> +
> +static struct clk_pll gpll0 =3D {
> +       .l_reg =3D 0x21004,
> +       .m_reg =3D 0x21008,
> +       .n_reg =3D 0x2100c,
> +       .config_reg =3D 0x21010,
> +       .mode_reg =3D 0x21000,
> +       .status_reg =3D 0x2101c,
> +       .status_bit =3D 17,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0",
> +               .parent_data =3D &(const struct clk_parent_data) {
> +                       .fw_name =3D "xo",
> +                       .name =3D "xo",

Please only have .fw_name. The .name field is a fallback, but given that
this is new code there shouldn't be a need for a fallback to the old way
of doing things.

> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_ops,
> +       },
> +};
> +
> +static struct clk_regmap gpll0_vote =3D {
> +       .enable_reg =3D 0x45000,
> +       .enable_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0_vote",
> +               .parent_data =3D &(const struct clk_parent_data) {
> +                       .hw =3D &gpll0.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_vote_ops,
> +       },
> +};
> +
> +static struct clk_pll gpll1 =3D {
> +       .l_reg =3D 0x20004,
> +       .m_reg =3D 0x20008,
> +       .n_reg =3D 0x2000c,
> +       .config_reg =3D 0x20010,
> +       .mode_reg =3D 0x20000,
> +       .status_reg =3D 0x2001c,
> +       .status_bit =3D 17,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll1",
> +               .parent_data =3D &(const struct clk_parent_data) {
> +                       .fw_name =3D "xo",
> +                       .name =3D "xo",
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_ops,
> +       },
> +};
> +
> +static struct clk_regmap gpll1_vote =3D {
> +       .enable_reg =3D 0x45000,
> +       .enable_mask =3D BIT(1),
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll1_vote",
> +               .parent_data =3D &(const struct clk_parent_data) {
> +                       .hw =3D &gpll1.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_vote_ops,
> +       },
> +};
> +
> +static struct clk_pll gpll2 =3D {
> +       .l_reg =3D 0x4a004,
> +       .m_reg =3D 0x4a008,
> +       .n_reg =3D 0x4a00c,
> +       .config_reg =3D 0x4a010,
> +       .mode_reg =3D 0x4a000,
> +       .status_reg =3D 0x4a01c,
> +       .status_bit =3D 17,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll2",
[...]
> +
> +static int gcc_msm8939_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct regmap *regmap;
> +
> +       ret =3D qcom_cc_probe(pdev, &gcc_msm8939_desc);
> +       if (ret)
> +               return ret;
> +
> +       regmap =3D dev_get_regmap(&pdev->dev, NULL);
> +       clk_pll_configure_sr_hpm_lp(&gpll3, regmap, &gpll3_config, true);
> +       clk_pll_configure_sr_hpm_lp(&gpll4, regmap, &gpll4_config, true);

We should probably configure these before registering the clks. Can you
do the usual, map registers, configure stuff, and then
qcom_cc_really_probe()?

> +
> +       return 0;

And then this can fail so return an error in case it does.

> +}
> +
> +static struct platform_driver gcc_msm8939_driver =3D {
> +       .probe          =3D gcc_msm8939_probe,
> +       .driver         =3D {
> +               .name   =3D "gcc-msm8939",
> +               .of_match_table =3D gcc_msm8939_match_table,
> +       },
> +};
> +
> +static int __init gcc_msm8939_init(void)
> +{
> +       return platform_driver_register(&gcc_msm8939_driver);
> +}
> +core_initcall(gcc_msm8939_init);
> +
> +static void __exit gcc_msm8939_exit(void)
> +{
> +       platform_driver_unregister(&gcc_msm8939_driver);
> +}
> +module_exit(gcc_msm8939_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm GCC MSM8939 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-msm8939");

The module alias isn't needed right?
