Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2F41499D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2020 10:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAZJpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jan 2020 04:45:40 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39400 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgAZJpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jan 2020 04:45:40 -0500
Received: by mail-vs1-f65.google.com with SMTP id y125so3895439vsb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2020 01:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVHiP/LUHhgXnsoU9lowYg7KRX4y/zu/aafuqKkBAl4=;
        b=hvPUjdIDUgOcZGgig2Qww379C/NcEBOYIbYloaeerEOEsvQFzU5ZM/lbpL0ZgMQsk8
         8j8B+GR/ccpD2kyZOw8dOhM9QszqyOmrdIKgG93sKCu4bjeWEECKda+2o3FxK73OKxEi
         AlxfqeM95VjT0XUsn/0oBBo0GxdGwBaDqoQBZ+ikQ1m8R/v5QOou8m4YU8ixczNpUDpZ
         LPFz7CwCR+LpKx8FaXNcfBgJjSkVBogcD3LU5Y8zFpd6CKYiiQbU/r4W53YwMjDjWzUM
         Nu560WuwD4k1RxtEcBxL3JoHlsLB+8lN500HNTCmeChQ+/TL+IOFmSVE9v/74ZdsByBB
         5aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVHiP/LUHhgXnsoU9lowYg7KRX4y/zu/aafuqKkBAl4=;
        b=PxteEBBQQ8B2+ZEeilFA1FFKwsf6NPLyWXIXDoCmHqH/MDTN9O9e7WMBZ+Yrp/8YVu
         u8l5zu5YJAK+tlwG9DCBoUm1Yy1RmGxoPGh8zs/lW/8fbs7CnqhuklpVrM0HGJ5XezS1
         w96CSlcmlbkSbQW1GoJtlpPqagLCk+k514SngkR91+qYd7+TD+Ao3hg7gC1fhAen+3Xe
         DD98CdKjab8LvhpXcMRfOu/N/ls1V8BxWrhq3EbN4VmgO1wLuWQsPkofBswmD9vQ0fpl
         Beih29pY20lKcHI67keklGoiIgCEq48OYUVNLPe6JAw75vdC6zqxPTrjiW2nargks6n+
         wjGQ==
X-Gm-Message-State: APjAAAXO5Z34Pt9eRepUbE9j/ckZPQHZo6GCHuKMrmnBhtkhSkZ7uTkM
        z+x08YaSJR2DPGh8ztSf30Z57MTWwoxyVOsBjFfAmh/+
X-Google-Smtp-Source: APXvYqxuX4BR8yOQe/7XN2WN62z+nEc4S80gIFTjk3Dzmjku/zBnypnKTc/fp7PENX1aB4jBKIlvYlyQ49tyavtJC1g=
X-Received: by 2002:a05:6102:a10:: with SMTP id t16mr7340033vsa.130.1580031938654;
 Sun, 26 Jan 2020 01:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20200106153711.1282414-1-robert.marko@sartura.hr>
 <CA+HBbNF8c1i2nqM+0aqABCQv0KotAHKrQu5+RJoCy1RCnzac6w@mail.gmail.com> <7eddd24e-543e-f07d-d831-4fa463c17b77@phrozen.org>
In-Reply-To: <7eddd24e-543e-f07d-d831-4fa463c17b77@phrozen.org>
From:   Luka Perkov <luka.perkov@sartura.hr>
Date:   Sun, 26 Jan 2020 10:45:27 +0100
Message-ID: <CAKQ-crhdyjbx3DKM=P-ya4+PVP4hrJEvnY8dbo293R9nhvWYiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     John Crispin <john@phrozen.org>
Cc:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?B?THVrYSBLb3ZhxI1pxI0=?= <luka.kovacic@sartura.hr>,
        Davor Popovic <davor.popovic@sartura.hr>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Josip Kelecic <josip.kelecic@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello John,

On Sat, Jan 25, 2020 at 8:15 PM John Crispin <john@phrozen.org> wrote:
>
> On 25/01/2020 19:47, Robert Marko wrote:
> > Any issues that are preventing merging of this patch?
> >
> > Cheers
> >
> Hi,
> the ones I told you about last time. The original patch got NAK'ed due
> to the magic values written to the registers. However I have been
> engaging with the dakota team of QCA and they provided me with the
> relevant info.

Can you kindly share with whom from QCA Dakota team have you been
discussing these issues with? I'd appreciate it if you could start a
separate email thread as we have other points we would like to
discuss.

One of those is the state of the networking driver and our soon to be
released mainline U-Boot activities. On our side we are investing
significant resources into mainline activities for this platform in a
telecom project.

