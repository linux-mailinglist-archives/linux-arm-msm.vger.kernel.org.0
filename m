Return-Path: <linux-arm-msm+bounces-118691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8kWtIs+pVGovpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC4749110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UWVi4JWa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1ADFC301090F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE2C3DC4D9;
	Mon, 13 Jul 2026 09:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332A3DC4CF;
	Mon, 13 Jul 2026 09:02:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933376; cv=none; b=Xh9wO1Zyq9GmqzxWl0QXs0gxmWA5+FwE4dNfqgWMkR/I1qYhpA805RYOnbPpna6LBkYzfifqUUeGv7pn17+JwOTTTa+aTzQVMdAz8FJzayCacpL27fsXVKkRavptshdgNzI6urDXTU2dgNiNvCBf9jSD3SfsuRgYPDbN8rbH2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933376; c=relaxed/simple;
	bh=hv+BmMFQI7uxtEd6z3IljolVMm1yVXKHdzUxd1mtwME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRpeQaLSHl0gC9M0aexKNFvjG/UssvrEmTOwEFwJVYUl9gZImRklcAXnN74+DruJCMBoHY1BPhKisiqlnUZV9UW1yX7/7q14qgTOSat6IeCj7GwSfiz5xqDdBK0ycpdu2JvGdC4qkb9eo072Y68G+6WJfIa7XOX5NLSGww/kihc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWVi4JWa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD941F000E9;
	Mon, 13 Jul 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933375;
	bh=LxyKwQaktf9OsCYvofn84dtPjQPJZPN114SMIhyidto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UWVi4JWaOponQfliAEHWGQ6JCVxBBXWS0ecLl7ObsdKTl6l1/juz1vSHtpFr77bML
	 Ju7ynySFyIMfXDDRhxKD/VUIctTc+Gy7Jk7ue2lGbGgCEiGOdBGrxvP0xXnMkVMUsE
	 m1MQPXixVhSjXlCxjm6HSFHbZR5BN2v7pg3HefuquEy+RK0atRc9tD5p7XNRGRJyRY
	 P83u3xaH2Wk5RTjcvxeAWRgoCpUxVolLGKBCuoYQXtZpoCTdtYGtDFtfTMDzBRy6OE
	 LIw/NExfkvzkQ2vqP/fwMH+rzrgY+qIJxtjm9UmzelMCF/CYZ+7UXoabw75Sg7H8sO
	 X3RX8Ip73U4Pw==
Message-ID: <4b70d37b-20c6-4216-b2a3-20f525d5ca93@kernel.org>
Date: Mon, 13 Jul 2026 10:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
 <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
 <f484f295-f454-4a19-bd3a-cd0db5d5f970@oss.qualcomm.com>
 <439a96fe-9fe1-4052-8e35-f442d7f857ad@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <439a96fe-9fe1-4052-8e35-f442d7f857ad@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-louis.bossart@linux.dev,m:srinivas.kandagatla@oss.qualcomm.com,m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15CC4749110



On 7/13/26 9:16 AM, Pierre-Louis Bossart wrote:
> On 7/13/26 09:28, Srinivas Kandagatla wrote:
>>
>> On 7/7/26 12:42 PM, Pierre-Louis Bossart wrote:
>>>> + *
>>>> + * Qualcomm WCD9378 audio codec driver.
>>>> + *
>>>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
>>> SDCA-style or SDCA-compliant?
>>
>> This codec is SDCA compliant and used on X2 Elite Windows laptops.
>>
>> This Codec can be configured in two modes, Mobile and Compute, and this
>> configuration is fused out.
> 
> How would you the drivers know which configuration is used? read from platform firmware?
We can read fuse registers to get this info. this is pretty much fixed
for each SoC, so the device tree description would also have to reflect
that topology.
> 
>> The codec IP is the same in both modes; what changes is how the
>> host-side SoundWire master setup.
>>
>> The codec itself has two modes of working.
>> 1. mobile mode
>> 	in this mode the codec is enumerated as two slaves(tx and rx) on two
>> different soundwire masters (tx and rx), like any other wcd codecs.
>>
>> 2. compute mode
>> 	In this mode, where the codec is enumerated as single slave on primary
>> soundwire master. Two Soundwire controllers(primary and dependent i.e tx
>> and rx) are aggregated and they act as one logical SoundWire bus with
>> four data lanes. The primary alone runs the SCP control channel,
>> enumerates the slave, drives the bus clock, the secondary follows. The
>> secondary drives some of the data lanes. There is a hardware sync
>> between these two. This is a new configuration on Qualcomm Soundwire
>> controllers called multi-master.
> 
> Very useful explanation, thanks.
> 
> In this configuration, I guess each lane is really dedicated to specific traffic?
Exactly, on X2 Elite lane 0 and 1 are for TX traffic and Lane 2 and Lane
3 are for RX traffic.

> In theory the LaneCtrl port register allows a stream to be dynamically moved to a different lane, but I am not sure how this would work in such a 'multi-master' implementation. Along the same lines, I'd guess the non-zero data lanes remain enabled while the clock toggles, even if there's no traffic?
This is pretty much fixed, frame shapping and lane mapping is hardcoded
in device tree.

> 
> Management and optimization of multi-lane systems isn't straightforward, I've heard two theories:
> - one where it's better to only enable multi-lane when the bandwidth on lane0 is exceeded.
> - and a second where it's better to spread traffic on separate lanes and lower the clock.
> It probably depends on a number of factors, and in the end on how codecs are wired to the different lanes...

This is case is pretty much fixed due to how the lanes are wiredup
internally.

--srini
> 
>> From Codec pov, its exactly same IP, I have now SDCA drivers working for
>> both playback and capture, so Am hoping that we could use the same SDCA
>> driver for both of these modes. I still have to give it a try on a
>> mobile platform to verify this.
>>
>> Am hoping to send a version of this driver sometime this week.
> 
> Sounds good.


