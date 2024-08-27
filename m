Return-Path: <linux-arm-msm+bounces-29684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB3961AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 01:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5034F1C230D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 23:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CA01D45F7;
	Tue, 27 Aug 2024 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggIf3er3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F91D365D;
	Tue, 27 Aug 2024 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724802606; cv=none; b=kC0DdDqS9T7L6BvoUgdpdgGqT64uWuhDJ3+5bZbD6GQsdmvrPJ9yBOrGREsVfxOv9/UTyoW7p5ts/TZQym0RZ+koi9dQcxVgCDlRRUrR0otAXWEOrvqG7uPLU5aOtEaphUsOsrYjh+0mkzz5hmCVTYDgMBzIIlOYDmFBe34y9zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724802606; c=relaxed/simple;
	bh=HgWQdtXWb0VBXnmCD7/KhTe9vlHFiMLZIIAtA6mCnN8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=sMRecv/JEDY7HNpi2rjK924weByPR+aP0fVF93dfLf4uxhrbFwpZ9lT8SJ3+oK/FTUlEfR8OyiA3lEoS6zxViH8kEp3Qzl+8JF+75jQ6nCw/x/dPD11n7GcJlOmrpym1G82RpJi90gm6fHtmth0ItZ9BAzbt1Fs+rWO/sQlNmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggIf3er3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE5DC4FF4F;
	Tue, 27 Aug 2024 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724802606;
	bh=HgWQdtXWb0VBXnmCD7/KhTe9vlHFiMLZIIAtA6mCnN8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ggIf3er3wdjqmhQNoYFkxUA88FY68ZWkbU+JcFON3upecc5v3FGQ4hF3HHO5icfYU
	 kbnXX+a1JdlOV/P3Lgi8IGwcZ5I98CZvMa/SgJ//L+xPOxJvc4bfUSex+UqqdKhusu
	 +PT0ymbF92x9aa6HG4ndsODEEIGzKL6Vm9UzvyrB3tpDFkMh2S6CTR+VUXablyxZr3
	 PNOee2eaUriPd3bLmuCVIKSBkOYznKDBfxWFLoYEljh9Jf/wmrkSejgY6mEYKs+hPA
	 YG42XNfSKi3mDrwf417Gfj/7sgdPDk+fPirNsAIX/fBWSFriUj7CxMTci5UgFSjDY9
	 blGKzAs3mRCFA==
Message-ID: <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com> <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org, Luo Jie <quic_luoj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Date: Tue, 27 Aug 2024 16:50:03 -0700
User-Agent: alot/0.10

Quoting Luo Jie (2024-08-27 05:46:00)
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 8a6f0dabd02f..35f656146de7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_X1E80100_TCSRCC) +=3D tcsrcc-x1e80100.o
>  obj-$(CONFIG_CLK_QCM2290_GPUCC) +=3D gpucc-qcm2290.o
>  obj-$(CONFIG_IPQ_APSS_PLL) +=3D apss-ipq-pll.o
>  obj-$(CONFIG_IPQ_APSS_6018) +=3D apss-ipq6018.o
> +obj-$(CONFIG_IPQ_CMN_PLL) +=3D clk-ipq-cmn-pll.o

I don't see many other filenames with clk- prefix in this directory, so
probably drop it.

