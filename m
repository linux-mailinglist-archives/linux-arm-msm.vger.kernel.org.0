Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A5C3AFD9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 09:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhFVHNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 03:13:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59817 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhFVHNo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 03:13:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624345887; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zqN5xJ1RAKN2BdQ5f0mUHA/0kqF/3jw1gEsxh7IqgbQ=;
 b=NIxhwb9NsTqFIFQHlxLGzvCjxls3Krlh0QXYA5fG96xLGeWr09chPBmXLyyu1Pa3F1wx56zo
 0GE3lvpsM5u6WskgdR7gH6zaqX4gftEsQlUUBeG0kCdI9Kv+3j4W0RCGkxMnCBDgZuG8nAEr
 G7j4OoC4Cw+tmcpEH1gXCud03bI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d18d1c6ddc3305c414fa45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 07:11:24
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9B43C433D3; Tue, 22 Jun 2021 07:11:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA412C433F1;
        Tue, 22 Jun 2021 07:11:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Jun 2021 12:41:22 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use
 tlb_flush_all() for partial walk flush
In-Reply-To: <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
Message-ID: <a110e58e36af207be2bed04d1331832a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-06-21 21:15, Robin Murphy wrote:
> On 2021-06-18 03:51, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire context
>> with tlb_flush_all() callback in partial walk flush to improve unmap
>> performance on select few platforms where the cost of 
>> over-invalidation
>> is less than the unmap latency.
> 
> I still think this doesn't belong anywhere near io-pgtable at all.
> It's a driver-internal decision how exactly it implements a non-leaf
> invalidation, and that may be more complex than a predetermined
> boolean decision. For example, I've just realised for SMMUv3 we can't
> invalidate multiple levels of table at once with a range command,
> since if we assume the whole thing is mapped at worst-case page
> granularity we may fail to invalidate any parts which are mapped as
> intermediate-level blocks. If invalidating a 1GB region (with 4KB
> granule) means having to fall back to 256K non-range commands, we may
> not want to invalidate by VA then, even though doing so for a 2MB
> region is still optimal.
> 
> It's also quite feasible that drivers might want to do this for leaf
> invalidations too - if you don't like issuing 512 commands to
> invalidate 2MB, do you like issuing 511 commands to invalidate 2044KB?
> - and at that point the logic really has to be in the driver anyway.
> 

Ok I will move this to tlb_flush_walk() functions in the drivers. In the 
previous
v1 thread, you suggested to make the choice in iommu_get_dma_strict() 
test,
I assume you meant the test in iommu_dma_init_domain() with a flag or 
was it
the leaf driver(ex:arm-smmu.c) test of iommu_get_dma_strict() in 
init_domain?

I am still a bit confused on where this flag would be? Should this be a 
part
of struct iommu_domain?

Thanks,
Sai

> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 3 ++-
>>   include/linux/io-pgtable.h     | 5 +++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index 87def58e79b5..5d362f2214bd 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -768,7 +768,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg 
>> *cfg, void *cookie)
>>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>>   			    IO_PGTABLE_QUIRK_NON_STRICT |
>>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>> -			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
>> +			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
>> +			    IO_PGTABLE_QUIRK_TLB_INV_ALL))
>>   		return NULL;
>>     	data = arm_lpae_alloc_pgtable(cfg);
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index 4d40dfa75b55..45441592a0e6 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -82,6 +82,10 @@ struct io_pgtable_cfg {
>>   	 *
>>   	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
>>   	 *	attributes set in the TCR for a non-coherent page-table walker.
>> +	 *
>> +	 * IO_PGTABLE_QUIRK_TLB_INV_ALL: Use TLBIALL/TLBIASID to invalidate
>> +	 *	entire context for partial walk flush to increase unmap
>> +	 *	performance on select few platforms.
>>   	 */
>>   	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
>>   	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
>> @@ -89,6 +93,7 @@ struct io_pgtable_cfg {
>>   	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
>>   	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
>>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
>> +	#define IO_PGTABLE_QUIRK_TLB_INV_ALL	BIT(7)
>>   	unsigned long			quirks;
>>   	unsigned long			pgsize_bitmap;
>>   	unsigned int			ias;
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
