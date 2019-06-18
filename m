Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66749963
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 08:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbfFRGwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 02:52:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53188 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbfFRGwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 02:52:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A200C60CEC; Tue, 18 Jun 2019 06:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560838414;
        bh=fCWGKREBsv3hGvD3rVywtApaIKwTtb7YPB/ogowlWmw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UVmcEu+qfigO+6b07wwxaiCPUFLkQNMk1MtJUPVvNr3nGypXaE1ahY+PHPU1u345a
         Esglej/ReVXjFIaAJWKvWAb9/eUGHzRVfEnQtpwyGsdxmw0MrIFFK68rRfuB8c4HTe
         O79ZMiTAQv1mtTLvgIZRSODLuw6hKCQ1Tm3CWCDA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.187] (unknown [223.227.13.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1E1260E59;
        Tue, 18 Jun 2019 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560838412;
        bh=fCWGKREBsv3hGvD3rVywtApaIKwTtb7YPB/ogowlWmw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FjXIxWRLQWWfAITsYjdQZjq28kJUH/Y5DCj3F587PlIP7UggBTr1H32bldeb8i01I
         d1HT+xNIqLGdag/X1IdRLf9iI+X1l5TxWn9s2UL+ONIsr0UYQE2ezHTNGkh7CF3TO+
         gnJ54kdL0GnzqEk25Jc6eZNe+WeUzFLCxcIZj1RQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1E1260E59
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
 <20190613170434.GH22737@tuxbook-pro>
From:   Nisha Kumari <nishakumari@codeaurora.org>
Message-ID: <d8d4b039-02d4-f081-5562-2711805519f9@codeaurora.org>
Date:   Tue, 18 Jun 2019 11:43:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613170434.GH22737@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/13/2019 10:34 PM, Bjorn Andersson wrote:
> On Wed 12 Jun 04:00 PDT 2019, Nisha Kumari wrote:
>
>> This patch adds labibb regulator driver for supporting LCD mode display
>> on SDM845 platform.
>>
>> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
>> ---
>>   drivers/regulator/Kconfig                 |  10 +
>>   drivers/regulator/Makefile                |   1 +
>>   drivers/regulator/qcom-labibb-regulator.c | 438 ++++++++++++++++++++++++++++++
>>   3 files changed, 449 insertions(+)
>>   create mode 100644 drivers/regulator/qcom-labibb-regulator.c
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index b7f249e..ab9d272 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1057,5 +1057,15 @@ config REGULATOR_WM8994
>>   	  This driver provides support for the voltage regulators on the
>>   	  WM8994 CODEC.
>>   
>> +config REGULATOR_QCOM_LABIBB
>> +	tristate "QCOM LAB/IBB regulator support"
>> +	depends on SPMI || COMPILE_TEST
>> +	help
>> +	  This driver supports Qualcomm's LAB/IBB regulators present on the
>> +	  Qualcomm's PMIC chip pmi8998. QCOM LAB and IBB are SPMI
>> +	  based PMIC implementations. LAB can be used as positive
>> +	  boost regulator and IBB can be used as a negative boost regulator
>> +	  for LCD display panel.
>> +
>>   endif
>>   
>> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
>> index 1169f8a..f123f3e 100644
>> --- a/drivers/regulator/Makefile
>> +++ b/drivers/regulator/Makefile
>> @@ -81,6 +81,7 @@ obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
>> +obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
>>   obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>>   obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>>   obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
>> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
>> new file mode 100644
>> index 0000000..0c68883
>> --- /dev/null
>> +++ b/drivers/regulator/qcom-labibb-regulator.c
>> @@ -0,0 +1,438 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> +
>> +#include <linux/module.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/of_regulator.h>
>> +
>> +#define REG_PERPH_TYPE                  0x04
>> +#define QCOM_LAB_TYPE			0x24
>> +#define QCOM_IBB_TYPE			0x20
>> +
>> +#define REG_LAB_STATUS1			0x08
>> +#define REG_LAB_ENABLE_CTL		0x46
>> +#define LAB_STATUS1_VREG_OK_BIT		BIT(7)
>> +#define LAB_ENABLE_CTL_EN		BIT(7)
>> +
>> +#define REG_IBB_STATUS1			0x08
>> +#define REG_IBB_ENABLE_CTL		0x46
>> +#define IBB_STATUS1_VREG_OK_BIT		BIT(7)
>> +#define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
>> +#define IBB_CONTROL_ENABLE		BIT(7)
>> +
>> +#define POWER_DELAY			8000
>> +
>> +struct lab_regulator {
>> +	struct regulator_dev		*rdev;
>> +	int				vreg_enabled;
>> +};
>> +
>> +struct ibb_regulator {
>> +	struct regulator_dev		*rdev;
>> +	int				vreg_enabled;
>> +};
>> +
>> +struct qcom_labibb {
>> +	struct device			*dev;
>> +	struct regmap			*regmap;
>> +	u16				lab_base;
>> +	u16				ibb_base;
>> +	struct lab_regulator		lab_vreg;
>> +	struct ibb_regulator		ibb_vreg;
>> +};
>> +
>> +static int qcom_labibb_read(struct qcom_labibb *labibb, u16 address,
> These three wrappers are essentially just aliases of the regmap
> functions, with an error print. In all call sights you check for errors
> and print another error. So they don't reduce the amount of code at the
> callers and they simply means that any error result in two prints in the
> log.
>
> Please drop these three wrappers and just call the regmap functions
> directly.
Sure, i will do that.
>
>> +			    u8 *val, int count)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(labibb->regmap, address, val, count);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi read failed ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_labibb_write(struct qcom_labibb *labibb, u16 address,
>> +			     u8 *val, int count)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_bulk_write(labibb->regmap, address, val, count);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_labibb_masked_write(struct qcom_labibb *labibb, u16 address,
>> +				    u8 mask, u8 val)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(labibb->regmap, address, mask, val);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_enable_ibb(struct qcom_labibb *labibb, bool enable)
>> +{
>> +	int ret;
>> +	u8 val = enable ? IBB_CONTROL_ENABLE : 0;
>> +
>> +	ret = qcom_labibb_masked_write(labibb,
>> +				       labibb->ibb_base + REG_IBB_ENABLE_CTL,
>> +				       IBB_ENABLE_CTL_MASK, val);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "Unable to configure IBB_ENABLE_CTL ret=%d\n",
>> +			ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_lab_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	val = LAB_ENABLE_CTL_EN;
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Wait for a small period before reading REG_LAB_STATUS1 */
>> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
> Wait between 8 and 8.1ms? How about giving the scheduler some more slack
> and making that +100 larger?
Ok,i will add.
>
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!(val & LAB_STATUS1_VREG_OK_BIT)) {
>> +		dev_err(labibb->dev, "Can't enable LAB\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	labibb->lab_vreg.vreg_enabled = 1;
> You don't use vreg_enabled in this patch, how about adding it in the
> next patch where it's actually used instead.
Sure, i will do that.
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_lab_regulator_disable(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val = 0;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +	/* after this delay, lab should get disabled */
>> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (val & LAB_STATUS1_VREG_OK_BIT) {
>> +		dev_err(labibb->dev, "Can't disable LAB\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	labibb->lab_vreg.vreg_enabled = 0;
>> +
> disable is pretty much identical to enable, so might be worth moving its
> content to a common helper function and calling that from the two.
Sure, i will do that.
>> +	return 0;
>> +}
>> +
>> +static int qcom_lab_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return val & LAB_STATUS1_VREG_OK_BIT;
>> +}
>> +
>> +static struct regulator_ops qcom_lab_ops = {
>> +	.enable			= qcom_lab_regulator_enable,
>> +	.disable		= qcom_lab_regulator_disable,
>> +	.is_enabled		= qcom_lab_regulator_is_enabled,
>> +};
>> +
>> +static const struct regulator_desc lab_desc = {
>> +	.name = "lab_reg",
>> +	.ops = &qcom_lab_ops,
>> +	.type = REGULATOR_VOLTAGE,
>> +	.owner = THIS_MODULE,
>> +};
>> +
>> +static int qcom_ibb_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	int ret, retries = 10;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_enable_ibb(labibb, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Unable to set IBB mode ret= %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	while (retries--) {
> Is there a reason why would don't want this wait for the "lab"? That
> should allow you to use the same functions for both regulators.
No. LAB comes up in only one try. But there is no harm in using multiple 
retries. So i will do that.
>
>> +		/* Wait for a small period before reading IBB_STATUS1 */
>> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
>> +				       REG_IBB_STATUS1, &val, 1);
>> +		if (ret < 0) {
>> +			dev_err(labibb->dev,
>> +				"Read register failed ret = %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (val & IBB_STATUS1_VREG_OK_BIT) {
>> +			labibb->ibb_vreg.vreg_enabled = 1;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	dev_err(labibb->dev, "Can't enable IBB\n");
>> +	return -EINVAL;
>> +}
>> +
>> +static int qcom_ibb_regulator_disable(struct regulator_dev *rdev)
>> +{
>> +	int ret, retries = 2;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_enable_ibb(labibb, 0);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev,
>> +			"Unable to set IBB_MODULE_EN ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* poll IBB_STATUS to make sure ibb had been disabled */
>> +	while (retries--) {
>> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
>> +				       REG_IBB_STATUS1, &val, 1);
>> +		if (ret < 0) {
>> +			dev_err(labibb->dev, "Read register failed ret = %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +
>> +		if (!(val & IBB_STATUS1_VREG_OK_BIT)) {
>> +			labibb->ibb_vreg.vreg_enabled = 0;
>> +			return 0;
>> +		}
>> +	}
>> +	dev_err(labibb->dev, "Can't disable IBB\n");
>> +	return -EINVAL;
>> +}
>> +
>> +static int qcom_ibb_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->ibb_base +
>> +			REG_IBB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return(val & IBB_STATUS1_VREG_OK_BIT);
>> +}
>> +
>> +static struct regulator_ops qcom_ibb_ops = {
>> +	.enable			= qcom_ibb_regulator_enable,
>> +	.disable		= qcom_ibb_regulator_disable,
>> +	.is_enabled		= qcom_ibb_regulator_is_enabled,
>> +};
>> +
>> +static const struct regulator_desc ibb_desc = {
>> +	.name = "ibb_reg",
>> +	.ops = &qcom_ibb_ops,
>> +	.type = REGULATOR_VOLTAGE,
>> +	.owner = THIS_MODULE,
>> +};
>> +
>> +static int register_lab_regulator(struct qcom_labibb *labibb,
>> +				  struct device_node *of_node)
>> +{
>> +	int ret = 0;
>> +	struct regulator_init_data *init_data;
>> +	struct regulator_config cfg = {};
>> +
>> +	cfg.dev = labibb->dev;
>> +	cfg.driver_data = labibb;
>> +	cfg.of_node = of_node;
>> +	init_data =
>> +		of_get_regulator_init_data(labibb->dev,
>> +					   of_node, &lab_desc);
> Rather than calling of_get_regulator_init_data() directly, you should
> use desc->of_match to match the children of the regulator driver.
Sure, i will do that.
>
>> +	if (!init_data) {
>> +		dev_err(labibb->dev,
>> +			"unable to get init data for LAB\n");
>> +		return -ENOMEM;
>> +	}
>> +	cfg.init_data = init_data;
>> +
>> +	labibb->lab_vreg.rdev = devm_regulator_register(labibb->dev, &lab_desc,
>> +							&cfg);
>> +	if (IS_ERR(labibb->lab_vreg.rdev)) {
>> +		ret = PTR_ERR(labibb->lab_vreg.rdev);
>> +		dev_err(labibb->dev,
>> +			"unable to register LAB regulator");
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int register_ibb_regulator(struct qcom_labibb *labibb,
>> +				  struct device_node *of_node)
>> +{
>> +	int ret;
>> +	struct regulator_init_data *init_data;
>> +	struct regulator_config cfg = {};
>> +
>> +	cfg.dev = labibb->dev;
>> +	cfg.driver_data = labibb;
>> +	cfg.of_node = of_node;
>> +	init_data =
>> +		of_get_regulator_init_data(labibb->dev,
>> +					   of_node, &ibb_desc);
>> +	if (!init_data) {
>> +		dev_err(labibb->dev,
>> +			"unable to get init data for IBB\n");
>> +		return -ENOMEM;
>> +	}
>> +	cfg.init_data = init_data;
>> +
>> +	labibb->ibb_vreg.rdev = devm_regulator_register(labibb->dev, &ibb_desc,
>> +							&cfg);
>> +	if (IS_ERR(labibb->ibb_vreg.rdev)) {
>> +		ret = PTR_ERR(labibb->ibb_vreg.rdev);
>> +		dev_err(labibb->dev,
>> +			"unable to register IBB regulator");
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int qcom_labibb_regulator_probe(struct platform_device *pdev)
>> +{
>> +	struct qcom_labibb *labibb;
>> +	struct device_node *child;
>> +	unsigned int base;
>> +	u8 type;
>> +	int ret;
>> +
>> +	labibb = devm_kzalloc(&pdev->dev, sizeof(*labibb), GFP_KERNEL);
>> +	if (!labibb)
>> +		return -ENOMEM;
>> +
>> +	labibb->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!labibb->regmap) {
>> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	labibb->dev = &pdev->dev;
>> +
>> +	for_each_available_child_of_node(pdev->dev.of_node, child) {
>> +		ret = of_property_read_u32(child, "reg", &base);
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev,
>> +				"Couldn't find reg in node = %s ret = %d\n",
>> +				child->full_name, ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = qcom_labibb_read(labibb, base + REG_PERPH_TYPE,
>> +				       &type, 1);
>> +		if (ret < 0) {
>> +			dev_err(labibb->dev,
>> +				"Peripheral type read failed ret=%d\n",
>> +				ret);
>> +		}
>> +
>> +		switch (type) {
>> +		case QCOM_LAB_TYPE:
>> +			labibb->lab_base = base;
>> +			ret = register_lab_regulator(labibb, child);
>> +			if (ret < 0) {
>> +				dev_err(labibb->dev,
>> +					"Failed LAB regulator registration");
>> +				return ret;
>> +			}
>> +			break;
>> +
>> +		case QCOM_IBB_TYPE:
>> +			labibb->ibb_base = base;
>> +			ret = register_ibb_regulator(labibb, child);
>> +			if (ret < 0) {
>> +				dev_err(labibb->dev,
>> +					"Failed IBB regulator registration");
>> +				return ret;
>> +			}
>> +			break;
>> +
>> +		default:
>> +			dev_err(labibb->dev,
>> +				"qcom_labibb: unknown peripheral type\n");
>> +			return -EINVAL;
>> +		}
>> +	}
> Given how the registers are laid out, the accessors looks like and this
> loop I think that rather than having a "virtual" labibb device you
> should instantiate two devices directly.
Sure, i will do that.
>
>> +
>> +	dev_set_drvdata(&pdev->dev, labibb);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id qcom_labibb_match_table[] = {
>> +	{ .compatible = "qcom,lab-ibb-regulator", },
> So please make this qcom,pmi8998-lab and qcom,pmi8998-ibb.
Yeah
>
> Regards,
> Bjorn

Thanks and regards,

Nisha

>
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_labibb_match_table);
>> +
>> +static struct platform_driver qcom_labibb_regulator_driver = {
>> +	.driver		= {
>> +		.name		= "qcom-lab-ibb-regulator",
>> +		.of_match_table	= qcom_labibb_match_table,
>> +	},
>> +	.probe		= qcom_labibb_regulator_probe,
>> +};
>> +module_platform_driver(qcom_labibb_regulator_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm labibb driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