>  obj-$(CONFIG_IPQ_GCC_4019) +=3D gcc-ipq4019.o
>  obj-$(CONFIG_IPQ_GCC_5018) +=3D gcc-ipq5018.o
>  obj-$(CONFIG_IPQ_GCC_5332) +=3D gcc-ipq5332.o
> diff --git a/drivers/clk/qcom/clk-ipq-cmn-pll.c b/drivers/clk/qcom/clk-ip=
q-cmn-pll.c
> new file mode 100644
> index 000000000000..a9775c39b2f3
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ipq-cmn-pll.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +/*
> + * CMN PLL block expects the reference clock from on-board Wi-Fi block, =
and
> + * supplies fixed rate clocks as output to the Ethernet hardware blocks.
> + * The Ethernet related blocks include PPE (packet process engine) and t=
he
> + * external connected PHY (or switch) chip receiving clocks from the CMN=
 PLL.
> + *
> + * On the IPQ9574 SoC, There are three clocks with 50 MHZ, one clock with
> + * 25 MHZ which are output from the CMN PLL to Ethernet PHY (or switch),
> + * and one clock with 353 MHZ to PPE.
> + *
> + *               +---------+
> + *               |   GCC   |
> + *               +--+---+--+
> + *           AHB CLK|   |SYS CLK
> + *                  V   V
> + *          +-------+---+------+
> + *          |                  +-------------> eth0-50mhz
> + * REF CLK  |     IPQ9574      |
> + * -------->+                  +-------------> eth1-50mhz
> + *          |  CMN PLL block   |
> + *          |                  +-------------> eth2-50mhz
> + *          |                  |
> + *          +---------+--------+-------------> eth-25mhz
> + *                    |
> + *                    V
> + *                    ppe-353mhz
> + */
> +
> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>

Include dt-bindings after linux please.

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define CMN_PLL_REFCLK_SRC_SELECTION           0x28
> +#define CMN_PLL_REFCLK_SRC_DIV                 GENMASK(9, 8)
> +
> +#define CMN_PLL_LOCKED                         0x64
> +#define CMN_PLL_CLKS_LOCKED                    BIT(8)
> +
> +#define CMN_PLL_POWER_ON_AND_RESET             0x780
> +#define CMN_ANA_EN_SW_RSTN                     BIT(6)
> +
> +#define CMN_PLL_REFCLK_CONFIG                  0x784
> +#define CMN_PLL_REFCLK_EXTERNAL                        BIT(9)
> +#define CMN_PLL_REFCLK_DIV                     GENMASK(8, 4)
> +#define CMN_PLL_REFCLK_INDEX                   GENMASK(3, 0)
> +
> +#define CMN_PLL_CTRL                           0x78c
> +#define CMN_PLL_CTRL_LOCK_DETECT_EN            BIT(15)
> +
> +/**
> + * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
> + * @id:        Clock specifier to be supplied
> + * @name: Clock name to be registered
> + * @rate: Clock rate
> + */
> +struct cmn_pll_fixed_output_clk {
> +       unsigned int id;
> +       const char *name;
> +       const unsigned long rate;
> +};
> +
> +#define CLK_PLL_OUTPUT(_id, _name, _rate) {            \
> +       .id =3D _id,                                      \
> +       .name =3D _name,                                  \
> +       .rate =3D _rate,                                  \
> +}
> +
> +static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] =3D {
> +       CLK_PLL_OUTPUT(PPE_353MHZ_CLK, "ppe-353mhz", 353000000UL),
> +       CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
> +};
> +
> +static int ipq_cmn_pll_config(struct device *dev, unsigned long parent_r=
ate)
> +{
> +       void __iomem *base;
> +       u32 val;
> +
> +       base =3D devm_of_iomap(dev, dev->of_node, 0, NULL);

Use platform_device APIs please. This is a platform driver.

> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       val =3D readl(base + CMN_PLL_REFCLK_CONFIG);
> +       val &=3D ~(CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_INDEX);
> +
> +       /*
> +        * Configure the reference input clock selection as per the given=
 rate.
> +        * The output clock rates are always of fixed value.
> +        */
> +       switch (parent_rate) {
> +       case 25000000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3);
> +               break;
> +       case 31250000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 4);
> +               break;
> +       case 40000000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 6);
> +               break;
> +       case 48000000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> +               break;
> +       case 50000000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
> +               break;
> +       case 96000000:
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> +               val &=3D ~CMN_PLL_REFCLK_DIV;
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }

Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?

