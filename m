Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8D344894
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 19:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393500AbfFMRI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 13:08:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44232 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404459AbfFMRDu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 13:03:50 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so12205202pfe.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XRza9/nX/AVz8g7hPSG2DNaFuABmwAREVdt+czc0FpA=;
        b=I3GYar+6Adau5gO+T/ugawQHY3A+iFNvOIDQmJh5sNaYZ01miXS2kM8S+cBxlLpuVv
         sq+aotHhov+dwnrfTD8UHyZIwlZ8o4eTL3y71xvzNw1G9XCo3ii9cS11wpROIE2V77nk
         uekK7z91f1KVCjfUyW/JNe/xJXFfsMTHiuoNtWhtYvK1nOyYrUZ+Ub/QWCPlMluLlbb4
         Hx+EBVQUm4HEubOGo8Ccn9kBqP6hYqhYoF8ibKo/2lUQSnE8X9LkYAWSQo95wd0xW3Vj
         mxU80rR8jfIBQbAaoeHAyPRiD8B0R+zFk6NAPqCiKmePEC2Yg9HQaIz6QK6H7G1jMb6d
         j9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XRza9/nX/AVz8g7hPSG2DNaFuABmwAREVdt+czc0FpA=;
        b=Q0pq9iINGDqbs793cWK02HdDQzqIXNhpCtMfRODP0U5VwEfKEoFd5N9UvvsFRkObhl
         rcjLYs6hf2eHalDfd0MDXnqeX4JZrFkn7jGDs+c3lXnPKCwoJGtBZDKOf0+tKZmqkUXW
         wOvB33v06xvbCU50mBdTb4M7mF+mO6SbwLMp5PndSiHFPH0S2oEPR+g9QIfBOPpUW78H
         4HIOg+3xoSjTEYaeQDu9dcONQPJi6i2mO9x861UpV8hueYpyaxBDll8TkAkrGo1uPrAR
         k7xoM7GQUmWJPSXUZrPkRoEJSalbRkpZiQb/lOa9/Vh5fe5Tbzzk6UmiBvw5bU8+uAmf
         Q4Gg==
X-Gm-Message-State: APjAAAWiWzdmHLFxOGv25sRPS31Glwi8l+2IIQrZV+60P8qqtb/cDN+c
        kmW8Pbu4lJu+jW7bPsm4IquFNg==
X-Google-Smtp-Source: APXvYqybIx0r2TNBzaJsFnmZth8kZqiNFhsWXLaSG73n6UwWeUW4LS+t6dbEjRtq9WRcdiUnNf5tDw==
X-Received: by 2002:a17:90a:9291:: with SMTP id n17mr6502233pjo.66.1560445428843;
        Thu, 13 Jun 2019 10:03:48 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l13sm375198pjq.20.2019.06.13.10.03.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 10:03:48 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:04:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nisha Kumari <nishakumari@codeaurora.org>
Cc:     broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
Message-ID: <20190613170434.GH22737@tuxbook-pro>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 04:00 PDT 2019, Nisha Kumari wrote:

> This patch adds labibb regulator driver for supporting LCD mode display
> on SDM845 platform.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> ---
>  drivers/regulator/Kconfig                 |  10 +
>  drivers/regulator/Makefile                |   1 +
>  drivers/regulator/qcom-labibb-regulator.c | 438 ++++++++++++++++++++++++++++++
>  3 files changed, 449 insertions(+)
>  create mode 100644 drivers/regulator/qcom-labibb-regulator.c
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index b7f249e..ab9d272 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1057,5 +1057,15 @@ config REGULATOR_WM8994
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
> index 1169f8a..f123f3e 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
> +obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> new file mode 100644
> index 0000000..0c68883
> --- /dev/null
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, The Linux Foundation. All rights reserved.
> +
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define REG_PERPH_TYPE                  0x04
> +#define QCOM_LAB_TYPE			0x24
> +#define QCOM_IBB_TYPE			0x20
> +
> +#define REG_LAB_STATUS1			0x08
> +#define REG_LAB_ENABLE_CTL		0x46
> +#define LAB_STATUS1_VREG_OK_BIT		BIT(7)
> +#define LAB_ENABLE_CTL_EN		BIT(7)
> +
> +#define REG_IBB_STATUS1			0x08
> +#define REG_IBB_ENABLE_CTL		0x46
> +#define IBB_STATUS1_VREG_OK_BIT		BIT(7)
> +#define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
> +#define IBB_CONTROL_ENABLE		BIT(7)
> +
> +#define POWER_DELAY			8000
> +
> +struct lab_regulator {
> +	struct regulator_dev		*rdev;
> +	int				vreg_enabled;
> +};
> +
> +struct ibb_regulator {
> +	struct regulator_dev		*rdev;
> +	int				vreg_enabled;
> +};
> +
> +struct qcom_labibb {
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	u16				lab_base;
> +	u16				ibb_base;
> +	struct lab_regulator		lab_vreg;
> +	struct ibb_regulator		ibb_vreg;
> +};
> +
> +static int qcom_labibb_read(struct qcom_labibb *labibb, u16 address,

These three wrappers are essentially just aliases of the regmap
functions, with an error print. In all call sights you check for errors
and print another error. So they don't reduce the amount of code at the
callers and they simply means that any error result in two prints in the
log.

Please drop these three wrappers and just call the regmap functions
directly.

> +			    u8 *val, int count)
> +{
> +	int ret;
> +
> +	ret = regmap_bulk_read(labibb->regmap, address, val, count);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "spmi read failed ret=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int qcom_labibb_write(struct qcom_labibb *labibb, u16 address,
> +			     u8 *val, int count)
> +{
> +	int ret;
> +
> +	ret = regmap_bulk_write(labibb->regmap, address, val, count);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int qcom_labibb_masked_write(struct qcom_labibb *labibb, u16 address,
> +				    u8 mask, u8 val)
> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(labibb->regmap, address, mask, val);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int qcom_enable_ibb(struct qcom_labibb *labibb, bool enable)
> +{
> +	int ret;
> +	u8 val = enable ? IBB_CONTROL_ENABLE : 0;
> +
> +	ret = qcom_labibb_masked_write(labibb,
> +				       labibb->ibb_base + REG_IBB_ENABLE_CTL,
> +				       IBB_ENABLE_CTL_MASK, val);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "Unable to configure IBB_ENABLE_CTL ret=%d\n",
> +			ret);
> +
> +	return ret;
> +}
> +
> +static int qcom_lab_regulator_enable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	val = LAB_ENABLE_CTL_EN;
> +	ret = qcom_labibb_write(labibb,
> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
> +				&val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Wait for a small period before reading REG_LAB_STATUS1 */
> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);

Wait between 8 and 8.1ms? How about giving the scheduler some more slack
and making that +100 larger?

> +
> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
> +			       REG_LAB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!(val & LAB_STATUS1_VREG_OK_BIT)) {
> +		dev_err(labibb->dev, "Can't enable LAB\n");
> +		return -EINVAL;
> +	}
> +
> +	labibb->lab_vreg.vreg_enabled = 1;

You don't use vreg_enabled in this patch, how about adding it in the
next patch where it's actually used instead.

