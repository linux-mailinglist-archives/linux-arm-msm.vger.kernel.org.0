Return-Path: <linux-arm-msm+bounces-34642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024609A14E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 23:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45869B21A44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 21:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907B81D2B0E;
	Wed, 16 Oct 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLJaAHwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4911865E2;
	Wed, 16 Oct 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729114657; cv=none; b=MVkf6ov1xRI0qCU168CwRNp5qkoNZhy+tUaYfnP4d9SiK+++8EeKo1b2iaCgI4SpU77k7Rs1xTB280IRjZcD4mhk3Iw3Rhne5zonN0/RVACnxMcEKOujOmxN3BOlaqyjoDfLheqxN2cG5EhswneYpN8dgR8Q0SV6YmaEimH/Oq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729114657; c=relaxed/simple;
	bh=46L/pMutPlLS8XV/qOBKY2jlyYO4to/YAOYlwTc9qXQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=HB9IjolU2QLvNo9EHqd5wf17lYr+Y62SnI6FD5MfRK6Gs+mt5c3Uyi2LzZXq32ERpzy/4aFw4t2iBytg2SBUr6JRD/mZ9WCFh6+sqEp27oLTXMgnul9pyWtcMDScw77iTadX+LcADFCVeydMtOzb5k9xgOtXsq9d2pIf5wnb0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLJaAHwe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA926C4CEC5;
	Wed, 16 Oct 2024 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729114656;
	bh=46L/pMutPlLS8XV/qOBKY2jlyYO4to/YAOYlwTc9qXQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KLJaAHweOQhuAdFlR2ijAF1PBBoi58buUyWkpqgIwWyy79Zj216KGPa4buP6fHFGY
	 DfNabrspG2ACBV5l2TGzDX3HnBkCYI73cpfRe4LDM0tVNPltZ+IMPWbgAspLhXW5ux
	 Grc/a3F3Td+jZI/xh2Nqsj97/me4Z/1c0iRaxUTJ4CfCt6ZjMtzFwKSM6lL2xuBACa
	 cnhBR7dk3Z3+mF2XG8aeuShUQXiVcw6Vzz9dlx0f+RCKDWruLsS1DF1WyYtxzaWdzZ
	 99+MqiWBPjk/Dw6Us3GlYOVPLa6g7htp4SsfZ+8zL6RsF5CG9TUJ2f7O5SA6fsj4xs
	 JDAUzvSdZ1qVQ==
Message-ID: <77ad972276c165acc3d0e9d72df1a021.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241015-qcom_ipq_cmnpll-v4-2-27817fbe3505@quicinc.com>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com> <20241015-qcom_ipq_cmnpll-v4-2-27817fbe3505@quicinc.com>
Subject: Re: [PATCH v4 2/4] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org, Luo Jie <quic_luoj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Date: Wed, 16 Oct 2024 14:37:34 -0700
User-Agent: alot/0.10

Quoting Luo Jie (2024-10-15 07:16:52)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 30eb8236c9d8..3def659fc5cb 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -190,6 +190,16 @@ config IPQ_APSS_6018
>           Say Y if you want to support CPU frequency scaling on
>           ipq based devices.
> =20
> +config IPQ_CMN_PLL
> +       tristate "IPQ CMN PLL Clock Controller"
> +       depends on IPQ_GCC_9574

What is the build dependency?

> +       help
> +         Support for CMN PLL clock controller on IPQ platform. The
> +         CMN PLL feeds the reference clocks to the Ethernet devices
> +         based on IPQ SoC.
> +         Say Y or M if you want to support CMN PLL clock on the IPQ
> +         based devices.
> +
>  config IPQ_GCC_4019
>         tristate "IPQ4019 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> new file mode 100644
> index 000000000000..f5ebc7d93ed8
> --- /dev/null
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +/*
> + * CMN PLL block expects the reference clock from on-board Wi-Fi block,
> + * and supplies fixed rate clocks as output to the networking hardware
> + * blocks and to GCC. The networking related blocks include PPE (packet
> + * process engine), the externally connected PHY or switch devices, and
> + * the PCS.
> + *
> + * On the IPQ9574 SoC, there are three clocks with 50 MHZ and one clock
> + * with 25 MHZ which are output from the CMN PLL to Ethernet PHY (or swi=
tch),
> + * and one clock with 353 MHZ to PPE. The other fixed rate output clocks
> + * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to =
PCS
> + * with 31.25 MHZ.
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
> + *          +----+----+----+---+-------------> eth-25mhz
> + *               |    |    |
> + *               V    V    V
> + *              GCC  PCS  NSS/PPE
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

What is of_address.h for? Did you mean mod_devicetable.h?

> +#include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
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
[...]
> +
> +/*
> + * This function is used to initialize the CMN PLL to enable the fixed
> + * rate output clocks. It is expected to be configured once.
> + */
> +static int clk_cmn_pll_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
> +{
> +       struct clk_cmn_pll *cmn_pll =3D to_clk_cmn_pll(hw);
> +       u32 val;
> +       int ret;
> +
> +       /*
> +        * Configure the reference input clock selection as per the given
> +        * parent clock. The output clock rates are always of fixed value.
> +        */
> +       switch (req->best_parent_rate) {
> +       case 25000000:
> +               val =3D 3;
> +               break;
> +       case 31250000:
> +               val =3D 4;
> +               break;
> +       case 40000000:
> +               val =3D 6;
> +               break;
> +       case 50000000:
> +               val =3D 8;
> +               break;
> +       case 48000000:
> +       case 96000000:
> +               /*
> +                * Parent clock rate 48 MHZ and 96 MHZ take the same value
> +                * of reference clock index. 96 MHZ needs the source clock
> +                * divider to be programmed as 2.
> +                */
> +               val =3D 7;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       ret =3D regmap_update_bits(cmn_pll->regmap, CMN_PLL_REFCLK_CONFIG,
> +                                CMN_PLL_REFCLK_INDEX,
> +                                FIELD_PREP(CMN_PLL_REFCLK_INDEX, val));

The determine_rate() function shouldn't modify the hardware. This should
be done in the set_rate() callback. Likely you'll need to use
assigned-clock-rates to do that.

