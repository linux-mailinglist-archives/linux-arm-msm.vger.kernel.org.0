Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2CC1B3AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 11:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgDVJA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 05:00:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgDVJA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 05:00:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43919206D6;
        Wed, 22 Apr 2020 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587546028;
        bh=Szlf9ZzsWRDVLiUoIgGCUpAgcbXQVj4EqngSZMV2pGY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=APQfd9bUJPPAgYgjsa4XM35xNOOByU2WNDdm4k95dTACr3ILzmncCxszFhiy1Ku5u
         PbqOgLt554/UNk5yAn9xBNFqr3b8J8iP72lUEpcsbvGMY7T4SNFRSz/97qKqIIJy6H
         YsYBqOkWd6uxz6JZnfqEEUyTg6KjsgcSdsqKhKnI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586832922-29191-4-git-send-email-sivaprak@codeaurora.org>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org> <1586832922-29191-4-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V3 3/8] clk: qcom: Add A53 PLL support for ipq6018 devices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 22 Apr 2020 02:00:27 -0700
Message-ID: <158754602745.132238.14379194464345140559@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-04-13 19:55:17)
> The CPUs on Qualcomm IPQ6018 platform is primarily clocked by A53 PLL.
> This patch adds support for the A53 PLL on IPQ6018 devices which can
> support CPU frequencies above 1Ghz.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  drivers/clk/qcom/a53-pll.c | 136 ++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 111 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 45cfc57..a95351c 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -11,11 +11,40 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>

Why does this driver need to change to use of_device APIs?

