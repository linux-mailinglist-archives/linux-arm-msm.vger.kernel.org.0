Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDB117E9ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 21:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgCIUYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 16:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726106AbgCIUYg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 16:24:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D87F62146E;
        Mon,  9 Mar 2020 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583785476;
        bh=StFL5QvmItJfOwz5VxmHCR0sM7EiUH0ldEUy/9kuvBI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mEltg4vcLqtYrMmRBSqoDNjFIEKXPWo+0y9RcaDbIdUbJgApQjySqLUB03QgQkVHQ
         MiLGalrDdPxg9svfAdIjRCd5U7eMPLG7pUgeFQr/CgHNkq2dj1Mtn71lHcXyn5XBVP
         3ShE/8zhFEQvjPWlCh8RuqexbeyA1TD3J/wmlz8I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org> <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     sivaprak@codeaurora.org
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 09 Mar 2020 13:24:35 -0700
Message-ID: <158378547505.66766.155212878365765346@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-02-27 01:55:18)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 15cdcdc..37e4ce2 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -89,6 +89,14 @@ config APQ_MMCC_8084
>           Say Y if you want to support multimedia devices such as display,
>           graphics, video encode/decode, camera, etc.
> =20
> +config IPQ_APSS_6018
> +       tristate "IPQ6018 APSS Clock Controller"
> +       select IPQ_GCC_6018
> +       help
> +         Support for APSS clock controller on ipq6018 devices. The
> +         APSS clock controller supports frequencies higher than 800Mhz.

supports CPU frequencies? It's not clear what APSS is to a lot of people
out there.

> +         Say Y if you want to support higher frequencies on ipq6018 devi=
ces.

support CPU frequency scaling on ipq6018?

> +
>  config IPQ_GCC_4019
>         tristate "IPQ4019 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6=
018.c
> new file mode 100644
> index 0000000..04b8962
> --- /dev/null
> +++ b/drivers/clk/qcom/apss-ipq6018.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>

> +#include <linux/of.h>
> +#include <linux/of_device.h>

Are these two includes needed at all?

> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/qcom,apss-ipq6018.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "reset.h"
> +
> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }

This can be removed. It's common in clk-rcg.h now

> +
> +static struct clk_branch apcs_alias0_core_clk =3D {
> +       .halt_reg =3D 0x004c,
> +       .clkr =3D {
> +               .enable_reg =3D 0x004c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "apcs_alias0_core_clk",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &apcs_alias0_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Please add a comment about why CLK_IS_CRITICAL is here. Presumably in
the case that a cpufreq driver doesn't probe and claim this clk?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +
[...]
> +
> +static int __init apss_ipq6018_init(void)
> +{
> +       return platform_driver_register(&apss_ipq6018_driver);
> +}
> +core_initcall(apss_ipq6018_init);
> +
> +static void __exit apss_ipq6018_exit(void)
> +{
> +       platform_driver_unregister(&apss_ipq6018_driver);
> +}
> +module_exit(apss_ipq6018_exit);

Any reason this can't just be module_platform_driver()?
