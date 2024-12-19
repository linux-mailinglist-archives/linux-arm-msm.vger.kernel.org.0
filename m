Return-Path: <linux-arm-msm+bounces-42845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB809F862F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B55F91893C0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D68E1E3DF7;
	Thu, 19 Dec 2024 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYe+43E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1641D6DB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641004; cv=none; b=LUQ3BUCMRtFVvZK9+yFSfXH+NdxXVB+d0dVN19NoO6ZEgy2LLmvjZsRrvcBFQXQx1S+q/F/4zPXmikNMZ1VLZsncYalP1nioglUOgd0EpucVdjfRVeU/wUWEjbXpamW0pnHrM9BQthit9XDahTBr+WcTmIqKO0ayfwoarM9YTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641004; c=relaxed/simple;
	bh=H9CWREEr2/wWECFnaBN7QwzgYs+nYVPhVSsT+Z2MZIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJoyzRvYHu4gm1FA0RCiLo7DRtroyD/wXbIpauqJwoeEscIYSh0MNP/9YRYMAbc/5YZFeU5DmfmvG/iAKk2mxlsUdd/v9xei20Z4wiRq34X/B4rWqpSRtAhQmvBGOXfGMsojeAIoK1swBuuvrke44qJ21mGGuQCqX8bN6aa/SPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYe+43E+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso13643015e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734640999; x=1735245799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ybfejc6eCvRqum4cuszxm/+3pd1Ax4pDuaNueiRGuko=;
        b=wYe+43E+TqVNQMxljcOHrYEtLyyPA4QqJOMSVBYaeAxRZb8kZc4DCtW29f7QVDpIzf
         2Oi78ytj8BQGalzU7Fkxmtevgec51uDPyIRlLjR1gKRdrTpRRL5OWxwON1ZAZjOke1zk
         /TKLgZ5FYM2ykNBr0Vo5bQAqyhyoj7Es1ufd+LMnJEcRVO6xI2B8+kLSgKjCyJ1m+H3y
         OEpT6chtEdDvvEfCGWRF0TBeWFNZgoWFFErGxyZwXQo/wqgjMBQe/dvY2AEwjGsTMRQ2
         ufcgSwlNpDN2aTcWzSak1ehoxciOarJ5BrKVEmph9HMLuW0Jxzuc0P76EWiCk7mOpl8u
         co0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640999; x=1735245799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ybfejc6eCvRqum4cuszxm/+3pd1Ax4pDuaNueiRGuko=;
        b=tq+zA/slTjBUsok3NFf6KCi9B/PEYtDD85pMKb2LtTG1wMoDPh2hgMoa7sTxKSR4Qn
         jD/FT0pdLMcTfMajZVW7WhxaJiPe09dXIN3CxjEJBbKJC6UFAQMTJTSGefqjjdwC+8/M
         Dnq5X0Udz36+H4c5P1ACuedBJLmflZoqN6SWA6eNfO8OBeOs1CAgTWgneu3Gwb9mq1wW
         iulwVpRvjxqW6DGJUEWHo8MslgHvDW5VGC+tpYTkr0/I544n/xa15uq1prPTPbcAha09
         8VTwIHMS9fXA1e9mc7rpyWpMuRDIN73O9aBoQxDlU8VBz5rkuqIGAmi18BYtqYVye9Xx
         sKDA==
X-Gm-Message-State: AOJu0YxTBqWKOxXQxtKy2am0qr2ZcVeLQMNU5VT8duvpXmV9CMlIXENQ
	y4HhTxX0+m00MiQn8IiN6t0GADVs4aX3fJeiCrzGLEZP9XMH89xcRrXSUo97jEQ=
X-Gm-Gg: ASbGncs/NTkliPlsLsBIkMzRpnuM2ReCEVr1pQHVsEAND/GKoquNzUHy8rBywHdb/gt
	Gl5h2+/37fUvEydBcOQrJPYXqHP62z5he5QLawUBoT2PTpP4XHedNElo3n1e2hMUhIS0un3jBKL
	0/fS0S8MeToqQCWGhQIkELKn7XlXnEHUcqLrkn+77wKyN1dT2vvqjisuCCeZIyC7nE/N5c/W88q
	zNh4SS7ij7mNEid8XnbaeI0mljFNLBqjbcWuJI9I8Ho2MOEhN8OOZT5d1mhEdz4emCE3A==
X-Google-Smtp-Source: AGHT+IFKhLZNXUJlh0eq6oK26ukCLmUEvISiQSqgEWiiAQXasyBiX9z9wBDVbl6+woC2mWPAUkF3Dw==
X-Received: by 2002:a05:600c:3ca4:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-43668646b20mr2825975e9.16.1734640999365;
        Thu, 19 Dec 2024 12:43:19 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e375sm2368057f8f.73.2024.12.19.12.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:43:18 -0800 (PST)
