Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91041F0B27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 01:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfKFAjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 19:39:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:60368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfKFAjp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 19:39:45 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BDAE2178F;
        Wed,  6 Nov 2019 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573000784;
        bh=XLdzJ0kLucCVA8uB4YNgHPKE5VLk6I9jneTkawWn3Vw=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=g4E0r6h7Cd9eEZmFAgy4AYlR36j8Wg/pQ/do7/zZibtQJ0WiRo9jNrAG3OVXImD0S
         kQB9VpozFzUDbgib29LsnLMFp4cnER89vIfyTo3iNr9qRRYtXPlbAwzv8f0/aHqSEl
         XTNNXqD2aJjFMCQznX63g3AL2LxcTUWzQKBygx6o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572524473-19344-8-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-8-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 7/7] clk: qcom: Add video clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 16:39:43 -0800
Message-Id: <20191106003944.1BDAE2178F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-31 05:21:13)
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc=
-sc7180.c
> new file mode 100644
> index 0000000..bef034b
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

Are these of includes used?

> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,videocc-sc7180.h>
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
> +       P_CHIP_SLEEP_CLK,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_VIDEO_PLL0_OUT_EVEN,
> +       P_VIDEO_PLL0_OUT_MAIN,
> +       P_VIDEO_PLL0_OUT_ODD,
> +};
> +
> +static struct pll_vco fabia_vco[] =3D {

const?

> +       { 249600000, 2000000000, 0 },
> +};
> +
[...]
> +
> +static int video_cc_sc7180_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct alpha_pll_config video_pll0_config =3D {};
> +
> +       regmap =3D qcom_cc_map(pdev, &video_cc_sc7180_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       video_pll0_config.l =3D 0x1F;

lowercase hex please.

> +       video_pll0_config.alpha =3D 0x4000;
> +       video_pll0_config.user_ctl_val =3D 0x00000001;
> +       video_pll0_config.user_ctl_hi_val =3D 0x00004805;

Same question, why on stack?

> +
> +       clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
> +
> +       /* video_cc_xo_clk */

What are we doing? Enabling it?

> +       regmap_update_bits(regmap, 0x984, 0x1, 0x1);
> +
> +       return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
> +}
> +
> +static struct platform_driver video_cc_sc7180_driver =3D {
> +       .probe =3D video_cc_sc7180_probe,
> +       .driver =3D {
> +               .name =3D "sc7180-videocc",
> +               .of_match_table =3D video_cc_sc7180_match_table,
> +       },
> +};
> +
> +static int __init video_cc_sc7180_init(void)
> +{
> +       return platform_driver_register(&video_cc_sc7180_driver);
> +}
> +core_initcall(video_cc_sc7180_init);
> +
> +static void __exit video_cc_sc7180_exit(void)
> +{
> +       platform_driver_unregister(&video_cc_sc7180_driver);
> +}
> +module_exit(video_cc_sc7180_exit);

Same question, module platform driver perhaps?