> I'll be doing the tests they suggested next week and will
> then resend the fixed version of the patch.

Can you kindly share this information? Or point us to the right
documentation so we can look it up?

> I have also been told that
> satura asked about a defunct secondary USB port. Could you shed some
> light on this issue please so that can also resolve that one ?

I have no information about this and will check internally. In case
someone raised it we will let you know.

Thanks,
Luka

>         John
>
> > On Mon, Jan 6, 2020 at 4:38 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >>
> >> From: John Crispin <john@phrozen.org>
> >>
> >> Add a driver to setup the USB phy on Qualcom Dakota SoCs.
> >> The driver sets up HS and SS phys. In case of HS some magic values need to
> >> be written to magic offsets. These were taken from the SDK driver.
> >>
> >> Signed-off-by: John Crispin <john@phrozen.org>
> >> Tested-by: Robert Marko <robert.marko@sartura.hr>
> >> Cc: Luka Perkov <luka.perkov@sartura.hr>
> >> ---
> >> Changes since v1:
> >> - Preserve original author
> >>
> >>   drivers/phy/qualcomm/Kconfig                |   7 +
> >>   drivers/phy/qualcomm/Makefile               |   1 +
> >>   drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 180 ++++++++++++++++++++
> >>   3 files changed, 188 insertions(+)
> >>   create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> >>
> >> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> >> index e46824da29f6..964bd5d784d2 100644
> >> --- a/drivers/phy/qualcomm/Kconfig
> >> +++ b/drivers/phy/qualcomm/Kconfig
> >> @@ -18,6 +18,13 @@ config PHY_QCOM_APQ8064_SATA
> >>          depends on OF
> >>          select GENERIC_PHY
> >>
> >> +config PHY_QCOM_IPQ4019_USB
> >> +       tristate "Qualcomm IPQ4019 USB PHY module"
> >> +       depends on OF && ARCH_QCOM
> >> +       select GENERIC_PHY
> >> +       help
> >> +         Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
> >> +
> >>   config PHY_QCOM_IPQ806X_SATA
> >>          tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
> >>          depends on ARCH_QCOM
> >> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> >> index 283251d6a5d9..8afe6c4f5178 100644
> >> --- a/drivers/phy/qualcomm/Makefile
> >> +++ b/drivers/phy/qualcomm/Makefile
> >> @@ -1,6 +1,7 @@
> >>   # SPDX-License-Identifier: GPL-2.0
> >>   obj-$(CONFIG_PHY_ATH79_USB)            += phy-ath79-usb.o
> >>   obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)    += phy-qcom-apq8064-sata.o
> >> +obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)     += phy-qcom-ipq4019-usb.o
> >>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    += phy-qcom-ipq806x-sata.o
> >>   obj-$(CONFIG_PHY_QCOM_PCIE2)           += phy-qcom-pcie2.o
> >>   obj-$(CONFIG_PHY_QCOM_QMP)             += phy-qcom-qmp.o
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> >> new file mode 100644
> >> index 000000000000..eddea2901062
> >> --- /dev/null
> >> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> >> @@ -0,0 +1,180 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Copyright (C) 2018 John Crispin <john@phrozen.org>
> >> + *
> >> + * Based on code from
> >> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
> >> + *
> >> + */
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/err.h>
> >> +#include <linux/io.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/phy/phy.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/reset.h>
> >> +
> >> +/*
> >> + * Magic registers copied from the SDK driver code
> >> + */
> >> +#define PHY_CTRL0_ADDR 0x000
> >> +#define PHY_CTRL1_ADDR 0x004
> >> +#define PHY_CTRL2_ADDR 0x008
> >> +#define PHY_CTRL3_ADDR 0x00C
> >> +#define PHY_CTRL4_ADDR 0x010
> >> +#define PHY_MISC_ADDR  0x024
> >> +#define PHY_IPG_ADDR   0x030
> >> +
> >> +#define PHY_CTRL0_VAL  0xA4600015
> >> +#define PHY_CTRL1_VAL  0x09500000
> >> +#define PHY_CTRL2_VAL  0x00058180
> >> +#define PHY_CTRL3_VAL  0x6DB6DCD6
> >> +#define PHY_CTRL4_VAL  0x836DB6DB
> >> +#define PHY_MISC_VAL   0x3803FB0C
> >> +#define PHY_IPG_VAL    0x47323232
> >> +
> >> +struct ipq4019_usb_phy {
> >> +       struct device           *dev;
> >> +       struct phy              *phy;
> >> +       void __iomem            *base;
> >> +       struct reset_control    *por_rst;
> >> +       struct reset_control    *srif_rst;
> >> +};
> >> +
> >> +static int ipq4019_ss_phy_power_off(struct phy *_phy)
> >> +{
> >> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> >> +
> >> +       reset_control_assert(phy->por_rst);
> >> +       msleep(10);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> >> +{
> >> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> >> +
> >> +       ipq4019_ss_phy_power_off(_phy);
> >> +
> >> +       reset_control_deassert(phy->por_rst);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> >> +       .power_on       = ipq4019_ss_phy_power_on,
> >> +       .power_off      = ipq4019_ss_phy_power_off,
> >> +};
> >> +
> >> +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> >> +{
> >> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> >> +
> >> +       reset_control_assert(phy->por_rst);
> >> +       msleep(10);
> >> +
> >> +       reset_control_assert(phy->srif_rst);
> >> +       msleep(10);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> >> +{
> >> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> >> +
> >> +       ipq4019_hs_phy_power_off(_phy);
> >> +
> >> +       reset_control_deassert(phy->srif_rst);
> >> +       msleep(10);
> >> +
> >> +       writel(PHY_CTRL0_VAL, phy->base + PHY_CTRL0_ADDR);
> >> +       writel(PHY_CTRL1_VAL, phy->base + PHY_CTRL1_ADDR);
> >> +       writel(PHY_CTRL2_VAL, phy->base + PHY_CTRL2_ADDR);
> >> +       writel(PHY_CTRL3_VAL, phy->base + PHY_CTRL3_ADDR);
> >> +       writel(PHY_CTRL4_VAL, phy->base + PHY_CTRL4_ADDR);
> >> +       writel(PHY_MISC_VAL, phy->base + PHY_MISC_ADDR);
> >> +       writel(PHY_IPG_VAL, phy->base + PHY_IPG_ADDR);
> >> +       msleep(10);
> >> +
> >> +       reset_control_deassert(phy->por_rst);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> >> +       .power_on       = ipq4019_hs_phy_power_on,
> >> +       .power_off      = ipq4019_hs_phy_power_off,
> >> +};
> >> +
> >> +static const struct of_device_id ipq4019_usb_phy_of_match[] = {
> >> +       { .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
> >> +       { .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
> >> +       { },
> >> +};
> >> +MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
> >> +
> >> +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> >> +{
> >> +       struct device *dev = &pdev->dev;
> >> +       struct resource *res;
> >> +       struct phy_provider *phy_provider;
> >> +       struct ipq4019_usb_phy *phy;
> >> +       const struct of_device_id *match;
> >> +
> >> +       match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> >> +       if (!match)
> >> +               return -ENODEV;
> >> +
> >> +       phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> >> +       if (!phy)
> >> +               return -ENOMEM;
> >> +
> >> +       phy->dev = &pdev->dev;
> >> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +       phy->base = devm_ioremap_resource(&pdev->dev, res);
> >> +       if (IS_ERR(phy->base)) {
> >> +               dev_err(dev, "failed to remap register memory\n");
> >> +               return PTR_ERR(phy->base);
> >> +       }
> >> +
> >> +       phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
> >> +       if (IS_ERR(phy->por_rst)) {
> >> +               if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
> >> +                       dev_err(dev, "POR reset is missing\n");
> >> +               return PTR_ERR(phy->por_rst);
> >> +       }
> >> +
> >> +       phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
> >> +       if (IS_ERR(phy->srif_rst))
> >> +               return PTR_ERR(phy->srif_rst);
> >> +
> >> +       phy->phy = devm_phy_create(dev, NULL, match->data);
> >> +       if (IS_ERR(phy->phy)) {
> >> +               dev_err(dev, "failed to create PHY\n");
> >> +               return PTR_ERR(phy->phy);
> >> +       }
> >> +       phy_set_drvdata(phy->phy, phy);
> >> +
> >> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> >> +
> >> +       return PTR_ERR_OR_ZERO(phy_provider);
> >> +}
> >> +
> >> +static struct platform_driver ipq4019_usb_phy_driver = {
> >> +       .probe  = ipq4019_usb_phy_probe,
> >> +       .driver = {
> >> +               .of_match_table = ipq4019_usb_phy_of_match,
> >> +               .name  = "ipq4019-usb-phy",
> >> +       }
> >> +};
> >> +module_platform_driver(ipq4019_usb_phy_driver);
> >> +
> >> +MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
> >> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> >> +MODULE_LICENSE("GPL v2");
> >> --
> >> 2.24.1
> >>
>
