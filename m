Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CC137A9D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 16:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhEKOrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 10:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbhEKOrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 10:47:47 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B2AC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:46:40 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 76so18933012qkn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLFCa87I7JQKzoSKsNDQL+580pIbXD9R49fKyps3yZ0=;
        b=UQWqxiiYpfVygCKimxDpZTXVss+lMKvwc386fEozjE8z9gTmTSyc1szxCU/lf3KjZX
         UqGf9/iuywPDkcsBnv57VypH9xZ0LMbCWj62qlqnBJW/spRuoJL7XBQtBayBhonXIQK+
         ubcGbAjorjwmUTxIoOm4r+8a9M+I0JkMPjk79gVc6hsbbdbUUSazQUr3yK5LP01NE7NK
         tfWaHBy8swoW0nfQFOxZtAP3cy3Vlggr/QlEvIeJ2JVeMjUAZ2kJPkFuDUeNPLhGccQq
         ybZiqYP02kvC1TfHpjkLdC2oKKybS845qoiTFQm9o/Op5/mXOqDSb0swZSXM5nvDVLqI
         MXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLFCa87I7JQKzoSKsNDQL+580pIbXD9R49fKyps3yZ0=;
        b=SpaqctUIhp7NAAvuiqxe/9akwgerl7QwYH40LlOAUEy79sGzVPl1dD1sen5OY+AL5P
         781Ylc39g3U6As6zyO39t7p65YTcMzu+mJTzddsNekL6oZCS8WYAeOtdQGeArOp6NZM7
         OnzxPv8oysiXUPdZqispg8EgmgBQvwp+8lv7CXlG/6kUPrMCHuGq5Zas+6S35YJm16l1
         bZWfyxAgSo4WKl13pzR8eZfrLWfCmCZozsF5Fgqg5DJMaON5zq5Slsve9PM41MFTGr2x
         TTmv9bNUkI/COECayb+bEl3cIczQuCMv1DssprSwKfMgxEwacwHW+JwXtXyywN+7kM/l
         CHeg==
X-Gm-Message-State: AOAM533hSX0XcW1SOluQF0muUX38f4Nl1ziyc32f+9H+5ub3MakwDAri
        G6J7GT/6v4u7siRob0H8wKdCK6Xc06Ws7DtcTtu7CA==
X-Google-Smtp-Source: ABdhPJw7wgyqE4OGOSNvvMlbCH/ED3plbDNvVy8uO5BlMBZFfbkNha2lc+V071l5I4AikiQko7scIrlbX2qAX7Z/0Ks=
X-Received: by 2002:a37:5945:: with SMTP id n66mr28314179qkb.138.1620744399868;
 Tue, 11 May 2021 07:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210511041930.592483-1-bjorn.andersson@linaro.org> <20210511041930.592483-2-bjorn.andersson@linaro.org>
In-Reply-To: <20210511041930.592483-2-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 11 May 2021 17:46:28 +0300
Message-ID: <CAA8EJpo90TcA_NgH_yg1N8fnj_usTAmSJ-tvQmL8371YHT7eTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sankeerth Billakanti <sbillaka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 07:19, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Many recent Qualcomm platforms comes with native DP and eDP support.
> This consists of a controller int he MDSS and a QMP-like PHY.
>
> While similar to the well known QMP block, the eDP PHY only has TX lanes
> and the programming sequences are slightly different. Rather than
> continuing the trend of parameterize the QMP driver to pieces, this
> introduces the support as a new driver.
>
> The registration of link and pixel clocks are borrowed from the QMP
> driver. The non-DP link frequencies are omitted for now.
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

Just a generic suggestion: what about naming it
PHY_QCOM_QMP_EDP/phy-qcom-qmp-edp.c, so that it stays close to the
"big" qmp driver and also so that other qmp parts can follow this
example if we ever split the bg driver in future?

