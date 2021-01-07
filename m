Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285112ECA89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 07:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbhAGGgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 01:36:10 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:63624 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAGGgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 01:36:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610001344; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zaE4+TJQvH3SFoKXVDoAMLGGx6TuByIHlqy6fvPhicY=;
 b=b2JKhaTVOoxe/JkgZe44wlPESIckT3clBXamHz/JZrXfIG0sDXpQhKfCZ6CjqqKZYoqmab3t
 Uj8/xpK4NjpjXjHZBawGiJJLWGmdAj1GLGQGmsCkux3bfBlVjrL/5QLnC4s8mydLL0g85qUM
 8VKc1rF4hZpUYvhzx+rrIp0IPnQ=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ff6aba5fc3778927efec518 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 06:35:17
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0492C43464; Thu,  7 Jan 2021 06:35:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEEB5C433C6;
        Thu,  7 Jan 2021 06:35:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 Jan 2021 12:05:15 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
In-Reply-To: <20210106115615.GA1763@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
 <20210106115615.GA1763@willie-the-truck>
Message-ID: <ce8981988c84ccb015ea04fc439e8949@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2021-01-06 17:26, Will Deacon wrote:
> On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
>> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
>> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> the memory type setting required for the non-coherent masters to use
>> system cache. Now that system cache support for GPU is added, we will
>> need to mark the memory as normal sys-cached for GPU to use system 
>> cache.
>> Without this, the system cache lines are not allocated for GPU. We use
>> the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page protection
>> flag as the flag cannot be exposed via DMA api because of no in-tree
>> users.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/io-pgtable-arm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index 7c9ea9d7874a..3fb7de8304a2 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct 
>> arm_lpae_io_pgtable *data,
>>  		else if (prot & IOMMU_CACHE)
>>  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
>> +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
>> +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>>  	}
> 
> drivers/iommu/io-pgtable.c currently documents this quirk as applying 
> only
> to the page-table walker. Given that we only have one user at the 
> moment,
> I think it's ok to change that, but please update the comment.
> 

Sure, how about this change in comment:

          * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the 
outer-cacheability
-        *      attributes set in the TCR for a non-coherent page-table 
walker.
+        *      attributes set in the TCR for a non-coherent page-table 
walker
+        *      and also to set the correct cacheability attributes to 
use an
+        *      outer level of cache for non-coherent masters.

> We also need to decide on whether we want to allow the quirk to be 
> passed
> if the coherency of the page-table walker differs from the DMA device, 
> since
> we have these combinations:
> 
> 	Coherent walker?	IOMMU_CACHE	IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
> 0:	N			0		0
> 1:	N			0		1
> 2:	N			1		0
> 3:	N			1		1
> 4:	Y			0		0
> 5:	Y			0		1
> 6:	Y			1		0
> 7:	Y			1		1
> 
> Some of them are obviously bogus, such as (7), but I don't know what to
> do about cases such as (3) and (5).
> 

I thought this was already decided when IOMMU_SYS_CACHE_ONLY prot flag 
was
added in this same location [1]. dma-coherent masters can use the normal
cached memory type to use the system cache and non dma-coherent masters
willing to use system cache should use normal sys-cached memory type 
with
this quirk.

[1] 
https://lore.kernel.org/linux-arm-msm/20190516093020.18028-1-vivek.gautam@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
