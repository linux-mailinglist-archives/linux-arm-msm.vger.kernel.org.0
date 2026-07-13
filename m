Return-Path: <linux-arm-msm+bounces-118689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dL6LIiGoVGq6owMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:56:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DB4748FF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=LyH8uZm0;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F29930C38CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368823CFF6F;
	Mon, 13 Jul 2026 08:49:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C1386453
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:49:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932599; cv=none; b=VdGgyu4ylUJHGoEpTqT8G4+jOmWbJnfkeZlJtnl6kv5qXZGED9UUfMX2U0eoO00DCMxb+pYQvQIRs0vNtajL/bAaFnUD1ThiPfeWcleOPkASF+A72cnVxDww3lJyeEZ7liSLbafSdxJnivDHWhq+Du3l5LMh4Ptwv+KDaT5eeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932599; c=relaxed/simple;
	bh=gH8HxnyO1XfTFN31IbMWye8x4y4V6avllUroChwnIIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWlBgrpekW3GimsKpGZpJSRWi7XfF9bHbdlhO25jVf7QUPd1NCz2rTLQeg7vgeQc/o4pA4Bqnuu+13gO5igFtRk7DZe3G0hjkaDL6M0vVo3a/TXVOMhtekBP9wubwgJPNW49cM12kBjvjtxEBnu7+GzvZqMTN82BcdzBSXz9qQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LyH8uZm0; arc=none smtp.client-ip=91.218.175.174
Message-ID: <439a96fe-9fe1-4052-8e35-f442d7f857ad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783932595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8JpgXig8cb4Ro4duhCCMtU6KWJD7cfDJhsUqvJKuBE=;
	b=LyH8uZm0UrcuCtT+yq7yddsVnusoUVzMBdRUyZE2sDGpaZwLIvEVxojmDufKJabGjG1m8v
	9UJNWuJj16750I0N1XR554fC6ZX+dPakkxObwD7MkOzppdH9dzYjTu0yq/HzSY/SPPO5Hm
	kGTUeTSHkEovVwEdMLcF7FJVIAzWeiU=
Date: Mon, 13 Jul 2026 10:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <f484f295-f454-4a19-bd3a-cd0db5d5f970@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118689-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3DB4748FF4

On 7/13/26 09:28, Srinivas Kandagatla wrote:
> 
> On 7/7/26 12:42 PM, Pierre-Louis Bossart wrote:
>>> + *
>>> + * Qualcomm WCD9378 audio codec driver.
>>> + *
>>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
>> SDCA-style or SDCA-compliant?
> 
> This codec is SDCA compliant and used on X2 Elite Windows laptops.
> 
> This Codec can be configured in two modes, Mobile and Compute, and this
> configuration is fused out.

How would you the drivers know which configuration is used? read from platform firmware?

> The codec IP is the same in both modes; what changes is how the
> host-side SoundWire master setup.
> 
> The codec itself has two modes of working.
> 1. mobile mode
> 	in this mode the codec is enumerated as two slaves(tx and rx) on two
> different soundwire masters (tx and rx), like any other wcd codecs.
> 
> 2. compute mode
> 	In this mode, where the codec is enumerated as single slave on primary
> soundwire master. Two Soundwire controllers(primary and dependent i.e tx
> and rx) are aggregated and they act as one logical SoundWire bus with
> four data lanes. The primary alone runs the SCP control channel,
> enumerates the slave, drives the bus clock, the secondary follows. The
> secondary drives some of the data lanes. There is a hardware sync
> between these two. This is a new configuration on Qualcomm Soundwire
> controllers called multi-master.

Very useful explanation, thanks.

In this configuration, I guess each lane is really dedicated to specific traffic?
In theory the LaneCtrl port register allows a stream to be dynamically moved to a different lane, but I am not sure how this would work in such a 'multi-master' implementation. Along the same lines, I'd guess the non-zero data lanes remain enabled while the clock toggles, even if there's no traffic?

Management and optimization of multi-lane systems isn't straightforward, I've heard two theories:
- one where it's better to only enable multi-lane when the bandwidth on lane0 is exceeded.
- and a second where it's better to spread traffic on separate lanes and lower the clock.
It probably depends on a number of factors, and in the end on how codecs are wired to the different lanes...

> From Codec pov, its exactly same IP, I have now SDCA drivers working for
> both playback and capture, so Am hoping that we could use the same SDCA
> driver for both of these modes. I still have to give it a try on a
> mobile platform to verify this.
> 
> Am hoping to send a version of this driver sometime this week.

Sounds good.