> +config PHY_QCOM_EDP
> +       tristate "Qualcomm eDP PHY driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
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
> +
> +#define TXn_VMODE_CTRL1                         0x007C
> +
> +/* PLL register offset */
> +#define QSERDES_COM_BG_TIMER                    0x000C
> +#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN         0x0044
> +#define QSERDES_COM_CLK_ENABLE1                 0x0048
> +#define QSERDES_COM_SYS_CLK_CTRL                0x004C
> +#define QSERDES_COM_SYSCLK_BUF_ENABLE           0x0050
> +#define QSERDES_COM_PLL_IVCO                    0x0058
> +
> +#define QSERDES_COM_CP_CTRL_MODE0               0x0074
> +#define QSERDES_COM_PLL_RCTRL_MODE0             0x007C
> +#define QSERDES_COM_PLL_CCTRL_MODE0             0x0084
> +#define QSERDES_COM_SYSCLK_EN_SEL               0x0094
> +#define QSERDES_COM_RESETSM_CNTRL               0x009C
> +#define QSERDES_COM_LOCK_CMP_EN                 0x00A4
> +#define QSERDES_COM_LOCK_CMP1_MODE0             0x00AC
> +#define QSERDES_COM_LOCK_CMP2_MODE0             0x00B0
> +
> +#define QSERDES_COM_DEC_START_MODE0             0x00BC
> +#define QSERDES_COM_DIV_FRAC_START1_MODE0       0x00CC
> +#define QSERDES_COM_DIV_FRAC_START2_MODE0       0x00D0
> +#define QSERDES_COM_DIV_FRAC_START3_MODE0       0x00D4
> +#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0       0x00EC
> +#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0       0x00F0
> +#define QSERDES_COM_VCO_TUNE_CTRL               0x0108
> +#define QSERDES_COM_VCO_TUNE_MAP                0x010C
> +#define QSERDES_COM_VCO_TUNE1_MODE0             0x0110
> +#define QSERDES_COM_VCO_TUNE2_MODE0             0x0114
> +#define QSERDES_COM_CMN_STATUS                  0x0140
> +
> +#define QSERDES_COM_CLK_SEL                     0x0154
> +#define QSERDES_COM_HSCLK_SEL                   0x0158
> +
> +#define QSERDES_COM_CORECLK_DIV_MODE0           0x0168
> +
> +#define QSERDES_COM_CORE_CLK_EN                 0x0174
> +#define QSERDES_COM_C_READY_STATUS              0x0178
> +#define QSERDES_COM_CMN_CONFIG                  0x017C
> +
> +#define QSERDES_COM_SVS_MODE_CLK_SEL            0x0184
> +
> +#define QSERDES_COM_SSC_EN_CENTER               0x0010
> +#define QSERDES_COM_SSC_ADJ_PER1                0x0014
> +#define QSERDES_COM_SSC_ADJ_PER2                0x0018
> +#define QSERDES_COM_SSC_PER1                    0x001C
> +#define QSERDES_COM_SSC_PER2                    0x0020
> +#define QSERDES_COM_SSC_STEP_SIZE1_MODE0        0x0024
> +#define QSERDES_COM_SSC_STEP_SIZE2_MODE0        0x0028
> +
> +#define DP_PHY_PLL_POLL_SLEEP_US                500
> +#define DP_PHY_PLL_POLL_TIMEOUT_US              10000
> +
> +#define EDP_VCO_RATE_8100MHZDIV1000             8100000UL
> +#define EDP_VCO_RATE_8640MHZDIV1000             8640000UL
> +#define EDP_VCO_RATE_9720MHZDIV1000             9720000UL
> +#define EDP_VCO_RATE_10800MHZDIV1000            10800000UL
> +#define EDP_VCO_RATE_11880MHZDIV1000            11880000UL

Can we use phy-qcom-qmp.h for register difinitions?

