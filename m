Return-Path: <linux-arm-msm+bounces-92040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BKfCXjrhWlvIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:24:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58AFE130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13B3830022CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047443AEF43;
	Fri,  6 Feb 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgWUuiaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438336EA91;
	Fri,  6 Feb 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384243; cv=none; b=ckLD0vHbU7jVbnnehenagQ9JhjGFErkfxAwKdQ6d+uBVSzHBCTILotoy9mPLUEkf61c6u6hBtCiEoCt/92/ssQQKpuKZo4gf88n8V/9uX2PKv1dLYrQmMsDFjd51QftcVSSv+fCwwwAqXJZaynWoRT/Cohyp2eaHYDm+GNHeJws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384243; c=relaxed/simple;
	bh=FduWvw3ubyVJfuwnx6b4VchiNgkQI5eokDQ8NIaGrJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlZkrsHAlEbGovS0kwMgxjSu6bsHcFQWmSQ+ekMh0wEWZtIjgnMrJ2f76baRVjnrwRZO1+nLtKxNgsJmG/Hhpvdp48O4/QvJ2XPEUHhjm7OS1K9vzfRqNzBDQj2n620nQuVMsiJpYXivlIc5F/NahnS9EkxO4Z1fWJ7W+ESIQHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgWUuiaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4064FC116C6;
	Fri,  6 Feb 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770384243;
	bh=FduWvw3ubyVJfuwnx6b4VchiNgkQI5eokDQ8NIaGrJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgWUuiaJaxr9u6BqbrGP2Zz0DRfxcorNK3odBPvMA3qXQStNbVl/ppVEngCmlF5vG
	 n36GGiMRsYwi74TC/CRE7FrtxgSsbb+xu2cHwX5p+n3YdC5QJOfweWIq8+AXabQbOR
	 2ddk/B+t+0KUG4f/KQqTmbP7k2085VhH06o0ysglWgDifsSXcGmsyC9HW7q7rfXzwD
	 PhJ2zPCyKGufzruOUhrsHpGXV8Y0sted5s1rlr+4g0fEq7FlOJdHPaGL5YyNQ6FoEE
	 J9xzy420X0iDGBUkvuvYJZgSnOrhncHyfRW1QLdnK51uhqFje/ikB9rQnxHqyoqzor
	 E6AOr8TePgPiQ==
Date: Fri, 6 Feb 2026 07:24:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Message-ID: <ndkdgw6tiau4y7psfl53tmzylrfi27h6j5likx5mahufv34625@na3yyn56fgw6>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92040-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BD58AFE130
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
> new file mode 100644
> index 000000000000..a7e3b865de5c
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> @@ -0,0 +1,982 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm pmic BCL hardware driver for battery overcurrent and
> + * battery or system under voltage monitor
> + *
> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.

That's the wrong statement.

> + */
> +
[..]
> +static void bcl_hw_channel_mon_init(struct bcl_device *bcl)
> +{
> +	bcl->in_mon_enabled = bcl_in_monitor_enabled(bcl);
> +	bcl->in_input_enabled = bcl_in_input_enabled(bcl);
> +	bcl->curr_mon_enabled = bcl_curr_monitor_enabled(bcl);
> +}
> +
> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret = 0, irq_num = 0, i = 0;

First use of these three variables are assignments, no need to
zero-initialize them here.

> +	struct bcl_alarm_data *alarm;
> +
> +	for (i = LVL0; i < ALARM_MAX; i++) {

I would prefer ARRAY_SIZE(bcl->bcl_alarms) over ALARM_MAX.

> +		alarm = &bcl->bcl_alarms[i];
> +		alarm->type = i;
> +		alarm->device = bcl;
> +
> +		ret = devm_delayed_work_autocancel(bcl->dev, &alarm->alarm_poll_work,
> +					   bcl_alarm_enable_poll);
> +		if (ret)
> +			return ret;
> +
> +		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
> +		if (irq_num <= 0)
> +			continue;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_int_names[i], alarm);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Error requesting irq(%s).err:%d\n",
> +				bcl_int_names[i], ret);
> +			return ret;
> +		}
> +		enable_irq_wake(alarm->irq);
> +		alarm->irq_enabled = true;
> +		alarm->irq = irq_num;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
> +				 const struct bcl_desc *data)
> +{
> +	int i;
> +	struct reg_field fields[F_MAX_FIELDS];
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(common_reg_fields) != COMMON_FIELD_MAX);
> +
> +	for (i = 0; i < data->num_reg_fields; i++) {
> +		if (i < COMMON_FIELD_MAX)
> +			fields[i] = common_reg_fields[i];
> +		else
> +			fields[i] = data->reg_fields[i];
> +
> +		/* Need to adjust BCL base from regmap dynamically */
> +		fields[i].reg += bcl->base;
> +	}
> +
> +	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
> +					   fields, data->num_reg_fields);
> +}
> +
> +static int bcl_get_device_property_data(struct platform_device *pdev,
> +				   struct bcl_device *bcl)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret = device_property_read_u32(dev, "reg", &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	bcl->base = reg;
> +
> +	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
> +				       bcl->curr_thresholds, 2);
> +	return 0;
> +}
> +
> +static int bcl_probe(struct platform_device *pdev)
> +{
> +	struct bcl_device *bcl;
> +	int ret;
> +
> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
> +	if (!bcl)
> +		return -ENOMEM;
> +
> +	bcl->dev = &pdev->dev;
> +	bcl->desc = device_get_match_data(&pdev->dev);
> +	if (!bcl->desc)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
> +	if (ret)
> +		return ret;
> +
> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!bcl->regmap) {
> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = bcl_get_device_property_data(pdev, bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Unable to allocate regmap fields, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!bcl_hw_is_enabled(bcl))
> +		return -ENODEV;
> +
> +	ret = bcl_curr_thresh_update(bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = bcl_alarm_irq_init(pdev, bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	bcl_hw_channel_mon_init(bcl);
> +
> +	dev_set_drvdata(&pdev->dev, bcl);
> +
> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
> +						   dev_name(bcl->dev));
> +	if (IS_ERR(bcl->hwmon_name)) {
> +		dev_err(&pdev->dev, "Failed to sanitize hwmon name\n");

Afaict, devm_hwmon_sanitize_name() can only return -ENOMEM, which
already printed an error.

> +		return PTR_ERR(bcl->hwmon_name);
> +	}
> +
> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							      bcl->hwmon_name,
> +							      bcl,
> +							      &bcl_hwmon_chip_info,
> +							      NULL);
> +	if (IS_ERR(bcl->hwmon_dev)) {
> +		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
> +			PTR_ERR(bcl->hwmon_dev));
> +		return PTR_ERR(bcl->hwmon_dev);
> +	}
> +
> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,bcl-v1",
> +		.data = &pm7250b_data,

