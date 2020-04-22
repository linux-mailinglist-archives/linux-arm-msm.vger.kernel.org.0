Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9951B4E48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 22:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDVUVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 16:21:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:34744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgDVUVm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 16:21:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1A4C20767;
        Wed, 22 Apr 2020 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587586902;
        bh=sVGakmyZIimxVh6U1lDFkiKS1DEJ2XKPcUCT2x3Qmbk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=g3xivWzzJvyVHH1HErEiqGQUNJah4tooLOqvnlZaaY6ZFq6YZzUwWOVd6rfnyWG86
         e+X7xup1d/L0LrHry3bu9lf82rjBqNhaigvow+OsjpD8WQGq+o8ZIfcxsYI8zF7egA
         dgURC9UvpfhQZWcctyg4/K9sFodUpdLeGk3C1CLY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585224008-15730-3-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org> <1585224008-15730-3-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 2/4] clk: qcom: Add CPU clock driver for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        mturquette@baylibre.com
Date:   Wed, 22 Apr 2020 13:21:41 -0700
Message-ID: <158758690122.163502.14723108532742675083@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-03-26 05:00:06)
> Each of the CPU clusters (Power and Perf) on msm8996 are
> clocked via 2 PLLs, a primary and alternate. There are also
> 2 Mux'es, a primary and secondary all connected together
> as shown below
>=20
>                              +-------+
>               XO             |       |
>           +------------------>0      |
>                              |       |
>                    PLL/2     | SMUX  +----+
>                      +------->1      |    |
>                      |       |       |    |
>                      |       +-------+    |    +-------+
>                      |                    +---->0      |
>                      |                         |       |
> +---------------+    |             +----------->1      | CPU clk
> |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> |               +------+-----------+    +------>2 PMUX |
> +---------------+      |                |      |       |
>                        |   +------+     |   +-->3      |
>                        +--^+  ACD +-----+   |  +-------+
> +---------------+          +------+         |
> |Alt PLL        |                           |
> |               +---------------------------+
> +---------------+         PLL_EARLY
>=20
> The primary PLL is what drives the CPU clk, except for times
> when we are reprogramming the PLL itself (for rate changes) when
> we temporarily switch to an alternate PLL. A subsequent patch adds
> support to switch between primary and alternate PLL during rate
> changes.
>=20
> The primary PLL operates on a single VCO range, between 600MHz
> and 3GHz. However the CPUs do support OPPs with frequencies
> between 300MHz and 600MHz. In order to support running the CPUs
> at those frequencies we end up having to lock the PLL at twice
> the rate and drive the CPU clk via the PLL/2 output and SMUX.
>=20
> So for frequencies above 600MHz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300MHz and 600MHz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
> Support for this is added in a subsequent patch as well.
>=20
> ACD stands for Adaptive Clock Distribution and is used to
> detect voltage droops.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>

Some Co-developed-by tags here?

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/clk-alpha-pll.h |   6 +
>  drivers/clk/qcom/clk-cpu-8996.c  | 547 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 564 insertions(+)
>  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 15cdcdc..48934b2 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -37,6 +37,16 @@ config QCOM_CLK_APCS_MSM8916
>           Say Y if you want to support CPU frequency scaling on devices
>           such as msm8916.
> =20
> +config QCOM_CLK_APCC_MSM8996
> +       tristate "MSM8996 CPU Clock Controller"
> +       depends on ARM64
> +       depends on COMMON_CLK_QCOM

This should be dropped if this is inside the if in this Kconfig file.