> +
> +       writel(val, base + CMN_PLL_REFCLK_CONFIG);
> +
> +       /* Update the source clock rate selection. Only 96 MHZ uses 0. */
> +       val =3D readl(base + CMN_PLL_REFCLK_SRC_SELECTION);
> +       val &=3D ~CMN_PLL_REFCLK_SRC_DIV;
> +       if (parent_rate !=3D 96000000)
> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_SRC_DIV, 1);
> +
> +       writel(val, base + CMN_PLL_REFCLK_SRC_SELECTION);
> +
> +       /* Enable PLL locked detect. */
> +       val =3D readl(base + CMN_PLL_CTRL);
> +       val |=3D CMN_PLL_CTRL_LOCK_DETECT_EN;
> +       writel(val, base + CMN_PLL_CTRL);
> +
> +       /*
> +        * Reset the CMN PLL block to ensure the updated configurations
> +        * take effect.
> +        */
> +       val =3D readl(base + CMN_PLL_POWER_ON_AND_RESET);
> +       val &=3D ~CMN_ANA_EN_SW_RSTN;
> +       writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
> +       usleep_range(1000, 1200);
> +
> +       val |=3D CMN_ANA_EN_SW_RSTN;
> +       writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
> +
> +       /* Stability check of CMN PLL output clocks. */
> +       return readl_poll_timeout(base + CMN_PLL_LOCKED, val,
> +                                 (val & CMN_PLL_CLKS_LOCKED),
> +                                 100, 100000);
> +}
> +
> +static int ipq_cmn_pll_clk_register(struct device *dev, const char *pare=
nt)

Please don't use string names to describe topology.

> +{
> +       const struct cmn_pll_fixed_output_clk *fixed_clk;
> +       struct clk_hw_onecell_data *data;
> +       unsigned int num_clks;
> +       struct clk_hw *hw;
> +       int i;
> +
> +       num_clks =3D ARRAY_SIZE(ipq9574_output_clks);
> +       fixed_clk =3D ipq9574_output_clks;
> +
> +       data =3D devm_kzalloc(dev, struct_size(data, hws, num_clks), GFP_=
KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               hw =3D devm_clk_hw_register_fixed_rate(dev, fixed_clk[i].=
name,
> +                                                    parent, 0,
> +                                                    fixed_clk[i].rate);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +
> +               data->hws[fixed_clk[i].id] =3D hw;
> +       }
> +       data->num =3D num_clks;
> +
> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, da=
ta);
> +}
> +
> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct clk *clk;
> +       int ret;
> +
> +       /*
> +        * To access the CMN PLL registers, the GCC AHB & SYSY clocks
> +        * for CMN PLL block need to be enabled.
> +        */
> +       clk =3D devm_clk_get_enabled(dev, "ahb");
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk),
> +                                    "Enable AHB clock failed\n");
> +
> +       clk =3D devm_clk_get_enabled(dev, "sys");
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk),
> +                                    "Enable SYS clock failed\n");

Usually qcom clk drivers do this with pm_clk_add() and runtime PM. Why
can't that be done here?

> +
> +       clk =3D devm_clk_get(dev, "ref");
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk),
> +                                    "Get reference clock failed\n");

We don't want clk providers to be clk consumers. Presumably this is the
PLL's parent clk, and so the frequency should be passed to the clk_ops
via the parent rate.

> +
> +       /* Configure CMN PLL to apply the reference clock. */
> +       ret =3D ipq_cmn_pll_config(dev, clk_get_rate(clk));
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Configure CMN PLL failed\=
n");
> +
> +       return ipq_cmn_pll_clk_register(dev, __clk_get_name(clk));
> +}
> +
> +static const struct of_device_id ipq_cmn_pll_clk_ids[] =3D {
> +       { .compatible =3D "qcom,ipq9574-cmn-pll", },
> +       { }
> +};

module device table?

