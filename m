Return-Path: <linux-arm-msm+bounces-113982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NZy1KE0iOWpQnQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:53:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C49236AF3A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:53:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=kChLxFBp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8BB53009822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E322DB7BE;
	Mon, 22 Jun 2026 11:53:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACC215075;
	Mon, 22 Jun 2026 11:53:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129223; cv=none; b=g/s8bysawT33dKHd29IJkHsGg8q8tLLpCmBf4F8D8R6fXX3apL9R9UPzn4aJnS0FM9PQTNoKO+UHIljSBeSppOvNRVn793aSm0zKtWECKSiwS9Zr0wGUXHmhDz7kYO/UUbjksQhHm+7w/H5bei+BCDArOG17Umewwc7t3kqbFC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129223; c=relaxed/simple;
	bh=ZlY7LiDJbqgSVT9Nf/t6ZTWQFSkggeXli1VFF7vseCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFbeXM9+8j1uazT5p53rvuiI95BYSxLtwrxzCmpaoQu8F44Wcvg4laFkyjYckLJ7EE7x47RByRzaC1IzuZmK6mysTWB3gvOcIbOMq81WCNbKPkdyEQGyxUBHm68Au/gV/xQijneyMi53iZigZt10LQroUg++6vPM7E8D8GrBhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kChLxFBp; arc=none smtp.client-ip=91.218.175.170
Message-ID: <40ee213b-7aff-4bae-a779-8bbc8a12c307@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782129209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j16DQTDl5D56r3ONIjaiPaCsohlbcGnNLgUHsyy9OfM=;
	b=kChLxFBpZ/aXxvpKphfhZDi87fbZPV/mv6O7M9La61jklHQxG4sewcYOs6lcj73z/37KJD
	n34hVcnKDn7TBQxiR9ThC1vkekQ0piE2rhHc+G5bfKWPJG817Dv8fvxgKYa+iZE/5VUgNM
	SmiEyhpCd39pALAMq10RfpQdVs1fSX0=
Date: Mon, 22 Jun 2026 13:53:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 shumingf@realtek.com, srini@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
 <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
 <ajVpMYzqnSc0x/YB@opensource.cirrus.com>
 <d4c4ffb9-8ea6-4fb2-bcfe-1e2265c262fa@linux.dev>
 <ajkLfSeJDAG53/ZM@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ajkLfSeJDAG53/ZM@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113982-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,linux.dev:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C49236AF3A5

On 6/22/26 12:16, Charles Keepax wrote:
> On Mon, Jun 22, 2026 at 11:44:01AM +0200, Pierre-Louis Bossart wrote:
>> On 6/19/26 18:07, Charles Keepax wrote:
>>> On Fri, Jun 19, 2026 at 03:41:44PM +0200, Pierre-Louis Bossart wrote:
>>> The problem is mostly from the device side. This usually comes up
>>> from a device reset. So the driver does a reset, device drops off
>>> the bus, the device driver doesn't want to carry on until it
>>> knows the device is back on the bus. So naively one calls
>>> sdw_slave_wait_for_init() but there is nothing the ensures the
>>> core saw the bus disconnection before that call so it might
>>> immediately succeed, causing the driver to attempt to access a
>>> missing device.
>>>
>>> Yeah the fall of the bus is fast but so are processors, you need
>>> to actually ensure you can't shortcut the wait. Although typing
>>> this it occurs to me it probably doesn't have to be a wait one
>>> can probably just manually reinit the initalization_complete
>>> completion. But hopefully I will get this series ready soon and
>>> we can discuss on there.
>>
>> Don't we already have the interface to detect a device was UNATTACHED?
>> In theory the core will invoke the update_status() callback on
>> every status change. Each driver would use the information to
>> know when the UNATTACHED happened and likewise when the device
>> is enumerated/initialized again. So far most drivers just return
>> and do nothing when an UNATTACHED status is reported.
> 
> Yeah so update_status() is the normal mechanism for a driver to
> know if it becomes unattached AFAIK. Indeed what this is working
> up to is removing the code in cs42l43 that uses that to track if
> the device is attached. Although also now you can also use the
> intialization_complete completion for this purpose too, since it
> was moved to complete_all().
> 
>> The only thing we can't control at the moment is that when
>> a device reports as device0, the core will enumerate it and
>> attempt to initialize it. If additional time is needed prior
>> to the enumeration, we don't have the hooks for it - that would
>> not be quite standard behavior anyways.
> 
> Its not really about additional time, there is always time,
> events in the real world are not instant.
> 
> Thread 1 (driver)                 Thread 2 (core)
> -----------------                 ---------------
> Reset device
> call wait_for_init()
>                                   reinit_completion()
> 
> You need something to ensure that wait_for_init() doesn't skip
> the completion before the core calls reinit_completion(). Or are
> you saying there is already a mechanism that prevents this that I
> am missing?

Ah ok I see what you are trying to do.
I am afraid we don't have a mechanism to do what your Thread1 describes, but you could alternatively have a less sequential mechanism where you only do the reset, and then the rest of the initialization is done in the update_status() callback. Your Thread1 would be implemented in two disjoint parts with no need for waiting.

The completions were meant for the suspend/resume cases mostly. I am not sure we want to use completion or any other synchronization between core and peripheral driver, it'd be introducing even more races.

Anyways, best to follow-up with next series, my comments are speculative and probably somewhat off-track..

