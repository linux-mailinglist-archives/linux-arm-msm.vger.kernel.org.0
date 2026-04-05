Return-Path: <linux-arm-msm+bounces-101829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AkF2KNus0WmeMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B439CF32
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E778300CBD6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 00:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D4829B793;
	Sun,  5 Apr 2026 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yB/Ea+8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDD29B224
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 00:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348952; cv=none; b=LBG4vD/95e9/YC9BOAbIFd3Wvlf3K1WMdIgSl1d/cA1iCOr2OTTp+4knbs2wEGj8LOeLb5x3hJbtYC3maZVO36ya7JDs9/2qjn6d4IM9l0g4AFFT8Egm7FQ+LU2LbvUlswNH+uqQheJyE7YCOZUai1bIVgRAU+QUjI/kTbs6bWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348952; c=relaxed/simple;
	bh=Amr/RewaQAlWbUH+6Wis1+hD3LQooFsCuUANt5hk4F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIlhLObh1M4Z6FL4pMgYBCzKPS6TzZGUjtnPTjcfu+fRd+hHDwCbB0FV+crrWl42dQvIZTMpGDMyB4C52VHuE4KrN/PdQrlIj2SrquYV5ZkQUbOqe4NJBMUisCU9UPqcdqJOAj6u6fe3G38tT8ddaAy4dYpJ5ml5rojzdH4FMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yB/Ea+8p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso4055635e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 17:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348949; x=1775953749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iGVc+S/jcmSk1HVkcDOJV7oa/GXq4G2NgkukuikRxk=;
        b=yB/Ea+8pSy9Of62qz8RbRvGxj31OgGwxkcFV1FbZkTcNKhADZqnKgNjy9ze8SR11I+
         MuoQlDTf3+KTNVrbO3XQVtH+PnGew408+xB1BnRHdkzl4A8iHzmxUGp430IUS3V45Igt
         DG8ZPKzDQSnd1JuVgoqggiOJ16a+dbkdN3od16BfQW5pWyIcwljv2QgAjU4IjwtfxmiG
         8+95SahGe0pRDChZoSpvkccRu3ZfFZ9+fL8P8X7RGPb0Yh7KQjcnNNRfa4EhXSABa5nw
         yZ1Dp3R+yyN6WXZXshCgg+xivwi45+Btn2hFei2AP62myeUoAkcxerf/LTUPJEQU7sQg
         AQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348949; x=1775953749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iGVc+S/jcmSk1HVkcDOJV7oa/GXq4G2NgkukuikRxk=;
        b=iL8LH/25WH40ES//EGWuznK5AVaK+74m/7laonXkSTc0RmGoFXtRP7wQr2fHLDtbes
         KmUfGlFyOFEpAUqiuos6OyKbXTiWjJDbFwknal9Z0dpt2/eZL4swozbtmORtp3Ok8GE1
         MnTiWepwVnYyZhelcdIdysuQVhHYkkr/zdqlTyUv9ebYzzFSXn/LKZX5QzQzGMmkwF0t
         JirTvRTckJhfEzJqKepnWommJ/aQEERLxEsHIfAQhRbMAwGvZMtCx/8JnlCLw2J4Qm5H
         pAAiowFV6GKSw22XtOSqkpEbfMw9K/MTJZwaiR2yoNQKsKuMlbycvQzd3NOgUIVHuY5z
         oWiw==
X-Gm-Message-State: AOJu0Yw+jQ2XELdxBsg2OM2Jh6qD2++HDrqWnVBn4RNrnZAW67fPth8v
	/ofd0caV+kWoGSjTY3izkQYznAUbNwgZXheIVHc3/vwimkWbNcHfFks2yqUOeoA0eg0=
X-Gm-Gg: AeBDiesA80vNOPHcRk/9Qonq5LtId78LW0mkEOb+QCTk6ahrvakXanaLFr/3KjPIfXD
	KWNz0zdfkB0OPk1uI0EfxJBI4b9vut3dU3rdQ32wYfAFaeEBl2GhVNwS2eOqKSMIQky/cFhjaEL
	MKn5k6qV0qBHMTe8Tw4ucCyMBU90nv+w0VL3GC272tUvCcyMODM6V9Pe36FJ8JLU1KJAJucZUQA
	Nh+0ffHIDa93gv9jpkj3EMsB9EOq5vSUh/ns+yi9McQlhHO1a3PILAeK/o1sbsApsshgggFwfT2
	M/YAMIUL2CU08VTBqFwe5CUIqEhfhOXrNqJq149lmrB7UcFV7/xIXr7l4zN9iGbAqZdAmVmXrV7
	DuOO485MAv0z0XOtLGxSZY5WBD8WmFpzrGxqzkZiaeHxNkrOqx4sV5eUJXQaguWkjtsyQ0qzwNJ
	zx/7ZoItWRJtYV4DVJ38NvQArkvDo0VImExwU=
X-Received: by 2002:a05:600d:a:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-488997d1788mr95228915e9.18.1775348949259;
        Sat, 04 Apr 2026 17:29:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm74852795e9.4.2026.04.04.17.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:29:08 -0700 (PDT)
