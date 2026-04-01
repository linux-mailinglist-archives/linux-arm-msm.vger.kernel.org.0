Return-Path: <linux-arm-msm+bounces-101307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BLRL8P3zGl9YQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:47:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2F378C21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09A0C301FD77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EE33D3CF0;
	Wed,  1 Apr 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/jwtqm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F53CBE6C;
	Wed,  1 Apr 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040133; cv=none; b=AzyFwvRws2n0WSgWkfiVIqvhBwyMF1xa0mbgxpfgiVfXzqOqJRH68IlZEY0WOTVX+bzZi9TidSgBVI9RVNFQMt8lYlKcDEMehmKN4AikCw9oWMRZm92TMBFJWUyv66N/lr+DRVmaq7CAqDnRI60AwHGFJlV/b5zR/ssgJaESrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040133; c=relaxed/simple;
	bh=td5Zyn2cZ1HcsQZzinWnxhcyLl4JZqmQyOAiTjFP8kI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZHndYafOBB3WTES0aDjHxt+iuvxyMrtsUArZ74a4wXkXfqwKkP42xnuiBSuavSMDBkmfHKbxYgqNSsJ+clUXuK9krPS4/J+rGa5Ob5V0yJd+lHSLM53MV73u6fZA2bU2l5lxuYTG/r/WklJunCvcdEskXS9pZkFRAca+eYdCnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/jwtqm+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775040130; x=1806576130;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=td5Zyn2cZ1HcsQZzinWnxhcyLl4JZqmQyOAiTjFP8kI=;
  b=A/jwtqm+++xTdfho32+0DdUpeqe1dCdFvfTfqSkdx4cN3tBUdeUTDY3V
   t3acpCLRRsGTZghtDsD6XSBufDL+TnCvuXFuoSFgbN+qi29sEkBRyglNX
   sZW6Nk9TVgYdeXmWRgHWW2Dsq2IR0kOgGYKjtApqgmIkFxOx+UCbOC5Cv
   uYt6vuAbQKOS1G4kiUNR0ha6Oshtk67sJHjJyMXj8OZ38Dbk5DIb2vd58
   FQw4utjR7+2eIYHQaSBcD0xLWMUrKDDbBEn7K3jF4A+fQlfiSP+0MdxTf
   N81Cv0SvX+IK+nbpwYYyCfV/WC5d2/wAD89KmdHJOFKy5GFhu5n1b07AA
   w==;
X-CSE-ConnectionGUID: BGUn3WM+R3Wu1v5q8TkD8Q==
X-CSE-MsgGUID: VRc57v7TRjmhL12k+HRAQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75958280"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75958280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:42:09 -0700
X-CSE-ConnectionGUID: gw37JFDZRWSeHrcIocS7nw==
X-CSE-MsgGUID: njZXfq+8RP+NC7F/+l+7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225635111"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.192])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:42:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Apr 2026 13:41:56 +0300 (EEST)
To: Aleksandrs Vinarskis <alex@vinarskis.com>
cc: Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
    Tobias Heider <tobias.heider@canonical.com>, 
    Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
In-Reply-To: <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Message-ID: <c5f4fb9d-39bf-96a4-49cf-57c210e20a63@linux.intel.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com> <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101307-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid,vinarskis.com:email,bewilderbeest.net:email]
X-Rspamd-Queue-Id: DED2F378C21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026, Aleksandrs Vinarskis wrote:

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
>   appears to be thermistor constants readout, though its not obvious
>   what it used for.
> - According to ACPI's _DSM there is a method to readout fans' RPM.
> - Initial thermistor constants were sniffed from Windows, these can be
>   likely fine tuned for better cooling performance.
> - There is additional temperature reading that Windows sents to EC but
>   more rare than others, likely SoC T_j / TZ98 or TZ4. This is the only
>   thermal zone who's reading can exceed 115C without triggering thermal
>   shutdown.
> - Given similarities between 'tributo' and 'thena' platforms, including
>   EC i2c address, driver can be potentially extended to support both.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/platform/arm64/Kconfig       |  12 ++
>  drivers/platform/arm64/Makefile      |   1 +
>  drivers/platform/arm64/dell-xps-ec.c | 269 +++++++++++++++++++++++++++++++++++
>  4 files changed, 283 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe3f2fc4fbc087d8041f97708fbb93722f7d1882..f82c7f6c7377d3f2ff0ae1be263d854749541f03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
>  M:	Aleksandrs Vinarskis <alex@vinarskis.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> +F:	drivers/platform/arm64/dell-xps-ec.c
>  
>  DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>  M:	Zev Weiss <zev@bewilderbeest.net>
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a7cc50bdf1092da04153bc 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
>  	  laptop where this information is not properly exposed via the
>  	  standard ACPI devices.
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
>  config EC_HUAWEI_GAOKUN
>  	tristate "Huawei Matebook E Go Embedded Controller driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e67381cfc729bed1fdaaef 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,6 +6,7 @@
>  #
>  
>  obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_DELL_XPS)	+= dell-xps-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm64/dell-xps-ec.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ea8f30931d8b61acbb948d8617dde3681fb8de3
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/workqueue.h>
> +
> +#define DELL_XPS_EC_SUSPEND_CMD		0xb9
> +#define DELL_XPS_EC_SUSPEND_MSG_LEN	64
> +
> +#define DELL_XPS_EC_TEMP_CMD0		0xfb
> +#define DELL_XPS_EC_TEMP_CMD1		0x20
> +#define DELL_XPS_EC_TEMP_CMD3		0x02
> +#define DELL_XPS_EC_TEMP_MSG_LEN	6
> +#define DELL_XPS_EC_TEMP_INTERVAL_MS	100
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
> +	buf[4] = deci_celsius & 0xff;		/* LSB */
> +	buf[5] = (deci_celsius >> 8) & 0xff;	/* MSB */

This looks like a 16-bit field so it should be handled as such and with 
annotated endianness. One option would be to use a struct so you can use 
it as a field.

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

Add include for dev_err_ratelimited().

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
> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));

Add include for msecs_to_jiffies().

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
> +		ec->therm_channels[i] = devm_iio_channel_get(dev,
> +					dell_xps_ec_therms[i].name);
> +		if (IS_ERR(ec->therm_channels[i])) {

Add include.

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
> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
> +	dev_info(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		 DELL_XPS_EC_TEMP_INTERVAL_MS);
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
> + * - Ramp down the fans
> + * - Cut power to display/trackpad/keyboard/touch row
> + * - Periodically (?) power them back, such that wake-up source still works
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
> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
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
> 

-- 
 i.


