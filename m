Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4173B17D5A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2020 19:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCHSzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Mar 2020 14:55:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33728 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgCHSzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Mar 2020 14:55:21 -0400
Received: by mail-ot1-f67.google.com with SMTP id g15so1356118otr.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2020 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n1SqGZmfk09nP1tlLdZhdyJNd2+esYSN6zu7hcM4+ks=;
        b=tuIX4qnOBeboVwrBRaAGWtTY3ynGUJ/PYsBi5H3gUbC6Qlai8/VVgrCoAQbfKGhdwL
         VTKZV6uBn3L/qwu/l+JquVwwFQSUaZBo6NAiAqD3vYuy3j2VK0HtEkmUKtx0xYDgxw/m
         bC/Ik4SJzbCB3bMb8//fe5cLq/Q1RcCGsVvZWxcss31UeOPtCv5mGAQgA7ufIZeI9+xi
         6S/TPu3RJHKSouPnoEZiyH+URDOaP5+5Ot4M9X0Hvi722sIZiwaK5/R6/AnpyWNx+HHN
         WNYnzm3eBG1NXAU8Y7KeI8SNXf9izyVdlfuFpaiKgKt5evgHz+qdDsQfhko1e3RLR2p6
         Tg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n1SqGZmfk09nP1tlLdZhdyJNd2+esYSN6zu7hcM4+ks=;
        b=uRIuBKWNwEgtk/s41gpdcf64p42EEkNFnBS5DKipKvw8LFVnBvNeK2/7JdClbobdGz
         1BrApoUn3kppnARwxiU3KfAAayP4lojbgFqMV8h7zTXgMET1VW8t4FmLFQxqBAmIS0lu
         otqlykflYiNL+lmd+wCJ85F7eHJYIZnqtmkP9SvleevKrBuZ23YYyUUtP9Zk2Tak5U0s
         PHU8zHsvZsRxy8aP6HjL/dCMBwTq89jQQMTfIWgNygiNA7Ro96lX5jk9LtX6ktHVblBX
         ha8fhhZVBFLKZVnqoqssav3tpQOTM914L3vY5bRtXRojXCa/2qsMdEkiKQPkzp07TXPO
         xi+w==
X-Gm-Message-State: ANhLgQ1JazRIi13aTD4Ei79AESpq6VnST7Asm0BF/A/PYruo6khbvwKR
        3yVEQGSG2K4wQIASxcy3FheHcFYeoilHo63YrNYSSA==
X-Google-Smtp-Source: ADFU+vuPtYvp45+CBkRvMtWCCIaqx5t6hQrkEnekfL5yLNyElDOafI9Re8HHPVu1UC5+HpNN9IjQjBtN9j9mTlgHgbA=
X-Received: by 2002:a9d:4782:: with SMTP id b2mr10594493otf.66.1583693720285;
 Sun, 08 Mar 2020 11:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
In-Reply-To: <20200127212319.1544222-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sun, 8 Mar 2020 19:55:09 +0100
Message-ID: <CA+HBbNGs+k6UgFPQB0q+i98By0YUGHx2YoSYntRAW5-RjAsu8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     John Crispin <john@phrozen.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 27, 2020 at 10:23 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Add a driver to setup the USB phy on Qualcom Dakota SoCs.
> The driver sets up HS and SS phys.
>
Hi,
any chance of merging this?

Thanks
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes from v2 to v3:
> * Remove magic writes as they are not needed
> * Correct commit message
>
>  drivers/phy/qualcomm/Kconfig                |   7 +
>  drivers/phy/qualcomm/Makefile               |   1 +
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 152 ++++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
>
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index e46824da29f6..964bd5d784d2 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -18,6 +18,13 @@ config PHY_QCOM_APQ8064_SATA
>         depends on OF
>         select GENERIC_PHY
>
> +config PHY_QCOM_IPQ4019_USB
> +       tristate "Qualcomm IPQ4019 USB PHY module"
> +       depends on OF && ARCH_QCOM
> +       select GENERIC_PHY
> +       help
> +         Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
> +
>  config PHY_QCOM_IPQ806X_SATA
>         tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
>         depends on ARCH_QCOM
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 283251d6a5d9..8afe6c4f5178 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_PHY_ATH79_USB)            += phy-ath79-usb.o
>  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)    += phy-qcom-apq8064-sata.o
> +obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)     += phy-qcom-ipq4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    += phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)           += phy-qcom-pcie2.o
>  obj-$(CONFIG_PHY_QCOM_QMP)             += phy-qcom-qmp.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> new file mode 100644
> index 000000000000..7efebae6b6fd
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2018 John Crispin <john@phrozen.org>
> + *
> + * Based on code from
> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
> + *
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +struct ipq4019_usb_phy {
> +       struct device           *dev;
> +       struct phy              *phy;
> +       void __iomem            *base;
> +       struct reset_control    *por_rst;
> +       struct reset_control    *srif_rst;
> +};
> +
> +static int ipq4019_ss_phy_power_off(struct phy *_phy)
> +{
> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +       reset_control_assert(phy->por_rst);
> +       msleep(10);
> +
> +       return 0;
> +}
> +
> +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> +{
> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +       ipq4019_ss_phy_power_off(_phy);
> +
> +       reset_control_deassert(phy->por_rst);
> +
> +       return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> +       .power_on       = ipq4019_ss_phy_power_on,
> +       .power_off      = ipq4019_ss_phy_power_off,
> +};
> +
> +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> +{
> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +       reset_control_assert(phy->por_rst);
> +       msleep(10);
> +
> +       reset_control_assert(phy->srif_rst);
> +       msleep(10);
> +
> +       return 0;
> +}
> +
> +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> +{
> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +       ipq4019_hs_phy_power_off(_phy);
> +
> +       reset_control_deassert(phy->srif_rst);
> +       msleep(10);
> +
> +       reset_control_deassert(phy->por_rst);
> +
> +       return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> +       .power_on       = ipq4019_hs_phy_power_on,
> +       .power_off      = ipq4019_hs_phy_power_off,
> +};
> +
> +static const struct of_device_id ipq4019_usb_phy_of_match[] = {
> +       { .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
> +       { .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
> +
> +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       struct phy_provider *phy_provider;
> +       struct ipq4019_usb_phy *phy;
> +       const struct of_device_id *match;
> +
> +       match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> +       if (!match)
> +               return -ENODEV;
> +
> +       phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +       if (!phy)
> +               return -ENOMEM;
> +
> +       phy->dev = &pdev->dev;
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       phy->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(phy->base)) {
> +               dev_err(dev, "failed to remap register memory\n");
> +               return PTR_ERR(phy->base);
> +       }
> +
> +       phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
> +       if (IS_ERR(phy->por_rst)) {
> +               if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
> +                       dev_err(dev, "POR reset is missing\n");
> +               return PTR_ERR(phy->por_rst);
> +       }
> +
> +       phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
> +       if (IS_ERR(phy->srif_rst))
> +               return PTR_ERR(phy->srif_rst);
> +
> +       phy->phy = devm_phy_create(dev, NULL, match->data);
> +       if (IS_ERR(phy->phy)) {
> +               dev_err(dev, "failed to create PHY\n");
> +               return PTR_ERR(phy->phy);
> +       }
> +       phy_set_drvdata(phy->phy, phy);
> +
> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +       return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver ipq4019_usb_phy_driver = {
> +       .probe  = ipq4019_usb_phy_probe,
> +       .driver = {
> +               .of_match_table = ipq4019_usb_phy_of_match,
> +               .name  = "ipq4019-usb-phy",
> +       }
> +};
> +module_platform_driver(ipq4019_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.24.1
>
