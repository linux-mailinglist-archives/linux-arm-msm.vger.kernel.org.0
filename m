Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3299244384E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 23:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhKBWVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 18:21:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:38570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhKBWVr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 18:21:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC82060EE3;
        Tue,  2 Nov 2021 22:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635891552;
        bh=6Mwu42okVvcvjBV/VKJLjnVkO/4ZEev2OWDFN5IX0o8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k1A+QknaIKS2dQO5FY+d+s1pSNX1uC9z6xiPYclurt5l6HjuTrdMbvM5K7FDv+uEW
         1rRkirBsWXCN4Xzp3ox1Vk3JBtl6RF5jb4pIhrQ59WaoisnZzGoRbyV7SuihWfUq+I
         QcZyT9Wqo27xOFCHtjUKzvdWn/d1gn302h605bksssIz9+Sk+2zIFuybS/+0RDmwen
         brDgAddBVKTO2CvCgzm7l3qGhfatJLCjXtDcFJpfKJFYpHf4AmiY9ahVl4zLw6685Y
         a5SmvHB/v2CSLi9TW0tPTQl65h6K2Ic9awzluqTM1r7s85+A7JHGsOCD/e0Z0H8ucA
         bbgydj+lxFbKQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1635847013-3220-5-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org> <1635847013-3220-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 02 Nov 2021 15:19:10 -0700
Message-ID: <163589155056.2993099.6975945997405184816@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-11-02 02:56:53)
> The Low Power Audio subsystem core and audio clocks are required for
> Audio client to be able to request for the clocks and power domains.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig               |   9 +
>  drivers/clk/qcom/Makefile              |   1 +
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 831 +++++++++++++++++++++++++++=
++++++
>  drivers/clk/qcom/lpasscorecc-sc7280.c  | 491 +++++++++++++++++++
>  4 files changed, 1332 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpassaudiocc-sc7280.c
>  create mode 100644 drivers/clk/qcom/lpasscorecc-sc7280.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 74efc82..4dcabc6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -435,6 +435,15 @@ config SC_LPASS_CORECC_7180
>           Say Y if you want to use LPASS clocks and power domains of the =
LPASS
>           core clock controller.
>=20
> +config SC_LPASS_CORECC_7280
> +       tristate "SC7280 LPASS Core & Audio Clock Controller"
> +       select SC_GCC_7280

select GDSC too

> +       help
> +         Support for the LPASS(Low Power Audio Subsystem) core and audio=
 clock
