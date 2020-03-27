Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E70B1960E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 23:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgC0WOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 18:14:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40026 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC0WOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 18:14:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id h11so3956929plk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eCB8fBXv2T9w5TAaLDS4wtymhwsXB6r6GllX3XivkcU=;
        b=KtWJvHoXqJ9lomiO1kLG4w2I70V5w8yxqXDfutFp7f5bEYz5d/k2gxPadDRN2778QT
         tH2sJJOECKiE6MDm19KTAul/D/9jRKCyeoXSReP/1NePAOUIgrxYp3ZcPiBhAv2baOLD
         cf0pwJ5wAMkT6RB/jj77mbvruneNWE+4XMKIBczB5GOiFQmzzW2/zlQ5J/vVm1yWQHrr
         8ojR6eP6g96LZaXR9QNvITxHQJj9WP+gaWpttQD1pX49kAhsRy8MZ69wKxBbrkRu7F9a
         SQajzLZ7hdqkelUpNYrK7jHJjC+u6t3LqO/dutdcAzkNwg1sM82N64TjTNf6AQsjqIl8
         z+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eCB8fBXv2T9w5TAaLDS4wtymhwsXB6r6GllX3XivkcU=;
        b=apijV4DnkDEeZmD9to6Rh7imlL6KgHkK/e8eWK6nraZtNlB35xbz9f8bjPBIlm/5k2
         4odioB7pIeHL5sRrEgVW+RMq+3nCndTrasYzAsVxsRtXW8t7Pn6aDtO5FVVA/zP13VZI
         EpzvNyVLbWQhtc1kw+CiYWYk4zqCvarCXUMxN54BUwHLrgaUgooVuctke2eWicW75GMh
         Y6A9N9IqpCG9F7u/YPOJFO9RUjxXIVdKGNSh5BVUTjLIRprVY3FwW0InQgW8pY6/VAuj
         BTdKOe/mD14hBHtC5OT1UtPffLCm1w6oacRjYXDo35fxcTyF97CdvaMrq6IWf7lR1tZv
         01Lg==
X-Gm-Message-State: ANhLgQ0KfhCpNlIsXVn2qn2T6Nb2jLnxFg+ICmJ1PeKvFFXTjbmzFJ04
        BXjcub93nC9dPmAmt3BeoAPVKw==
X-Google-Smtp-Source: ADFU+vs7h/2b5zaHbbw5q6LuwVJLwhmnlkJUskgeNeViU6l92+EaK8Bc4Bky5+sXcj4dTjUSseCaiw==
X-Received: by 2002:a17:90a:7187:: with SMTP id i7mr1682559pjk.6.1585347254562;
        Fri, 27 Mar 2020 15:14:14 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l1sm4527897pje.9.2020.03.27.15.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:14:13 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:14:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v3 1/3] phy:  add driver for Qualcomm IPQ40xx USB PHY
Message-ID: <20200327221410.GE5063@builder>
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127212319.1544222-1-robert.marko@sartura.hr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 27 Jan 13:23 PST 2020, Robert Marko wrote:

> From: John Crispin <john@phrozen.org>
> 
> Add a driver to setup the USB phy on Qualcom Dakota SoCs.
> The driver sets up HS and SS phys.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>

You didn't include any of the PHY or devicetree maintainers on your
patches. Please resubmit them, with recipients as reported by
scripts/get_maintainer.pl.

Thanks,
Bjorn

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
>  	depends on OF
>  	select GENERIC_PHY
>  
> +config PHY_QCOM_IPQ4019_USB
> +	tristate "Qualcomm IPQ4019 USB PHY module"
> +	depends on OF && ARCH_QCOM
> +	select GENERIC_PHY
> +	help
> +	  Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
> +
>  config PHY_QCOM_IPQ806X_SATA
>  	tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
>  	depends on ARCH_QCOM
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 283251d6a5d9..8afe6c4f5178 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_PHY_ATH79_USB)		+= phy-ath79-usb.o
>  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
> +obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
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
> +	struct device		*dev;
> +	struct phy		*phy;
> +	void __iomem		*base;
> +	struct reset_control	*por_rst;
> +	struct reset_control	*srif_rst;
> +};
> +
> +static int ipq4019_ss_phy_power_off(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	reset_control_assert(phy->por_rst);
> +	msleep(10);
> +
> +	return 0;
> +}
> +
> +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	ipq4019_ss_phy_power_off(_phy);
> +
> +	reset_control_deassert(phy->por_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> +	.power_on	= ipq4019_ss_phy_power_on,
> +	.power_off	= ipq4019_ss_phy_power_off,
> +};
> +
> +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	reset_control_assert(phy->por_rst);
> +	msleep(10);
> +
> +	reset_control_assert(phy->srif_rst);
> +	msleep(10);
> +
> +	return 0;
> +}
> +
> +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	ipq4019_hs_phy_power_off(_phy);
> +
> +	reset_control_deassert(phy->srif_rst);
> +	msleep(10);
> +
> +	reset_control_deassert(phy->por_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> +	.power_on	= ipq4019_hs_phy_power_on,
> +	.power_off	= ipq4019_hs_phy_power_off,
> +};
> +
> +static const struct of_device_id ipq4019_usb_phy_of_match[] = {
> +	{ .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
> +	{ .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
> +
> +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct phy_provider *phy_provider;
> +	struct ipq4019_usb_phy *phy;
> +	const struct of_device_id *match;
> +
> +	match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->dev = &pdev->dev;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	phy->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(phy->base)) {
> +		dev_err(dev, "failed to remap register memory\n");
> +		return PTR_ERR(phy->base);
> +	}
> +
> +	phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
> +	if (IS_ERR(phy->por_rst)) {
> +		if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
> +			dev_err(dev, "POR reset is missing\n");
> +		return PTR_ERR(phy->por_rst);
> +	}
> +
> +	phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
> +	if (IS_ERR(phy->srif_rst))
> +		return PTR_ERR(phy->srif_rst);
> +
> +	phy->phy = devm_phy_create(dev, NULL, match->data);
> +	if (IS_ERR(phy->phy)) {
> +		dev_err(dev, "failed to create PHY\n");
> +		return PTR_ERR(phy->phy);
> +	}
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver ipq4019_usb_phy_driver = {
> +	.probe	= ipq4019_usb_phy_probe,
> +	.driver = {
> +		.of_match_table	= ipq4019_usb_phy_of_match,
> +		.name  = "ipq4019-usb-phy",
> +	}
> +};
> +module_platform_driver(ipq4019_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.24.1
> 
