Return-Path: <linux-arm-msm+bounces-119063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v2wEKU1dVmpo4AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:01:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B445756BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:01:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="Ab/B3gqk";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119063-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119063-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E473230EF0BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0BA496916;
	Tue, 14 Jul 2026 15:56:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA394968E3;
	Tue, 14 Jul 2026 15:56:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044616; cv=none; b=pI4nWyT+tlHLaAoo/6rI/v5PWZ6clqwfRmSMgoUjAmND8xIB+wMfunW/FAfXqjCCVAlqSpIP9z7nhdsF6TzfNHytvG/eFaUeo4UHyKNBZ+F5aLiyW4/zZBbLDqJFtl5Ygi44O7CrX4Oj0JYekjRCA/na98c9LJwxF77NuNRAnT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044616; c=relaxed/simple;
	bh=jlDWHc+QVt9k7HkTB6RbuYA4PZFVH9ssR+9+zo3598c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKIzfxCQGC9q3ub5DxZIJvdYX8k8OBqUz49YhRQdoyWUQKSONb/+TIE9is27JwtfRxjR3CwrhruDkA1fRMWQHy5cwehqtoIXNwyUJkLaavb3lhAidH3M5jwECc8jRRcC6KQ3QkPF3Xa9OQqh7/ugpFEw6r3uIzqwXX/X8M+MNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ab/B3gqk; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15AFD339;
	Tue, 14 Jul 2026 08:56:50 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0223F915;
	Tue, 14 Jul 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044614; bh=jlDWHc+QVt9k7HkTB6RbuYA4PZFVH9ssR+9+zo3598c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ab/B3gqkVvxeSWk9m22lT60CDPxipry6LYSeJo0GLLNUbs9fhDIntrVO0Eu6x8Hgb
	 h5xnMvaElwcevH+hvea19kQ3qUVqh4vQ0tItMzcOFYaeLFcnomQj67iUdQiexxoY56
	 jljvdomivta+hgdUgK4J+9LD+PT4oDA5vK/4Rj94=
Message-ID: <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
Date: Tue, 14 Jul 2026 16:56:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
To: Pranjal Shrivastava <praan@google.com>, weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <alZCbIIuawpugaQe@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <alZCbIIuawpugaQe@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119063-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:xiongwm2026@163.com,m:will@kernel.org,m:joro@8bytes.org,m:benjamin.gaignard@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[robin.murphy@arm.com:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B445756BF9

On 14/07/2026 3:06 pm, Pranjal Shrivastava wrote:
> On Tue, Jul 14, 2026 at 02:09:26PM +0800, weimin xiong wrote:
>> Fix a few IOMMU driver lifetime and error-path issues found while
>> auditing fwnode-based device lookup and probe cleanup paths.
>>
>> The first three patches avoid deriving driver private data after
>> dropping the device reference returned by bus_find_device_by_fwnode().
>> They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
>> IOMMU lookup fails.
> 
> I'm not sure if that's really needed? All these drivers are doing is
> dropping the "extra" refcount (incremented by calling find_device)  back
> to the state *before* the fwnode function call. If you find that this
> put_device caused the count to drop to 0, I believe that's the real
> problem/bug. These fwnode functions are usually called in probe and the
> refcount shouldn't be 0 inside probe.
> 
> Could you share your observation / failing logs where this fails? Maybe
> something else is wrong with the system?

I don't have any trace of the original patches (thanks, Microsoft...) 
but looking on lore, yes these "lifetime" concerns are spurious; it's 
just a particular situation where due to the API, the drivers are taking 
a slightly roundabout route to look up their own valid device instance.

The IOMMU device must already have at least one held reference from way 
back in its device_initialise(), which will not be released unless and 
until device_unregister() is called (which is probably never for a 
non-hotpluggable platform device once it has been successfully created). 
If someone unregistered a platform device while it still had a driver 
bound, or the IOMMU driver could be unbound without unregistering the 
iommu_device through which its ->of_xlate or ->probe_device could be 
called, so many other things would be blowing up already that this would 
still be irrelevant.

Since 17de3f5fdd35 ("iommu: Retire bus ops") these lookups should also 
never return NULL for the same reasons, so do feel free to clean up 
those redundant checks if it helps make things a bit clearer.

Thanks,
Robin.

