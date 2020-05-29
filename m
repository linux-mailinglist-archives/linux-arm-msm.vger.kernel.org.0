Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A671E725F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391562AbgE2CF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390805AbgE2CFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:05:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9432FC08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:05:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x11so380868plv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=scMPyp0Cd4obDzXIcULUzWcz6qsbcJHLwkXHbhN3T8s=;
        b=IEnVHh6qMTtKRaskM5/V2ACzCO1WO6gXLfvZe+UT6aMUw4D30kUUTVM9Io0sPADR5E
         OVt1aoy61cFPjhdF/d9iWl/PSRIpnxeOraTvRdYec4ts6W1A3TBbE8E0CrnJ+GgmYL1q
         eoQ1MklVvW6xT5guC/wVGlanQvMvXiYeYOZosfzr0N41kOQkB7GqfoWf2rrcCjKm7IlL
         dJ8zQodFqP20gPtyIOwbqdRmMffECbuco9aR8Dhpq7e89FFzL+CjIr1RhiuiWDxtYYDQ
         KI4eSnrkpQTG7Ni72d2pQs+xDim8FiVl89EtvtbkLoakuHfDfihdzxf5SzjHoaa3cOpL
         SkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=scMPyp0Cd4obDzXIcULUzWcz6qsbcJHLwkXHbhN3T8s=;
        b=iw3/eScIrbhk0txpzrAbyjbEmrEapx93ydiM/3/H/XcR2X0zVeNJtj77hV56Kp0FVu
         N//ZRSxS2wjBb38Y34vKGI8XY8PveeUbipjlv6sHKPMD9JpIudL7FtiBYaTO0ZgdXGdy
         4lPY2zurtHen2nNL3wCOJdKNhVuT/R3BIU4fKII8BtJx6JH+xRX4MdnIIgXEHgHJ1juA
         ql5us+yU6k9bOqRwvm2TwV5Je0p4GITc60UGEnY3pl7y7CJb244rkTo//e/DmnF8phjH
         Ab35b73Yvi81WgjrW4ODXfVnk+foeekl1XmZgZ0P5i/AYEJ7E0Q/ymJGIczHOloH/0C/
         ukZA==
X-Gm-Message-State: AOAM5318ZahOfXK0ydPXzWy96pkcsUcMsMF2HTmIRgV2VfJTscmv0abe
        AvlajEMTPq8v1UHJ3nuJVNuODA==
X-Google-Smtp-Source: ABdhPJyu/U/zFyc1Mj2/7NmzBqox/bFC5Paz7MNXaGMPwenYVkipIgKqQyDmgko+QzT+0liCcAVNqw==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr6535954plq.173.1590717922705;
        Thu, 28 May 2020 19:05:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e21sm5312043pga.71.2020.05.28.19.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:05:22 -0700 (PDT)
Date:   Thu, 28 May 2020 19:04:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v3 4/5] regulator: qcom: Add labibb driver
Message-ID: <20200529020416.GN279327@builder.lan>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-5-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-5-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 08:46 PDT 2020, Sumit Semwal wrote:

> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Qualcomm platforms have LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost)
> regulators, labibb for short, which are used as power supply for
> LCD Mode displays.
> 
> This patch adds labibb regulator driver for pmi8998 PMIC, found on
> SDM845 platforms.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> --
> v2: sumits: reworked the driver for more common code, and addressed
>      review comments from v1
> v3: sumits: addressed review comments from v2; moved to use core
>      regulator features like enable_time, off_on_delay, and the newly
>      added poll_enabled_time. Moved the check_enabled functionality
>      to core framework via poll_enabled_time.
> 
> ---
>  drivers/regulator/Kconfig                 |  10 +
>  drivers/regulator/Makefile                |   1 +
>  drivers/regulator/qcom-labibb-regulator.c | 224 ++++++++++++++++++++++
>  3 files changed, 235 insertions(+)
>  create mode 100644 drivers/regulator/qcom-labibb-regulator.c
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index f4b72cb098ef..58704a9fd05d 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1167,5 +1167,15 @@ config REGULATOR_WM8994
>  	  This driver provides support for the voltage regulators on the
>  	  WM8994 CODEC.
>  
> +config REGULATOR_QCOM_LABIBB
> +	tristate "QCOM LAB/IBB regulator support"
> +	depends on SPMI || COMPILE_TEST
> +	help
> +	  This driver supports Qualcomm's LAB/IBB regulators present on the
> +	  Qualcomm's PMIC chip pmi8998. QCOM LAB and IBB are SPMI
> +	  based PMIC implementations. LAB can be used as positive
> +	  boost regulator and IBB can be used as a negative boost regulator
> +	  for LCD display panel.
> +
>  endif
>  
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 6610ee001d9a..5b313786c0e8 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -87,6 +87,7 @@ obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
> +obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> new file mode 100644
> index 000000000000..634d08461c6e
> --- /dev/null
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define REG_PERPH_TYPE                  0x04
> +#define QCOM_LAB_TYPE			0x24
> +#define QCOM_IBB_TYPE			0x20
> +
> +#define REG_LABIBB_STATUS1		0x08
> +#define REG_LABIBB_ENABLE_CTL		0x46
> +#define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
> +#define LABIBB_CONTROL_ENABLE		BIT(7)
> +
> +#define LAB_ENABLE_CTL_MASK		BIT(7)
> +#define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
> +
> +#define LABIBB_ENABLE_TIME		1000
> +#define LAB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 2)
> +#define IBB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 10)
> +#define LABIBB_OFF_ON_DELAY		(8200)
> +
> +struct labibb_regulator {
> +	struct regulator_desc		desc;
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	struct regulator_dev		*rdev;
> +	u16				base;
> +	u8				type;
> +};
> +
> +struct labibb_regulator_data {
> +	u16				base;
> +	const char			*name;
> +	u8				type;
> +	unsigned int			poll_enabled_time;
> +};
> +
> +static int qcom_labibb_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	unsigned int val;
> +	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(reg->regmap, reg->base + REG_LABIBB_STATUS1, &val);
> +	if (ret < 0) {
> +		dev_err(reg->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +	return !!(val & LABIBB_STATUS1_VREG_OK_BIT);
> +}
> +
> +static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> +
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret < 0)
> +		dev_err(reg->dev, "Write failed: enable %s regulator\n",
> +			reg->desc.name);

If you return a negative value the various callers of
_regulator_do_enable() and _regulator_do_disable() will print an error
message for you.

As such you don't need these wrappers and should be able to just specify
regulator_enable_regmap and regulator_disable_regmap as you enable and
disable functions in qcom_labibb_ops directly.

