Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEF718C2E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 23:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbgCSWRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 18:17:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgCSWRl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 18:17:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A220520663;
        Thu, 19 Mar 2020 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584656259;
        bh=9YFfp6SMjOMzuqUuqqNcb8clCM59a9u4pFlNJ/hxsR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n4iTXkh3rdkp2OBRF0wO724UClsFBx7uteIoNYfCtrzUHQrw9ujrlYPvPFbKtTh2H
         Xiiu1LTI0gPyBGDMN3V66oHf5lSWZx01yodhWHczN2If/0atG4E2mOWSWjP6lt+nOb
         fTJlbDmNnW5Zc9U2eIqdfZCfP3J20L9WjfvMVXiU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583367028-19979-5-git-send-email-varar@codeaurora.org>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org> <1583367028-19979-5-git-send-email-varar@codeaurora.org>
Subject: Re: [DPU PATCH v4 4/5] drm/msm/dp: add support for DP PLL driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        aravindh@codeaurora.org, dri-devel@lists.freedesktop.org,
        Vara Reddy <varar@codeaurora.org>
To:     Vara Reddy <varar@codeaurora.org>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org
Date:   Thu, 19 Mar 2020 15:17:38 -0700
Message-ID: <158465625882.152100.12706886180422992156@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vara Reddy (2020-03-04 16:10:27)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> Add the needed DP PLL specific files to support
> display port interface on msm targets.
>=20
> The DP driver calls the DP PLL driver registration.
> The DP driver sets the link and pixel clock sources.
>=20
> Changes in v2:
> -- Update copyright markings on all relevant files.
> -- Use DRM_DEBUG_DP for debug msgs.
>=20
> Changes in v4:
> -- Update the DP link clock provider names
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/Kconfig                   |  13 +
>  drivers/gpu/drm/msm/Makefile                  |   4 +
>  drivers/gpu/drm/msm/dp/dp_display.c           |  51 +++
>  drivers/gpu/drm/msm/dp/dp_display.h           |   3 +
>  drivers/gpu/drm/msm/dp/dp_parser.h            |   4 +
>  drivers/gpu/drm/msm/dp/dp_power.h             |   1 -
>  drivers/gpu/drm/msm/dp/pll/dp_pll.c           | 136 +++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.h           |  57 +++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c      | 406 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h      |  86 +++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c | 524 ++++++++++++++++++++=
++++++
>  11 files changed, 1284 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>=20
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 7946cb1..e73ad23 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -66,6 +66,19 @@ config DRM_MSM_DP
>           display support is enabled through this config option. It can
>           be primary or secondary display on device.
> =20
> +config DRM_MSM_DP_PLL
> +       bool "Enable DP PLL driver in MSM DRM"
> +       depends on DRM_MSM_DP && COMMON_CLK
> +       help
> +         Choose this option to enable DP PLL driver which provides DP
> +         source clocks under common clock framework.
> +
> +config DRM_MSM_DP_10NM_PLL
> +       bool "Enable DP 10nm PLL driver in MSM DRM (used by SDM845)"
> +       depends on DRM_MSM_DP_PLL
> +       help
> +         Choose this option if DP PLL on SDM845 is used on the platform.
> +
>  config DRM_MSM_DSI
>         bool "Enable DSI support in MSM DRM driver"
>         depends on DRM_MSM
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index c846599..1621f3f 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -140,4 +140,8 @@ msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/pll/dsi_p=
ll_14nm.o
>  msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/pll/dsi_pll_10nm.o
>  endif
> =20
> +msm-$(CONFIG_DRM_MSM_DP_PLL)+=3D dp/pll/dp_pll.o
> +msm-$(CONFIG_DRM_MSM_DP_10NM_PLL)+=3D dp/pll/dp_pll_10nm.o \
> +       dp/pll/dp_pll_10nm_util.o
> +
>  obj-$(CONFIG_DRM_MSM)  +=3D msm.o
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 5525405..ded8f5c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -61,6 +61,51 @@ struct dp_display_private {
>         {}
>  };
> =20
> +static int dp_get_pll(struct dp_display_private *dp_priv)
> +{
> +       struct platform_device *pdev =3D NULL;
> +       struct platform_device *pll_pdev;
> +       struct device_node *pll_node;
> +       struct dp_parser *dp_parser =3D NULL;
> +
> +       if (!dp_priv) {
> +               DRM_ERROR("Invalid Arguments\n");

It's a static function. Is this even possible? The bad code would be in
the same file.

> +               return -EINVAL;
> +       }
> +
> +       pdev =3D dp_priv->pdev;
> +       dp_parser =3D dp_priv->parser;
> +
> +       if (!dp_parser) {
> +               DRM_DEV_ERROR(&pdev->dev, "%s: Parser not initialized\n",
> +                               __func__);
> +               return -EINVAL;
> +       }
> +
> +       pll_node =3D of_parse_phandle(pdev->dev.of_node, "pll-node", 0);
> +       if (!pll_node) {
> +               DRM_DEV_ERROR(&pdev->dev, "%s: cannot find pll device\n",
> +                               __func__);
> +               return -ENXIO;
> +       }
> +
> +       pll_pdev =3D of_find_device_by_node(pll_node);
> +       if (pll_pdev)
> +               dp_parser->pll =3D platform_get_drvdata(pll_pdev);
> +
> +       of_node_put(pll_node);
> +
> +       if (!pll_pdev || !dp_parser->pll) {
> +               DRM_DEV_ERROR(&pdev->dev, "%s: pll driver is not ready\n",
> +                               __func__);
> +               return -EPROBE_DEFER;
> +       }
> +
> +       dp_parser->pll_dev =3D get_device(&pll_pdev->dev);
> +
> +       return 0;
> +}
> +
>  static irqreturn_t dp_display_irq(int irq, void *dev_id)
>  {
>         struct dp_display_private *dp =3D dev_id;
> @@ -114,6 +159,10 @@ static int dp_display_bind(struct device *dev, struc=
t device *master,
>                 goto end;
>         }
> =20
> +       rc =3D dp_get_pll(dp);
> +       if (rc)
> +               goto end;
> +
>         rc =3D dp_aux_register(dp->aux);
>         if (rc) {
>                 DRM_ERROR("DRM DP AUX register failed\n");
> @@ -837,6 +886,7 @@ int __init msm_dp_register(void)
>  {
>         int ret;
> =20
> +       msm_dp_pll_driver_register();
>         ret =3D platform_driver_register(&dp_display_driver);
>         if (ret) {
>                 DRM_ERROR("driver register failed");
> @@ -848,6 +898,7 @@ int __init msm_dp_register(void)
> =20
>  void __exit msm_dp_unregister(void)
>  {
> +       msm_dp_pll_driver_unregister();
>         platform_driver_unregister(&dp_display_driver);
>  }
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp=
/dp_display.h
> index dad8610..4c53ed5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -25,4 +25,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
>  bool dp_display_check_video_test(struct msm_dp *dp_display);
>  int dp_display_get_test_bpp(struct msm_dp *dp_display);
> =20
> +void __init msm_dp_pll_driver_register(void);
> +void __exit msm_dp_pll_driver_unregister(void);
> +
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/=
dp_parser.h
> index 1dc592f..e775cbc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -6,6 +6,8 @@
>  #ifndef _DP_PARSER_H_
>  #define _DP_PARSER_H_
> =20
> +#include "pll/dp_pll.h"
> +
>  #define DP_LABEL "MDSS DP DISPLAY"
>  #define AUX_CFG_LEN    10
>  #define DP_MAX_PIXEL_CLK_KHZ   675000
> @@ -193,6 +195,8 @@ struct dp_parser {
>         bool combo_phy_en;
>         struct dp_io io;
>         struct dp_display_data disp_data;
> +       struct msm_dp_pll *pll;
> +       struct device *pll_dev;
>         const struct dp_regulator_cfg *regulator_cfg;
>         u8 l_map[4];
>         struct dp_aux_cfg aux_cfg[AUX_CFG_LEN];
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/d=
p_power.h
> index 52b6194..b24b2c5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -14,7 +14,6 @@
>   * @init: initializes the regulators/core clocks/GPIOs/pinctrl
>   * @deinit: turns off the regulators/core clocks/GPIOs/pinctrl
>   * @clk_enable: enable/disable the DP clocks
> - * @set_link_clk_parent: set the parent of DP link clock
>   * @set_pixel_clk_parent: set the parent of DP pixel clock
>   */
>  struct dp_power {

This can be another patch to update documentation?

> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll.c b/drivers/gpu/drm/msm/dp=
/pll/dp_pll.c
> new file mode 100644
> index 0000000..11e26cf
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include "dp_pll.h"
> +
> +int msm_dp_pll_util_parse_dt_clock(struct platform_device *pdev,
> +                                       struct msm_dp_pll *pll)
> +{
> +       u32 i =3D 0, rc =3D 0;
> +       struct dss_module_power *mp =3D &pll->mp;
> +       const char *clock_name;
> +       u32 clock_rate;
> +
> +       mp->num_clk =3D of_property_count_strings(pdev->dev.of_node,
> +                                                       "clock-names");
> +       if (mp->num_clk <=3D 0) {
> +               DRM_DEV_ERROR(&pdev->dev, "%s:clocks are not defined\n",
> +                               __func__);
> +               goto clk_err;
> +       }
> +
> +       mp->clk_config =3D devm_kzalloc(&pdev->dev,

Use devm_kcalloc() for arrays.

> +                       sizeof(struct dss_clk) * mp->num_clk, GFP_KERNEL);
> +       if (!mp->clk_config) {
> +               rc =3D -ENOMEM;
> +               mp->num_clk =3D 0;
> +               goto clk_err;
> +       }
> +
> +       for (i =3D 0; i < mp->num_clk; i++) {
> +               of_property_read_string_index(pdev->dev.of_node, "clock-n=
ames",
> +                                                       i, &clock_name);
> +               strlcpy(mp->clk_config[i].clk_name, clock_name,
> +                               sizeof(mp->clk_config[i].clk_name));
> +
> +               of_property_read_u32_index(pdev->dev.of_node, "clock-rate=
",
> +                                                       i, &clock_rate);
> +               mp->clk_config[i].rate =3D clock_rate;
> +
> +               if (!clock_rate)
> +                       mp->clk_config[i].type =3D DSS_CLK_AHB;
> +               else
> +                       mp->clk_config[i].type =3D DSS_CLK_PCLK;
> +       }
> +
> +clk_err:
> +       return rc;
> +}
> +
> +struct msm_dp_pll *msm_dp_pll_init(struct platform_device *pdev,
> +                       enum msm_dp_pll_type type, int id)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct msm_dp_pll *pll;
> +
> +       switch (type) {
> +       case MSM_DP_PLL_10NM:
> +               pll =3D msm_dp_pll_10nm_init(pdev, id);
> +               break;
> +       default:
> +               pll =3D ERR_PTR(-ENXIO);
> +               break;
> +       }
> +
> +       if (IS_ERR(pll)) {
> +               DRM_DEV_ERROR(dev, "%s: failed to init DP PLL\n", __func_=
_);
> +               return pll;
> +       }
> +
> +       pll->type =3D type;
> +
> +       DRM_DEBUG_DP("DP:%d PLL registered", id);
> +
> +       return pll;
> +}
> +
> +static const struct of_device_id dp_pll_dt_match[] =3D {
> +       { .compatible =3D "qcom,dp-pll-10nm" },

Add a terminator here { }.

> +};
> +
> +static int dp_pll_driver_probe(struct platform_device *pdev)
> +{
> +       struct msm_dp_pll *pll;
> +       struct device *dev =3D &pdev->dev;
> +       const struct of_device_id *match;
> +
> +       match =3D of_match_node(dp_pll_dt_match, dev->of_node);
> +       if (!match)
> +               return -ENODEV;
> +
> +       /* Currently supporting only 10nm-DP PLL */

Please remove this useless comment that can only require being updated
in the future.

> +       pll =3D msm_dp_pll_init(pdev, MSM_DP_PLL_10NM, 0);
> +       if (IS_ERR_OR_NULL(pll)) {
> +               DRM_DEV_ERROR(dev,
> +                       "%s: pll init failed: %ld, need separate pll clk =
driver\n",

What does this error mean?

> +                       __func__, PTR_ERR(pll));
> +               return -ENODEV;
> +       }
> +
> +       platform_set_drvdata(pdev, pll);
> +
> +       return 0;
> +}
> +
> +static int dp_pll_driver_remove(struct platform_device *pdev)
> +{
> +       struct msm_dp_pll *pll =3D platform_get_drvdata(pdev);
> +
> +       if (pll)
> +               pll =3D NULL;
> +
> +       platform_set_drvdata(pdev, NULL);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver dp_pll_platform_driver =3D {
> +       .probe      =3D dp_pll_driver_probe,
> +       .remove     =3D dp_pll_driver_remove,
> +       .driver     =3D {
> +               .name   =3D "msm_dp_pll",
> +               .of_match_table =3D dp_pll_dt_match,
> +       },
> +};
> +
> +void __init msm_dp_pll_driver_register(void)
> +{
> +       platform_driver_register(&dp_pll_platform_driver);
> +}
> +
> +void __exit msm_dp_pll_driver_unregister(void)
> +{
> +       platform_driver_unregister(&dp_pll_platform_driver);
> +}
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll.h b/drivers/gpu/drm/msm/dp=
/pll/dp_pll.h
> new file mode 100644
> index 0000000..185f1e9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DP_PLL_H
> +#define __DP_PLL_H
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>

You're making a clk provider. Please Cc clk maintainers and
linux-clk@vger.kernel.org

> +#include <linux/platform_device.h>
> +
> +#include "dpu_io_util.h"
> +#include "msm_drv.h"
> +
> +#define PLL_REG_W(base, offset, data)  \
> +                               writel((data), (base) + (offset))
> +#define PLL_REG_R(base, offset)        readl((base) + (offset))
> +
> +enum msm_dp_pll_type {
> +       MSM_DP_PLL_10NM,
> +       MSM_DP_PLL_MAX
> +};
> +
> +struct msm_dp_pll {
> +       enum msm_dp_pll_type type;
> +       struct clk_hw clk_hw;
> +       unsigned long   rate;           /* current vco rate */
> +       u64             min_rate;       /* min vco rate */
> +       u64             max_rate;       /* max vco rate */
> +       bool            pll_on;

Are these struct members here to save/restore the rate across
suspend/resume?

> +       void            *priv;
> +       /* Pll specific resources like GPIO, power supply, clocks, etc*/
> +       struct dss_module_power mp;
> +       int (*get_provider)(struct msm_dp_pll *pll,
> +                       struct clk **link_clk_provider,
> +                       struct clk **pixel_clk_provider);
> +};
> +
> +#define hw_clk_to_pll(x) container_of(x, struct msm_dp_pll, clk_hw)

Why not to_msm_dp_pll() for this macro.

> +
> +struct msm_dp_pll *msm_dp_pll_init(struct platform_device *pdev,
> +                               enum msm_dp_pll_type type, int id);
> +
> +int msm_dp_pll_util_parse_dt_clock(struct platform_device *pdev,
> +                               struct msm_dp_pll *pll);
> +
> +#ifdef CONFIG_DRM_MSM_DP_10NM_PLL
> +struct msm_dp_pll *msm_dp_pll_10nm_init(struct platform_device *pdev, in=
t id);
> +#else
> +static inline struct msm_dp_pll *msm_dp_pll_10nm_init
> +                               (struct platform_device *pdev, int id)

I would write this as

static inline struct msm_dp_pll *
msm_dp_pll_10nm_init(struct platform_device *pdev, int id)

so that we don't have parameters all by themselves.

> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +#endif
> +#endif /* __DP_PLL_H */
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c b/drivers/gpu/drm/m=
sm/dp/pll/dp_pll_10nm.c
> new file mode 100644
> index 0000000..5991e09
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v---------+                                 |
> + * |    dp_phy_pll    |                                 |
> + * |     link_clk     |                                 |
> + * +--------+---------+                                 |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+---------+
> + *              |   dp_phy_pll_vco   |
> + *              |       div_clk      |
> + *              +---------+----------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *

Awesome diagram!

> + */
> +
> +#include <linux/clk.h>

Please try to avoid making a clk provider a clk consumer at the same
time.

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/regmap.h>
> +
> +#include "dp_pll_10nm.h"
> +
> +#define NUM_PROVIDED_CLKS              2
> +
> +#define DP_LINK_CLK_SRC                        0
> +#define DP_PIXEL_CLK_SRC               1
> +
> +static struct dp_pll_10nm *dp_pdb;
> +
> +static const struct clk_ops dp_10nm_vco_clk_ops =3D {
> +       .recalc_rate =3D dp_vco_recalc_rate_10nm,
> +       .set_rate =3D dp_vco_set_rate_10nm,
> +       .round_rate =3D dp_vco_round_rate_10nm,
> +       .prepare =3D dp_vco_prepare_10nm,
> +       .unprepare =3D dp_vco_unprepare_10nm,
> +};
> +
> +struct dp_pll_10nm_pclksel {
> +       struct clk_hw hw;
> +
> +       /* divider params */
> +       u8 shift;
> +       u8 width;
> +       u8 flags; /* same flags as used by clk_divider struct */
> +
> +       struct dp_pll_10nm *pll;
> +};
> +#define to_pll_10nm_pclksel(_hw) \
> +       container_of(_hw, struct dp_pll_10nm_pclksel, hw)
> +
> +static int dp_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
> +{
> +       struct dp_pll_10nm_pclksel *pclksel =3D to_pll_10nm_pclksel(hw);
> +       struct dp_pll_10nm *dp_res =3D pclksel->pll;
> +       u32 auxclk_div;
> +
> +       auxclk_div =3D PLL_REG_R(dp_res->phy_base, REG_DP_PHY_VCO_DIV);
> +       auxclk_div &=3D ~0x03;    /* bits 0 to 1 */
> +
> +       if (val =3D=3D 0) /* mux parent index =3D 0 */
> +               auxclk_div |=3D 1;
> +       else if (val =3D=3D 1) /* mux parent index =3D 1 */
> +               auxclk_div |=3D 2;
> +       else if (val =3D=3D 2) /* mux parent index =3D 2 */
> +               auxclk_div |=3D 0;

These comments are just saying what the code says. Can you remove them?

> +
> +       PLL_REG_W(dp_res->phy_base,
> +                       REG_DP_PHY_VCO_DIV, auxclk_div);
> +       DRM_DEBUG_DP("%s: mux=3D%d auxclk_div=3D%x\n", __func__, val, aux=
clk_div);

Is it a mux and divider combined? The diagram seems to imply that the
mux picks between fixed dividers but I don't see why that isn't just a
divider clk because the parent is always the same for the fixed
dividers. Put another way, why is a parent API being used for this? It
would make more sense to just treat this like a divider and use rate
setting APIs instead.

> +
> +       return 0;
> +}
> +
> +static u8 dp_mux_get_parent_10nm(struct clk_hw *hw)
> +{
> +       u32 auxclk_div =3D 0;
> +       struct dp_pll_10nm_pclksel *pclksel =3D to_pll_10nm_pclksel(hw);
> +       struct dp_pll_10nm *dp_res =3D pclksel->pll;
> +       u8 val =3D 0;
> +
> +       auxclk_div =3D PLL_REG_R(dp_res->phy_base, REG_DP_PHY_VCO_DIV);
> +       auxclk_div &=3D 0x03;
> +
> +       if (auxclk_div =3D=3D 1) /* Default divider */
> +               val =3D 0;
> +       else if (auxclk_div =3D=3D 2)
> +               val =3D 1;
> +       else if (auxclk_div =3D=3D 0)
> +               val =3D 2;
> +
> +       DRM_DEBUG_DP("%s: auxclk_div=3D%d, val=3D%d\n", __func__, auxclk_=
div, val);
> +
> +       return val;
> +}
> +
> +static int clk_mux_determine_rate(struct clk_hw *hw,
> +                                    struct clk_rate_request *req)
> +{
> +       unsigned long rate =3D 0;
> +       int ret =3D 0;
> +
> +       rate =3D clk_get_rate(hw->clk);
> +
> +       if (rate <=3D 0) {
> +               DRM_ERROR("Rate is not set properly\n");
> +               return -EINVAL;
> +       }
> +
> +       req->rate =3D rate;
> +
> +       DRM_DEBUG_DP("%s: rate=3D%ld\n", __func__, req->rate);
> +       /* Set the new parent of mux if there is a new valid parent */
> +       if (hw->clk && req->best_parent_hw->clk) {
> +               ret =3D clk_set_parent(hw->clk, req->best_parent_hw->clk);
> +               if (ret) {
> +                       DRM_ERROR("%s: clk_set_parent failed: ret=3D%d\n",
> +                                       __func__, ret);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static unsigned long mux_recalc_rate(struct clk_hw *hw,

Please prefix all functions with dp_pll_

> +                                       unsigned long parent_rate)
> +{
> +       struct clk *div_clk =3D NULL, *vco_clk =3D NULL;
> +       struct msm_dp_pll *vco =3D NULL;
> +
> +       div_clk =3D clk_get_parent(hw->clk);

We have clk_hw_get_parent() for this stuff. Please use it.

> +       if (!div_clk)
> +               return 0;
> +
> +       vco_clk =3D clk_get_parent(div_clk);
> +       if (!vco_clk)
> +               return 0;
> +
> +       vco =3D hw_clk_to_pll(__clk_get_hw(vco_clk));

Please don't use __clk_get_hw().

> +       if (!vco)
> +               return 0;
> +
> +       if (vco->rate =3D=3D DP_VCO_HSCLK_RATE_8100MHZDIV1000)
> +               return (vco->rate / 6);
> +       else if (vco->rate =3D=3D DP_VCO_HSCLK_RATE_5400MHZDIV1000)
> +               return (vco->rate / 4);
> +       else
> +               return (vco->rate / 2);

else return is shunned. Just have return instead.

> +}
> +
> +static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
> +                                    struct clk **link_clk_provider,
> +                                    struct clk **pixel_clk_provider)
> +{
> +       struct dp_pll_10nm *pll_10nm =3D to_dp_pll_10nm(pll);
> +       struct clk_hw_onecell_data *hw_data =3D pll_10nm->hw_data;
> +
> +       if (link_clk_provider)
> +               *link_clk_provider =3D hw_data->hws[DP_LINK_CLK_SRC]->clk;
> +       if (pixel_clk_provider)
> +               *pixel_clk_provider =3D hw_data->hws[DP_PIXEL_CLK_SRC]->c=
lk;

I don't know what this is but it looks weird. Is this a clk provider on
top of another clk provider?

> +
> +       return 0;
> +}
> +
> +static const struct clk_ops dp_10nm_pclksel_clk_ops =3D {
> +       .get_parent =3D dp_mux_get_parent_10nm,
> +       .set_parent =3D dp_mux_set_parent_10nm,
> +       .recalc_rate =3D mux_recalc_rate,
> +       .determine_rate =3D clk_mux_determine_rate,
> +};
> +
> +static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_10nm *pll_=
10nm)
> +{
> +       struct device *dev =3D &pll_10nm->pdev->dev;
> +       struct dp_pll_10nm_pclksel *pll_pclksel;
> +       struct clk_init_data pclksel_init =3D {
> +               .parent_names =3D (const char *[]){
> +                               "dp_vco_divsel_two_clk_src",
> +                               "dp_vco_divsel_four_clk_src",
> +                               "dp_vco_divsel_six_clk_src" },

It looks like a clk divider still, not a mux.

> +               .num_parents =3D 3,
> +               .name =3D "dp_phy_pll_vco_div_clk",
> +               .flags =3D CLK_IGNORE_UNUSED,

Why? Please comment why this is needed in the code. But more
importantly, please just don't use this flag.

> +               .ops =3D &dp_10nm_pclksel_clk_ops,
> +       };
> +       int ret;
> +
> +       pll_pclksel =3D devm_kzalloc(dev, sizeof(*pll_pclksel), GFP_KERNE=
L);
> +       if (!pll_pclksel)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pll_pclksel->pll =3D pll_10nm;
> +       pll_pclksel->shift =3D 0;
> +       pll_pclksel->width =3D 4;
> +       pll_pclksel->flags =3D CLK_DIVIDER_ONE_BASED;
> +       pll_pclksel->hw.init =3D &pclksel_init;
> +
> +       ret =3D clk_hw_register(dev, &pll_pclksel->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &pll_pclksel->hw;
> +}
> +
> +static int dp_pll_10nm_register(struct dp_pll_10nm *pll_10nm)
> +{
> +       char clk_name[32], parent[32], vco_name[32];
> +       struct clk_init_data vco_init =3D {
> +               .parent_names =3D (const char *[]){ "bi_tcxo" },

Please use the new way of specifying clk parents through .fw_name and DT
indices.

> +               .num_parents =3D 1,
> +               .name =3D vco_name,
> +               .flags =3D CLK_IGNORE_UNUSED,

Ugh there's that flag again.

> +               .ops =3D &dp_10nm_vco_clk_ops,
> +       };
> +       struct device *dev =3D &pll_10nm->pdev->dev;
> +       struct clk_hw **hws =3D pll_10nm->hws;
> +       struct clk_hw_onecell_data *hw_data;
> +       struct clk_hw *hw;
> +       int num =3D 0;
> +       int ret;
> +
> +       DRM_DEBUG_DP("DP->id =3D %d", pll_10nm->id);
> +
> +       hw_data =3D devm_kzalloc(dev, sizeof(*hw_data) +

Use devm_kcalloc()

> +                              NUM_PROVIDED_CLKS * sizeof(struct clk_hw *=
),
> +                              GFP_KERNEL);
> +       if (!hw_data)
> +               return -ENOMEM;
> +
> +       snprintf(vco_name, 32, "dp_vco_clk");
> +       pll_10nm->base.clk_hw.init =3D &vco_init;
> +       ret =3D clk_hw_register(dev, &pll_10nm->base.clk_hw);
> +       if (ret)
> +               return ret;
> +       hws[num++] =3D &pll_10nm->base.clk_hw;
> +
> +       snprintf(clk_name, 32, "dp_phy_pll_link_clk");
> +       snprintf(parent, 32, "dp_vco_clk");

Is there a need to make these names with snprintf?

> +       hw =3D clk_hw_register_fixed_factor(dev, clk_name, parent,
> +                                         CLK_SET_RATE_PARENT, 1, 10);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +       hw_data->hws[DP_LINK_CLK_SRC] =3D hw;
> +
> +       snprintf(clk_name, 32, "dp_vco_divsel_two_clk_src");
> +       snprintf(parent, 32, "dp_vco_clk");
> +       hw =3D clk_hw_register_fixed_factor(dev, clk_name, parent,
> +                                         0, 1, 2);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       snprintf(clk_name, 32, "dp_vco_divsel_four_clk_src");
> +       snprintf(parent, 32, "dp_vco_clk");
> +       hw =3D clk_hw_register_fixed_factor(dev, clk_name, parent,
> +                                         0, 1, 4);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       snprintf(clk_name, 32, "dp_vco_divsel_six_clk_src");
> +       snprintf(parent, 32, "dp_vco_clk");
> +       hw =3D clk_hw_register_fixed_factor(dev, clk_name, parent,
> +                                         0, 1, 6);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       hw =3D dp_pll_10nm_pixel_clk_sel(pll_10nm);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       hws[num++] =3D hw;
> +       hw_data->hws[DP_PIXEL_CLK_SRC] =3D hw;
> +
> +       pll_10nm->num_hws =3D num;
> +
> +       hw_data->num =3D NUM_PROVIDED_CLKS;
> +       pll_10nm->hw_data =3D hw_data;
> +
> +       ret =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_ge=
t,
> +                                    pll_10nm->hw_data);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n=
",
> +                               ret);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +struct msm_dp_pll *msm_dp_pll_10nm_init(struct platform_device *pdev, in=
t id)
> +{
> +       struct dp_pll_10nm *dp_10nm_pll;
> +       struct msm_dp_pll *pll;
> +       int ret;
> +
> +       if (!pdev)
> +               return ERR_PTR(-ENODEV);
> +
> +       dp_10nm_pll =3D devm_kzalloc(&pdev->dev,
> +                                       sizeof(*dp_10nm_pll), GFP_KERNEL);
> +       if (!dp_10nm_pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       DRM_DEBUG_DP("DP PLL%d", id);
> +
> +       dp_10nm_pll->pdev =3D pdev;
> +       dp_10nm_pll->id =3D id;
> +       dp_pdb =3D dp_10nm_pll;
> +
> +       dp_10nm_pll->pll_base =3D msm_ioremap(pdev, "pll_base", "DP_PLL");
> +       if (IS_ERR_OR_NULL(dp_10nm_pll->pll_base)) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PLL base\n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       dp_10nm_pll->phy_base =3D msm_ioremap(pdev, "phy_base", "DP_PHY");
> +       if (IS_ERR_OR_NULL(dp_10nm_pll->phy_base)) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       dp_10nm_pll->ln_tx0_base =3D msm_ioremap(pdev, "ln_tx0_base",
> +                                               "DP_LN_TX0");
> +       if (IS_ERR_OR_NULL(dp_10nm_pll->ln_tx0_base)) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to map CMN LN_TX0 base\=
n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       dp_10nm_pll->ln_tx1_base =3D msm_ioremap(pdev, "ln_tx1_base",
> +                                               "DP_LN_TX1");
> +       if (IS_ERR_OR_NULL(dp_10nm_pll->ln_tx1_base)) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to map CMN LN_TX1 base\=
n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       ret =3D of_property_read_u32(pdev->dev.of_node, "cell-index",
> +                               &dp_10nm_pll->index);
> +       if (ret) {
> +               DRM_ERROR("Unable to get the cell-index ret=3D%d\n", ret);
> +               dp_10nm_pll->index =3D 0;
> +       }
> +
> +       ret =3D msm_dp_pll_util_parse_dt_clock(pdev, &dp_10nm_pll->base);
> +       if (ret) {
> +               DRM_ERROR("Unable to parse dt clocks ret=3D%d\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       ret =3D dp_pll_10nm_register(dp_10nm_pll);
> +       if (ret) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n",=
 ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       pll =3D &dp_10nm_pll->base;
> +       pll->min_rate =3D DP_VCO_HSCLK_RATE_1620MHZDIV1000;
> +       pll->max_rate =3D DP_VCO_HSCLK_RATE_8100MHZDIV1000;

Maybe min/max can be set with clk_hw_set_rate_range()?

> +       pll->get_provider =3D dp_pll_10nm_get_provider;
> +
> +       return pll;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h b/drivers/gpu/drm/m=
sm/dp/pll/dp_pll_10nm.h
> new file mode 100644
> index 0000000..8466463
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DP_PLL_10NM_H
> +#define __DP_PLL_10NM_H
> +
> +#include "dp_pll.h"
> +#include "dp_reg.h"
> +
> +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000       1620000UL
> +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000       2700000UL
> +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000       5400000UL
> +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000       8100000UL
> +
> +#define NUM_DP_CLOCKS_MAX                      6
> +
> +#define DP_PHY_PLL_POLL_SLEEP_US               500
> +#define DP_PHY_PLL_POLL_TIMEOUT_US             10000
> +
> +#define DP_VCO_RATE_8100MHZDIV1000             8100000UL
> +#define DP_VCO_RATE_9720MHZDIV1000             9720000UL
> +#define DP_VCO_RATE_10800MHZDIV1000            10800000UL
> +
> +struct dp_pll_10nm {
> +       struct msm_dp_pll base;
> +
> +       int id;
> +       struct platform_device *pdev;
> +
> +       void __iomem *pll_base;
> +       void __iomem *phy_base;
> +       void __iomem *ln_tx0_base;
> +       void __iomem *ln_tx1_base;
> +
> +       /* private clocks: */
> +       struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
> +       u32 num_hws;
> +
> +       /* clock-provider: */
> +       struct clk_hw_onecell_data *hw_data;
> +
> +       /* lane and orientation settings */
> +       u8 lane_cnt;
> +       u8 orientation;
> +
> +       /* COM PHY settings */
> +       u32 hsclk_sel;
> +       u32 dec_start_mode0;
> +       u32 div_frac_start1_mode0;
> +       u32 div_frac_start2_mode0;
> +       u32 div_frac_start3_mode0;
> +       u32 integloop_gain0_mode0;
> +       u32 integloop_gain1_mode0;
> +       u32 vco_tune_map;
> +       u32 lock_cmp1_mode0;
> +       u32 lock_cmp2_mode0;
> +       u32 lock_cmp3_mode0;
> +       u32 lock_cmp_en;
> +
> +       /* PHY vco divider */
> +       u32 phy_vco_div;
> +       /*
> +        * Certain pll's needs to update the same vco rate after resume in
> +        * suspend/resume scenario. Cached the vco rate for such plls.
> +        */
> +       unsigned long   vco_cached_rate;
> +       u32             cached_cfg0;
> +       u32             cached_cfg1;
> +       u32             cached_outdiv;
> +
> +       uint32_t index;
> +};
> +
> +#define to_dp_pll_10nm(x)      container_of(x, struct dp_pll_10nm, base)

Why is this struct in the header file? Does something outside of the PLL
driver need to access this struct?

> +
> +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate);
> +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
> +                               unsigned long parent_rate);
> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long *parent_rate);
> +int dp_vco_prepare_10nm(struct clk_hw *hw);
> +void dp_vco_unprepare_10nm(struct clk_hw *hw);
> +#endif /* __DP_PLL_10NM_H */
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c b/drivers/gpu/=
drm/msm/dp/pll/dp_pll_10nm_util.c
> new file mode 100644
> index 0000000..db3983d5
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt)    "%s: " fmt, __func__
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +
> +#include "dp_hpd.h"
> +#include "dp_pll.h"
> +#include "dp_pll_10nm.h"
> +
> +static int dp_vco_pll_init_db_10nm(struct msm_dp_pll *pll,
> +               unsigned long rate)
> +{
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +       u32 spare_value =3D 0;
> +
> +       spare_value =3D PLL_REG_R(dp_res->phy_base, REG_DP_PHY_SPARE0);
> +       dp_res->lane_cnt =3D spare_value & 0x0F;
> +       dp_res->orientation =3D (spare_value & 0xF0) >> 4;

Can this be read at any time from the spare register? Just curious why
we need to read this here in init vs. when it's actually used. We could
avoid stashing away these values in the struct. It also looks like the
PLL part is intimately tied to the phy, but there isn't an actual phy
driver. Why? It looks like the phy driver is a clk driver, and the clk
framework is not prepared to handle things like lane count and
orientation. I'd expect that to come through a PHY framework and then
have the phy driver control the PLL by powering it back up and changing
it's rates, etc. Not everything needs to be done through clk APIs.

> +
> +       DRM_DEBUG_DP("%s: spare_value=3D0x%x, ln_cnt=3D0x%x, orientation=
=3D0x%x\n",
> +                       __func__, spare_value, dp_res->lane_cnt,
> +                       dp_res->orientation);
> +
> +       switch (rate) {
> +       case DP_VCO_HSCLK_RATE_1620MHZDIV1000:
> +               DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
> +                               DP_VCO_RATE_9720MHZDIV1000);
> +               dp_res->hsclk_sel =3D 0x0c;
> +               dp_res->dec_start_mode0 =3D 0x69;
> +               dp_res->div_frac_start1_mode0 =3D 0x00;
> +               dp_res->div_frac_start2_mode0 =3D 0x80;
> +               dp_res->div_frac_start3_mode0 =3D 0x07;
> +               dp_res->integloop_gain0_mode0 =3D 0x3f;
> +               dp_res->integloop_gain1_mode0 =3D 0x00;
> +               dp_res->vco_tune_map =3D 0x00;
> +               dp_res->lock_cmp1_mode0 =3D 0x6f;
> +               dp_res->lock_cmp2_mode0 =3D 0x08;
> +               dp_res->lock_cmp3_mode0 =3D 0x00;
> +               dp_res->phy_vco_div =3D 0x1;
> +               dp_res->lock_cmp_en =3D 0x00;
> +               break;
> +       case DP_VCO_HSCLK_RATE_2700MHZDIV1000:
> +               DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
> +                               DP_VCO_RATE_10800MHZDIV1000);
> +               dp_res->hsclk_sel =3D 0x04;
> +               dp_res->dec_start_mode0 =3D 0x69;
> +               dp_res->div_frac_start1_mode0 =3D 0x00;
> +               dp_res->div_frac_start2_mode0 =3D 0x80;
> +               dp_res->div_frac_start3_mode0 =3D 0x07;
> +               dp_res->integloop_gain0_mode0 =3D 0x3f;
> +               dp_res->integloop_gain1_mode0 =3D 0x00;
> +               dp_res->vco_tune_map =3D 0x00;
> +               dp_res->lock_cmp1_mode0 =3D 0x0f;
> +               dp_res->lock_cmp2_mode0 =3D 0x0e;
> +               dp_res->lock_cmp3_mode0 =3D 0x00;
> +               dp_res->phy_vco_div =3D 0x1;
> +               dp_res->lock_cmp_en =3D 0x00;
> +               break;
> +       case DP_VCO_HSCLK_RATE_5400MHZDIV1000:
> +               DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
> +                               DP_VCO_RATE_10800MHZDIV1000);
> +               dp_res->hsclk_sel =3D 0x00;
> +               dp_res->dec_start_mode0 =3D 0x8c;
> +               dp_res->div_frac_start1_mode0 =3D 0x00;
> +               dp_res->div_frac_start2_mode0 =3D 0x00;
> +               dp_res->div_frac_start3_mode0 =3D 0x0a;
> +               dp_res->integloop_gain0_mode0 =3D 0x3f;
> +               dp_res->integloop_gain1_mode0 =3D 0x00;
> +               dp_res->vco_tune_map =3D 0x00;
> +               dp_res->lock_cmp1_mode0 =3D 0x1f;
> +               dp_res->lock_cmp2_mode0 =3D 0x1c;
> +               dp_res->lock_cmp3_mode0 =3D 0x00;
> +               dp_res->phy_vco_div =3D 0x2;
> +               dp_res->lock_cmp_en =3D 0x00;
> +               break;
> +       case DP_VCO_HSCLK_RATE_8100MHZDIV1000:
> +               DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
> +                               DP_VCO_RATE_8100MHZDIV1000);
> +               dp_res->hsclk_sel =3D 0x03;
> +               dp_res->dec_start_mode0 =3D 0x69;
> +               dp_res->div_frac_start1_mode0 =3D 0x00;
> +               dp_res->div_frac_start2_mode0 =3D 0x80;
> +               dp_res->div_frac_start3_mode0 =3D 0x07;
> +               dp_res->integloop_gain0_mode0 =3D 0x3f;
> +               dp_res->integloop_gain1_mode0 =3D 0x00;
> +               dp_res->vco_tune_map =3D 0x00;
> +               dp_res->lock_cmp1_mode0 =3D 0x2f;
> +               dp_res->lock_cmp2_mode0 =3D 0x2a;
> +               dp_res->lock_cmp3_mode0 =3D 0x00;
> +               dp_res->phy_vco_div =3D 0x0;
> +               dp_res->lock_cmp_en =3D 0x08;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static int dp_config_vco_rate_10nm(struct msm_dp_pll *pll,
> +               unsigned long rate)
> +{
> +       u32 res =3D 0;
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +
> +       res =3D dp_vco_pll_init_db_10nm(pll, rate);
> +       if (res) {
> +               DRM_ERROR("VCO Init DB failed\n");
> +               return res;
> +       }
> +
> +       if (dp_res->lane_cnt !=3D 4) {
> +               if (dp_res->orientation =3D=3D ORIENTATION_CC2)
> +                       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x=
6d);
> +               else
> +                       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x=
75);
> +       } else {
> +               PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x7d);
> +       }
> +
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_SVS_MODE_CLK_SEL, 0x01);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYS_CLK_CTRL, 0x02);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CLK_ENABLE1, 0x0e);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CLK_SEL, 0x30);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CMN_CONFIG, 0x02);
> +
> +       /* Different for each clock rates */
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_HSCLK_SEL, dp_res->hsclk_sel);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_DEC_START_MODE0, dp_res->dec_start_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_DIV_FRAC_START1_MODE0,
> +               dp_res->div_frac_start1_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_DIV_FRAC_START2_MODE0,
> +               dp_res->div_frac_start2_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_DIV_FRAC_START3_MODE0,
> +               dp_res->div_frac_start3_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
> +               dp_res->integloop_gain0_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
> +               dp_res->integloop_gain1_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_VCO_TUNE_MAP, dp_res->vco_tune_map);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_LOCK_CMP1_MODE0, dp_res->lock_cmp1_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_LOCK_CMP2_MODE0, dp_res->lock_cmp2_mode0);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_LOCK_CMP3_MODE0, dp_res->lock_cmp3_mode0);
> +
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_BG_TIMER, 0x0a);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CORECLK_DIV_MODE0, 0x0a);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_VCO_TUNE_CTRL, 0x00);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f=
);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CORE_CLK_EN, 0x1f);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_IVCO, 0x07);
> +       PLL_REG_W(dp_res->pll_base,
> +               QSERDES_COM_LOCK_CMP_EN, dp_res->lock_cmp_en);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_CP_CTRL_MODE0, 0x06);
> +
> +       if (dp_res->orientation =3D=3D ORIENTATION_CC2)
> +               PLL_REG_W(dp_res->phy_base, REG_DP_PHY_MODE, 0x4c);
> +       else
> +               PLL_REG_W(dp_res->phy_base, REG_DP_PHY_MODE, 0x5c);
> +
> +       /* TX Lane configuration */
> +       PLL_REG_W(dp_res->phy_base,
> +                       REG_DP_PHY_TX0_TX1_LANE_CTL, 0x05);
> +       PLL_REG_W(dp_res->phy_base,
> +                       REG_DP_PHY_TX2_TX3_LANE_CTL, 0x05);
> +
> +       /* TX-0 register configuration */
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
> +       PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_BAND, 0x4);
> +
> +       /* TX-1 register configuration */
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_TX_BAND, 0x4);
> +
> +       /* dependent on the vco frequency */
> +       PLL_REG_W(dp_res->phy_base,
> +                       REG_DP_PHY_VCO_DIV, dp_res->phy_vco_div);
> +
> +       return res;
> +}
> +
> +static bool dp_10nm_pll_lock_status(struct dp_pll_10nm *dp_res)
> +{
> +       u32 status;
> +       bool pll_locked;
> +
> +       /* poll for PLL lock status */
> +       if (readl_poll_timeout_atomic((dp_res->pll_base +
> +                       QSERDES_COM_C_READY_STATUS),
> +                       status,
> +                       ((status & BIT(0)) > 0),
> +                       DP_PHY_PLL_POLL_SLEEP_US,
> +                       DP_PHY_PLL_POLL_TIMEOUT_US)) {
> +               DRM_ERROR("%s: C_READY status is not high. Status=3D%x\n",
> +                               __func__, status);
> +               pll_locked =3D false;
> +       } else {
> +               pll_locked =3D true;
> +       }
> +
> +       return pll_locked;
> +}
> +
> +static bool dp_10nm_phy_rdy_status(struct dp_pll_10nm *dp_res)
> +{
> +       u32 status;
> +       bool phy_ready =3D true;
> +
> +       /* poll for PHY ready status */
> +       if (readl_poll_timeout_atomic((dp_res->phy_base +
> +                       REG_DP_PHY_STATUS),
> +                       status,
> +                       ((status & (BIT(1))) > 0),
> +                       DP_PHY_PLL_POLL_SLEEP_US,
> +                       DP_PHY_PLL_POLL_TIMEOUT_US)) {
> +               DRM_ERROR("%s: Phy_ready is not high. Status=3D%x\n",
> +                               __func__, status);
> +               phy_ready =3D false;
> +       }
> +
> +       return phy_ready;
> +}
> +
> +static int dp_pll_enable_10nm(struct clk_hw *hw)
> +{
> +       int rc =3D 0;
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +       u32 bias_en, drvr_en;
> +
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_AUX_CFG2, 0x04);
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x01);
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x05);
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x01);
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x09);
> +
> +       PLL_REG_W(dp_res->pll_base, QSERDES_COM_RESETSM_CNTRL, 0x20);
> +
> +       if (!dp_10nm_pll_lock_status(dp_res)) {
> +               rc =3D -EINVAL;
> +               goto lock_err;
> +       }
> +
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x19);
> +       /* poll for PHY ready status */
> +       if (!dp_10nm_phy_rdy_status(dp_res)) {
> +               rc =3D -EINVAL;
> +               goto lock_err;
> +       }
> +
> +       DRM_DEBUG_DP("%s: PLL is locked\n", __func__);
> +
> +       if (dp_res->lane_cnt =3D=3D 1) {
> +               bias_en =3D 0x3e;
> +               drvr_en =3D 0x13;
> +       } else {
> +               bias_en =3D 0x3f;
> +               drvr_en =3D 0x10;
> +       }
> +
> +       if (dp_res->lane_cnt !=3D 4) {
> +               if (dp_res->orientation =3D=3D ORIENTATION_CC1) {
> +                       PLL_REG_W(dp_res->ln_tx1_base,
> +                               REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
> +                       PLL_REG_W(dp_res->ln_tx1_base,
> +                               REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_=
en);
> +               } else {
> +                       PLL_REG_W(dp_res->ln_tx0_base,
> +                               REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
> +                       PLL_REG_W(dp_res->ln_tx0_base,
> +                               REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_=
en);
> +               }
> +       } else {
> +               PLL_REG_W(dp_res->ln_tx0_base,
> +                               REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
> +               PLL_REG_W(dp_res->ln_tx0_base,
> +                               REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_=
en);
> +               PLL_REG_W(dp_res->ln_tx1_base,
> +                               REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
> +               PLL_REG_W(dp_res->ln_tx1_base,
> +                               REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_=
en);
> +       }
> +
> +       PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
> +       PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x18);
> +       udelay(2000);
> +
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x19);
> +
> +       /* poll for PHY ready status */
> +       if (!dp_10nm_phy_rdy_status(dp_res)) {
> +               rc =3D -EINVAL;
> +               goto lock_err;
> +       }
> +
> +       PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
> +       PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
> +       PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0=
x20);
> +       PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0=
x20);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
> +       PLL_REG_W(dp_res->ln_tx0_base,
> +                       REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
> +       PLL_REG_W(dp_res->ln_tx1_base,
> +                       REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
> +
> +lock_err:
> +       return rc;
> +}
> +
> +static int dp_pll_disable_10nm(struct clk_hw *hw)
> +{
> +       int rc =3D 0;
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +
> +       /* Assert DP PHY power down */
> +       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x2);
> +
> +       return rc;
> +}
> +
> +
> +int dp_vco_prepare_10nm(struct clk_hw *hw)
> +{
> +       int rc =3D 0;
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +
> +       DRM_DEBUG_DP("%s: rate =3D %ld\n", __func__, pll->rate);
> +       if ((dp_res->vco_cached_rate !=3D 0)
> +               && (dp_res->vco_cached_rate =3D=3D pll->rate)) {
> +               rc =3D dp_vco_set_rate_10nm(hw,
> +                       dp_res->vco_cached_rate, dp_res->vco_cached_rate);
> +               if (rc) {
> +                       DRM_ERROR("index=3D%d vco_set_rate failed. rc=3D%=
d\n",
> +                               rc, dp_res->index);
> +                       goto error;
> +               }
> +       }
> +
> +       rc =3D dp_pll_enable_10nm(hw);
> +       if (rc) {
> +               DRM_ERROR("ndx=3D%d failed to enable dp pll\n",
> +                                       dp_res->index);
> +               goto error;
> +       }
> +
> +       pll->pll_on =3D true;
> +error:
> +       return rc;
> +}
> +
> +void dp_vco_unprepare_10nm(struct clk_hw *hw)
> +{
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +
> +       if (!dp_res) {
> +               DRM_ERROR("Invalid input parameter\n");
> +               return;
> +       }
> +
> +       if (!pll->pll_on) {
> +               DRM_ERROR("pll resource can't be enabled\n");
> +               return;
> +       }
> +       dp_res->vco_cached_rate =3D pll->rate;
> +       dp_pll_disable_10nm(hw);
> +
> +       pll->pll_on =3D false;
> +}
> +
> +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
> +                                       unsigned long parent_rate)
> +{
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       int rc;
> +
> +       DRM_DEBUG_DP("DP lane CLK rate=3D%ld\n", rate);
> +
> +       rc =3D dp_config_vco_rate_10nm(pll, rate);
> +       if (rc)
> +               DRM_ERROR("%s: Failed to set clk rate\n", __func__);
> +
> +       pll->rate =3D rate;
> +
> +       return 0;
> +}
> +
> +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +       struct dp_pll_10nm *dp_res =3D to_dp_pll_10nm(pll);
> +       u32 div, hsclk_div, link_clk_div =3D 0;
> +       u64 vco_rate;
> +
> +       div =3D PLL_REG_R(dp_res->pll_base, QSERDES_COM_HSCLK_SEL);
> +       div &=3D 0x0f;
> +
> +       if (div =3D=3D 12)
> +               hsclk_div =3D 6; /* Default */
> +       else if (div =3D=3D 4)
> +               hsclk_div =3D 4;
> +       else if (div =3D=3D 0)
> +               hsclk_div =3D 2;
> +       else if (div =3D=3D 3)
> +               hsclk_div =3D 1;
> +       else {
> +               DRM_DEBUG_DP("unknown divider. forcing to default\n");
> +               hsclk_div =3D 5;
> +       }
> +
> +       div =3D PLL_REG_R(dp_res->phy_base, REG_DP_PHY_AUX_CFG2);
> +       div >>=3D 2;
> +
> +       if ((div & 0x3) =3D=3D 0)
> +               link_clk_div =3D 5;
> +       else if ((div & 0x3) =3D=3D 1)
> +               link_clk_div =3D 10;
> +       else if ((div & 0x3) =3D=3D 2)
> +               link_clk_div =3D 20;
> +       else
> +               DRM_ERROR("%s: unsupported div. Phy_mode: %d\n", __func__=
, div);
> +
> +       if (link_clk_div =3D=3D 20) {
> +               vco_rate =3D DP_VCO_HSCLK_RATE_2700MHZDIV1000;
> +       } else {
> +               if (hsclk_div =3D=3D 6)
> +                       vco_rate =3D DP_VCO_HSCLK_RATE_1620MHZDIV1000;
> +               else if (hsclk_div =3D=3D 4)
> +                       vco_rate =3D DP_VCO_HSCLK_RATE_2700MHZDIV1000;
> +               else if (hsclk_div =3D=3D 2)
> +                       vco_rate =3D DP_VCO_HSCLK_RATE_5400MHZDIV1000;
> +               else
> +                       vco_rate =3D DP_VCO_HSCLK_RATE_8100MHZDIV1000;
> +       }
> +
> +       DRM_DEBUG_DP("returning vco rate =3D %lu\n", (unsigned long)vco_r=
ate);
> +
> +       dp_res->vco_cached_rate =3D pll->rate =3D vco_rate;
> +       return (unsigned long)vco_rate;
> +}
> +
> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
> +                       unsigned long *parent_rate)
> +{
> +       unsigned long rrate =3D rate;
> +       struct msm_dp_pll *pll =3D hw_clk_to_pll(hw);
> +
> +       if (rate <=3D pll->min_rate)
> +               rrate =3D pll->min_rate;
> +       else if (rate <=3D DP_VCO_HSCLK_RATE_2700MHZDIV1000)
> +               rrate =3D DP_VCO_HSCLK_RATE_2700MHZDIV1000;
> +       else if (rate <=3D DP_VCO_HSCLK_RATE_5400MHZDIV1000)
> +               rrate =3D DP_VCO_HSCLK_RATE_5400MHZDIV1000;
> +       else
> +               rrate =3D pll->max_rate;

A switch statement would be more readable. Not sure why pll->min_rate is
needed though.

	switch (rate) {
	case 0 .. pll->min_rate:
		rrate =3D=20
		break;
	case pll->min_rate .. DP_VCO_HSCLK_RATE_2700MHZDIV1000:
		...
	}

> +
> +       DRM_DEBUG_DP("%s: rrate=3D%ld\n", __func__, rrate);
> +
> +       *parent_rate =3D rrate;
> +       return rrate;
> +}
