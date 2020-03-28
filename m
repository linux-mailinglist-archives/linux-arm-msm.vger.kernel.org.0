Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C3819667C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 14:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgC1N6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 09:58:02 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33649 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgC1N6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 09:58:02 -0400
Received: by mail-oi1-f195.google.com with SMTP id m14so11485573oic.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZhOXawR03cEpJTCuKhqqHtfzwr+QbqwzkVsUpZ+Vsm0=;
        b=aGxIQj2znEADp+1XdfO9jtn5BKsBNV7dKTe82uPfoVJ3fgRMkwS4g2nDdrn8c7N9/b
         vCqm4lJtslU2InVpgtPg/R1xUUr64MYJJHUrSbKJWpV9G8OEwK7zkIdMPstNPbG0AT9g
         2vuGy1lvICJ2rleFZI24fuF+53bXTT6bvWLOjpJK5MEXXN/5zIC7LtTptKYtXwKhYbyU
         PZrV0qqEFcFshTMKUSCYxgY43eWSUaRmiaRUErgLajYXMMGJD7dMsBGS6XL0casPmb5h
         OTuGvdut5z+6SOpRfQAe+vfwHNjHzzQzvKVLnnV+BbeSe+HsDcl5/11yPwYzgKGRd2TY
         ba4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhOXawR03cEpJTCuKhqqHtfzwr+QbqwzkVsUpZ+Vsm0=;
        b=B2gM4JY3bimTSUaG7d6gDGs6uylMlTbzY7Nl08e+Vokd8IV+l2raqMGPp59N6VfCsj
         5NQAurUkjARwhHMvZTsIgaP8KGSEaWSIL1RUx1gpjFesAaD0/F5PMi0aIED0rkCh53my
         Wt2mPs6HFhEiXqP2xpLHCZSEQ7cJHNzHvUUkfUFny1DtrZWmPbhcMlqiiaYmZT71fX/g
         w8y36Vq7JslhDfa7dZB9O9e+gJ2EctGcucslKF1w6nEgUJMnBnQpK5wYcWcrW4du8eMD
         uHihvv6nsqWqWJhPv0M/8Za00qf/tRQf3Cb7yeKLSuzx9ZBPI6Ng3szt5gLiyhhh3Gf1
         nEkw==
X-Gm-Message-State: ANhLgQ1bLQ4q0nMw03XcnSPRaOy7mkWt71PLxcJNT5iCpojCswtyuGsV
        3J9nHrfWiqhsr9BMXoG1Z1ttt0c+y//10dac2cqPZkq/
X-Google-Smtp-Source: ADFU+vsl2dOd9DWhersd/JyVqAYeErryuaiA6Bcnli1y4w7JF9OggUqHNxlioUOnDGLT8olhdKMx9H+XEtPbbbXm6bg=
X-Received: by 2002:aca:cd58:: with SMTP id d85mr2428733oig.173.1585403881004;
 Sat, 28 Mar 2020 06:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200127212319.1544222-1-robert.marko@sartura.hr> <20200327221410.GE5063@builder>
