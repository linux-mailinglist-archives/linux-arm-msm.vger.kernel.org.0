Return-Path: <linux-arm-msm+bounces-113057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l9q4H84fL2ox8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E337E682541
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="WFg/0a+3";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113057-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113057-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A5153007659
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E6D30D41C;
	Sun, 14 Jun 2026 21:40:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95929D267;
	Sun, 14 Jun 2026 21:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473225; cv=none; b=j7FB8PP41sib02pfkaCkLsKs8fywgGPKQLaHSIN7UVc14EcCS1yv5/Sqf+v5U1gAKjnAgY5cHOVyJ3m9hxroX1cHNfBJN69Lpsfvqde2dT562QtE6QvjbfXRVJS1IPgVTuZZGMAnUN3EUyhJaKPydUje8TTzPmgXno3/yy8abyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473225; c=relaxed/simple;
	bh=YeWt6ilz2rTfTgSZrPbRsBD3V7K33gUGcwAcwFD8V48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjzkq8nc/vnv/yeV6ZYIW+7Cp0rBtxyiqDnbAh90vEbPIdL0EaRFUjMLKmzl+B0EugqmxuFB/VnDF914jcOsSkqDljm9OROK4qoukPhHb3h9sSB/BkXq+mcnumwtkbt6PvTrfRI8B1VWnnJBEyOSto796D6VjVDSKvnlGxHPPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFg/0a+3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257931F000E9;
	Sun, 14 Jun 2026 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781473224;
	bh=czSpGHnu/6m54nRewROulWLRKswPRXBxOoj+wn+X2Lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WFg/0a+32MgufWVU3hcyVAxi9AN82mhg6sPIMjnNICr/iRDcSmZ2rzbIigvwjFcyI
	 seQ/NzX5YI8tJH2Exm/mkYV0F5KC/CfEVtck/7Yid/RIxjPeEEG6qNZTKkuofzhc1Z
	 jCZR27tg8wCmLB9SFpFh31GBSqT+0/llS5MaFyX5wrTZOrQ4CLttoQjw6cnBXKBam0
	 nU1wnTEtA0y+eBssDAd5Eg/4saei8RGF42F9cjWx9jSVGPZxdsq9TGWWVHgYwFOL6t
	 cb8igZaAz5JVR5Ft1yQT7glzs1f0GxDfeEHKsC/YVFfsUfG+DJGKyYqhxMYOGh2nUk
	 jw+UZhOtAoC1g==
Message-ID: <04c39f6d-e01b-4336-b077-c744f8a85c07@kernel.org>
Date: Sun, 14 Jun 2026 22:40:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
 <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
 <DJ654FFH3T09.1VKAT493JUWP3@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <DJ654FFH3T09.1VKAT493JUWP3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:srinivas.kandagatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:lumag@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[fairphone.com,oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113057-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,fairphone.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E337E682541



On 6/11/26 11:16 AM, Luca Weiss wrote:
> On Wed Jun 10, 2026 at 12:52 PM CEST, Srinivas Kandagatla wrote:
>>
>> Thanks Luca for the patch,
>>
>> On 5/26/26 4:03 PM, Luca Weiss wrote:
>>> According to both the static definition in downstream...
>>>
>>>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>>>   #define BOLERO_VERSION_2_0 0x0004)
>>>
>>> and the runtime detection:
>>>
>>>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>>>   CDC_VA_TOP_CSR_CORE_ID_1=0xf
>>>
>>> SC7280 has LPASS Codec Version 2.0 and not, as declared with
>>> sm8250_va_data LPASS_CODEC_VERSION_1_0.
>>>
>>> Create new va_macro_data with .version not set to use the runtime
>>> detection and correctly get .version = LPASS_CODEC_VERSION_2_0.
>>>
>>> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")
>>
>> Can you help me understand if this change was fixing any issue, if so
>> can you pl add CC stable
> 
> I'm pretty sure that just came around because I was looking at the
> different parts of the audio stack and trying to figure out if there's
> something wrong somewhere, and how the different versions floating
> around downstream & upstream & documentation match up.
> 
> I'm not aware of a situation where this change makes a difference -
> apart from the dev_dbg() print.
> 
>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> I'm fairly confident this is correct, but please someone double check
>>> this if they can.
>>
>> Yes, you are correct, this is actually Bolero 1.1.0 Version where things
>> have changed in codec. if you read major number it will be 1
>> This has been artificially tagged as 2.0 in the driver.
>> So the change that you are doing is correct.
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Thanks a lot for checking! Opens even more questions in my mind, why
> 1.1.0 == 2.0 but somebody somewhere decided that at some point I guess.

I have no idea why this was done, Looking at the downstream drivers, am
guessing that there were two different variants of lpass codec drivers
in downstream one is less than v1 and other one is v2. 1.1.0 is
supported in v2 driver.

--srini
> 
> Regards
> Luca