Message-ID: <6be0cefb-72e4-4a8a-8668-45994db6c5d8@linaro.org>
Date: Sun, 5 Apr 2026 01:29:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform: arm64: dell-xps-ec: new driver
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-2-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-2-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101829-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,vinarskis.com:email,temp_work.work:url]
X-Rspamd-Queue-Id: E61B439CF32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> partially of fully compatible with Snapdragon-based Dell Latitude,
> Inspiron ('thena'). Primary function of this driver is unblock EC's
> thermal management, specifically to provide it with necessary
> information to control device fans, peripherals power.
> 
> The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> i2c dumps of communication between SoC and EC. Changes to Windows
> driver's behavior include increasing temperature feed loop from ~50ms
> to 100ms here.
> 
> While Xps's EC is rather complex and controls practically all device
> peripherals including touch row's brightness and special keys such as
> mic mute, these do not go over this particular i2c interface.
> 
> Not yet implemented features:
> - On lid-close IRQ event is registered. Windows performs what to
>    appears to be thermistor constants readout, though its not obvious
>    what it used for.
> - According to ACPI's _DSM there is a method to readout fans' RPM.
> - Initial thermistor constants were sniffed from Windows, these can be
>    likely fine tuned for better cooling performance.
> - There is additional temperature reading that Windows sents to EC but
>    more rare than others, likely SoC T_j / TZ98 or TZ4. This is the only
>    thermal zone who's reading can exceed 115C without triggering thermal
>    shutdown.
> - Given similarities between 'tributo' and 'thena' platforms, including
>    EC i2c address, driver can be potentially extended to support both.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>   MAINTAINERS                          |   1 +
>   drivers/platform/arm64/Kconfig       |  12 ++
>   drivers/platform/arm64/Makefile      |   1 +
>   drivers/platform/arm64/dell-xps-ec.c | 267 +++++++++++++++++++++++++++++++++++
>   4 files changed, 281 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5d175559f4468dfe363b319a1b08d3425f4d712..c150f57b60706224e5b24b0dfb3d8a9b81f36398 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
>   M:	Aleksandrs Vinarskis <alex@vinarskis.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> +F:	drivers/platform/arm64/dell-xps-ec.c
>   
>   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>   M:	Zev Weiss <zev@bewilderbeest.net>
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a7cc50bdf1092da04153bc 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
>   	  laptop where this information is not properly exposed via the
>   	  standard ACPI devices.
>   
> +config EC_DELL_XPS
> +	tristate "Dell XPS 9345 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on IIO
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Dell XPS 13 9345, which handles thermal management and fan speed
> +	  control.
> +
> +	  Say M or Y here to include this support.
> +
>   config EC_HUAWEI_GAOKUN
>   	tristate "Huawei Matebook E Go Embedded Controller driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e67381cfc729bed1fdaaef 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,6 +6,7 @@
>   #
>   
>   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_DELL_XPS)	+= dell-xps-ec.o
>   obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>   obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm64/dell-xps-ec.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bf1495fbe473ccdb82b95a66b56e8525f782cc8e
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/unaligned.h>
> +#include <linux/workqueue.h>
> +
> +#define DELL_XPS_EC_SUSPEND_CMD		0xb9
> +#define DELL_XPS_EC_SUSPEND_MSG_LEN	64
> +
> +#define DELL_XPS_EC_TEMP_CMD0		0xfb
> +#define DELL_XPS_EC_TEMP_CMD1		0x20
> +#define DELL_XPS_EC_TEMP_CMD3		0x02
> +#define DELL_XPS_EC_TEMP_MSG_LEN	6
> +#define DELL_XPS_EC_TEMP_POLL_JIFFIES	msecs_to_jiffies(100)
> +
> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps_ec_thermistor_profile[] = {
> +	0xff, 0x54,
> +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> +	0x04, 0x44, 0x28,	/* sys_therm3 */
> +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> +	0x06, 0x44, 0x26,	/* sys_therm5 */
> +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> +};
> +
> +/*
> + * Mapping from IIO channel name to EC command byte
> + */
> +static const struct {
> +	const char *name;
> +	u8 cmd;
> +} dell_xps_ec_therms[] = {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },
> +	{ "sys_therm2", 0x04 },
> +	{ "sys_therm3", 0x05 },
> +	{ "sys_therm4", 0x06 },
> +	{ "sys_therm5", 0x07 },
> +	{ "sys_therm6", 0x08 },
> +};

You could probably retrieve these strings from the dt if you really need 
them.

