Return-Path: <linux-arm-msm+bounces-117552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r3uiNLEJTmpFCAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:26:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A036072323B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OyDKbu1x;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117552-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117552-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAF6A300E68E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F203F4824;
	Wed,  8 Jul 2026 08:24:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B483FCB0A;
	Wed,  8 Jul 2026 08:24:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499055; cv=none; b=DPrUbzWAFG68bdP7bmm7zAZOLIGX1lw2T7ykbE+9cdta3YJihLDwUppkgwfpXbnMrsLZRk0y0WI4yTklNBUlsWCxyxYqxG9jKkx5N7nzazL1i5F5Mzdgj4RfXkzht7NrVfWYqWZ5cVvJID1iuSgO4SA9gLZgp9ueJc+MIwGfOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499055; c=relaxed/simple;
	bh=IX94bXMbbRmaCb4/ACgbttjebsI/vycb4edIzQhXcAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX5wosphjbxrDxhMdjcrhTnm6RT/i8i7rPvMyjqDOnkqclcxKCNoyV20/yRs0ygddobdWdLEwJ3kjH7L1ZGMjAtyV8anWeXLty7sF0M46KeLjO6WqdgX4qomSuJRKBHfOVzEzDMv7YAPDbacC3S04K3Yhxhb1uaZyysDR/b1t2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyDKbu1x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C3B1F000E9;
	Wed,  8 Jul 2026 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499051;
	bh=oSaZCJYBE7oj/TxkN3HTMPHlDGDkR4nh/cfAgBXZdks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OyDKbu1x5TFbMMPPFO/5Z4ALeaWhDLAeaZpgFxdh9fzejmYg3KyucEwzX9NlFYfos
	 EXo/IFcVb8mZ4bKTBur+bTPOsOuzAtoOueP88RyOwRUlzKuX8p0nIDaS0QnXBrtRQs
	 qUqd73KMpymyYKhdwl8HgsWZHYtAUTx9CdbtQFxqnScOFk9M0YkTO+MUpKNYyUAh0M
	 tNI5JKBGy1f+SJbDzlE0JwGylrCI9lvYVikHn5q/F2uKoOJt/GM18S7koVeXNJm2hr
	 0PEKTIc2xf1eNQlYomTW5VwHDOK804SNCnkBShign96+NtvwrSxFmS/653iNAVIbX8
	 uftHwyrxzg9YQ==
Message-ID: <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Date: Wed, 8 Jul 2026 10:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
 manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117552-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A036072323B

On 08/07/2026 09:31, Daniel Lezcano wrote:
> On 7/8/26 08:30, Krzysztof Kozlowski wrote:
>> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>>> +	.is_visible = t14s_ec_hwmon_is_visible,
>>> +	.read = t14s_ec_hwmon_read,
>>> +	.read_string = t14s_ec_hwmon_read_string,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>> +	HWMON_CHANNEL_INFO(temp,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>> +	NULL
>>> +};
>>> +
>>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>>> +	.ops = &t14s_ec_hwmon_ops,
>>> +	.info = t14s_ec_hwmon_info,
>>> +};
>>> +
>>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>>> +{
>>> +	struct device *dev;
>>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>> +	};
>>> +
>>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>>> +						     ARRAY_SIZE(sys_thermx),
>>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>>> +	if (!ec->ec_hwmon.sys_thermx)
>>> +		return -ENOMEM;
>>> +
>>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>>> +						   &t14s_ec_chip_info, NULL);
>>
>> Last time I commented this looks like actual ABI break. You did not respond to
>> that, so I assume my finding was right, thus:
>> 1. binding is not correct (although driver should be fixed, not binding)
>> 2. the code still breaks users
> 
> Sorry I misunderstood it was a question expecting an answer but an 
> affirmation.
> 
> By ABI break do you mean:

Existing ABI contract is changed in an incompatible way, which has
observable effects as below:
> 
>   * new driver with old DT will fail ?

^^^ this one.


Best regards,
Krzysztof

