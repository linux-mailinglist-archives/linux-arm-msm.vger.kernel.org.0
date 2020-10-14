Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704C128D81D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgJNBvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:51:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgJNBvS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:51:18 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3864021D7B;
        Wed, 14 Oct 2020 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602640277;
        bh=pIP41d9h8xs9BC0IHNIuNj5lWlNr0vB2hoKO+soU2TY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lDB047QlnOJGi5xKgx/DTmj1Ei4a+A4WPCxyKAqCUXzU3ZkARCHi7xJzLXo34c8Go
         3VtyH2Echg+MQCRazlyK/SHaUW3hYjJU06g1hVA4CRzTjxc2td0kSBRqSSGyK38+Ty
         rjdmow3wHtQTCEXXAyQwLgWp95heFt9+NAd4sHKs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200925103115.15191-4-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org> <20200925103115.15191-4-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:51:16 -0700
Message-ID: <160264027603.310579.2093648852055594042@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-09-25 03:31:14)
> GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
> This patch adds support to these muxes.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig            |   6 +
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/lpass-gfm-sm8250.c | 260 ++++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 058327310c25..08078f4b0591 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -475,4 +475,10 @@ config KRAITCC
>           Support for the Krait CPU clocks on Qualcomm devices.
>           Say Y if you want to support CPU frequency scaling.
> =20
> +config CLK_GFM_LPASS_SM8250
> +       tristate "GFM LPASS Clocks"

Can we get SM8250 in the name? And also sort this into the other SoC
compatible strings with a name that matches how it's been done
otherwise. I guess CONFIG_SM_LPASS_8250? GFM for Glitch Free Mux doesn't
seem very important unless it is actually part of the device name?

> +       help
> +         Support for the GFM Glitch Free Mux LPASS clock. Say Y

I'd write "Support for the Glitch Free Mux (GFM) Low power audio
subsystem (LPASS) clocks found on SM8250 SoCs."

> +         if you want to support GFM Clocks on LPASS for SM8250 SoC.
> +
>  endif
> diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass=
-gfm-sm8250.c
> new file mode 100644
> index 000000000000..c79854e1494d
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LPASS Audio CC and Always ON CC Glitch Free Mux clock driver
> + *
> + * Copyright (c) 2020 Linaro Ltd.
> + * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
> +
> +static struct clk_gfm lpass_gfm_wsa_mclk =3D {
> +       .mux_reg =3D 0x220d8,
> +       .mux_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data) {
> +               .name =3D "WSA_MCLK",
> +               .ops =3D &clk_gfm_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +               .parent_data =3D (const struct clk_parent_data[]){
> +                       {
> +                               .index =3D 0,
> +                               .name =3D "LPASS_CLK_ID_TX_CORE_MCLK",

Can these use .fw_name instead of .name? The .fw_name is the future and
.name is for drivers that don't use DT bindings or existed before we
parsed clks from DT in the core.

> +                       }, {
> +                               .index =3D 1,
> +                               .name =3D "LPASS_CLK_ID_WSA_CORE_MCLK",
> +                       },
> +               },
> +               .num_parents =3D 2,
> +       },
> +};
> +
[...]
> +static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
> +{
> +       const struct lpass_gfm_data *data;
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       struct clk_gfm *gfm;
> +       struct lpass_gfm *cc;
> +       int err, i;
> +
> +       data =3D of_device_get_match_data(dev);
> +       if (!data)
> +               return -EINVAL;
> +
> +       cc =3D devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> +       if (!cc)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cc->base =3D devm_ioremap_resource(dev, res);

devm_platform_ioremap_resource()

> +       if (IS_ERR(cc->base))
> +               return PTR_ERR(cc->base);
> +
> +       pm_runtime_enable(dev);
> +       err =3D pm_clk_create(dev);
> +       if (err)
> +               goto pm_clk_err;
> +
> +       err =3D of_pm_clk_add_clks(dev);
> +       if (err < 0) {
> +               dev_dbg(dev, "Failed to get lpass core voting clocks\n");
> +               goto clk_reg_err;
> +       }
> +
> +       for (i =3D 0; i < data->onecell_data->num; i++) {
> +               if (!data->gfm_clks[i])
> +                       continue;
> +
> +               gfm =3D data->gfm_clks[i];
> +               gfm->priv =3D cc;
> +               gfm->gfm_mux =3D cc->base;
> +               gfm->gfm_mux =3D gfm->gfm_mux + data->gfm_clks[i]->mux_re=
g;
> +
> +               err =3D devm_clk_hw_register(dev, &data->gfm_clks[i]->hw);
> +               if (err)
> +                       goto clk_reg_err;
> +
> +       }
> +
> +       err =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +                                         data->onecell_data);
> +       if (err)
> +               goto clk_reg_err;
> +
> +       return 0;
> +
> +clk_reg_err:
> +       pm_clk_destroy(dev);
> +pm_clk_err:
> +       pm_runtime_disable(dev);
> +       return err;
> +}
> +