> +         controller on SC7280 devices.
> +         Say Y if you want to use LPASS clocks and power domains of the =
LPASS
> +         core clock controller.
> +
>  config SC_MSS_7180
>         tristate "SC7180 Modem Clock Controller"
>         select SC_GCC_7180
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 1718c34..9e4b8e1 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_SC_GPUCC_7180) +=3D gpucc-sc7180.o
>  obj-$(CONFIG_SC_GPUCC_7280) +=3D gpucc-sc7280.o
>  obj-$(CONFIG_SC_LPASSCC_7280) +=3D lpasscc-sc7280.o
>  obj-$(CONFIG_SC_LPASS_CORECC_7180) +=3D lpasscorecc-sc7180.o
> +obj-$(CONFIG_SC_LPASS_CORECC_7280) +=3D lpasscorecc-sc7280.o lpassaudioc=
c-sc7280.o
>  obj-$(CONFIG_SC_MSS_7180) +=3D mss-sc7180.o
>  obj-$(CONFIG_SC_VIDEOCC_7180) +=3D videocc-sc7180.o
>  obj-$(CONFIG_SC_VIDEOCC_7280) +=3D videocc-sc7280.o
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lp=
assaudiocc-sc7280.c
> new file mode 100644
> index 0000000..52e7f8e
> --- /dev/null
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_LPASS_AON_CC_PLL_OUT_EVEN,
> +       P_LPASS_AON_CC_PLL_OUT_MAIN,
> +       P_LPASS_AON_CC_PLL_OUT_MAIN_CDIV_DIV_CLK_SRC,
> +       P_LPASS_AON_CC_PLL_OUT_ODD,
> +       P_LPASS_AUDIO_CC_PLL_OUT_AUX,
> +       P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC,
> +       P_LPASS_AUDIO_CC_PLL_MAIN_DIV_CLK,
> +};
> +
> +static struct pll_vco zonda_vco[] =3D {

const

> +       { 595200000, 3600000000, 0 },
> +};
> +
> +/* 1128.96MHz configuration */
> +static const struct alpha_pll_config lpass_audio_cc_pll_config =3D {
> +       .l =3D 0x3a,
> +       .alpha =3D 0xcccc,
> +       .config_ctl_val =3D 0x08200920,
> +       .config_ctl_hi_val =3D 0x05002001,
> +       .config_ctl_hi1_val =3D 0x00000000,
> +       .user_ctl_val =3D 0x03000101,
> +};
> +
> +static struct clk_alpha_pll lpass_audio_cc_pll =3D {
> +       .offset =3D 0x0,
> +       .vco_table =3D zonda_vco,
> +       .num_vco =3D ARRAY_SIZE(zonda_vco),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){

const struct clk_init_data

BTW, we should do that for all the qcom clk drivers.

> +                       .name =3D "lpass_audio_cc_pll",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",

To make the kernel smaller we should consider using integers in the
.index field instead of .fw_name so that we don't have to store around
strings.

> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_zonda_ops,
> +               },
> +       },
> +};
> +
> +static const struct clk_div_table post_div_table_lpass_audio_cc_pll_out_=
aux2[] =3D {
> +       { 0x1, 2 },
> +       { }
> +};
> +
> +static struct clk_alpha_pll_postdiv lpass_audio_cc_pll_out_aux2 =3D {
> +       .offset =3D 0x0,
> +       .post_div_shift =3D 8,
> +       .post_div_table =3D post_div_table_lpass_audio_cc_pll_out_aux2,
> +       .num_post_div =3D ARRAY_SIZE(post_div_table_lpass_audio_cc_pll_ou=
t_aux2),
> +       .width =3D 2,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "lpass_audio_cc_pll_out_aux2",
> +               .parent_hws =3D (const struct clk_hw*[]){
> +                       &lpass_audio_cc_pll.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_zonda_ops,
> +       },
> +};
> +
> +static struct pll_vco lucid_vco[] =3D {

const

> +       { 249600000, 2000000000, 0 },
> +};
> +
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpa=
sscorecc-sc7280.c
> new file mode 100644
> index 0000000..812d9bd
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
[...]
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_core_cc_sysnoc_mport_core_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &lpass_core_cc_core_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct gdsc  lpass_core_cc_lpass_core_hm_gdsc =3D {

Only one space after gdsc please

> +       .gdscr =3D 0x0,
> +       .pd =3D {
> +               .name =3D "lpass_core_cc_lpass_core_hm_gdsc",
> +       },
> +       .pwrsts =3D PWRSTS_OFF_ON,
> +       .flags =3D RETAIN_FF_ENABLE,
> +       .clk_name =3D "iface",
> +};
> +
> +static struct clk_regmap *lpass_core_cc_sc7280_clocks[] =3D {
> +       [LPASS_CORE_CC_CORE_CLK] =3D &lpass_core_cc_core_clk.clkr,
> +       [LPASS_CORE_CC_CORE_CLK_SRC] =3D &lpass_core_cc_core_clk_src.clkr,
> +       [LPASS_CORE_CC_DIG_PLL] =3D &lpass_core_cc_dig_pll.clkr,
> +       [LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC] =3D
> +               &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr,
> +       [LPASS_CORE_CC_DIG_PLL_OUT_ODD] =3D &lpass_core_cc_dig_pll_out_od=
d.clkr,
> +       [LPASS_CORE_CC_EXT_IF0_CLK_SRC] =3D &lpass_core_cc_ext_if0_clk_sr=
c.clkr,
> +       [LPASS_CORE_CC_EXT_IF0_IBIT_CLK] =3D &lpass_core_cc_ext_if0_ibit_=
clk.clkr,
> +       [LPASS_CORE_CC_EXT_IF1_CLK_SRC] =3D &lpass_core_cc_ext_if1_clk_sr=
c.clkr,
> +       [LPASS_CORE_CC_EXT_IF1_IBIT_CLK] =3D &lpass_core_cc_ext_if1_ibit_=
clk.clkr,
> +       [LPASS_CORE_CC_LPM_CORE_CLK] =3D &lpass_core_cc_lpm_core_clk.clkr,
> +       [LPASS_CORE_CC_LPM_MEM0_CORE_CLK] =3D &lpass_core_cc_lpm_mem0_cor=
e_clk.clkr,
> +       [LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK] =3D &lpass_core_cc_sysnoc_m=
port_core_clk.clkr,
> +};
> +
> +static struct regmap_config lpass_core_cc_sc7280_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .val_bits =3D 32,
> +       .fast_io =3D true,
> +};
> +
> +static const struct qcom_cc_desc lpass_core_cc_sc7280_desc =3D {
> +       .config =3D &lpass_core_cc_sc7280_regmap_config,
> +       .clks =3D lpass_core_cc_sc7280_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_core_cc_sc7280_clocks),
> +};
> +
> +static const struct of_device_id lpass_core_cc_sc7280_match_table[] =3D {
> +       { .compatible =3D "qcom,sc7280-lpasscorecc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7280_match_table);
> +
> +static struct gdsc *lpass_core_hm_sc7280_gdscs[] =3D {
> +       [LPASS_CORE_CC_LPASS_CORE_HM_GDSC] =3D &lpass_core_cc_lpass_core_=
hm_gdsc,
> +};
> +
> +static const struct qcom_cc_desc lpass_core_hm_sc7280_desc =3D {
> +       .config =3D &lpass_core_cc_sc7280_regmap_config,
> +       .gdscs =3D lpass_core_hm_sc7280_gdscs,
> +       .num_gdscs =3D ARRAY_SIZE(lpass_core_hm_sc7280_gdscs),
> +};
> +
> +static void lpass_pm_runtime_disable(void *data)
> +{
> +       pm_runtime_disable(data);
> +}
> +
> +static void lpass_pm_clk_destroy(void *data)

Please make the symbols unique. This is the same function name twice.

> +{
> +       pm_clk_destroy(data);
> +}
> +
> +static int lpass_create_pm_clks(struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +       pm_runtime_enable(&pdev->dev);
> +
> +       ret =3D devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_dis=
able, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_clk_create(&pdev->dev);
> +       if (ret)
> +               return ret;
> +       ret =3D devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy=
, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_clk_add(&pdev->dev, "iface");
> +       if (ret < 0)
> +               dev_err(&pdev->dev, "failed to acquire iface clock\n");
> +
> +       return ret;
> +}
> +
> +static int lpass_core_cc_sc7280_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       ret =3D lpass_create_pm_clks(pdev);
> +       if (ret)
> +               return ret;
> +
> +       regmap =3D qcom_cc_map(pdev, &lpass_core_cc_sc7280_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_lucid_pll_configure(&lpass_core_cc_dig_pll, regmap, &lpass_co=
re_cc_dig_pll_config);
> +
> +       ret =3D qcom_cc_really_probe(pdev, &lpass_core_cc_sc7280_desc, re=
gmap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register LPASS CORE CC clo=
cks\n");
> +               return ret;
> +       }
> +
> +       pm_runtime_mark_last_busy(&pdev->dev);
> +       pm_runtime_put_autosuspend(&pdev->dev);
> +
> +       return ret;
> +}
> +
> +static const struct dev_pm_ops lpass_core_cc_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +static struct platform_driver lpass_core_cc_sc7280_driver =3D {
> +       .probe =3D lpass_core_cc_sc7280_probe,
> +       .driver =3D {
> +               .name =3D "lpass_core_cc-sc7280",
> +               .of_match_table =3D lpass_core_cc_sc7280_match_table,
> +               .pm =3D &lpass_core_cc_pm_ops,
> +       },
> +};
> +
> +static int lpass_hm_core_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       lpass_core_cc_sc7280_regmap_config.name =3D "lpass_hm_core";
> +       desc =3D &lpass_core_hm_sc7280_desc;
> +
> +       ret =3D qcom_cc_probe_by_index(pdev, 0, desc);
> +       if (ret)
> +               goto destroy_clk;
> +
> +       return 0;
> +
> +destroy_clk:
> +       return ret;

	return qcom_cc_probe_by_index(...);

is equivalent.

> +}
> +
> +static const struct of_device_id lpass_hm_sc7280_match_table[] =3D {
> +       {
> +               .compatible =3D "qcom,sc7280-lpasshm",
> +       },

Please reduce to one line instead of three.

> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_hm_sc7280_match_table);
> +
