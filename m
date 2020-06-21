Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A76220293B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgFUHHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 03:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbgFUHHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 03:07:36 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ED8C061796
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:07:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d8so6077740plo.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Eyw+OIq5IAOYcbhAR5aQhcXPnXEeBoQ/j3lQnatrebE=;
        b=idYWo3ZWZHpPyNl2HVOqvf5kV7qBu2PcJ4b7paVWuutTuQWxqB0RPsIad8SU082NqM
         EquVgyXwmGaIjNa4cgrkEu8b7e9lXyZhpxCmwkllD0+Qe/gJamBhO8k2WJYDFbJ99LAM
         LFTf/BNNWIG1nMhmyRwICkfLXGpnqTtizVhtkVg+iyYIwBywanHJylgl2l2JfSUpgfwm
         JhZ+m9NZL/cRKCQGH2o/RR7QcfLEqFz6VasRMlCjj/4KT1f0ItmDSid9ZOIqkLiT+3Ee
         TQUMQEXtuOoh1erRY23qQVNB+oT+x9VZTYmXtsDgedXsgkR5/C3mGyR7PxWhi+Mg+SZT
         E13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Eyw+OIq5IAOYcbhAR5aQhcXPnXEeBoQ/j3lQnatrebE=;
        b=V/6u9bYxuq/7zT7vbCYII6jv/hGdVkhFMhgjvEmib5EbtqFgzMRLJYIpPPIiH7nT8k
         /24rOxCg+IZWwrjnHTqQPiUDvs4A6ha+rD/RyCyCgN/Bus1chKwUozM2MDbY2KottXsI
         3iG8LGeGj1GAUpTvaUylv2pdw6lvm3ZXCu5V1UktO4eG0hu3nLBhx7uAA7DmWss/tbun
         BBAZDhAredghZ4R85whJ7KBTbK2zX3IVe0eiHbNzknT1SkLsB5xkb4JEytcMg0az6rLB
         hhZjqgszQ6JeSDQfUCSNtDRL3REFlqIfAxBmtCuKy01Oage72ZXgnyBxiN9FmDcqxAq3
         duAg==
X-Gm-Message-State: AOAM531EAspBDVG22abYEGGVDqRRXjOeqm/LM3jCtUmOZ/UU5aiSCclZ
        ZI9CAfIRaZPKkhxmvzRsBA/JPA==
X-Google-Smtp-Source: ABdhPJwQL4OT/OQ7MWVH16+4hVwyT+N2MB6EUb6ctqbrBUFr4+aBZQH+sakEvbKD4IclpWgskAd/bw==
X-Received: by 2002:a17:90a:8c96:: with SMTP id b22mr12738763pjo.88.1592723255836;
        Sun, 21 Jun 2020 00:07:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h2sm10663244pfb.175.2020.06.21.00.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 00:07:34 -0700 (PDT)
Date:   Sun, 21 Jun 2020 00:04:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     heikki.krogerus@linux.intel.com, mark.rutland@arm.com,
        broonie@kernel.org, gregkh@linuxfoundation.org,
        lgirdwood@gmail.com, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org, lijun.kernel@gmail.com
Subject: Re: [PATCH v3 4/6] regulator: Add support for QCOM PMIC VBUS booster
Message-ID: <20200621070447.GC128451@builder.lan>
References: <20200617180209.5636-1-wcheng@codeaurora.org>
 <20200617180209.5636-5-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617180209.5636-5-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 17 Jun 11:02 PDT 2020, Wesley Cheng wrote:

> Some Qualcomm PMICs have the capability to source the VBUS output to
> connected peripherals.  This driver will register a regulator to the
> regulator list to enable or disable this source by an external driver.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/regulator/Kconfig                   |  10 ++
>  drivers/regulator/Makefile                  |   1 +
>  drivers/regulator/qcom_usb_vbus-regulator.c | 100 ++++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 drivers/regulator/qcom_usb_vbus-regulator.c
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 074a2ef55943..79d6b7596f0b 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -797,6 +797,16 @@ config REGULATOR_QCOM_SPMI
>  	  Qualcomm SPMI PMICs as a module. The module will be named
>  	  "qcom_spmi-regulator".
>  
> +config REGULATOR_QCOM_USB_VBUS
> +	tristate "Qualcomm USB Vbus regulator driver"
> +	depends on SPMI || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  regulator used to enable the VBUS output.
> +
> +	  Say M here if you want to include support for enabling the VBUS output
> +	  as a module. The module will be named "qcom_usb_vbus-regulator".
> +
>  config REGULATOR_RC5T583
>  	tristate "RICOH RC5T583 Power regulators"
>  	depends on MFD_RC5T583
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index c0d6b96ebd78..cbab28aa7b56 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
> +obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
>  obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
>  obj-$(CONFIG_REGULATOR_PFUZE100) += pfuze100-regulator.o
>  obj-$(CONFIG_REGULATOR_PV88060) += pv88060-regulator.o
> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> new file mode 100644
> index 000000000000..fa7a3d891808
> --- /dev/null
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Qualcomm PMIC VBUS output regulator driver
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/regmap.h>
> +
> +#define CMD_OTG				0x40
> +#define OTG_EN				BIT(0)
> +#define OTG_CFG				0x53
> +#define OTG_EN_SRC_CFG			BIT(1)
> +
> +static const struct regulator_ops qcom_usb_vbus_reg_ops = {
> +	.enable = regulator_enable_regmap,
> +	.disable = regulator_disable_regmap,
> +	.is_enabled = regulator_is_enabled_regmap,
> +};
> +
> +static struct regulator_desc qcom_usb_vbus_rdesc = {
> +	.name = "usb_vbus",
> +	.ops = &qcom_usb_vbus_reg_ops,
> +	.owner = THIS_MODULE,
> +	.type = REGULATOR_VOLTAGE,
> +};
> +
> +static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
> +	{ .compatible = "qcom,pm8150b-vbus-reg" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

Please move the of_device_id below the probe.

> +
> +static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_dev *rdev;
> +	struct regmap	*regmap;

Please drop the tab in the middle here.

> +	struct regulator_config config = { };
> +	struct regulator_init_data *init_data;
> +	int ret;
> +	u32 base;
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &base);
> +	if (ret < 0) {
> +		dev_err(dev, "no base address found\n");
> +		return ret;
> +	}
> +
> +	regmap = dev_get_regmap(dev->parent, NULL);
> +	if (regmap) {
> +		dev_err(dev, "Failed to get regmap\n");
> +		return -ENOENT;
> +	}
> +
> +	init_data = of_get_regulator_init_data(dev, dev->of_node,
> +					       &qcom_usb_vbus_rdesc);
> +	if (!init_data)
> +		return -ENOMEM;
> +
> +	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
> +	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
> +	config.dev = dev;
> +	config.init_data = init_data;
> +	config.regmap = regmap;
> +
> +	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
> +	if (IS_ERR(rdev)) {
> +		ret = PTR_ERR(rdev);
> +		dev_err(dev, "not able to register vbus reg %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, rdev);

I don't see a matching platform_get_drvdata(), so please omit this.

> +
> +	/* Disable HW logic for VBUS enable */
> +	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_usb_vbus_regulator_driver = {
> +	.driver		= {
> +		.name	= "qcom-usb-vbus-regulator",
> +		.of_match_table = qcom_usb_vbus_regulator_match,
> +	},
> +	.probe		= qcom_usb_vbus_regulator_probe,
> +};
> +module_platform_driver(qcom_usb_vbus_regulator_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm USB vbus regulator driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:qcom-usb-vbus-regulator");

There's no code that will attempt to load the driver by this alias, so
please drop it.

Regards,
Bjorn

> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
