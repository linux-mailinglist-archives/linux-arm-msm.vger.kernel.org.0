Return-Path: <linux-arm-msm+bounces-115482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aQ+FNqrbQ2p+kQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:07:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 802356E5BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:07:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=S55tXRCS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115482-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115482-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F9BE3033711
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B8C2C21FD;
	Tue, 30 Jun 2026 15:04:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45127467F;
	Tue, 30 Jun 2026 15:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831847; cv=none; b=s/uZur13Emg+Du3/s0KzMYb+25rMCz6w8Cj4QWw/P5GfUkfqY/e2GOfYfBZcISxp152b7yuVHF3VewbihCvSdetDlxSDhEmlBTL2ExqpRIlYElVL2hAQYLfasv8ro0ijhK00mum2JDcjLoEpD45ZtW9HRD5KWrYUF57BXPaZNSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831847; c=relaxed/simple;
	bh=q2gs8fhSbQ7M94DtEUMGpwzbFqPH/whWIV1lYtJESg8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C+7O5fhFxVPSyyMrcwYg6q8vXFoSBs8GMeEeVMrMAmE/k67FEfXRV0Fh7CeL3WCw7FBPajh8yzF9a84rMxUpX6XRnQ8BZIawcP9dI+IV4WJWEBA87faURWPqq5ONMzPeN1dewCeddrGJR8RTZFY5sXFwZYeN7T7gFFX9zD5Iklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S55tXRCS; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782831846; x=1814367846;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q2gs8fhSbQ7M94DtEUMGpwzbFqPH/whWIV1lYtJESg8=;
  b=S55tXRCSCQ6yKQYU+gWGag5XQqzrRIKCLXvLHuNW/iJMUdG9OXfAmBON
   xX4uELWs3au89gzKpxwY9quTkFAiuzT8NbGWERKmAT6x22KUAC7Z6l15z
   7SKrZpo84dOybPsdHwiNNIjfLBNCcU6dYdsfMzBYb61NtqZL/IFGIDI8c
   qV2fyX9qKdio83ZkZBl1QyeI/UB6edVFb2Gr1RTzsDMCc+cwiAziSbVQN
   X9WlkQkfp6ExX3Mtrkt7fmyCeVOtYuIW5OfKKRHvuH6xpS3bLmyzcAGSW
   t06d55Bxvr1lsRdJ91J2kNdf6G4vM7Ogo8FB5Ym92/2FFomVTJOvgG4xO
   A==;
X-CSE-ConnectionGUID: 9uQ8wxpDQOamPtBOlvYf+Q==
X-CSE-MsgGUID: hu+jnbtmRzOOn5uOGUaNtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83421380"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83421380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:04:05 -0700
X-CSE-ConnectionGUID: lRP7Ps9aR/m8IaDp6e0p/A==
X-CSE-MsgGUID: ycS9TBMIQTy3VuTw8STAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248301948"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:04:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jun 2026 18:03:58 +0300 (EEST)
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
cc: sre@kernel.org, Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: lenovo-thinkpad-t14s: Wire EC
 thermal events to hwmon
In-Reply-To: <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
Message-ID: <ea082fea-3ab8-fa65-aa07-ce82567450f0@linux.intel.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com> <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115482-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 802356E5BAC

On Tue, 30 Jun 2026, Daniel Lezcano wrote:

> The EC generates thermal zone status change notifications for a subset
> of the exposed temperature sensors. Wire these EC events to the hwmon
> notification framework so userspace can be informed when a thermal alarm
> state changes.
> 
> Associate each hwmon temperature channel with its corresponding EC
> thermal event and emit hwmon_temp_alarm notifications through
> hwmon_notify_event() when the EC reports a thermal zone status change.
> 
> Also register thermal zones in the hwmon chip capabilities and keep a
> reference to the hwmon device to allow event propagation from the IRQ
> handler.
> 
> This allows userspace monitoring tools to receive thermal alarm
> updates without polling the sensors and gives the opportuniy to the

opportuniy -> opportunity 

> kernel to cool them down.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 78 ++++++++++++++-----
>  1 file changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 35a6f8b0cb6b..5fafb01a2b33 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -104,10 +104,13 @@ struct t14s_ec_led_classdev {
>  struct t14s_ec_hwmon_sys_thermx {
>  	const char *label;
>  	int reg;
> +	u8 event;
>  };
>  
>  struct t14s_ec_hwmon {
> +	struct device *dev;
>  	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
> +	size_t num_sys_thermx;
>  };
>  
>  struct t14s_ec {
> @@ -490,6 +493,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
>  	return input_register_device(ec->inputdev);
>  }
>  
> +static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
> +{
> +	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
> +		if (ec->ec_hwmon.sys_thermx[i].event != event)
> +			continue;
> +
> +		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
> +				   hwmon_temp_alarm, i);
> +
> +		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
> +			ec->ec_hwmon.sys_thermx[i].label);
> +	}
> +}
> +
>  static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  {
>  	struct t14s_ec *ec = data;
> @@ -539,13 +556,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  		dev_dbg(ec->dev, "LID closed\n");
>  		break;
>  	case T14S_EC_EVT_THERMAL_TZ40:
> -		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
> -		break;
>  	case T14S_EC_EVT_THERMAL_TZ42:
> -		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
> -		break;
>  	case T14S_EC_EVT_THERMAL_TZ39:
> -		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
> +		t14s_ec_hwmon_notify_event(ec, val);
>  		break;
>  	case T14S_EC_EVT_KEY_FN_G:
>  		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
> @@ -640,13 +653,14 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
>  };
>  
>  static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM),
>  	NULL
>  };
>  
> @@ -657,14 +671,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
>  
>  static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>  {
> -	struct device *dev;
>  	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> -		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> -		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> -		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> -		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> -		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> -		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> +		{
> +			.label = "soc",
> +			.reg = T14S_EC_SYS_THERM0,
> +			.event = T14S_EC_EVT_THERMAL_TZ39
> +		},
> +		{
> +			.label = "keyboard",
> +			.reg = T14S_EC_SYS_THERM1,
> +			.event = T14S_EC_EVT_THERMAL_TZ40
> +		},
> +		{
> +			.label = "base",
> +			.reg = T14S_EC_SYS_THERM2,
> +		},
> +		{
> +			.label = "charging",
> +			.reg = T14S_EC_SYS_THERM3,
> +			.event = T14S_EC_EVT_THERMAL_TZ42
> +		},
> +		{
> +			.label = "qtm",
> +			.reg = T14S_EC_SYS_THERM6
> +		},
> +		{
> +			.label = "ssd",
> +			.reg = T14S_EC_SYS_THERM7
> +		},
>  	};
>  
>  	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
> @@ -673,10 +707,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>  	if (!ec->ec_hwmon.sys_thermx)
>  		return -ENOMEM;
>  
> -	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> -						   &t14s_ec_chip_info, NULL);
> +	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);

Please add include.

> +
> +	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> +								&t14s_ec_chip_info, NULL);
>  
> -	return PTR_ERR_OR_ZERO(dev);
> +	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
>  }
>  
>  static int t14s_ec_probe(struct i2c_client *client)
> 

-- 
 i.


