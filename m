Return-Path: <linux-arm-msm+bounces-45312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344AA140E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 18:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F2A3A6CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70871547E3;
	Thu, 16 Jan 2025 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogFbcxdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B835145355
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048721; cv=none; b=S3f2/GoJH2PR3/E8lpYv7f6OoQJEI2MyAGpTDA7LTgI6En6MwUmzhk1DcRlU4pl8SQFhVYIl1Ty2gXy+OCGZ7Ut/dfxmldWsjwkTwPuL8nEf8O0/y+6UsISxSEGOzd4OJHcNjxR9danZLsQxwLdPnHpn1C+UhRjxO+3i79wISNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048721; c=relaxed/simple;
	bh=g7hnVS/9DFvxbSkpr7z4nUE0zTvhyjp9IDBA53OKnR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdlEJLCVQvghAN2jt+TLfRBx9LneG5uoWtziZEGR5p/FBib/xIg5MwwtDpWcXq4kDaI9mfDV9x74HbbgLUCqQiVlBA3pEs3WcR7Fm0tqoKannBo7MB0pzInETr97JeTRqov5LvEAuI9qhVuDdd17XKMQDK1lI64pDmiZaR/sMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ogFbcxdr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38632b8ae71so965685f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737048718; x=1737653518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfv1jGgL1BThv2NuUinBU8GmNixat0dYcl5xyl3Fe8M=;
        b=ogFbcxdr7gWoVCI2yWsGL2G0rEqbdhILuYQ1FJxjKfC7tLB/Mj7wYr4qRqCyzvxTbu
         Jza1LqXGjC/A4rdR57UIuSARuyfMBmlitNDEEwFTQ2cAV1vfhisBcnrtzM45bcYWkA2O
         rK+hVfsEhelGXtS4y5VkHBL0OlxHPQbq39s7aO0xwAN7hbUl+sy074+DM6RWyUnFDK7k
         NgfHtiBc4mWFpBwGzIs0wIp6I3nZxW6IFykF7Vm6IweCMw42q3eBzUPthDMwbghk/TJU
         KyvcpvWkrbzi+yxJ8LRVkBXC+WsvKYHuvwLHwhuRQujw4rfLTaXuQzjIsat04oZ+pKyp
         zVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737048718; x=1737653518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfv1jGgL1BThv2NuUinBU8GmNixat0dYcl5xyl3Fe8M=;
        b=neTvPkJDqCKfbdAZ/hvW9AAKPXpOrMLAlQsQO087orlwumm6991vMlYu0b6cgY79qQ
         AI/ZcR2AZnNxC2/y21WY34KTyunZmm3geIiqdW90qwo5bDXsYXGldRUrxFDtZGj5jBC9
         XtReajwkxn8wH0lL5eeW0j2E3wqZuoqQYUu6Mfz/6MYTSrhisivMI83ujDdpb/6/OBD5
         cUwgXrkWZR+YQUr+EEfPNL1KsSW/Ln51u/hIEt3InXYm93/dsEGWIaP4AXnGU0jNZr8Y
         TJvK1HEU5XFOuW6FHYiTLXQmGl2vTcEBDYy4pBbkLHUfWxlkmIVgJWpRPkmrxVGN4EZ1
         DA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqIcbWuE6hJsDyVmVtNCoOHZgly9QIoX3a9yHp5pZctnrD7VDyB5Lx0ecN/eeCqoQ5Y21duNkMirT6boGE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4triObMsq9SlPEpZABbcMY6J+eOYMu5Pfq9k+IriG4L8NPgx
	QSqqv7kBWQ5t+yxb+oKXINJhK5K9RyFouDv4nIm+ekxo/3Ll/7nXy2H6ix9/LFc=
X-Gm-Gg: ASbGnct3r+bIruKvhHc4lbPXLU4LVOca9zzh0DvszhvQbEa8y+RYcqxrFyKpTVPMG++
	JC6+SXG6mFMYGQb2Z1xI1hr5J5sBBZhGlR/RVJJxER8CoU/daK7SHWSx1VCQlPBoo2gfNHT6wxg
	0HSSpjWkGnWwSliYihEcNiykJ6JlCu37oyxbcBF6Ng0IUfai9qJ2LtGSqSGZmrDvfJmQDv2o2sA
	h2vCjDbxbf0UkgaboUIwfbEHGl67fLbmVPPL0U7afpqx3r8EfbvbraXfERHmPuvco595Q==