> +
> +struct qcom_edp {
> +       struct device *dev;
> +
> +       struct phy *phy;
> +
> +       void __iomem *edp;
> +       void __iomem *tx0;
> +       void __iomem *tx1;
> +       void __iomem *pll;
> +
> +       struct clk_hw dp_link_hw;
> +       struct clk_hw dp_pixel_hw;
> +
> +       struct phy_configure_opts_dp dp_opts;
> +
> +       struct clk_bulk_data clks[2];
> +       struct regulator_bulk_data supplies[2];
> +} ;
> +
> +static int qcom_edp_phy_init(struct phy *phy)
> +{
> +       struct qcom_edp *edp = phy_get_drvdata(phy);
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> +       if (ret)
> +               goto out_disable_supplies;
> +
> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +              DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +              edp->edp + DP_PHY_PD_CTL);
> +
> +       writel(0x17, edp->pll + QSERDES_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +       writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
> +       msleep(20);
> +
> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +              DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +              DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +              edp->edp + DP_PHY_PD_CTL);
> +
> +       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> +       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> +       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> +       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> +       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> +       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> +       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> +       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> +       writel(0x37, edp->edp + DP_PHY_AUX_CFG8);
> +       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> +
> +       writel(0x1f, edp->edp + 0x58);
> +
> +       msleep(20);
> +
> +       return 0;
> +
> +out_disable_supplies:
> +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +       return ret;
> +}
> +
> +static int qcom_edp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +       const struct phy_configure_opts_dp *dp_opts = &opts->dp;
> +       struct qcom_edp *edp = phy_get_drvdata(phy);
> +
> +       memcpy(&edp->dp_opts, dp_opts, sizeof(*dp_opts));
> +
> +       return 0;
> +}
> +
> +static int qcom_edp_configure_ssc(struct qcom_edp *edp)
> +{
> +       const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +       u32 step1;
> +       u32 step2;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +       case 2700:
> +       case 8100:
> +               step1 = 0x45;
> +               step2 = 0x06;
> +               break;
> +       case 5400:
> +               step1 = 0x5c;
> +               step2 = 0x08;
> +               break;
> +       default:
> +               /* Other link rates aren't supported */
> +               return -EINVAL;
> +       }
> +
> +       writel(0x01, edp->pll + QSERDES_COM_SSC_EN_CENTER);
> +       writel(0x00, edp->pll + QSERDES_COM_SSC_ADJ_PER1);
> +       writel(0x36, edp->pll + QSERDES_COM_SSC_PER1);
> +       writel(0x01, edp->pll + QSERDES_COM_SSC_PER2);
> +       writel(step1, edp->pll + QSERDES_COM_SSC_STEP_SIZE1_MODE0);
> +       writel(step2, edp->pll + QSERDES_COM_SSC_STEP_SIZE2_MODE0);
> +
> +       return 0;
> +}
> +
> +static int qcom_edp_configure_pll(struct qcom_edp *edp)
> +{
> +       const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +       u32 div_frac_start2_mode0;
> +       u32 div_frac_start3_mode0;
> +       u32 dec_start_mode0;
> +       u32 lock_cmp1_mode0;
> +       u32 lock_cmp2_mode0;
> +       u32 hsclk_sel;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               hsclk_sel = 0x5;
> +               dec_start_mode0 = 0x69;
> +               div_frac_start2_mode0 = 0x80;
> +               div_frac_start3_mode0 = 0x07;
> +               lock_cmp1_mode0 = 0x6f;
> +               lock_cmp2_mode0 = 0x08;
> +               break;
> +       case 2700:
> +               hsclk_sel = 0x3;
> +               dec_start_mode0 = 0x69;
> +               div_frac_start2_mode0 = 0x80;
> +               div_frac_start3_mode0 = 0x07;
> +               lock_cmp1_mode0 = 0x0f;
> +               lock_cmp2_mode0 = 0x0e;
> +               break;
> +       case 5400:
> +               hsclk_sel = 0x1;
> +               dec_start_mode0 = 0x8c;
> +               div_frac_start2_mode0 = 0x00;
> +               div_frac_start3_mode0 = 0x0a;
> +               lock_cmp1_mode0 = 0x1f;
> +               lock_cmp2_mode0 = 0x1c;
> +               break;
> +       case 8100:
> +               hsclk_sel = 0x0;
> +               dec_start_mode0 = 0x69;
> +               div_frac_start2_mode0 = 0x80;
> +               div_frac_start3_mode0 = 0x07;
> +               lock_cmp1_mode0 = 0x2f;
> +               lock_cmp2_mode0 = 0x2a;
> +               break;
> +       default:
> +               /* Other link rates aren't supported */
> +               return -EINVAL;
> +       }
> +
> +       writel(0x01, edp->pll + QSERDES_COM_SVS_MODE_CLK_SEL);
> +       writel(0x0b, edp->pll + QSERDES_COM_SYSCLK_EN_SEL);
> +       writel(0x02, edp->pll + QSERDES_COM_SYS_CLK_CTRL);
> +       writel(0x0c, edp->pll + QSERDES_COM_CLK_ENABLE1);
> +       writel(0x06, edp->pll + QSERDES_COM_SYSCLK_BUF_ENABLE);
> +       writel(0x30, edp->pll + QSERDES_COM_CLK_SEL);
> +       writel(hsclk_sel, edp->pll + QSERDES_COM_HSCLK_SEL);
> +       writel(0x0f, edp->pll + QSERDES_COM_PLL_IVCO);
> +       writel(0x08, edp->pll + QSERDES_COM_LOCK_CMP_EN);
> +       writel(0x36, edp->pll + QSERDES_COM_PLL_CCTRL_MODE0);
> +       writel(0x16, edp->pll + QSERDES_COM_PLL_RCTRL_MODE0);
> +       writel(0x06, edp->pll + QSERDES_COM_CP_CTRL_MODE0);
> +       writel(dec_start_mode0, edp->pll + QSERDES_COM_DEC_START_MODE0);
> +       writel(0x00, edp->pll + QSERDES_COM_DIV_FRAC_START1_MODE0);
> +       writel(div_frac_start2_mode0, edp->pll + QSERDES_COM_DIV_FRAC_START2_MODE0);
> +       writel(div_frac_start3_mode0, edp->pll + QSERDES_COM_DIV_FRAC_START3_MODE0);
> +       writel(0x02, edp->pll + QSERDES_COM_CMN_CONFIG);
> +       writel(0x3f, edp->pll + QSERDES_COM_INTEGLOOP_GAIN0_MODE0);
> +       writel(0x00, edp->pll + QSERDES_COM_INTEGLOOP_GAIN1_MODE0);
> +       writel(0x00, edp->pll + QSERDES_COM_VCO_TUNE_MAP);
> +       writel(lock_cmp1_mode0, edp->pll + QSERDES_COM_LOCK_CMP1_MODE0);
> +       writel(lock_cmp2_mode0, edp->pll + QSERDES_COM_LOCK_CMP2_MODE0);
> +
> +       writel(0x0a, edp->pll + QSERDES_COM_BG_TIMER);
> +       writel(0x14, edp->pll + QSERDES_COM_CORECLK_DIV_MODE0);
> +       writel(0x00, edp->pll + QSERDES_COM_VCO_TUNE_CTRL);
> +       writel(0x17, edp->pll + QSERDES_COM_BIAS_EN_CLKBUFLR_EN);
> +       writel(0x0f, edp->pll + QSERDES_COM_CORE_CLK_EN);
> +       writel(0xa0, edp->pll + QSERDES_COM_VCO_TUNE1_MODE0);
> +       writel(0x03, edp->pll + QSERDES_COM_VCO_TUNE2_MODE0);
> +
> +       return 0;
> +}
> +
> +static int qcom_edp_set_vco_div(struct qcom_edp *edp)
> +{
> +       const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +       unsigned long pixel_freq;
> +       u32 vco_div;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               vco_div = 0x1;
> +               pixel_freq = 1620000000UL / 2;
> +               break;
> +       case 2700:
> +               vco_div = 0x1;
> +               pixel_freq = 2700000000UL / 2;
> +               break;
> +       case 5400:
> +               vco_div = 0x2;
> +               pixel_freq = 5400000000UL / 4;
> +               break;
> +       case 8100:
> +               vco_div = 0x0;
> +               pixel_freq = 8100000000UL / 6;
> +               break;
> +       default:
> +               /* Other link rates aren't supported */
> +               return -EINVAL;
> +       }
> +
> +       writel(vco_div, edp->edp + DP_PHY_VCO_DIV);
> +
> +       clk_set_rate(edp->dp_link_hw.clk, dp_opts->link_rate * 100000);
> +       clk_set_rate(edp->dp_pixel_hw.clk, pixel_freq);
> +
> +       return 0;
> +}
> +
> +static int qcom_edp_phy_power_on(struct phy *phy)
> +{
> +       struct qcom_edp *edp = phy_get_drvdata(phy);
> +       int timeout;
> +       int ret;
> +       u32 val;
> +
> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +              DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +              DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +              edp->edp + DP_PHY_PD_CTL);
> +       writel(0xfc, edp->edp + DP_PHY_MODE);
> +
> +       timeout = readl_poll_timeout(edp->pll + QSERDES_COM_CMN_STATUS,
> +                                    val, val & BIT(7), 5, 200);
> +       if (timeout)
> +               return timeout;
> +
> +       writel(0x01, edp->tx0 + TXn_LDO_CONFIG);
> +       writel(0x01, edp->tx1 + TXn_LDO_CONFIG);
> +       writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
> +       writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
> +
> +       ret = qcom_edp_configure_ssc(edp);
> +       if (ret)
> +               return ret;
> +
> +       ret = qcom_edp_configure_pll(edp);
> +       if (ret)
> +               return ret;
> +
> +       /* TX Lane configuration */
> +       writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> +       writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +
> +       /* TX-0 register configuration */
> +       writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> +       writel(0x0f, edp->tx0 + TXn_CLKBUF_ENABLE);
> +       writel(0x03, edp->tx0 + TXn_RESET_TSYNC_EN);
> +       writel(0x01, edp->tx0 + TXn_TRAN_DRVR_EMP_EN);
> +       writel(0x04, edp->tx0 + TXn_TX_BAND);
> +
> +       /* TX-1 register configuration */
> +       writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
> +       writel(0x0f, edp->tx1 + TXn_CLKBUF_ENABLE);
> +       writel(0x03, edp->tx1 + TXn_RESET_TSYNC_EN);
> +       writel(0x01, edp->tx1 + TXn_TRAN_DRVR_EMP_EN);
> +       writel(0x04, edp->tx1 + TXn_TX_BAND);
> +
> +       ret = qcom_edp_set_vco_div(edp);
> +       if (ret)
> +               return ret;
> +
> +       writel(0x01, edp->edp + DP_PHY_CFG);
> +        writel(0x05, edp->edp + DP_PHY_CFG);
> +        writel(0x01, edp->edp + DP_PHY_CFG);
> +        writel(0x09, edp->edp + DP_PHY_CFG);
> +
> +        writel(0x20, edp->pll + QSERDES_COM_RESETSM_CNTRL);
> +
> +       timeout = readl_poll_timeout(edp->pll + QSERDES_COM_C_READY_STATUS,
> +                                    val, val & BIT(0), 500, 10000);
> +       if (timeout)
> +               return timeout;
> +
> +       writel(0x19, edp->edp + DP_PHY_CFG);
> +       writel(0x1f, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x00, edp->tx0 + TXn_TX_POL_INV);
> +       writel(0x1f, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x00, edp->tx1 + TXn_TX_POL_INV);
> +       writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
> +       writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> +       writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +       writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +       writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +       writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +
> +       writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +       writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +       writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
> +       writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
> +
> +       writel(0x4, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x3, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> +       writel(0x4, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +       writel(0x0, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
> +       writel(0x3, edp->edp + DP_PHY_CFG_1);
> +
> +       writel(0x18, edp->edp + DP_PHY_CFG);
> +       udelay(100);
> +
> +       writel(0x19, edp->edp + DP_PHY_CFG);
> +
> +       return readl_poll_timeout(edp->edp + DP_PHY_STATUS,
> +                                 val, val & BIT(1), 500, 10000);
> +}
> +
> +static int qcom_edp_phy_power_off(struct phy *phy)
> +{
> +       struct qcom_edp *edp = phy_get_drvdata(phy);
> +
> +       writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
> +
> +       return 0;
> +}
> +
> +static int qcom_edp_phy_exit(struct phy *phy)
> +{
> +       struct qcom_edp *edp = phy_get_drvdata(phy);
> +
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops qcom_edp_ops = {
> +       .init           = qcom_edp_phy_init,
> +       .configure      = qcom_edp_phy_configure,
> +       .power_on       = qcom_edp_phy_power_on,
> +       .power_off      = qcom_edp_phy_power_off,
> +       .exit           = qcom_edp_phy_exit,
> +       .owner          = THIS_MODULE,
> +};
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
> + * +--------v----------------+                          |
> + * |    dp_phy_pll_link_clk  |                          |
> + * |     link_clk            |                          |
> + * +--------+----------------+                          |
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
> + *              +----------+-----------------+
> + *              |   dp_phy_pll_vco_div_clk   |
> + *              +---------+------------------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +static int qcom_edp_dp_pixel_clk_determine_rate(struct clk_hw *hw,
> +                                               struct clk_rate_request *req)
> +{
> +       switch (req->rate) {
> +       case 1620000000UL / 2:
> +       case 2700000000UL / 2:
> +       /* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static unsigned long
> +qcom_edp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +       const struct qcom_edp *edp = container_of(hw, struct qcom_edp, dp_pixel_hw);
> +       const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               return 1620000000UL / 2;
> +       case 2700:
> +               return 2700000000UL / 2;
> +       case 5400:
> +               return 5400000000UL / 4;
> +       case 8100:
> +               return 8100000000UL / 6;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops qcom_edp_dp_pixel_clk_ops = {
> +       .determine_rate = qcom_edp_dp_pixel_clk_determine_rate,
> +       .recalc_rate = qcom_edp_dp_pixel_clk_recalc_rate,
> +};
> +
> +static int qcom_edp_dp_link_clk_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       switch (req->rate) {
> +       case 162000000:
> +       case 270000000:
> +       case 540000000:
> +       case 810000000:
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static unsigned long
> +qcom_edp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +       const struct qcom_edp *edp = container_of(hw, struct qcom_edp, dp_link_hw);
> +       const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +       case 2700:
> +       case 5400:
> +       case 8100:
> +               return dp_opts->link_rate * 100000;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops qcom_edp_dp_link_clk_ops = {
> +       .determine_rate = qcom_edp_dp_link_clk_determine_rate,
> +       .recalc_rate = qcom_edp_dp_link_clk_recalc_rate,
> +};
> +
> +static struct clk_hw *
> +qcom_edp_dp_clks_hw_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       unsigned int idx = clkspec->args[0];
> +       struct qcom_edp *edp = data;
> +
> +       if (idx >= 2) {
> +               pr_err("%s: invalid index %u\n", __func__, idx);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (idx == 0)
> +               return &edp->dp_link_hw;
> +
> +       return &edp->dp_pixel_hw;
> +}
> +
> +static void phy_clk_release_provider(void *res)
> +{
> +       of_clk_del_provider(res);
> +}
> +
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

I think we can use of_clk_onecell_get here (and we should change main
qmp driver)
Also we can use devm_of_clk_add_hw_provider.

> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Roll a devm action because the clock provider is the child node, but
> +        * the child node is not actually a device.
> +        */
> +       ret = devm_add_action(edp->dev, phy_clk_release_provider, np);
> +       if (ret)
> +               phy_clk_release_provider(np);
> +
> +       return ret;
> +}
> +
> +static int qcom_edp_phy_probe(struct platform_device *pdev)
> +{
> +       struct phy_provider *phy_provider;
> +       struct device *dev = &pdev->dev;
> +       struct qcom_edp *edp;
> +       int ret;
> +
> +       edp = devm_kzalloc(dev, sizeof(*edp), GFP_KERNEL);
> +       if (!edp)
> +               return -ENOMEM;
> +
> +       edp->dev = dev;
> +
> +       edp->edp = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(edp->edp))
> +               return PTR_ERR(edp->edp);
> +
> +       edp->tx0 = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(edp->tx0))
> +               return PTR_ERR(edp->tx0);
> +
> +       edp->tx1 = devm_platform_ioremap_resource(pdev, 2);
> +       if (IS_ERR(edp->tx1))
> +               return PTR_ERR(edp->tx1);
> +
> +       edp->pll = devm_platform_ioremap_resource(pdev, 3);
> +       if (IS_ERR(edp->pll))
> +               return PTR_ERR(edp->pll);
> +
> +       edp->clks[0].id = "aux";
> +       edp->clks[1].id = "cfg_ahb";
> +       ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
> +       if (ret)
> +               return ret;
> +
> +       edp->supplies[0].supply = "vdda-phy";
> +       edp->supplies[1].supply = "vdda-pll";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> +       if (ret)
> +               return ret;
> +
> +       edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
> +       if (IS_ERR(edp->phy)) {
> +               dev_err(dev, "failed to register phy\n");
> +               return PTR_ERR(edp->phy);
> +       }
> +
> +       phy_set_drvdata(edp->phy, edp);
> +
> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +       return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id qcom_edp_phy_match_table[] = {
> +       { .compatible = "qcom,sc8180x-edp-phy" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
> +
> +static struct platform_driver qcom_edp_phy_driver = {
> +       .probe          = qcom_edp_phy_probe,
> +       .driver = {
> +               .name   = "qcom-edp-phy",
> +               .of_match_table = qcom_edp_phy_match_table,
> +       },
> +};
> +
> +module_platform_driver(qcom_edp_phy_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm eDP PHY driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
