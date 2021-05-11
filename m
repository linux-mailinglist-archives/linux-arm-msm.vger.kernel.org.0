Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4C5379F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 07:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhEKFXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 01:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhEKFXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 01:23:30 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93943C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 22:22:22 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso16519860otn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 22:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1XYo/HH08xj1HbCG0QyRSLOCzZ3tgzrX+Sqs15Va+8g=;
        b=E6rFtJRbG+dAnqTEZhIOQA12ebJrYBaa84KcAWCbtejuM56Hr7s+KkcQi+lcNP7odQ
         xavNkxUgUazOv+LtElBePp5d4+SXjHRiAR3QtmP1Wr2c6AdmujRRVYzw3xdI+T4t+zqC
         ei10I8KDBH7Ob7E7WwbH4/HU/5XvrraaDvyHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1XYo/HH08xj1HbCG0QyRSLOCzZ3tgzrX+Sqs15Va+8g=;
        b=VR1M9cSjI3JPGzU7/mLp5KxWX+qAfvp422ZNIY+8G5gzDm8Ckm06fCHGMBGHrpLqef
         f5QdYIx+R2+YE0UDGa08VhGoSICksuPM6CuMB8nF5cdRx43V+bYXi4oK2thiKo9i7HhO
         TzUGpgiNQOecHg8boPvF5XuAcwG7YsoCNAyUgYC6SvexBS7A1uBnIz7xYwsA+KaCED/q
         8ADsqvrDVEvzy5swHkAw4ZjgUWY1tS2Vwu3fQYpp/ufYpzUwZviYsGoc+ZBJ+PvY1OMR
         DRRqgg3XNxQJS7BaN9sXRP4ztoH79UO1kxfH0VGlv754FnBgUCKaxLXJKkVTvHHeRWVs
         OYwQ==
X-Gm-Message-State: AOAM530om2b+W9CLyAYxrLwh5HeNLGc9YS8OadILqvs5yHKMRdrx3unC
        DyjBSMdAQdrM3XEy+a0QKnYD+iad9TmJ47DXVuCGBQ==
X-Google-Smtp-Source: ABdhPJy8D3AkEO7Rc/9a8rsCucdMVNPYVvuTKW5AD5jeNWw9ldBq6C1BFBpWSPmw8mdZ9Szx1p2QYuOaNOxG4kkypeo=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr25358780otn.233.1620710541992;
 Mon, 10 May 2021 22:22:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 22:22:21 -0700
MIME-Version: 1.0
In-Reply-To: <20210511041930.592483-2-bjorn.andersson@linaro.org>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org> <20210511041930.592483-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 10 May 2021 22:22:21 -0700
Message-ID: <CAE-0n50qWuny_1oYEMSZ+cfmCvnumk_UTPxUvZ-3wWdgOCioNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, sbillaka@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-05-10 21:19:30)
> Many recent Qualcomm platforms comes with native DP and eDP support.
> This consists of a controller int he MDSS and a QMP-like PHY.
>
> While similar to the well known QMP block, the eDP PHY only has TX lanes
> and the programming sequences are slightly different. Rather than
> continuing the trend of parameterize the QMP driver to pieces, this
> introduces the support as a new driver.

Thank you for not slamming it into the same mega driver.

>
> The registration of link and pixel clocks are borrowed from the QMP
> driver. The non-DP link frequencies are omitted for now.

Can we make some library code for "DP" stuff in qmp that the two can
call to share the logic?

>
> The eDP PHY is very similar to the dedicated (non-USB) DP PHY, but only
> the prior is supported for now.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/phy/qualcomm/Kconfig        |  10 +
>  drivers/phy/qualcomm/Makefile       |   1 +
>  drivers/phy/qualcomm/phy-qcom-edp.c | 750 ++++++++++++++++++++++++++++
>  3 files changed, 761 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-edp.c
>
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 7f6fcb8ec5ba..13ae6f4f3112 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -114,3 +114,13 @@ config PHY_QCOM_IPQ806X_USB
>           This option enables support for the Synopsis PHYs present inside the
>           Qualcomm USB3.0 DWC3 controller on ipq806x SoC. This driver supports
>           both HS and SS PHY controllers.
> +
> +config PHY_QCOM_EDP

Can this come somewhere alphabet sorted?

> +       tristate "Qualcomm eDP PHY driver"
> +       depends on ARCH_QCOM || COMPILE_TEST

I wonder if this could be pulled up above for the whole file.

> +       depends on OF
> +       depends on COMMON_CLK
> +       select GENERIC_PHY
> +       help
> +         Enable this driver to support the Qualcomm eDP PHY found in various
> +         Qualcomm chipsets.
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 47acbd7daa3a..1afd0882dbcc 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)    += phy-qcom-usb-hs-28nm.o
>  obj-$(CONFIG_PHY_QCOM_USB_SS)          += phy-qcom-usb-ss.o
>  obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)             += phy-qcom-ipq806x-usb.o
> +obj-$(CONFIG_PHY_QCOM_EDP)             += phy-qcom-edp.o

