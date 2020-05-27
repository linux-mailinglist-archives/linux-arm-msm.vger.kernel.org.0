Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3021E3640
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 05:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgE0DKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 23:10:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:53672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DKm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 23:10:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A34020704;
        Wed, 27 May 2020 03:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590549041;
        bh=W4LpQNTCqo6oScJJ6K9RdCmt19H0vyKKFd5EEo743+0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oKKISj2hOAD1vA47XtZZ3zSN872XZlWz03P0FRjaSfPI/Wy7REn7nNWdrJgC0/tNg
         YEwC/CmVNpvZgUiL1pKdxJFBHGHjEh+vDYKl3oUmB6YH/65LucfqtqWqfr2otz57Xz
         hgY4B8bThDC1UhOCillk9zYH4Dzx43Qixyw89El0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589707344-8871-5-git-send-email-tdas@codeaurora.org>
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org> <1589707344-8871-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 26 May 2020 20:10:40 -0700
Message-ID: <159054904061.88029.1394425232497625411@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-05-17 02:22:24)
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpa=
sscorecc-sc7180.c
> new file mode 100644
> index 0000000..86e3599
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD,
> +       P_SLEEP_CLK,
> +};
> +
> +static struct pll_vco fabia_vco[] =3D {
> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static const struct alpha_pll_config lpass_lpaaudio_dig_pll_config =3D {
> +       .l =3D 0x20,
[...]
> +
> +static struct regmap_config lpass_core_cc_sc7180_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .val_bits =3D 32,
> +       .fast_io =3D true,
> +};
> +
> +static const struct qcom_cc_desc lpass_core_hm_sc7180_desc =3D {
> +       .config =3D &lpass_core_cc_sc7180_regmap_config,
> +       .gdscs =3D lpass_core_hm_sc7180_gdscs,
> +       .num_gdscs =3D ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
> +};
> +
> +static const struct qcom_cc_desc lpass_core_cc_sc7180_desc =3D {
> +       .config =3D &lpass_core_cc_sc7180_regmap_config,
> +       .clks =3D lpass_core_cc_sc7180_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
> +};
> +
> +static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc =3D {
> +       .config =3D &lpass_core_cc_sc7180_regmap_config,
> +       .gdscs =3D lpass_audio_hm_sc7180_gdscs,
> +       .num_gdscs =3D ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> +};
> +
> +

Drop double newline please.

> +static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       struct regmap *regmap;
> +       int ret;
> +
> +       lpass_core_cc_sc7180_regmap_config.name =3D "lpass_audio_cc";
> +       desc =3D &lpass_audio_hm_sc7180_desc;
> +       ret =3D qcom_cc_probe_by_index(pdev, 1, desc);
> +       if (ret)
> +               return ret;
> +
> +       lpass_core_cc_sc7180_regmap_config.name =3D "lpass_core_cc";
> +       regmap =3D qcom_cc_map(pdev, &lpass_core_cc_sc7180_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /*
> +        * Keep the CLK always-ON

Why? Presumably to make sure we can access the lpass sysnoc path all the
time?

> +        * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
> +        */
> +       regmap_update_bits(regmap, 0x24000, BIT(0), BIT(0));
> +
> +       /* PLL settings */
> +       regmap_write(regmap, 0x1008, 0x20);
> +       regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
> +
> +       clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> +                               &lpass_lpaaudio_dig_pll_config);
> +
> +       return qcom_cc_really_probe(pdev, &lpass_core_cc_sc7180_desc, reg=
map);
> +}
> +
> +static int lpass_hm_core_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       lpass_core_cc_sc7180_regmap_config.name =3D "lpass_hm_core";
> +       desc =3D &lpass_core_hm_sc7180_desc;
> +
> +       return qcom_cc_probe_by_index(pdev, 0, desc);
> +}
> +
> +static const struct of_device_id lpass_core_cc_sc7180_match_table[] =3D {
> +       {
> +               .compatible =3D "qcom,sc7180-lpasshm",
> +               .data =3D lpass_hm_core_probe,
> +       },
> +       {
> +               .compatible =3D "qcom,sc7180-lpasscorecc",
> +               .data =3D lpass_core_cc_sc7180_probe,
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
> +
> +static int lpass_core_sc7180_probe(struct platform_device *pdev)
> +{
> +       int (*clk_probe)(struct platform_device *p);
> +       int ret;
> +
> +       pm_runtime_enable(&pdev->dev);
> +       ret =3D pm_clk_create(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_clk_add(&pdev->dev, "gcc_lpass_sway");
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to acquire iface clock\n");

Can the clk name be 'iface' if it's actually the interface clk?
"gcc_lpass_sway" looks to be the actual clk name which we shouldn't care
about here. It should be whatever clk name we consider it to be, which
would mean iface probably.

> +               goto disable_pm_runtime;
> +       }
> +
> +       clk_probe =3D of_device_get_match_data(&pdev->dev);
> +       if (!clk_probe)
> +               return -EINVAL;
> +
> +       ret =3D clk_probe(pdev);
> +       if (ret)
> +               goto destroy_pm_clk;
> +
> +       return 0;