I don't think you need static consts in your driver though you could 
just as easily do `sprintf("sys_therm%d\n", i) where you use 
ec_therms[i].name - the name is only used to print errors and you have 
the index of the channel when you do.

It would be nicer to get the strings from DT - certainly make the string 
names mandatory but, then let the DT specify those names.

Either that or just do the sprintf("sys_therm%d\n", i); for the index, 
whichever you wish yourself.

> +
> +struct dell_xps_ec {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct iio_channel *therm_channels[ARRAY_SIZE(dell_xps_ec_therms)];
> +	struct delayed_work temp_work;
> +};
> +
> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> +{
> +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> +	int ret;
> +
> +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> +	buf[1] = suspend ? 0x01 : 0x00;
> +	/* bytes 2..63 remain zero */
> +
> +	ret = i2c_master_send(ec->client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int dell_xps_ec_send_temp(struct dell_xps_ec *ec, u8 cmd_byte,
> +				 int milli_celsius)
> +{
> +	u8 buf[DELL_XPS_EC_TEMP_MSG_LEN];
> +	u16 deci_celsius;
> +	int ret;
> +
> +	/* Convert milli-Celsius to deci-Celsius (Celsius * 10) */
> +	deci_celsius = milli_celsius / 100;
> +
> +	buf[0] = DELL_XPS_EC_TEMP_CMD0;
> +	buf[1] = DELL_XPS_EC_TEMP_CMD1;
> +	buf[2] = cmd_byte;
> +	buf[3] = DELL_XPS_EC_TEMP_CMD3;
> +	put_unaligned_le16(deci_celsius, &buf[4]);
> +
> +	ret = i2c_master_send(ec->client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void dell_xps_ec_temp_work_fn(struct work_struct *work)
> +{
> +	struct dell_xps_ec *ec = container_of(work, struct dell_xps_ec,
> +					      temp_work.work);
> +	int val, ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> +		if (!ec->therm_channels[i])
> +			continue;
> +
> +		ret = iio_read_channel_processed(ec->therm_channels[i], &val);
> +		if (ret < 0) {
> +			dev_err_ratelimited(ec->dev,
> +					    "Failed to read thermistor %s: %d\n",
> +					    dell_xps_ec_therms[i].name, ret);
> +			continue;
> +		}
> +
> +		ret = dell_xps_ec_send_temp(ec, dell_xps_ec_therms[i].cmd, val);
> +		if (ret < 0) {
> +			dev_err_ratelimited(ec->dev,
> +					    "Failed to send temp for %s: %d\n",
> +					    dell_xps_ec_therms[i].name, ret);
> +		}
> +	}
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +}
> +
> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec = data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dell_xps_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dell_xps_ec *ec;
> +	int ret, i;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->dev = dev;
> +	ec->client = client;
> +	i2c_set_clientdata(client, ec);
> +
> +	/* Set default thermistor profile */
> +	ret = i2c_master_send(client, dell_xps_ec_thermistor_profile,
> +			      sizeof(dell_xps_ec_thermistor_profile));
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to set thermistor profile\n");
> +
> +	/* Get IIO channels for thermistors */
> +	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> +		ec->therm_channels[i] =
> +			devm_iio_channel_get(dev, dell_xps_ec_therms[i].name);
> +		if (IS_ERR(ec->therm_channels[i])) {
> +			ret = PTR_ERR(ec->therm_channels[i]);
> +			ec->therm_channels[i] = NULL;
> +			if (ret == -EPROBE_DEFER)
> +				return ret;
> +			dev_warn(dev, "Thermistor %s not available: %d\n",
> +				 dell_xps_ec_therms[i].name, ret);
> +		}
> +	}
> +
> +	/* Start periodic temperature reporting */
> +	ret = devm_delayed_work_autocancel(dev, &ec->temp_work,
> +					   dell_xps_ec_temp_work_fn);
> +	if (ret)
> +		return ret;
\n
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +	dev_dbg(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		jiffies_to_msecs(DELL_XPS_EC_TEMP_POLL_JIFFIES));
> +
> +	/* Request IRQ for EC events */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source still works
> + */
> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec = dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	return dell_xps_ec_suspend_cmd(ec, true);
> +}
> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions
> + * Without the resume signal, device would wake up but be forced back into
> + * suspend by EC within seconds
> + */
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +	return 0;
> +}
> +
> +static const struct of_device_id dell_xps_ec_of_match[] = {
> +	{ .compatible = "dell,xps13-9345-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
> +
> +static const struct i2c_device_id dell_xps_ec_i2c_id[] = {
> +	{ "dell-xps-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);
> +
> +static const struct dev_pm_ops dell_xps_ec_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(dell_xps_ec_suspend, dell_xps_ec_resume)
> +};
> +
> +static struct i2c_driver dell_xps_ec_driver = {
> +	.driver = {
> +		.name = "dell-xps-ec",
> +		.of_match_table = dell_xps_ec_of_match,
> +		.pm = &dell_xps_ec_pm_ops,
> +	},
> +	.probe = dell_xps_ec_probe,
> +	.id_table = dell_xps_ec_i2c_id,
> +};
> +module_i2c_driver(dell_xps_ec_driver);
> +
> +MODULE_AUTHOR("Aleksandrs Vinarskis <alex@vinarskis.com>");
> +MODULE_DESCRIPTION("Dell XPS 13 9345 Embedded Controller");
> +MODULE_LICENSE("GPL");
> 


