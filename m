Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20282F4556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 08:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbhAMHhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 02:37:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbhAMHhq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 02:37:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4DAE22C7B;
        Wed, 13 Jan 2021 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610523425;
        bh=eE0RZvXHZiIxMMYvfLk6R8FqDc6weG8XWrqLYF2TqGg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z66rzkqpppW0ohMSENn3SPVFcj7YvLX0WZcfI54rUnpxVeLMR9+szq1kHArmt9wrp
         wFKIYuUil/EUpuDVDvQSk6gT3VHxvBXDkJ82nW8BYZaOOtRsAQHW/4RRIWDme5OYE9
         SxP69ORyKd0Kkt++U6GPsbtzuy4lR9k4fqbxGCSW57o6y75giVRXgSMSb7GJmJ3hNz
         OevnhLMqkQLIKQLppdrCGbQATlEs5hFGEw5R7NBdx5+PDAIqK0DRzml4juLkUhjJXy
         xHPoy1o3thgcLuEXXCPMsHy9LFzXY6FYcI80zp5we5NbV7eHElchWMHSk5zLeVgaq8
         uGqWmkrFXA/aQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210108113233.75418-6-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org> <20210108113233.75418-6-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: Add SDX55 APCS clock controller support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 12 Jan 2021 23:37:04 -0800
Message-ID: <161052342416.3661239.16154742996506371048@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-08 03:32:33)
> Add a driver for the SDX55 APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined mux
> and half integer divider functionality. The APCS clock controller has 3
> parent clocks:
>=20
> 1. Board XO
> 2. Fixed rate GPLL0
> 3. A7 PLL
>=20
> The source and the divider can be set both at the same time.

I don't understand what that means. Presumably it's a mux/divider
combined?

>=20
> This is required for enabling CPU frequency scaling on SDX55-based
> platforms.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig      |   9 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/apcs-sdx55.c | 149 ++++++++++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 drivers/clk/qcom/apcs-sdx55.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d6f4aee4427a..2c67fdfae913 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,15 @@ config QCOM_CLK_APCS_MSM8916
>           Say Y if you want to support CPU frequency scaling on devices
>           such as msm8916.
> =20
> +config QCOM_CLK_APCS_SDX55

APCC comes before APCS

> +       tristate "SDX55 APCS Clock Controller"
> +       depends on QCOM_APCS_IPC || COMPILE_TEST
> +       help
> +         Support for the APCS Clock Controller on SDX55 platform. The
> +         APCS is managing the mux and divider which feeds the CPUs.
> +         Say Y if you want to support CPU frequency scaling on devices
> +         such as SDX55.
> +
>  config QCOM_CLK_APCC_MSM8996
>         tristate "MSM8996 CPU Clock Controller"
>         select QCOM_KRYO_L2_ACCESSORS
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index e7e0ac382176..a9271f40916c 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_MSM_MMCC_8998) +=3D mmcc-msm8998.o
>  obj-$(CONFIG_QCOM_A53PLL) +=3D a53-pll.o
>  obj-$(CONFIG_QCOM_A7PLL) +=3D a7-pll.o
>  obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) +=3D apcs-msm8916.o
> +obj-$(CONFIG_QCOM_CLK_APCS_SDX55) +=3D apcs-sdx55.o
>  obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) +=3D clk-cpu-8996.o
>  obj-$(CONFIG_QCOM_CLK_RPM) +=3D clk-rpm.o
>  obj-$(CONFIG_QCOM_CLK_RPMH) +=3D clk-rpmh.o
> diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
> new file mode 100644
> index 000000000000..14413c957d83
> --- /dev/null
> +++ b/drivers/clk/qcom/apcs-sdx55.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm SDX55 APCS clock controller driver
> + *
> + * Copyright (c) 2020, Linaro Limited
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/cpu.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"
> +#include "common.h"

Curious what common is needed for?