Also alphabet sorted instead of tacked onto the end?

> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> new file mode 100644
> index 000000000000..ff0508e49548
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -0,0 +1,750 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2017, 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/phy/phy.h>
> +
> +#define DP_PHY_PD_CTL_PWRDN                    0x001
> +#define DP_PHY_PD_CTL_PSR_PWRDN                        0x002
> +#define DP_PHY_PD_CTL_AUX_PWRDN                        0x004
> +#define DP_PHY_PD_CTL_LANE_0_1_PWRDN           0x008
> +#define DP_PHY_PD_CTL_LANE_2_3_PWRDN           0x010
> +#define DP_PHY_PD_CTL_PLL_PWRDN                        0x020
> +#define DP_PHY_PD_CTL_DP_CLAMP_EN              0x040
> +
> +#define DP_PHY_CFG                              0x0010
> +#define DP_PHY_CFG_1                            0x0014
> +#define DP_PHY_PD_CTL                           0x001C
> +#define DP_PHY_MODE                             0x0020
> +
> +#define DP_PHY_AUX_CFG0                                0x0020
> +#define DP_PHY_AUX_CFG1                                0x0024
> +#define DP_PHY_AUX_CFG2                                0x0028
> +#define DP_PHY_AUX_CFG3                                0x002c
> +#define DP_PHY_AUX_CFG4                                0x0030
> +#define DP_PHY_AUX_CFG5                                0x0034
> +#define DP_PHY_AUX_CFG6                                0x0038
> +#define DP_PHY_AUX_CFG7                                0x003c
> +#define DP_PHY_AUX_CFG8                                0x0040
> +#define DP_PHY_AUX_CFG9                                0x0044
> +
> +#define DP_PHY_VCO_DIV                          0x0074
> +#define DP_PHY_TX0_TX1_LANE_CTL                 0x007C
> +#define DP_PHY_TX2_TX3_LANE_CTL                 0x00A0
> +
> +#define DP_PHY_SPARE0                           0x00CC
> +#define DP_PHY_STATUS                           0x00E0
> +
> +/* Tx registers */
> +#define TXn_CLKBUF_ENABLE                       0x0000
> +#define TXn_TX_EMP_POST1_LVL                    0x0004
> +
> +#define TXn_TX_DRV_LVL                          0x0014
> +#define TXn_TX_DRV_LVL_OFFSET                   0x0018
> +#define TXn_RESET_TSYNC_EN                      0x001C
> +//#define TXn_PRE_STALL_LDO_BOOST_EN            0x0020
> +#define TXn_LDO_CONFIG                          0x0084
> +#define TXn_TX_BAND                             0x0028
> +#define TXn_INTERFACE_SELECT                    0x0024
> +
> +#define TXn_RES_CODE_LANE_OFFSET_TX0            0x0044
> +#define TXn_RES_CODE_LANE_OFFSET_TX1            0x0048
> +//#define TXn_RES_CODE_LANE_OFFSET_RX           0x0040
> +
> +#define TXn_TRANSCEIVER_BIAS_EN                 0x0054
> +#define TXn_HIGHZ_DRVR_EN                       0x0058
> +#define TXn_TX_POL_INV                          0x005C
> +#define TXn_PARRATE_REC_DETECT_IDLE_EN          0x0060
> +#define TXn_LANE_MODE_1                         0x0064
> +
> +#define TXn_TRAN_DRVR_EMP_EN                    0x0078
> +//#define TXn_TX_INTERFACE_MODE                 0x00BC

Future work? Maybe add a TODO?

> +
> +#define TXn_VMODE_CTRL1                         0x007C
> +
> +/* PLL register offset */
> +#define QSERDES_COM_BG_TIMER                    0x000C
> +#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN         0x0044
> +#define QSERDES_COM_CLK_ENABLE1                 0x0048
> +#define QSERDES_COM_SYS_CLK_CTRL                0x004C
[..]
> +static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
> +{
> +       struct clk_init_data init = { };
> +       int ret;
> +
> +       init.ops = &qcom_edp_dp_link_clk_ops;
> +       init.name = "edp_phy_pll_link_clk";
> +       edp->dp_link_hw.init = &init;
> +       ret = devm_clk_hw_register(edp->dev, &edp->dp_link_hw);
> +       if (ret)
> +               return ret;
> +
> +       init.ops = &qcom_edp_dp_pixel_clk_ops;
> +       init.name = "edp_phy_pll_vco_div_clk";
> +       edp->dp_pixel_hw.init = &init;
> +       ret = devm_clk_hw_register(edp->dev, &edp->dp_pixel_hw);
> +       if (ret)
> +               return ret;
> +
> +       ret = of_clk_add_hw_provider(np, qcom_edp_dp_clks_hw_get, edp);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Roll a devm action because the clock provider is the child node, but

Is it still a child node?

> +        * the child node is not actually a device.
> +        */
> +       ret = devm_add_action(edp->dev, phy_clk_release_provider, np);
> +       if (ret)
> +               phy_clk_release_provider(np);
> +
> +       return ret;
> +}
> +