Message-ID: <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
Date: Thu, 19 Dec 2024 20:43:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219200821.8328-2-maccraft123mc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 20:08, Maya Matuszczyk wrote:
> Currently it features only reporting that the AP is going to suspend,
> which results in keyboard backlight turning off and the power LED
> slowly blinking on the Lenovo Yoga Slim 7x.
> 
> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> firmware with extensions which would need appropriate handling.
> For reverse engineering the firmware on them I have written a Rust
> utility:
> 
> https://github.com/Maccraft123/it8987-qcom-tool.git
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>   MAINTAINERS                              |   6 +
>   drivers/platform/arm64/Kconfig           |   8 ++
>   drivers/platform/arm64/Makefile          |   1 +
>   drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
>   4 files changed, 173 insertions(+)
>   create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..08d170e2e1e3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12890,6 +12890,12 @@ S:	Maintained
>   W:	http://legousb.sourceforge.net/
>   F:	drivers/usb/misc/legousbtower.c
>   
> +QCOM IT8987 EC DRIVER
> +M:	Maya Matuszczyk <maccraft123mc@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> +F:	drivers/platform/arm64/qcom-x1e-it8987.c
> +
>   LETSKETCH HID TABLET DRIVER
>   M:	Hans de Goede <hdegoede@redhat.com>
>   L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index f88395ea3376..ebb7b4f70ca0 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -49,4 +49,12 @@ config EC_LENOVO_YOGA_C630
>   
>   	  Say M or Y here to include this support.
>   
> +config EC_QCOM_X1E_IT8987
> +	tristate "Embedded Controller driver for most X1E80100 laptops"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	help
> +	  This driver currently supports reporting device suspend to the EC so it
> +	  can take appropriate actions.
> +
>   endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index b2ae9114fdd8..b9aa195bc1e6 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -7,3 +7,4 @@
>   
>   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> +obj-$(CONFIG_EC_QCOM_X1E_IT8987) += qcom-x1e-it8987.o
> diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platform/arm64/qcom-x1e-it8987.c
> new file mode 100644
> index 000000000000..d27067d6326a
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> + */
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>

Your includes should be alphabetised.

> +
> +#define EC_IRQ_REASON_REG 0x05
> +#define EC_SUSPEND_RESUME_REG 0x23
> +#define EC_IRQ_ENABLE_REG 0x35
> +
> +#define EC_NOTIFY_SUSPEND_ENTER 0x01
> +#define EC_NOTIFY_SUSPEND_EXIT 0x00
> +#define EC_NOTIFY_SCREEN_OFF 0x03
> +#define EC_NOTIFY_SCREEN_ON 0x04
> +
> +#define EC_IRQ_MICMUTE_BUTTON 0x04
> +#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
> +#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
> +#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
> +#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
> +#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
> +#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
> +#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
> +#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
> +#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
> +#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
> +#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
> +#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
> +#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
> +#define EC_IRQ_RECOVERED_FROM_RESET 0x3d
> +
> +struct qcom_x1e_it8987_ec {
> +	struct i2c_client *client;
> +	struct input_dev *idev;
> +	struct mutex lock;
> +};
> +
> +static irqreturn_t qcom_x1e_it8987_ec_irq(int irq, void *data)
> +{
> +	struct qcom_x1e_it8987_ec *ec = data;
> +	struct device *dev = &ec->client->dev;
> +	int val;
> +
> +	guard(mutex)(&ec->lock);

What's the thing that can execute at the same time as this procedure - 
there doesn't appear to be any concurrent candidate in this patch.
> +
> +	val = i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
> +	if (val < 0) {
> +		dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
> +		return IRQ_HANDLED;
> +	}
> +
> +	dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);

Should an unhandled IRQ be an info or an err ?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_x1e_it8987_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct qcom_x1e_it8987_ec *ec;
> +	int ret;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	mutex_init(&ec->lock);
> +	ec->client = client;
> +
> +	ret = devm_request_threaded_irq(dev, client->irq,
> +					NULL, qcom_x1e_it8987_ec_irq,
> +					IRQF_ONESHOT, "qcom_x1e_it8987_ec", ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq\n");
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x01);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable interrupts\n");
> +
> +	return 0;
> +}
> +
> +static void qcom_x1e_it8987_ec_remove(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x00);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to disable interrupts: %d\n", ret);
> +}
> +
> +static int qcom_x1e_it8987_ec_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_ENTER);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int qcom_x1e_it8987_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_EXIT);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_ON);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-ec" },
> +	{ .compatible = "qcom,x1e-it9897-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
> +
> +static const struct i2c_device_id qcom_x1e_it8987_ec_i2c_id_table[] = {
> +	{ "qcom-x1e-it8987-ec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, qcom_x1e_it8987_ec_i2c_id_table);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_x1e_it8987_ec_pm_ops,
> +		qcom_x1e_it8987_ec_suspend,
> +		qcom_x1e_it8987_ec_resume);
> +
> +static struct i2c_driver qcom_x1e_it8987_ec_i2c_driver = {
> +	.driver = {
> +		.name = "yoga-slim7x-ec",
> +		.of_match_table = qcom_x1e_it8987_ec_of_match,
> +		.pm = &qcom_x1e_it8987_ec_pm_ops
> +	},
> +	.probe = qcom_x1e_it8987_ec_probe,
> +	.remove = qcom_x1e_it8987_ec_remove,
> +	.id_table = qcom_x1e_it8987_ec_i2c_id_table,
> +};
> +module_i2c_driver(qcom_x1e_it8987_ec_i2c_driver);
> +
> +MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Embedded Controller");
> +MODULE_LICENSE("GPL");

Otherwise looks pretty good to me, nice hacking :)

---
bod