> +
> +static const u32 apcs_mux_clk_parent_map[] =3D { 0, 1, 5 };
> +
> +static const struct clk_parent_data pdata[] =3D {
> +       { .fw_name =3D "ref", .name =3D "bi_tcxo", },
> +       { .fw_name =3D "aux", .name =3D "gpll0", },
> +       { .fw_name =3D "pll", .name =3D "a7pll", },

Please remove name from here. It shouldn't be necessary if the DT
describes things properly. Or there isn't DT for this device?

> +};
> +
> +/*
> + * We use the notifier function for switching to a temporary safe config=
uration
> + * (mux and divider), while the A7 PLL is reconfigured.
> + */
> +static int a7cc_notifier_cb(struct notifier_block *nb, unsigned long eve=
nt,
> +                           void *data)
> +{
> +       int ret =3D 0;
> +       struct clk_regmap_mux_div *md =3D container_of(nb,
> +                                                    struct clk_regmap_mu=
x_div,
> +                                                    clk_nb);
> +       if (event =3D=3D PRE_RATE_CHANGE)
> +               /* set the mux and divider to safe frequency (400mhz) */
> +               ret =3D mux_div_set_src_div(md, 1, 2);
> +
> +       return notifier_from_errno(ret);
> +}
> +
> +static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device *parent =3D dev->parent;
> +       struct device *cpu_dev;
> +       struct clk_regmap_mux_div *a7cc;
> +       struct regmap *regmap;
> +       struct clk_init_data init =3D { };
> +       int ret =3D -ENODEV;

Drop assignement..

> +
> +       regmap =3D dev_get_regmap(parent, NULL);
> +       if (!regmap) {
> +               dev_err(dev, "Failed to get parent regmap: %d\n", ret);
> +               return ret;

.. and Just return -ENODEV?

> +       }
> +
> +       a7cc =3D devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
> +       if (!a7cc)
> +               return -ENOMEM;
> +
> +       init.name =3D "a7mux";
> +       init.parent_data =3D pdata;
> +       init.num_parents =3D ARRAY_SIZE(pdata);
> +       init.ops =3D &clk_regmap_mux_div_ops;
> +
> +       a7cc->clkr.hw.init =3D &init;
> +       a7cc->clkr.regmap =3D regmap;
> +       a7cc->reg_offset =3D 0x8;
> +       a7cc->hid_width =3D 5;
> +       a7cc->hid_shift =3D 0;
> +       a7cc->src_width =3D 3;
> +       a7cc->src_shift =3D 8;
> +       a7cc->parent_map =3D apcs_mux_clk_parent_map;
> +
> +       a7cc->pclk =3D devm_clk_get(parent, "pll");
> +       if (IS_ERR(a7cc->pclk)) {
> +               ret =3D PTR_ERR(a7cc->pclk);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "Failed to get PLL clk: %d\n", ret);

Use dev_err_probe() please.

> +               return ret;
> +       }
> +
> +       a7cc->clk_nb.notifier_call =3D a7cc_notifier_cb;
> +       ret =3D clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
> +       if (ret) {
> +               dev_err(dev, "Failed to register clock notifier: %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       ret =3D devm_clk_register_regmap(dev, &a7cc->clkr);
> +       if (ret) {
> +               dev_err(dev, "Failed to register regmap clock: %d\n", ret=
);
> +               goto err;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +                                         &a7cc->clkr.hw);
> +       if (ret) {
> +               dev_err(dev, "Failed to add clock provider: %d\n", ret);
> +               goto err;
> +       }
> +
> +       platform_set_drvdata(pdev, a7cc);
> +
> +       /*
> +        * Attach the power domain to cpudev. There seems to be no better=
 place
> +        * to do this, so do it here.
> +        */
> +       cpu_dev =3D get_cpu_device(0);
> +       dev_pm_domain_attach(cpu_dev, true);

I guess this works given that we don't have CPU drivers. The comment
says what the code is doing but doesn't say why it's doing it. Adding
why may help understand in the future and would be a better comment.
Why can't cpufreq-dt attach a power domain from DT for a cpu device? Is
that a bad idea?

> +
> +       return 0;
> +
> +err:
> +       clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
> +       return ret;
> +}