> +       select QCOM_KRYO_L2_ACCESSORS
> +       help
> +         Support for the CPU clock controller on msm8996 devices.
> +         Say Y if you want to support CPU clock scaling using CPUfreq
> +         drivers for dyanmic power management.
> +
>  config QCOM_CLK_RPM
>         tristate "RPM based Clock Controller"
>         depends on MFD_QCOM_RPM
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8=
996.c
> new file mode 100644
> index 0000000..a977d5a
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -0,0 +1,547 @@
> +// SPDX-License-Identifier: GPL-2.0
[...]
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <soc/qcom/kryo-l2-accessors.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap.h"
> +
[...]
> +
> +static int clk_cpu_8996_mux_determine_rate(struct clk_hw *hw,
> +                                          struct clk_rate_request *req)
> +{
> +       struct clk_cpu_8996_mux *cpuclk =3D to_clk_cpu_8996_mux_hw(hw);
> +       struct clk_hw *parent =3D cpuclk->pll;
> +
> +       if (cpuclk->pll_div_2 && req->rate < DIV_2_THRESHOLD) {
> +               if (req->rate < (DIV_2_THRESHOLD / 2))
> +                       return -EINVAL;
> +
> +               parent =3D cpuclk->pll_div_2;
> +       }
> +
> +       req->best_parent_rate =3D clk_hw_round_rate(parent, req->rate);
> +       req->best_parent_hw =3D parent;
> +
> +       return 0;
> +}
> +
[...]
> +
> +static struct clk_cpu_8996_mux pwrcl_pmux =3D {
> +       .reg =3D PWRCL_REG_OFFSET + MUX_OFFSET,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .pll =3D &pwrcl_pll.clkr.hw,
> +       .pll_div_2 =3D &pwrcl_smux.clkr.hw,
> +       .nb.notifier_call =3D cpu_clk_notifier_cb,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "pwrcl_pmux",
> +               .parent_names =3D (const char *[]){
> +                       "pwrcl_smux",
> +                       "pwrcl_pll",
> +                       "pwrcl_pll_acd",
> +                       "pwrcl_alt_pll",
> +               },

I suppose use clk_hw pointers directly.

> +
> +static struct clk_cpu_8996_mux perfcl_pmux =3D {
> +       .reg =3D PERFCL_REG_OFFSET + MUX_OFFSET,
> +       .shift =3D 0,
> +       .width =3D 2,
> +       .pll =3D &perfcl_pll.clkr.hw,
> +       .pll_div_2 =3D &perfcl_smux.clkr.hw,
> +       .nb.notifier_call =3D cpu_clk_notifier_cb,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "perfcl_pmux",
> +               .parent_names =3D (const char *[]){
> +                       "perfcl_smux",
> +                       "perfcl_pll",
> +                       "perfcl_pll_acd",
> +                       "perfcl_alt_pll",
> +               },
> +               .num_parents =3D 4,
> +               .ops =3D &clk_cpu_8996_mux_ops,
> +               /* do not gate if unclaimed */
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,

Why CLK_IGNORE_UNUSED? Should it be CLK_IS_CRITICAL? The comment says
what's going on but doesn't tell us _why_ which is the important part.

> +       },
> +};
> +
> +static const struct regmap_config cpu_msm8996_regmap_config =3D {
> +       .reg_bits               =3D 32,
> +       .reg_stride             =3D 4,
> +       .val_bits               =3D 32,
> +       .max_register           =3D 0x80210,
> +       .fast_io                =3D true,
> +       .val_format_endian      =3D REGMAP_ENDIAN_LITTLE,
> +};
> +
> +struct clk_regmap *cpu_msm8996_clks[] =3D {
> +       &perfcl_pll.clkr,
> +       &pwrcl_pll.clkr,
> +       &perfcl_alt_pll.clkr,
> +       &pwrcl_alt_pll.clkr,
> +       &perfcl_smux.clkr,
> +       &pwrcl_smux.clkr,
> +       &perfcl_pmux.clkr,
> +       &pwrcl_pmux.clkr,
> +};
> +
> +static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
> +                                             struct regmap *regmap)
> +{
> +       int i, ret;
> +
> +       perfcl_smux.pll =3D clk_hw_register_fixed_factor(dev, "perfcl_pll=
_main",
> +                                                      "perfcl_pll",
> +                                                      CLK_SET_RATE_PAREN=
T,
> +                                                      1, 2);
> +       if (IS_ERR(perfcl_smux.pll)) {
> +               dev_err(dev, "Failed to initialize perfcl_pll_main\n");
> +               return PTR_ERR(perfcl_smux.pll);
> +       }
> +
> +       pwrcl_smux.pll =3D clk_hw_register_fixed_factor(dev, "pwrcl_pll_m=
ain",
> +                                                     "pwrcl_pll",
> +                                                     CLK_SET_RATE_PARENT,
> +                                                     1, 2);
> +       if (IS_ERR(pwrcl_smux.pll)) {
> +               dev_err(dev, "Failed to initialize pwrcl_pll_main\n");
> +               clk_hw_unregister(perfcl_smux.pll);
> +               return PTR_ERR(pwrcl_smux.pll);
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cpu_msm8996_clks); i++) {
> +               ret =3D devm_clk_register_regmap(dev, cpu_msm8996_clks[i]=
);
> +               if (ret) {
> +                       clk_hw_unregister(perfcl_smux.pll);
> +                       clk_hw_unregister(pwrcl_smux.pll);
> +                       return ret;
> +               }
> +       }
> +
> +       clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
> +       clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
> +       clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
> +       clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
> +
> +       /* Enable alt PLLs */
> +       clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
> +       clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
> +
> +       clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
> +       clk_notifier_register(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
> +
> +       return ret;
> +}
> +
> +static int qcom_cpu_clk_msm8996_unregister_clks(void)
> +{
> +       int ret =3D 0;
> +
> +       ret =3D clk_notifier_unregister(pwrcl_pmux.clkr.hw.clk, &pwrcl_pm=
ux.nb);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D clk_notifier_unregister(perfcl_pmux.clkr.hw.clk, &perfcl_=
pmux.nb);
> +       if (ret)
> +               return ret;
> +
> +       clk_hw_unregister(perfcl_smux.pll);
> +       clk_hw_unregister(pwrcl_smux.pll);
> +
> +       return 0;
> +}
> +
> +#define CPU_AFINITY_MASK 0xFFF
> +#define PWRCL_CPU_REG_MASK 0x3
> +#define PERFCL_CPU_REG_MASK 0x103
> +
> +#define L2ACDCR_REG 0x580ULL
> +#define L2ACDTD_REG 0x581ULL
> +#define L2ACDDVMRC_REG 0x584ULL
> +#define L2ACDSSCR_REG 0x589ULL
> +
> +static DEFINE_SPINLOCK(acd_lock);

