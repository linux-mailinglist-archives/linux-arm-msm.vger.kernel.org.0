Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0794768D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 04:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhLPDwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 22:52:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41348 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhLPDwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 22:52:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29C1761C11;
        Thu, 16 Dec 2021 03:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70995C36AE3;
        Thu, 16 Dec 2021 03:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639626742;
        bh=RUCt0riuU9Fb4YuFi47Zugjnb+4FH5cM3D7xn3IYuZA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j7G1LhvrTMyP6dmdFUBq2yRb8yKPxbCS2GcgUaCgjnupsoYw3TJ8ThcJodTU6JV/g
         40B9caiOJ7+eYrbQJUounNXhWijWwdJ9JcqnOdICvaqOwj7GVqOoFAQ9++X3DC4Xlc
         GP6yogLtWtX7YaHMUQ5p06XHaAAAmaBufdqm1iULieioGhV4wL9jT/EKMUq7oW2Zub
         BPRJKrRI/lvpGXnWPnTYyoAobz+pPSfaBEhyXsw2KVkZKJphBiQUwnXdgIJ5VBFFsW
         JIl2G710GoDlmzvWIXJHEc+ilA7rqSQKVkvyho464qz/4cDPl51XZLPTFSQp2dUvY2
         PjPR41raDKwyQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1639588180-32454-2-git-send-email-loic.poulain@linaro.org>
References: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org> <1639588180-32454-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add display clock controller driver for QCM2290
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Wed, 15 Dec 2021 19:52:21 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216035222.70995C36AE3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2021-12-15 09:09:40)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 74efc82..b136cd2 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -332,6 +332,14 @@ config QCM_GCC_2290
>           Say Y if you want to use multimedia devices or peripheral
>           devices such as UART, SPI, I2C, USB, SD/eMMC etc.
> =20
> +config QCM_DISPCC_2290
> +       tristate "QCM2290 Display Clock Controller"

Select QCM_GCC_2290 here so that this driver being builtin forces GCC to
be builtin.

> +       help
> +         Support for the display clock controller on Qualcomm Technologi=
es, Inc
> +         QCM2290 devices.
> +         Say Y if you want to support display devices and functionality =
such as
> +         splash screen.
> +
>  config QCS_GCC_404
>         tristate "QCS404 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> new file mode 100644
> index 00000000..6854371
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -0,0 +1,602 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>

Same comments apply on this version.

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "reset.h"
> +#include "gdsc.h"

Is there any reset or gdsc? Please include what is used instead of
copy/pasting includes from somewhere else.

> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_DISP_CC_PLL0_OUT_MAIN,
> +       P_DSI0_PHY_PLL_OUT_BYTECLK,
> +       P_DSI0_PHY_PLL_OUT_DSICLK,
> +       P_DSI1_PHY_PLL_OUT_DSICLK,
> +       P_GPLL0_OUT_MAIN,
> +       P_SLEEP_CLK,
> +};
> +
> +static struct pll_vco spark_vco[] =3D {
> +       { 500000000, 1000000000, 2 },
> +};
> +
> +/* 768MHz configuration */
> +static const struct alpha_pll_config disp_cc_pll0_config =3D {
> +       .l =3D 0x28,
> +       .alpha =3D 0x0,
> +       .alpha_en_mask =3D BIT(24),
> +       .vco_val =3D 0x2 << 20,
> +       .vco_mask =3D GENMASK(21, 20),
> +       .main_output_mask =3D BIT(0),
> +       .config_ctl_val =3D 0x4001055B,
> +};
> +
[...]
> +
> +static int disp_cc_qcm2290_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       regmap =3D qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_conf=
ig);
> +
> +       ret =3D qcom_cc_really_probe(pdev, &disp_cc_qcm2290_desc, regmap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register DISP CC clocks\n"=
);
> +               return ret;
> +       }
> +
> +       dev_info(&pdev->dev, "Registered DISP CC clocks\n");

Remove this.

> +
> +       return ret;
> +}
> +