> +
> +	return ret;
> +}
> +
> +static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
> +{
> +	int ret = 0;
> +	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> +
> +	ret = regulator_disable_regmap(rdev);
> +	if (ret < 0)
> +		dev_err(reg->dev, "Disable failed: disable %s\n",
> +			reg->desc.name);
> +
> +	return ret;
> +}
> +
> +static struct regulator_ops qcom_labibb_ops = {
> +	.enable			= qcom_labibb_regulator_enable,
> +	.disable		= qcom_labibb_regulator_disable,
> +	.is_enabled		= qcom_labibb_regulator_is_enabled,
> +};
> +
> +static int register_labibb_regulator(struct labibb_regulator *reg,
> +				const struct labibb_regulator_data *reg_data,
> +				struct device_node *of_node)
> +{
> +	struct regulator_config cfg = {};
> +
> +	reg->base = reg_data->base;
> +	reg->type = reg_data->type;
> +	reg->desc.enable_reg = reg->base + REG_LABIBB_ENABLE_CTL;
> +	reg->desc.enable_val = LABIBB_CONTROL_ENABLE;
> +	reg->desc.of_match = reg_data->name;
> +	reg->desc.name = reg_data->name;
> +	reg->desc.owner = THIS_MODULE;
> +	reg->desc.type = REGULATOR_VOLTAGE;
> +	reg->desc.ops = &qcom_labibb_ops;
> +
> +	reg->desc.enable_time = LABIBB_ENABLE_TIME;
> +	reg->desc.poll_enabled_time = reg_data->poll_enabled_time;
> +	reg->desc.off_on_delay = LABIBB_OFF_ON_DELAY;
> +
> +	cfg.dev = reg->dev;
> +	cfg.driver_data = reg;
> +	cfg.regmap = reg->regmap;
> +	cfg.of_node = of_node;
> +
> +	reg->rdev = devm_regulator_register(reg->dev, &reg->desc, &cfg);
> +	return PTR_ERR_OR_ZERO(reg->rdev);

If you change the return type to struct regulator_dev *, you can clean
this up by just:

	return devm_regulator_register()

And then if (IS_ERR()) that in the caller.

> +}
> +
> +static const struct labibb_regulator_data pmi8998_labibb_data[] = {
> +	{0xde00, "lab", QCOM_LAB_TYPE, LAB_POLL_ENABLED_TIME},
> +	{0xdc00, "ibb", QCOM_IBB_TYPE, IBB_POLL_ENABLED_TIME},
> +	{ },
> +};
> +
> +static const struct of_device_id qcom_labibb_match[] = {
> +	{ .compatible = "qcom,pmi8998-lab-ibb", .data = &pmi8998_labibb_data},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qcom_labibb_match);
> +
> +static int qcom_labibb_regulator_probe(struct platform_device *pdev)
> +{
> +	struct labibb_regulator *labibb_reg;
> +	struct device *dev;
> +	struct device_node *child;
> +	const struct of_device_id *match;
> +	const struct labibb_regulator_data *reg_data;
> +	struct regmap *reg_regmap;
> +	unsigned int type;
> +	int ret;
> +
> +	reg_regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!reg_regmap) {
> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	dev = &pdev->dev;

Do this as you declare "dev" above.

> +
> +	match = of_match_device(qcom_labibb_match, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	for (reg_data = match->data; reg_data->name; reg_data++) {
> +		child = of_get_child_by_name(pdev->dev.of_node, reg_data->name);
> +
> +		/* TODO: This validates if the type of regulator is indeed
> +		 * what's mentioned in DT.
> +		 * I'm not sure if this is needed, but we'll keep it for now.
> +		 */
> +		ret = regmap_read(reg_regmap, reg_data->base + REG_PERPH_TYPE,
> +				  &type);
> +		if (ret < 0) {
> +			dev_err(dev,
> +				"Peripheral type read failed ret=%d\n",
> +				ret);
> +			return -EINVAL;
> +		}
> +
> +		if ((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) {

Given that you don't actually validate the information in DT, but rather
just check that the data in the pmi8998_labibb_data is accurate this is
merely a sanity check during development. So I think you should reduce
this to:

		if (WARN_ON(type != reg_data->type))
			return -EINVAL;

You can thereby remove the TODO comment above as well.


What you should do though is check that "child" is not NULL - to catch
the case where the DT doesn't specify both lab and ibb.

> +			dev_err(dev,
> +				"qcom_labibb: unknown peripheral type\n");
> +			return -EINVAL;
> +		} else if (type != reg_data->type) {
> +			dev_err(dev,
> +				"qcom_labibb: type %x doesn't match DT %x\n",
> +				type, reg_data->type);
> +			return -EINVAL;
> +		}
> +
> +		labibb_reg  = devm_kzalloc(&pdev->dev, sizeof(*labibb_reg),
> +					   GFP_KERNEL);
> +		if (!labibb_reg)
> +			return -ENOMEM;
> +
> +		labibb_reg->regmap = reg_regmap;
> +		labibb_reg->dev = dev;
> +
> +		switch (reg_data->type) {
> +		case QCOM_LAB_TYPE:
> +			labibb_reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;

All other parts of labibb_reg->desc are filled out inside
register_labibb_regulator(), pass the mask as an argument instead to
consolidate the setup.

> +			break;
> +
> +		case QCOM_IBB_TYPE:
> +			labibb_reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
> +			break;
> +		}
> +
> +		dev_info(dev, "Registering %s regulator\n", child->full_name);
> +
> +		ret = register_labibb_regulator(labibb_reg, reg_data, child);
> +		if (ret < 0) {
> +			dev_err(dev,
> +				"qcom_labibb: error registering %s : %d\n",
> +				child->full_name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_labibb_regulator_driver = {
> +	.driver		= {
> +		.name		= "qcom-lab-ibb-regulator",
> +		.of_match_table	= qcom_labibb_match,
> +	},
> +	.probe		= qcom_labibb_regulator_probe,
> +};

I think you should drop the tabs before the various = in this
definition.

Regards,
Bjorn

> +module_platform_driver(qcom_labibb_regulator_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm labibb driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.2
> 