qcom_clk_acd_lock? acd_lock is pretty generic.

> +static void __iomem *base;
> +
> +static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
> +{
> +       u64 hwid;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&acd_lock, flags);
> +
> +       hwid =3D read_cpuid_mpidr() & CPU_AFINITY_MASK;
> +
> +       kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006A11);
> +       kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000E0F0F);
> +       kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
> +
> +       if (PWRCL_CPU_REG_MASK =3D=3D (hwid | PWRCL_CPU_REG_MASK)) {
> +               writel(0xF, base + PWRCL_REG_OFFSET + SSSCTL_OFFSET);

Lowercase hex please.

> +               wmb();

Can we have a comment in front of these wmb()s here? I think they're
needed to make sure the writel doesn't get executed out of oorder with
the kryo_l2_set_indirect_reg() but I'm not positive.

> +               kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002C5FFD);
> +       }
> +
> +       if (PERFCL_CPU_REG_MASK =3D=3D (hwid | PERFCL_CPU_REG_MASK)) {
> +               kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002C5FFD);
> +               writel(0xF, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
> +               wmb();

And this one is barriered why?

> +       }
> +
> +       spin_unlock_irqrestore(&acd_lock, flags);
> +}
> +
> +static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long =
event,
> +                              void *data)
> +{
> +       struct clk_cpu_8996_mux *cpuclk =3D to_clk_cpu_8996_mux_nb(nb);
> +       struct clk_notifier_data *cnd =3D data;
> +       int ret;
> +
> +       switch (event) {
> +       case PRE_RATE_CHANGE:
> +               ret =3D clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw, ALT=
_INDEX);
> +               qcom_cpu_clk_msm8996_acd_init(base);
> +               break;
> +       case POST_RATE_CHANGE:
> +               if (cnd->new_rate < DIV_2_THRESHOLD)
> +                       ret =3D clk_cpu_8996_mux_set_parent(&cpuclk->clkr=
.hw,
> +                                                         DIV_2_INDEX);
> +               else
> +                       ret =3D clk_cpu_8996_mux_set_parent(&cpuclk->clkr=
.hw,
> +                                                         ACD_INDEX);
> +               break;
> +       default:
> +               ret =3D 0;
> +               break;
> +       }
> +
> +       return notifier_from_errno(ret);
> +};
> +
> +static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pde=
v)
> +{
> +       int ret;
> +       struct resource *res;
> +       struct regmap *regmap;
> +       struct clk_hw_onecell_data *data;
> +       struct device *dev =3D &pdev->dev;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data) + 2 * sizeof(struct clk_=
hw *),

Is this struct_size() or some variant of it?

> +                           GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap_resource(dev, res);

Use devm_platform_ioremap_resource()?

> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       regmap =3D devm_regmap_init_mmio(dev, base, &cpu_msm8996_regmap_c=
onfig);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       ret =3D qcom_cpu_clk_msm8996_register_clks(dev, regmap);
> +       if (ret)
> +               return ret;
> +
> +       qcom_cpu_clk_msm8996_acd_init(base);
> +
> +       data->hws[0] =3D &pwrcl_pmux.clkr.hw;
> +       data->hws[1] =3D &perfcl_pmux.clkr.hw;
> +       data->num =3D 2;
> +
> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, da=
ta);
> +}
> +
> +static int qcom_cpu_clk_msm8996_driver_remove(struct platform_device *pd=
ev)
> +{
> +       return qcom_cpu_clk_msm8996_unregister_clks();
> +}
> +
> +static struct platform_driver qcom_cpu_clk_msm8996_driver =3D {
> +       .probe =3D qcom_cpu_clk_msm8996_driver_probe,
> +       .remove =3D qcom_cpu_clk_msm8996_driver_remove,
> +       .driver =3D {
> +               .name =3D "qcom-msm8996-apcc",
> +               .of_match_table =3D qcom_cpu_clk_msm8996_match_table,
> +       },
> +};
> +module_platform_driver(qcom_cpu_clk_msm8996_driver);
> +
> +MODULE_ALIAS("platform:msm8996-apcc");

Is this alias needed?

> +MODULE_DESCRIPTION("QCOM MSM8996 CPU Clock Driver");
> +MODULE_LICENSE("GPL v2");