X-Google-Smtp-Source: AGHT+IES4zDTMhvfHpUBy469EOztsJYtc/z4Whq2FC2Dkvj8UVj/i9PwjgK6gKvYU0LieDSk8We1sg==
X-Received: by 2002:a5d:64af:0:b0:38b:da31:3e3b with SMTP id ffacd0b85a97d-38bda313f4fmr15753982f8f.3.1737048717633;
        Thu, 16 Jan 2025 09:31:57 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f603sm5696615e9.21.2025.01.16.09.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:31:57 -0800 (PST)
Message-ID: <65dc7d7f-cee5-4eff-9ab7-153b12be4f26@linaro.org>
Date: Thu, 16 Jan 2025 17:31:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20250116111559.83641-1-mitltlatltl@gmail.com>
 <20250116111559.83641-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250116111559.83641-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2025 11:15, Pengyu Luo wrote:
> There are three variants of which Huawei released the first two
> simultaneously.
> 
> Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
> Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see [1])
> Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also gaokun3.
> 
> Adding support for the latter two variants for now, this driver should
> also work for the sc8180x variant according to acpi table files, but I
> don't have the device to test yet.
> 
> Different from other Qualcomm Snapdragon sc8280xp based machines, the
> Huawei Matebook E Go uses an embedded controller while others use
> a system called PMIC GLink. This embedded controller can be used to
> perform a set of various functions, including, but not limited to:
> 
> - Battery and charger monitoring;
> - Charge control and smart charge;
> - Fn_lock settings;
> - Tablet lid status;
> - Temperature sensors;
> - USB Type-C notifications (ports orientation,  DP alt mode HPD);
> - USB Type-C PD (according to observation, up to 48w).
> 
> Add a driver for the EC which creates devices for UCSI and power supply
> devices.
> 
> This driver is inspired by the following drivers:
>          drivers/platform/arm64/acer-aspire1-ec.c
>          drivers/platform/arm64/lenovo-yoga-c630.c
>          drivers/platform/x86/huawei-wmi.c
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219645
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   MAINTAINERS                                   |   7 +
>   drivers/platform/arm64/Kconfig                |  21 +
>   drivers/platform/arm64/Makefile               |   1 +
>   drivers/platform/arm64/huawei-gaokun-ec.c     | 787 ++++++++++++++++++
>   .../linux/platform_data/huawei-gaokun-ec.h    |  80 ++
>   5 files changed, 896 insertions(+)
>   create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
>   create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33b9cd11a..27ff24e7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10692,6 +10692,13 @@ S:	Maintained
>   F:	Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
>   F:	drivers/net/ethernet/huawei/hinic/
>   
> +HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
> +M:	Pengyu Luo <mitltlatltl@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
> +F:	drivers/platform/arm64/huawei-gaokun-ec.c
> +F:	include/linux/platform_data/huawei-gaokun-ec.h
> +
>   HUGETLB SUBSYSTEM
>   M:	Muchun Song <muchun.song@linux.dev>
>   L:	linux-mm@kvack.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index f88395ea3..6ceee3c16 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
>   	  laptop where this information is not properly exposed via the
>   	  standard ACPI devices.
>   
> +config EC_HUAWEI_GAOKUN
> +	tristate "Huawei Matebook E Go Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on INPUT
> +	select AUXILIARY_BUS
> +
> +	help
> +	  Say Y here to enable the EC driver for the Huawei Matebook E Go
> +	  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
> +	  (information, charge control) and USB Type-C DP HPD events as well
> +	  as some misc functions like the lid sensor and temperature sensors,
> +	  etc.
> +
> +	  This driver provides battery and AC status support for the mentioned
> +	  laptop where this information is not properly exposed via the
> +	  standard ACPI devices.
> +
> +	  Say M or Y here to include this support.
> +
> +
>   config EC_LENOVO_YOGA_C630
>   	tristate "Lenovo Yoga C630 Embedded Controller driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index b2ae9114f..46a99eba3 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,4 +6,5 @@
>   #
>   
>   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
> new file mode 100644
> index 000000000..5b09b7d7c
> --- /dev/null
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -0,0 +1,787 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
> + *
> + * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/notifier.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/huawei-gaokun-ec.h>
> +
> +#define EC_EVENT		0x06
> +
> +/* Also can be found in ACPI specification 12.3 */
> +#define EC_READ			0x80
> +#define EC_WRITE		0x81
> +#define EC_BURST		0x82
> +#define EC_QUERY		0x84
> +
> +#define EC_FN_LOCK_ON		0x5A
> +#define EC_FN_LOCK_OFF		0x55
> +
> +#define EC_EVENT_LID		0x81
> +
> +#define EC_LID_STATE		0x80
> +#define EC_LID_OPEN		BIT(1)
> +
> +#define UCSI_REG_SIZE		7
> +
> +/*
> + * For tx, command sequences are arranged as
> + * {master_cmd, slave_cmd, data_len, data_seq}
> + */
> +#define REQ_HDR_SIZE		3
> +#define INPUT_SIZE_OFFSET	2
> +#define REQ_LEN(req) (REQ_HDR_SIZE + req[INPUT_SIZE_OFFSET])
> +
> +/*
> + * For rx, data sequences are arranged as
> + * {status, data_len(unreliable), data_seq}
> + */
> +#define RESP_HDR_SIZE		2
> +
> +#define MKREQ(REG0, REG1, SIZE, ...)			\
> +{							\
> +	REG0, REG1, SIZE,				\
> +	/* ## will remove comma when SIZE is 0 */	\
> +	## __VA_ARGS__,					\
> +	/* make sure len(pkt[3:]) >= SIZE */		\
> +	[3 + SIZE] = 0,					\
> +}
> +
> +#define MKRESP(SIZE)				\
> +{						\
> +	[RESP_HDR_SIZE + SIZE - 1] = 0,		\
> +}
> +
> +/* Possible size 1, 4, 20, 24. Most of the time, the size is 1. */
> +static inline void refill_req(u8 *dest, const u8 *src, size_t size)
> +{
> +	memcpy(dest + REQ_HDR_SIZE, src, size);
> +}
> +
> +static inline void refill_req_byte(u8 *dest, const u8 *src)
> +{
> +	dest[REQ_HDR_SIZE] = *src;
> +}
> +
> +/* Possible size 1, 2, 4, 7, 20. Most of the time, the size is 1. */
> +static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
> +{
> +	memcpy(dest, src + RESP_HDR_SIZE, size);
> +}
> +
> +static inline void extr_resp_byte(u8 *dest, const u8 *src)
> +{
> +	*dest = src[RESP_HDR_SIZE];
> +}
> +
> +static inline void *extr_resp_shallow(const u8 *src)
> +{
> +	return src + RESP_HDR_SIZE;
> +}
> +
> +struct gaokun_ec {
> +	struct i2c_client *client;
> +	struct mutex lock; /* EC transaction lock */
> +	struct blocking_notifier_head notifier_list;
> +	struct device *hwmon_dev;
> +	struct input_dev *idev;
> +	bool suspended;
> +};
> +
> +static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
> +			     size_t resp_len, u8 *resp)
> +{
> +	struct i2c_client *client = ec->client;
> +	struct i2c_msg msgs[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = client->flags,
> +			.len = REQ_LEN(req),
> +			.buf = req,
> +		}, {
> +			.addr = client->addr,
> +			.flags = client->flags | I2C_M_RD,
> +			.len = resp_len,
> +			.buf = resp,
> +		},
> +	};
> +
> +	guard(mutex)(&ec->lock);
> +	i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));

