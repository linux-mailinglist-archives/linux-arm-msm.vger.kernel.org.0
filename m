Return-Path: <linux-arm-msm+bounces-30049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E79648B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7051E1F25D34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70C31B0118;
	Thu, 29 Aug 2024 14:39:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA881B143B;
	Thu, 29 Aug 2024 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724942393; cv=none; b=OUXXaEcchNlB6RPjB/09NR+56RWIu8UwwP8HpSProgdFbBv4BJuG2uJDKXCqn4xNco4u8xgfxNH5B0xgpl2MvexXuPZ5PpiMXovQIgX9PC7hh5amMvBjdbHFquHP24h/CnFenp9Pk9y8By1tSfCodluPt9FtlGgAL33niIjrH4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724942393; c=relaxed/simple;
	bh=HBjPQ7htFePlvgPXIVgV4omFwKv/gvrtPNO0yF79XDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyDb7VF9tlOmMncNfkW1Iz6jkIky5gO9/t2/OkkMiwTfY8lm/juI39wJT4L2SmfXWLJ4XHEHwnY9oL3GmEENMs94dAmBX9U8utxSH2WSCpjhC+vjVpXHp51KmwKAwpcH4DzzuX+Ha5ve23LGqtLe/kxPiPuNxnBF05sWNMU76a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F9BDA7;
	Thu, 29 Aug 2024 07:40:16 -0700 (PDT)
Received: from [10.57.16.245] (unknown [10.57.16.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A801D3F66E;
	Thu, 29 Aug 2024 07:39:13 -0700 (PDT)
Message-ID: <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
Date: Thu, 29 Aug 2024 15:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
To: neil.armstrong@linaro.org, Baruch Siach <baruch@tkos.co.il>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?=
 <petr@tesarici.cz>, Ramon Fried <ramon@neureality.ai>,
 Elad Nachman <enachman@marvell.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1723359916.git.baruch@tkos.co.il>
 <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
 <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-08-29 2:42 pm, Neil Armstrong wrote:
> Hi,
> 
> On 11/08/2024 09:09, Baruch Siach wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>>
>> Hardware DMA limit might not be power of 2. When RAM range starts above
>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>> can not encode this limit.
>>
>> Use plain address for DMA zone limit.
>>
>> Since DMA zone can now potentially span beyond 4GB physical limit of
>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>>   arch/powerpc/mm/mem.c      |  5 ++++-
>>   arch/s390/mm/init.c        |  2 +-
>>   include/linux/dma-direct.h |  2 +-
>>   kernel/dma/direct.c        |  6 +++---
>>   kernel/dma/pool.c          |  4 ++--
>>   kernel/dma/swiotlb.c       |  6 +++---
>>   7 files changed, 29 insertions(+), 26 deletions(-)
>>
> 
> <snip>
> 
> This change breaks the Qualcomm SM8550-HDK boot since next-20240826.
> It doesn't affect SM8550-QRD or other similar SoCs like SM8650 or SM8450.
> The last CI run on next-20240828 can be found at:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/100936
> 
> SM8550-HDK boot log:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/165617
> 
[...]

Yeah, a 35-bit ZONE_DMA is sure to make stuff go wrong:

> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000080000000-0x0000000affffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty

Compared to before:

[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]

This'll be because the SoC DT is describing a general non-restrictive range:
		dma-ranges = <0 0 0 0 0x10 0>;

Which proves we need more information than 
{acpi,of}_dma_get_max_cpu_address() are currently able to give us, 
because what zone_dma_limit actually wants to be is the *minimum* of the 
lowest highest CPU address of any DMA range, and the lowest CPU address 
of any DMA range + 2^32. I was thinking it had all ended up looking a 
bit too easy... :)

I think v1 of the fix[1] might actually work out for this, albeit still 
for the wrong reasons - if so, I concede that maybe at this point it 
might be safest to go back to that one as a quick short-term fix (with a 
big fat comment to say so) rather than try to rush the proper solution 
or revert everything.

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/731d204f5f556ad61bbaf004b1d984f83c90b4f5.1724748249.git.baruch@tkos.co.il/