> =20
>  #include "clk-pll.h"
>  #include "clk-regmap.h"
> +#include "clk-alpha-pll.h"
> =20
> -static const struct pll_freq_tbl a53pll_freq[] =3D {
> +struct a53_alpha_pll {
> +       struct alpha_pll_config *pll_config;
> +       struct clk_alpha_pll *pll;
> +};
> +
> +union a53pll {
> +       struct clk_pll *pll;
> +       struct a53_alpha_pll alpha_pll;
> +};
> +
> +struct a53pll_data {
> +#define PLL_IS_ALPHA BIT(0)
> +       u8 flags;
> +       union a53pll a53pll;

Why is there a union? Can't we have different clk ops for the two types
of PLLs and then use container_of to get it from the clk ops?

> +};
> +
> +static const u8 ipq_pll_offsets[] =3D {
> +       [PLL_OFF_L_VAL] =3D 0x08,
> +       [PLL_OFF_ALPHA_VAL] =3D 0x10,
> +       [PLL_OFF_USER_CTL] =3D 0x18,
> +       [PLL_OFF_CONFIG_CTL] =3D 0x20,
> +       [PLL_OFF_CONFIG_CTL_U] =3D 0x24,
> +       [PLL_OFF_STATUS] =3D 0x28,
> +       [PLL_OFF_TEST_CTL] =3D 0x30,
> +       [PLL_OFF_TEST_CTL_U] =3D 0x34,
> +};
> +
> +static const struct pll_freq_tbl msm8996_a53pll_freq[] =3D {
>         {  998400000, 52, 0x0, 0x1, 0 },
>         { 1094400000, 57, 0x0, 0x1, 0 },
>         { 1152000000, 62, 0x0, 0x1, 0 },
> @@ -26,6 +55,64 @@ static const struct pll_freq_tbl a53pll_freq[] =3D {
>         { }
>  };
> =20
> +static struct clk_pll msm8996_pll =3D {
> +       .mode_reg =3D 0x0,
> +       .l_reg =3D 0x04,
> +       .m_reg =3D 0x08,
> +       .n_reg =3D 0x0c,
> +       .config_reg =3D 0x14,
> +       .status_reg =3D 0x1c,
> +       .status_bit =3D 16,
> +       .freq_tbl =3D msm8996_a53pll_freq,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "a53pll",
> +               .flags =3D CLK_IS_CRITICAL,
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "xo",
> +                       .name =3D "xo",
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_sr2_ops,
> +       },
> +};
> +
> +static struct clk_alpha_pll ipq6018_pll =3D {
> +       .offset =3D 0x0,
> +       .regs =3D ipq_pll_offsets,
> +       .flags =3D SUPPORTS_DYNAMIC_UPDATE,
> +       .clkr =3D {
> +               .enable_reg =3D 0x0,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "a53pll",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "xo",
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_huayra_ops,
> +               },
> +       },
> +};
> +
> +static struct alpha_pll_config ipq6018_pll_config =3D {

Can this be const?

> +       .l =3D 0x37,
> +       .config_ctl_val =3D 0x04141200,
> +       .config_ctl_hi_val =3D 0x0,
> +       .early_output_mask =3D BIT(3),
> +       .main_output_mask =3D BIT(0),
> +};
> +
> +static struct a53pll_data msm8996pll_data =3D {
> +       .a53pll.pll =3D &msm8996_pll,
> +};
> +
> +static struct a53pll_data ipq6018pll_data =3D {
> +       .flags =3D PLL_IS_ALPHA,
> +       .a53pll.alpha_pll.pll =3D &ipq6018_pll,
> +       .a53pll.alpha_pll.pll_config =3D &ipq6018_pll_config,
> +};
> +
>  static const struct regmap_config a53pll_regmap_config =3D {
>         .reg_bits               =3D 32,
>         .reg_stride             =3D 4,
> @@ -39,14 +126,16 @@ static int qcom_a53pll_probe(struct platform_device =
*pdev)
>         struct device *dev =3D &pdev->dev;
>         struct regmap *regmap;
>         struct resource *res;
> -       struct clk_pll *pll;
> +       const struct a53pll_data *pll_data;
> +       struct clk_regmap *clkr;
>         void __iomem *base;
> -       struct clk_init_data init =3D { };
>         int ret;
> =20
> -       pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> -       if (!pll)
> -               return -ENOMEM;
> +       pll_data =3D of_device_get_match_data(dev);

Use device_get_match_data() please.

> +       if (!pll_data) {
> +               dev_err(dev, "failed to get platform data\n");

No error message please.

> +               return -ENODEV;
> +       }
> =20
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         base =3D devm_ioremap_resource(dev, res);
> @@ -57,30 +146,26 @@ static int qcom_a53pll_probe(struct platform_device =
*pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
> =20
> -       pll->l_reg =3D 0x04;
> -       pll->m_reg =3D 0x08;
> -       pll->n_reg =3D 0x0c;
> -       pll->config_reg =3D 0x14;
> -       pll->mode_reg =3D 0x00;
> -       pll->status_reg =3D 0x1c;
> -       pll->status_bit =3D 16;
> -       pll->freq_tbl =3D a53pll_freq;
> -
> -       init.name =3D "a53pll";
> -       init.parent_names =3D (const char *[]){ "xo" };
> -       init.num_parents =3D 1;
> -       init.ops =3D &clk_pll_sr2_ops;
> -       init.flags =3D CLK_IS_CRITICAL;

Please document why a clk is critical.

> -       pll->clkr.hw.init =3D &init;
> -
> -       ret =3D devm_clk_register_regmap(dev, &pll->clkr);
> +       if (pll_data->flags & PLL_IS_ALPHA) {
> +               struct clk_alpha_pll *alpha_pll =3D
> +                       pll_data->a53pll.alpha_pll.pll;
> +               struct alpha_pll_config *alpha_pll_config =3D
> +                       pll_data->a53pll.alpha_pll.pll_config;
> +
> +               clk_alpha_pll_configure(alpha_pll, regmap, alpha_pll_conf=
ig);
> +               clkr =3D &pll_data->a53pll.alpha_pll.pll->clkr;
> +       } else {
> +               clkr =3D &pll_data->a53pll.pll->clkr;
> +       }

Sorry, the design is confusing.