> +
> +	return 0;
> +}
> +
> +static int qcom_lab_regulator_disable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val = 0;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	ret = qcom_labibb_write(labibb,
> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
> +				&val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +	/* after this delay, lab should get disabled */
> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
> +
> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
> +			       REG_LAB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (val & LAB_STATUS1_VREG_OK_BIT) {
> +		dev_err(labibb->dev, "Can't disable LAB\n");
> +		return -EINVAL;
> +	}
> +
> +	labibb->lab_vreg.vreg_enabled = 0;
> +

disable is pretty much identical to enable, so might be worth moving its
content to a common helper function and calling that from the two.

> +	return 0;
> +}
> +
> +static int qcom_lab_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
> +			       REG_LAB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	return val & LAB_STATUS1_VREG_OK_BIT;
> +}
> +
> +static struct regulator_ops qcom_lab_ops = {
> +	.enable			= qcom_lab_regulator_enable,
> +	.disable		= qcom_lab_regulator_disable,
> +	.is_enabled		= qcom_lab_regulator_is_enabled,
> +};
> +
> +static const struct regulator_desc lab_desc = {
> +	.name = "lab_reg",
> +	.ops = &qcom_lab_ops,
> +	.type = REGULATOR_VOLTAGE,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int qcom_ibb_regulator_enable(struct regulator_dev *rdev)
> +{
> +	int ret, retries = 10;
> +	u8 val;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	ret = qcom_enable_ibb(labibb, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Unable to set IBB mode ret= %d\n", ret);
> +		return ret;
> +	}
> +
> +	while (retries--) {

Is there a reason why would don't want this wait for the "lab"? That
should allow you to use the same functions for both regulators.

> +		/* Wait for a small period before reading IBB_STATUS1 */
> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
> +
> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
> +				       REG_IBB_STATUS1, &val, 1);
> +		if (ret < 0) {
> +			dev_err(labibb->dev,
> +				"Read register failed ret = %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (val & IBB_STATUS1_VREG_OK_BIT) {
> +			labibb->ibb_vreg.vreg_enabled = 1;
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(labibb->dev, "Can't enable IBB\n");
> +	return -EINVAL;
> +}
> +
> +static int qcom_ibb_regulator_disable(struct regulator_dev *rdev)
> +{
> +	int ret, retries = 2;
> +	u8 val;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	ret = qcom_enable_ibb(labibb, 0);
> +	if (ret < 0) {
> +		dev_err(labibb->dev,
> +			"Unable to set IBB_MODULE_EN ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* poll IBB_STATUS to make sure ibb had been disabled */
> +	while (retries--) {
> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
> +				       REG_IBB_STATUS1, &val, 1);
> +		if (ret < 0) {
> +			dev_err(labibb->dev, "Read register failed ret = %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		if (!(val & IBB_STATUS1_VREG_OK_BIT)) {
> +			labibb->ibb_vreg.vreg_enabled = 0;
> +			return 0;
> +		}
> +	}
> +	dev_err(labibb->dev, "Can't disable IBB\n");
> +	return -EINVAL;
> +}
> +
> +static int qcom_ibb_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val;
> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
> +
> +	ret = qcom_labibb_read(labibb, labibb->ibb_base +
> +			REG_IBB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	return(val & IBB_STATUS1_VREG_OK_BIT);
> +}
> +
> +static struct regulator_ops qcom_ibb_ops = {
> +	.enable			= qcom_ibb_regulator_enable,
> +	.disable		= qcom_ibb_regulator_disable,
> +	.is_enabled		= qcom_ibb_regulator_is_enabled,
> +};
> +
> +static const struct regulator_desc ibb_desc = {
> +	.name = "ibb_reg",
> +	.ops = &qcom_ibb_ops,
> +	.type = REGULATOR_VOLTAGE,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int register_lab_regulator(struct qcom_labibb *labibb,
> +				  struct device_node *of_node)
> +{
> +	int ret = 0;
> +	struct regulator_init_data *init_data;
> +	struct regulator_config cfg = {};
> +
> +	cfg.dev = labibb->dev;
> +	cfg.driver_data = labibb;
> +	cfg.of_node = of_node;
> +	init_data =
> +		of_get_regulator_init_data(labibb->dev,
> +					   of_node, &lab_desc);

Rather than calling of_get_regulator_init_data() directly, you should
use desc->of_match to match the children of the regulator driver.

> +	if (!init_data) {
> +		dev_err(labibb->dev,
> +			"unable to get init data for LAB\n");
> +		return -ENOMEM;
> +	}
> +	cfg.init_data = init_data;
> +
> +	labibb->lab_vreg.rdev = devm_regulator_register(labibb->dev, &lab_desc,
> +							&cfg);
> +	if (IS_ERR(labibb->lab_vreg.rdev)) {
> +		ret = PTR_ERR(labibb->lab_vreg.rdev);
> +		dev_err(labibb->dev,
> +			"unable to register LAB regulator");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int register_ibb_regulator(struct qcom_labibb *labibb,
> +				  struct device_node *of_node)
> +{
> +	int ret;
> +	struct regulator_init_data *init_data;
> +	struct regulator_config cfg = {};
> +
> +	cfg.dev = labibb->dev;
> +	cfg.driver_data = labibb;
> +	cfg.of_node = of_node;
> +	init_data =
> +		of_get_regulator_init_data(labibb->dev,
> +					   of_node, &ibb_desc);
> +	if (!init_data) {
> +		dev_err(labibb->dev,
> +			"unable to get init data for IBB\n");
> +		return -ENOMEM;
> +	}
> +	cfg.init_data = init_data;
> +
> +	labibb->ibb_vreg.rdev = devm_regulator_register(labibb->dev, &ibb_desc,
> +							&cfg);
> +	if (IS_ERR(labibb->ibb_vreg.rdev)) {
> +		ret = PTR_ERR(labibb->ibb_vreg.rdev);
> +		dev_err(labibb->dev,
> +			"unable to register IBB regulator");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int qcom_labibb_regulator_probe(struct platform_device *pdev)
> +{
> +	struct qcom_labibb *labibb;
> +	struct device_node *child;
> +	unsigned int base;
> +	u8 type;
> +	int ret;
> +
> +	labibb = devm_kzalloc(&pdev->dev, sizeof(*labibb), GFP_KERNEL);
> +	if (!labibb)
> +		return -ENOMEM;
> +
> +	labibb->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!labibb->regmap) {
> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	labibb->dev = &pdev->dev;
> +
> +	for_each_available_child_of_node(pdev->dev.of_node, child) {
> +		ret = of_property_read_u32(child, "reg", &base);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"Couldn't find reg in node = %s ret = %d\n",
> +				child->full_name, ret);
> +			return ret;
> +		}
> +
> +		ret = qcom_labibb_read(labibb, base + REG_PERPH_TYPE,
> +				       &type, 1);
> +		if (ret < 0) {
> +			dev_err(labibb->dev,
> +				"Peripheral type read failed ret=%d\n",
> +				ret);
> +		}
> +
> +		switch (type) {
> +		case QCOM_LAB_TYPE:
> +			labibb->lab_base = base;
> +			ret = register_lab_regulator(labibb, child);
> +			if (ret < 0) {
> +				dev_err(labibb->dev,
> +					"Failed LAB regulator registration");
> +				return ret;
> +			}
> +			break;
> +
> +		case QCOM_IBB_TYPE:
> +			labibb->ibb_base = base;
> +			ret = register_ibb_regulator(labibb, child);
> +			if (ret < 0) {
> +				dev_err(labibb->dev,
> +					"Failed IBB regulator registration");
> +				return ret;
> +			}
> +			break;
> +
> +		default:
> +			dev_err(labibb->dev,
> +				"qcom_labibb: unknown peripheral type\n");
> +			return -EINVAL;
> +		}
> +	}

Given how the registers are laid out, the accessors looks like and this
loop I think that rather than having a "virtual" labibb device you
should instantiate two devices directly.

> +
> +	dev_set_drvdata(&pdev->dev, labibb);
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_labibb_match_table[] = {
> +	{ .compatible = "qcom,lab-ibb-regulator", },

So please make this qcom,pmi8998-lab and qcom,pmi8998-ibb.

Regards,
Bjorn

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qcom_labibb_match_table);
> +
> +static struct platform_driver qcom_labibb_regulator_driver = {
> +	.driver		= {
> +		.name		= "qcom-lab-ibb-regulator",
> +		.of_match_table	= qcom_labibb_match_table,
> +	},
> +	.probe		= qcom_labibb_regulator_probe,
> +};
> +module_platform_driver(qcom_labibb_regulator_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm labibb driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