You should trap the result code of i2c_transfer() and push it up the 
call stack.

> +	usleep_range(2000, 2500); /* have a break, ACPI did this */
> +
> +	return *resp ? -EIO : 0;

If the value @ *resp is non-zero return -EIO ?

Why ?

> +}
> +
> +/* -------------------------------------------------------------------------- */
> +/* Common API */
> +
> +/**
> + * gaokun_ec_read - Read from EC
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request
> + * @resp_len: The size to read
> + * @resp: The buffer to store response sequence
> + *
> + * This function is used to read data after writing a magic sequence to EC.
> + * All EC operations depend on this function.
> + *
> + * Huawei uses magic sequences everywhere to complete various functions, all
> + * these sequences are passed to ECCD(a ACPI method which is quiet similar
> + * to gaokun_ec_request), there is no good abstraction to generalize these
> + * sequences, so just wrap it for now. Almost all magic sequences are kept
> + * in this file.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> +		   size_t resp_len, u8 *resp)
> +{
> +	return gaokun_ec_request(ec, req, resp_len, resp);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_read);
> +
> +/**
> + * gaokun_ec_write - Write to EC
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request
> + *
> + * This function has no big difference from gaokun_ec_read. When caller care
> + * only write status and no actual data are returned, then use it.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
> +{
> +	u8 ec_resp[] = MKRESP(0);
> +
> +	return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_write);
> +
> +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte)
> +{
> +	int ret;
> +	u8 ec_resp[] = MKRESP(sizeof(*byte));
> +
> +	ret = gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
> +	extr_resp_byte(byte, ec_resp);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
> +
> +/**
> + * gaokun_ec_register_notify - Register a notifier callback for EC events.
> + * @ec: The gaokun_ec structure
> + * @nb: Notifier block pointer to register
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&ec->notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
> +
> +/**
> + * gaokun_ec_unregister_notify - Unregister notifier callback for EC events.
> + * @ec: The gaokun_ec structure
> + * @nb: Notifier block pointer to unregister
> + *
> + * Unregister a notifier callback that was previously registered with
> + * gaokun_ec_register_notify().
> + */
> +void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifier_block *nb)
> +{
> +	blocking_notifier_chain_unregister(&ec->notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
> +
> +/* -------------------------------------------------------------------------- */
> +/* API for PSY */
> +
> +/**
> + * gaokun_ec_psy_multi_read - Read contiguous registers
> + * @ec: The gaokun_ec structure
> + * @reg: The start register
> + * @resp_len: The number of registers to be read
> + * @resp: The buffer to store response sequence
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> +			     size_t resp_len, u8 *resp)
> +{
> +	u8 ec_req[] = MKREQ(0x02, EC_READ, 1, 0);
> +	u8 ec_resp[] = MKRESP(1);
> +	int i, ret;
> +
> +	for (i = 0; i < resp_len; ++i, reg++) {
> +		refill_req_byte(ec_req, &reg);
> +		ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +		if (ret)
> +			return ret;
> +		extr_resp_byte(&resp[i], ec_resp);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
> +
> +/* Smart charge */
> +
> +/**
> + * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
> + * @ec: The gaokun_ec structure
> + * @resp: The buffer to store response sequence (mode, delay, start, end)
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> +				   u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE])
> +{
> +	/* GBCM */
> +	u8 ec_req[] = MKREQ(0x02, 0xE4, 0);
> +	u8 ec_resp[] = MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
> +	int ret;
> +
> +	ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +	if (ret)
> +		return ret;
> +
> +	extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
> +
> +static inline bool are_thresholds_valid(u8 start, u8 end)
> +{
> +	return end != 0 && start <= end && end <= 100;

Why 100 ? Still feels like an arbitrary number.

Could you add a comment to explain where 100 comes from ?

> +}
> +
> +/**
> + * gaokun_ec_psy_set_smart_charge - Set smart charge data
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request (mode, delay, start, end)
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
> +				   const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE])
> +{
> +	/* SBCM */
> +	u8 ec_req[] = MKREQ(0x02, 0xE3, GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +	if (!are_thresholds_valid(req[2], req[3]))
> +		return -EINVAL;
> +
> +	refill_req(ec_req, req, GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +	return gaokun_ec_write(ec, ec_req);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
> +
> +/* Smart charge enable */
> +
> +/**
> + * gaokun_ec_psy_get_smart_charge_enable - Get smart charge state
> + * @ec: The gaokun_ec structure
> + * @on: The state
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on)
> +{
> +	/* GBAC */
> +	u8 ec_req[] = MKREQ(0x02, 0xE6, 0);

0xE6 == SMART_CHARGE_ENABLE right ?

In which case instead of passing magic numbers inline, it would be nice 
to declare an enum or set of defines that enumerates the command set and 
then pass those values to MKREQ instead of the hex.

Does the first parameter indicate write ? 0x02. 0x03 seems to indicate 
read too ?

If so again please name the hex values as defines/enums and then pass 
the descriptive names.

Looking much more readable now though.

---
bod

