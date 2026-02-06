Return-Path: <linux-arm-msm+bounces-91985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPKxIe2ihWmSEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:14:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3AFB524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B158E3042896
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C9B346FAB;
	Fri,  6 Feb 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9Mx7v1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D27346E54;
	Fri,  6 Feb 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365573; cv=none; b=o3Oj5V4NWGcwUxbXf0B2U0VxrkmdAV5qHPNZ2PCTP48k+mO99z0RRO1xbsUdE8jmqCy0eg92riA67Ag4JpPMqj5RpJc0bwgcbniY/tvbDK4v00dhbKYlogZ3ulGt6jDYQbqZ7bK4sCeZdcBCZEx4T2OM6SxHqnNzmuZ1S2Z4fW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365573; c=relaxed/simple;
	bh=niNVADaVUtdWJSNgFcuPDgkezYumY11HVp0GvpPI32A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV1jk1OFjVetz376S8zoVtvsYV97sokFMtcwx2bzmOG0U46rvVb6qKuEWPvuCUNcdtsw/+Gah2rfFvAMSCkHwTPCLpgLsUgjmMfHr161Eay6u9eeJEs3OybEP0NOCIJ9gJvA1IuEWuxCh0PADN5AJGrjwiE2HrJ+0BCjz3JNj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9Mx7v1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3A1C19425;
	Fri,  6 Feb 2026 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365572;
	bh=niNVADaVUtdWJSNgFcuPDgkezYumY11HVp0GvpPI32A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9Mx7v1A4V7paPZ2NgbwGUlr/Kw8KeYIvcYDAAhhmQDGD1EDmiWD7WRY2aiocRJF9
	 WqWnH/84TTdJuzphZ8mQN7et6KzCXl7F5cB4NxC9WrgsLhkHzCYIWNgwtI3ZF0TjI+
	 ggoyqovAasui6u2bxe+Ax0YoDFU35PwyP6d5rJePBzlkcmSMp7KJtc/dbHxEbEfQBG
	 M7qVjGUE0IxYGErhzWAXIDpsW5t2rqfUf5sR3cyz8acm+19tWV38RO2R9WTNjFN7rm
	 CvXrSal4BrTtfgVYlfdjCqwEEq8lG55AXdbl3UncE0vmfVUZrzndc1m7MuVYrkwCye
	 xN031yhtXVJig==
Date: Fri, 6 Feb 2026 09:12:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	amit.kucheria@oss.qualcomm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Message-ID: <20260206-garrulous-lilac-porcupine-083b08@quoll>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91985-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BC3AFB524
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
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

And that's the proof that your binding is just repeating downstream
bollocks pattern. Something like "v1" does not exist if you even here
claim this is not "v1", but pm7250.

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

No, just use name here.

> +		.of_match_table	= bcl_match,
> +	},
> +};
> +
> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
> +module_platform_driver(bcl_driver);
> +MODULE_LICENSE("GPL");

...

> +
> +/**
> + * bcl_disable_irq - Generic helper to disable alarm irq
> + * @alarm: BCL level alarm data
> + */
> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)

Why do you write actual functions/code in the headers?

Please follow standard C rules, which mean that the C unit contains code
intended for execution. Headers are only for declarations.

> +{
> +	if (!alarm->irq_enabled)
> +		return;
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