Why generic compatibles but pmic-specific data structures? If anything
I'd expect tthe other way around...

> +	}, {
> +		.compatible = "qcom,bcl-v2",
> +		.data = &pm8350_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-bmx",
> +		.data = &pm8550b_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-wb",
> +		.data = &pmw5100_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-core",
> +		.data = &pm8550_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-bmx",
> +		.data = &pmih010_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-wb",
> +		.data = &pmw6100_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-core",
> +		.data = &pmh010_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-pmv010",
> +		.data = &pmv010_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcl_match);
> +
> +static struct platform_driver bcl_driver = {
> +	.probe	= bcl_probe,
> +	.driver	= {
> +		.name		= BCL_DRIVER_NAME,
> +		.of_match_table	= bcl_match,
> +	},
> +};
> +
> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
> +module_platform_driver(bcl_driver);

This relates to the bcl_driver declaration, not module properties. So
move it there.

> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/qcom-bcl-hwmon.h b/drivers/hwmon/qcom-bcl-hwmon.h

Why is there a header file, is this going to be accessed by some other
driver? It mostly contain driver-internal thing, and some helpers that
won't be useful outside of the driver.

> new file mode 100644
> index 000000000000..28a7154d9486
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.h
> @@ -0,0 +1,311 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.

Please fix this one as well. (Or...drop the file)

> + */
> +
> +#ifndef __QCOM_BCL_HWMON_H__
> +#define __QCOM_BCL_HWMON_H__
> +
> +#define BCL_DRIVER_NAME			"qcom-bcl-hwmon"

This belong in the driver...but frankly, you can just put the string
directly in bcl_driver.driver.name, no need to have a define for it...

[..]
> +/**
> + * bcl_field_enabled - Generic helper to check if a regmap field is enabled
> + * @bcl: BCL device structure
> + * @field: Index in bcl->fields[]
> + *
> + * Return: true if field is non-zero, false otherwise
> + */
> +static inline bool bcl_field_enabled(const struct bcl_device *bcl, enum bcl_fields id)
> +{
> +	int ret;
> +	u32 val = 0;
> +
> +	ret = regmap_field_read(bcl->fields[id], &val);
> +	if (ret)
> +		return false;
> +
> +	return !!val;
> +}
> +
> +#define bcl_in_input_enabled(bcl)	bcl_field_enabled(bcl, F_IN_INPUT_EN)
> +#define bcl_curr_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_CURR_MON_EN)
> +#define bcl_in_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_IN_MON_EN)
> +#define bcl_hw_is_enabled(bcl)		bcl_field_enabled(bcl, F_CTL_EN)

This whole thing is only used in bcl_hw_channel_mon_init(), just put the
code in bcl_hw_channel_mon_init().


You have a few other regmap_field_*() calls in the driver, I would
suggest that you just call that directly for these cases as well.

> +
> +/**
> + * bcl_enable_irq - Generic helper to enable alarm irq
> + * @alarm: BCL level alarm data
> + */
> +static inline void bcl_enable_irq(struct bcl_alarm_data *alarm)
> +{
> +	if (alarm->irq_enabled)
> +		return;

This can't happen, but because you separated this to a helper function
it's not obvious

I'd suggest that you inline the remaining 3 lines in the one place where
this function is called.

> +	alarm->irq_enabled = true;
> +	enable_irq(alarm->irq);
> +	enable_irq_wake(alarm->irq);
> +}
> +
> +/**
> + * bcl_disable_irq - Generic helper to disable alarm irq
> + * @alarm: BCL level alarm data
> + */
> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
> +{
> +	if (!alarm->irq_enabled)
> +		return;

This is tricker, because there's a window between
devm_request_threaded_irq() and the assignment of irq_enabled, where the
interrupt function might execute and the attempt to bcl_disable_irq()
will face irq_enabled == 0.

But I don't think that's intentional...

I think this too would be better to just inline in the one place its'
being called.

Regards,
Bjorn

> +	alarm->irq_enabled = false;
> +	disable_irq_nosync(alarm->irq);
> +	disable_irq_wake(alarm->irq);
> +}
> +
> +#endif /* __QCOM_BCL_HWMON_H__ */
> 
> -- 
> 2.43.0
> 