In-Reply-To: <20200327221410.GE5063@builder>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 28 Mar 2020 14:57:50 +0100
Message-ID: <CA+HBbNFvj6-O=Y_D6CAde4Kj1e8k3n=v7NcbOdB66pW50Ps_jg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Crispin <john@phrozen.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 27, 2020 at 11:14 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 27 Jan 13:23 PST 2020, Robert Marko wrote:
>
> > From: John Crispin <john@phrozen.org>
> >
> > Add a driver to setup the USB phy on Qualcom Dakota SoCs.
> > The driver sets up HS and SS phys.
> >
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
>
> You didn't include any of the PHY or devicetree maintainers on your
> patches. Please resubmit them, with recipients as reported by
> scripts/get_maintainer.pl.
Sorry, I just sent it again to all of the maintainers.
>
> Thanks,
> Bjorn
>
> > ---
> > Changes from v2 to v3:
> > * Remove magic writes as they are not needed
> > * Correct commit message
> >
> >  drivers/phy/qualcomm/Kconfig                |   7 +
> >  drivers/phy/qualcomm/Makefile               |   1 +
> >  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 152 ++++++++++++++++++++
> >  3 files changed, 160 insertions(+)
> >  create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> >
> > diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> > index e46824da29f6..964bd5d784d2 100644
> > --- a/drivers/phy/qualcomm/Kconfig
> > +++ b/drivers/phy/qualcomm/Kconfig
> > @@ -18,6 +18,13 @@ config PHY_QCOM_APQ8064_SATA
> >       depends on OF
> >       select GENERIC_PHY
> >
> > +config PHY_QCOM_IPQ4019_USB
> > +     tristate "Qualcomm IPQ4019 USB PHY module"
> > +     depends on OF && ARCH_QCOM
> > +     select GENERIC_PHY
> > +     help
> > +       Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
> > +
> >  config PHY_QCOM_IPQ806X_SATA
> >       tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
> >       depends on ARCH_QCOM
> > diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> > index 283251d6a5d9..8afe6c4f5178 100644
> > --- a/drivers/phy/qualcomm/Makefile
> > +++ b/drivers/phy/qualcomm/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_PHY_ATH79_USB)          += phy-ath79-usb.o
> >  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)  += phy-qcom-apq8064-sata.o
> > +obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)   += phy-qcom-ipq4019-usb.o
> >  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)  += phy-qcom-ipq806x-sata.o
> >  obj-$(CONFIG_PHY_QCOM_PCIE2)         += phy-qcom-pcie2.o
> >  obj-$(CONFIG_PHY_QCOM_QMP)           += phy-qcom-qmp.o
> > diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> > new file mode 100644
> > index 000000000000..7efebae6b6fd
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> > @@ -0,0 +1,152 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2018 John Crispin <john@phrozen.org>
> > + *
> > + * Based on code from
> > + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
> > + *
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +struct ipq4019_usb_phy {
> > +     struct device           *dev;
> > +     struct phy              *phy;
> > +     void __iomem            *base;
> > +     struct reset_control    *por_rst;
> > +     struct reset_control    *srif_rst;
> > +};
> > +
> > +static int ipq4019_ss_phy_power_off(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     reset_control_assert(phy->por_rst);
> > +     msleep(10);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     ipq4019_ss_phy_power_off(_phy);
> > +
> > +     reset_control_deassert(phy->por_rst);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> > +     .power_on       = ipq4019_ss_phy_power_on,
> > +     .power_off      = ipq4019_ss_phy_power_off,
> > +};
> > +
> > +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     reset_control_assert(phy->por_rst);
> > +     msleep(10);
> > +
> > +     reset_control_assert(phy->srif_rst);
> > +     msleep(10);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     ipq4019_hs_phy_power_off(_phy);
> > +
> > +     reset_control_deassert(phy->srif_rst);
> > +     msleep(10);
> > +
> > +     reset_control_deassert(phy->por_rst);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> > +     .power_on       = ipq4019_hs_phy_power_on,
> > +     .power_off      = ipq4019_hs_phy_power_off,
> > +};
> > +
> > +static const struct of_device_id ipq4019_usb_phy_of_match[] = {
> > +     { .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
> > +     { .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
> > +
> > +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct resource *res;
> > +     struct phy_provider *phy_provider;
> > +     struct ipq4019_usb_phy *phy;
> > +     const struct of_device_id *match;
> > +
> > +     match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> > +     if (!match)
> > +             return -ENODEV;
> > +
> > +     phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> > +     if (!phy)
> > +             return -ENOMEM;
> > +
> > +     phy->dev = &pdev->dev;
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     phy->base = devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(phy->base)) {
> > +             dev_err(dev, "failed to remap register memory\n");
> > +             return PTR_ERR(phy->base);
> > +     }
> > +
> > +     phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
> > +     if (IS_ERR(phy->por_rst)) {
> > +             if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
> > +                     dev_err(dev, "POR reset is missing\n");
> > +             return PTR_ERR(phy->por_rst);
> > +     }
> > +
> > +     phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
> > +     if (IS_ERR(phy->srif_rst))
> > +             return PTR_ERR(phy->srif_rst);
> > +
> > +     phy->phy = devm_phy_create(dev, NULL, match->data);
> > +     if (IS_ERR(phy->phy)) {
> > +             dev_err(dev, "failed to create PHY\n");
> > +             return PTR_ERR(phy->phy);
> > +     }
> > +     phy_set_drvdata(phy->phy, phy);
> > +
> > +     phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > +
> > +     return PTR_ERR_OR_ZERO(phy_provider);
> > +}
> > +
> > +static struct platform_driver ipq4019_usb_phy_driver = {
> > +     .probe  = ipq4019_usb_phy_probe,
> > +     .driver = {
> > +             .of_match_table = ipq4019_usb_phy_of_match,
> > +             .name  = "ipq4019-usb-phy",
> > +     }
> > +};
> > +module_platform_driver(ipq4019_usb_phy_driver);
> > +
> > +MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
> > +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.24.1
> >
