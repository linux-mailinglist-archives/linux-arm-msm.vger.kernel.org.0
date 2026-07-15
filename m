Return-Path: <linux-arm-msm+bounces-119235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JNXFMTh6V2qVOwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:16:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28475DFED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=k9B32DcQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2C6A307C982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEDC435A8A;
	Wed, 15 Jul 2026 12:14:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351F7436BEF;
	Wed, 15 Jul 2026 12:14:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117664; cv=none; b=hvPnFLjv/Fy5k7MO/JD5VkR/CItMz/qj1g5RgSzeutZZ3t/HrUQSksBcSTWXBPit9JRNUlK+4CDgjuNAxe6VZReOhuIcUfxqrih195Su7LTmX5KTWoSLH0ucP+eq1byeEqKFl/fa8cQUR89zEM6oy1PQ0V71irbUWMPnILR8oJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117664; c=relaxed/simple;
	bh=Oo24supxqHGQF/xR33i1jri7lLQABYTzlem84t/Uj/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuoyatTEI59cJPr1oB2qUJP/CIEo+Q70DWKkhhbp1MGiQ/kW5y69CEyYNktKNWF/hesaCbutqIs3aDzJEuDc8nnOO/a2o5bTPAUSPTl5IC1UUZrPiwCW4GLolfpAzqXemAlayYyJNDkh4aW4PESAsJCNoCh0CXvL+c8f2AfYo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k9B32DcQ; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DCBC2F;
	Wed, 15 Jul 2026 05:14:17 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29C2F3F7B4;
	Wed, 15 Jul 2026 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784117661; bh=Oo24supxqHGQF/xR33i1jri7lLQABYTzlem84t/Uj/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k9B32DcQJrkF5e4lot+BTUtvQC5lX8mMTfzEwECqdCFlZu8Rdhq4wGKx62YjotCNz
	 CSr6EVSxOhQzpJVOGdeOFGSQTyp5VHbWYK1ZdrL6PZnP8c8sapp2kujSgyyotgXdgN
	 AH33LRK42Nfo4NT0qt9RVcYAoWh7fLTcTyap/j6I=
Message-ID: <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
Date: Wed, 15 Jul 2026 13:14:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ald3CuddY6I7gml1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:jgg@nvidia.com,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B28475DFED

On 15/07/2026 1:03 pm, Will Deacon wrote:
> On Wed, Jul 15, 2026 at 08:39:13AM -0300, Jason Gunthorpe wrote:
>> On Wed, Jul 15, 2026 at 11:25:42AM +0530, Vijayanand Jitta wrote:
>>> On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
>>>> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
>>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>>
>>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>>> When a set of consecutive PTEs map a naturally-aligned contiguous block
>>>>> of memory, the CONT bit can be set on all entries in the group to allow
>>>>> the hardware to combine them into a single TLB entry, improving TLB
>>>>> utilization.
>>>>>
>>>>> The contiguous hint sizes per granule are:
>>>>>
>>>>>    Page Size | CONT PTE |  PMD  | CONT PMD
>>>>>    ----------+----------+-------+---------
>>>>>        4K    |   64K    |   2M  |   32M
>>>>>       16K    |    2M    |  32M  |    1G
>>>>>       64K    |    2M    | 512M  |   16G
>>>>
>>>> My series to convert smmuv3 to the iommupt takes care of this and
>>>> supports all the orders too. I'd rather we move forward with that then
>>>> try to patch up this.
>>>
>>> Thanks for details, I have gone through your series. As this patch
>>> targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
>>> Apple DART, etc.), not just SMMUv3. I think there will still be value in
>>> this patch for the other users.
>>
>> If other users care they should also be converted to iommupt, there
>> are many benefits to this besides just cont support.
> 
> I really have no interest in maintaining two copies of the page-table
> code, so I agree that we should convert users of the architectural (long
> descriptor) page-table format over to iommupt with a view to removing
> the io-pgtable implementation eventually. If you want two parallel
> implementations, then one should really be in rust :)
> 
>  From what I can tell, the fiddly parts for iommupt will be:
> 
>    1. Hardware bugs / quirks. Some of the simpler ones could probably be
>       handled but for the more invasive stuff like the Mali format
>       format, io-pgtable will probably need to hang around. Perhaps
>       it becomes io-pgtable-mali.c?
> 
>    2. The pKVM work from Mostafa. We'll probably end up with something
>       separate at EL2 for this (ideally, just reusing the CPU page-table
>       code when it learns about BBML3).
> 
>    3. Non-coherent walkers, although I think this might actually be fine
>       because x86 needs it anyway?
> 
> So, for now, I wouldn't require new drivers to use iommupt but I'm not
> particularly keen about teaching io-pgtable new architectural tricks
> either.

Conversely though, I really wouldn't want to have to maintain arm-smmu 
supporting two completely different pagetable APIs simultaneously either :/

Thanks,
Robin.

