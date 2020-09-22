Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4BE274868
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIVSlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:41:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726714AbgIVSlo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:41:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C70020756;
        Tue, 22 Sep 2020 18:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800103;
        bh=tDKJ29i52obLnz6kMpc36hmPeyQhmdy700T68xXHhEE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r9E95aiX5+6Jv5pxo2n9HIzt2WXI6qawTE2iMlPlRK1SiJihHkWeZOwfNJi0oefba
         QDkqvqYS5MWKILpr+mHqOjTz5BPbmksvjibKM/LSC5ecLB/2SAp9nT62vgYH14uDf1
         ukeQ0eH4+2UvMCRpeb2Q7vJGViMdsOe31leIGDU4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200917132850.7730-4-srinivas.kandagatla@linaro.org>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org> <20200917132850.7730-4-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:41:42 -0700
Message-ID: <160080010215.310579.4526434246523292987@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-09-17 06:28:49)
> GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
> This patch adds support to these muxes.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig            |   7 +
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/lpass-gfm-sm8250.c | 235 ++++++++++++++++++++++++++++
>  3 files changed, 243 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 2eda63b7c46c..4e46fd339e62 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -494,4 +494,11 @@ config KRAITCC
>           Support for the Krait CPU clocks on Qualcomm devices.
>           Say Y if you want to support CPU frequency scaling.
> =20
> +config CLK_GFM_LPASS_SM8250
> +       tristate "GFM LPASS Clocks"
> +       depends on SND_SOC_QDSP6_COMMON

What is the depends for?

> +       help
> +         Support for the GFM Glitch Free Mux LPASS clock. Say Y
> +         if you want to support GFM Clocks on LPASS for SM8250 SoC.
> +
>  endif
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 8eb395d02a32..c18e4ead6c9e 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -74,3 +74,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div.o
>  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
>  obj-$(CONFIG_KRAITCC) +=3D krait-cc.o
> +obj-$(CONFIG_CLK_GFM_LPASS_SM8250) +=3D lpass-gfm-sm8250.o

I don't know but probably this should be sorted by Kconfig instead of
tacked onto the end here.

> diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass=
-gfm-sm8250.c
> new file mode 100644
> index 000000000000..2d5c41ae4969
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/notifier.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
> +
> +struct lpass_gfm {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk *core_vote;
> +       struct clk *bus_clk;
> +};
> +
> +struct clk_gfm {
> +       unsigned int mux_reg;
> +       unsigned int mux_mask;
> +       struct clk_hw   hw;
> +       struct lpass_gfm *priv;
> +       void __iomem *gfm_mux;
> +};
> +
> +#define GFM_MASK       BIT(1)
> +#define to_clk_gfm(_hw) container_of(_hw, struct clk_gfm, hw)
> +
> +static u8 clk_gfm_get_parent(struct clk_hw *hw)
> +{
> +       struct clk_gfm *clk =3D to_clk_gfm(hw);
> +
> +       return readl(clk->gfm_mux) & GFM_MASK;
> +}
> +
> +static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct clk_gfm *clk =3D to_clk_gfm(hw);
> +       unsigned int val;
> +
> +       val =3D readl(clk->gfm_mux);
> +
> +       if (index)
> +               val |=3D GFM_MASK;
> +       else
> +               val &=3D ~GFM_MASK;
> +
> +       writel(val, clk->gfm_mux);
> +
> +       return 0;
> +}
> +
> +static const struct clk_ops clk_gfm_ops =3D {
> +       .get_parent =3D clk_gfm_get_parent,
> +       .set_parent =3D clk_gfm_set_parent,
> +       .determine_rate =3D __clk_mux_determine_rate,
> +};
> +
> +static struct clk_gfm lpass_gfm_wsa_mclk =3D {
> +       .mux_reg =3D 0x220d8,
> +       .mux_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data) {
> +               .name =3D "WSA_MCLK",
> +               .ops =3D &clk_gfm_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +               .parent_names =3D (const char *[]){
> +                       "LPASS_CLK_ID_TX_CORE_MCLK",
> +                       "LPASS_CLK_ID_WSA_CORE_MCLK",
> +               },
> +               .parent_data =3D (const struct clk_parent_data[]){
> +                               { .index =3D 0 },
> +                               { .index =3D 1 },
> +               },
> +               .num_parents =3D 2,
> +       },
> +};
> +
> +static struct clk_gfm lpass_gfm_wsa_npl =3D {
> +       .mux_reg =3D 0x220d8,
> +       .mux_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data) {
> +               .name =3D "WSA_NPL",
> +               .ops =3D &clk_gfm_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +               .parent_names =3D (const char *[]){
> +                       "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
> +                       "LPASS_CLK_ID_WSA_CORE_NPL_MCLK",
> +               },
> +               .parent_data =3D (const struct clk_parent_data[]){
> +                               { .index =3D 0 },
> +                               { .index =3D 1 },
> +               },
> +               .num_parents =3D 2,
> +       },
> +};
> +
> +static struct clk_gfm lpass_gfm_rx_mclk_mclk2 =3D {
> +       .mux_reg =3D 0x240d8,
> +       .mux_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data) {
> +               .name =3D "RX_MCLK_MCLK2",
> +               .ops =3D &clk_gfm_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +               .parent_names =3D (const char *[]){
> +                       "LPASS_CLK_ID_TX_CORE_MCLK",
> +                       "LPASS_CLK_ID_RX_CORE_MCLK",
> +               },
> +               .parent_data =3D (const struct clk_parent_data[]){
> +                               { .index =3D 0 },
> +                               { .index =3D 1 },
> +               },
> +               .num_parents =3D 2,
> +       },
> +};
> +
> +static struct clk_gfm lpass_gfm_rx_npl =3D {
> +       .mux_reg =3D 0x240d8,
> +       .mux_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data) {
> +               .name =3D "RX_NPL",
> +               .ops =3D &clk_gfm_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +               .parent_names =3D (const char *[]){
> +                       "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
> +                       "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
> +               },
> +               .parent_data =3D (const struct clk_parent_data[]){
> +                               { .index =3D 0 },
> +                               { .index =3D 1 },
> +               },

Please use parent_data instead of parent_names. The name can go in the
parent_data struct.

> +               .num_parents =3D 2,
> +       },
> +};
> +
> +static struct clk_gfm *audiocc_gfm_clks[] =3D {
> +       [LPASS_CDC_WSA_NPL]             =3D &lpass_gfm_wsa_npl,
> +       [LPASS_CDC_WSA_MCLK]            =3D &lpass_gfm_wsa_mclk,
> +       [LPASS_CDC_RX_NPL]              =3D &lpass_gfm_rx_npl,
> +       [LPASS_CDC_RX_MCLK_MCLK2]       =3D &lpass_gfm_rx_mclk_mclk2,
> +};
> +
> +static struct clk_hw_onecell_data audiocc_hw_onecell_data =3D {
> +       .hws =3D {
> +               [LPASS_CDC_WSA_NPL]     =3D &lpass_gfm_wsa_npl.hw,
> +               [LPASS_CDC_WSA_MCLK]    =3D &lpass_gfm_wsa_mclk.hw,
> +               [LPASS_CDC_RX_NPL]      =3D &lpass_gfm_rx_npl.hw,
> +               [LPASS_CDC_RX_MCLK_MCLK2] =3D &lpass_gfm_rx_mclk_mclk2.hw,
> +       },
> +       .num =3D ARRAY_SIZE(audiocc_gfm_clks),
> +};
> +
> +struct lpass_gfm_data {
> +       struct clk_hw_onecell_data *onecell_data;
> +       struct clk_gfm **gfm_clks;
> +};
> +
> +static struct lpass_gfm_data audiocc_data =3D {
> +       .onecell_data =3D &audiocc_hw_onecell_data,
> +       .gfm_clks =3D audiocc_gfm_clks,
> +};
> +
> +static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
> +{
> +       const struct lpass_gfm_data *data;
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       struct clk_gfm *gfm;
> +       struct lpass_gfm *cc;
> +       int err, i;
> +
> +       cc =3D devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> +       if (!cc)
> +               return -ENOMEM;
> +
> +       cc->core_vote =3D devm_clk_get(&pdev->dev, "core");
> +       if (IS_ERR(cc->core_vote)) {
> +               dev_dbg(dev, "Failed to get lpass core clk\n");
> +               return PTR_ERR(cc->core_vote);
> +       }

Can this use the pm_clk stuff?

> +
> +       data =3D of_device_get_match_data(dev);

What if data is NULL?

> +       cc->bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> +       if (IS_ERR(cc->bus_clk)) {
> +               dev_dbg(dev, "Failed to get lpass bus clk\n");
> +               return PTR_ERR(cc->bus_clk);
> +       }
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cc->base =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(cc->base))
> +               return PTR_ERR(cc->base);
> +
> +       clk_prepare_enable(cc->core_vote);
> +       clk_prepare_enable(cc->bus_clk);

These will always be left enabled if the probe function bails out after her=
e.

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
> +                       return err;
> +
> +       }
> +
> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +                                          data->onecell_data);
> +}
> +
> +static const struct of_device_id lpass_gfm_clk_match_table[] =3D {
> +       {
> +               .compatible =3D "qcom,sm8250-lpass-audiocc",
> +               .data =3D &audiocc_data,
> +       },
> +       { }
> +};
> +
> +static struct platform_driver lpass_gfm_clk_driver =3D {
> +       .probe          =3D lpass_gfm_clk_driver_probe,
> +       .driver         =3D {
> +               .name   =3D "lpass-gfm-clk",
> +               .of_match_table =3D lpass_gfm_clk_match_table,
> +       },
> +};
> +builtin_platform_driver(lpass_gfm_clk_driver);

Should be module_platform_driver()?
