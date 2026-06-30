Return-Path: <linux-arm-msm+bounces-115487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +TSPJdjcQ2pIkgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE16E5C9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:12:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZnLQpM+n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 696FF3040680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D96230DEBE;
	Tue, 30 Jun 2026 15:08:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C562FD69D;
	Tue, 30 Jun 2026 15:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832091; cv=none; b=DaXM1x072t8VWOcxE7ORN5zBVuIUbt8r/A560FtH1XsQKhyuQaQmlsX5rkEmRP+hDLqvNBV48YIDWpuoTp1Mgxp3qHFOF6lPrQJSqbGupwYOB003YVMNl3x1K5HYLsgQh1+nH/VncT3e/SQKh+vTW0gdFNAGwXSNQkDjhkW/OMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832091; c=relaxed/simple;
	bh=OGcPkWc1soeFEVmkBELYbLiMfikDO3ttg2XJuX788J4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mS4x+XiLgIZqTGDlnvOsvtm7Halx+LQiaNrM7AMD553ifq2w+vzpzMSbmUIaS1qsh/wdtU0Egcb8KkFu92K0+WmVCFyuwaZH9sODhuVmVbOx6GDTBitb4xmGk+mw0d9SAYoSvpzPnA/Xi4jUp9OCJIdAHQXWyOszo9to6nbWJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnLQpM+n; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782832090; x=1814368090;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OGcPkWc1soeFEVmkBELYbLiMfikDO3ttg2XJuX788J4=;
  b=ZnLQpM+ncwbmU3JBGo2rY4FBxtlkNlAoTxoYXSiDmj6tr6Xo5HDEXBBI
   oXIV/3fYiGjnxSw8sZvsBitF98j6V5K1AQSH/xBv3yFNh/tiPL5ceT8J8
   qNXOpQJIqffw4sw6FHrGMkE8j83Kd3hmhTmkK+h0kF60Uxdhw2SRL5fnt
   wYuiCQmomIJQ110EERy0B3fxRBdvimgg8UHNYnt1RHkxP0h2kmthDuUxu
   I/kYfF8BinF/Kd3UMLr1KDf5EnmRJjkK/YzBfNdDyaAlHdvBCKWPXRSkF
   5hRQFVAc8HP5ZCoaVi5HtW0889yYOpSxMs5n5xM3x/bTuGLW4T5G7HFBU
   w==;
X-CSE-ConnectionGUID: MEsZDjIFT/uAqQ4agJS8ig==
X-CSE-MsgGUID: KmYrzhAUSiCvYmfg2SvS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="100974941"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="100974941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:08:10 -0700
X-CSE-ConnectionGUID: PqXOsuj2TOCe2wZCvOHsNA==
X-CSE-MsgGUID: ndHBnCxmSVOjXhihV/cE+Q==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:08:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jun 2026 18:08:01 +0300 (EEST)
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
cc: sre@kernel.org, Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] platform: arm64:: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
In-Reply-To: <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
Message-ID: <e39ed593-09fb-4332-e038-4966be0f59e0@linux.intel.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com> <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115487-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09BE16E5C9C

On Tue, 30 Jun 2026, Daniel Lezcano wrote:

> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
> 
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694..35a6f8b0cb6b 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -67,6 +68,13 @@
>  #define T14S_EC_EVT_KEY_FN_F11			0x7a
>  #define T14S_EC_EVT_KEY_FN_G			0x7e
>  
> +#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
> +#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
> +#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
> +#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
> +#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
> +#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
> +
>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>  #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
>  
> @@ -93,9 +101,19 @@ struct t14s_ec_led_classdev {
>  	struct t14s_ec *ec;
>  };
>  
> +struct t14s_ec_hwmon_sys_thermx {
> +	const char *label;
> +	int reg;
> +};
> +
> +struct t14s_ec_hwmon {
> +	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
> +};
> +
>  struct t14s_ec {
>  	struct regmap *regmap;
>  	struct device *dev;
> +	struct t14s_ec_hwmon ec_hwmon;
>  	struct t14s_ec_led_classdev led_pwr_btn;
>  	struct t14s_ec_led_classdev led_chrg_orange;
>  	struct t14s_ec_led_classdev led_chrg_white;
> @@ -555,6 +573,112 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input ||
> +		    attr == hwmon_temp_label)
> +			return 0444;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				     u32 attr, int channel, const char **str)
> +{
> +	struct t14s_ec *ec = dev_get_drvdata(dev);

Add an empty line.

> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_label) {
> +			*str = ec->ec_hwmon.sys_thermx[channel].label;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct t14s_ec *ec = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input) {
> +			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
> +			if (ret)
> +				return ret;
> +			*val = value * 1000;

Does this literal relate to something from units.h?

> +
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;

Nit, style is inconsistent with the one above.

> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
> +	.is_visible = t14s_ec_hwmon_is_visible,
> +	.read = t14s_ec_hwmon_read,
> +	.read_string = t14s_ec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> +	};
> +
> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
> +						     ARRAY_SIZE(sys_thermx),
> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
> +	if (!ec->ec_hwmon.sys_thermx)
> +		return -ENOMEM;
> +
> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> +						   &t14s_ec_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(dev);
> +}
> +
>  static int t14s_ec_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -590,6 +714,10 @@ static int t14s_ec_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = t14s_ec_hwmon_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL,
>  					t14s_ec_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), ec);
> 

-- 
 i.


