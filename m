Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30712C38BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 06:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgKYFgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 00:36:15 -0500
Received: from z5.mailgun.us ([104.130.96.5]:39775 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgKYFgO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 00:36:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606282574; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xc6AQ2BlPFKF4pdCQbur4GhZDY1bKsnq8i+dYz5snuw=;
 b=A4nh90sq7FZTqtsTiqMclebl0EvZU2vmFQk20D8oqhjvizDu4Ne80MuvaVC9z713qhMZQLyF
 arJXOHY/FU++Wk7CdFW5JpBMTjgyP98ZMY0sZuPKDuZBjK66q+ETgmDzFYA2Fu0dB0++vLJp
 R+lWo3DM2Vvsj1/IUQpH+KNFv9E=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fbded45d64ea0b70331d0f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 05:36:05
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32448C43467; Wed, 25 Nov 2020 05:36:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 208DCC433ED;
        Wed, 25 Nov 2020 05:36:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Nov 2020 11:06:02 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv9 3/8] iommu/arm-smmu: Move non-strict mode to use
 io_pgtable_domain_attr
In-Reply-To: <20201124213917.GA14252@willie-the-truck>
References: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <47f8e9760a7fba8b58ea89c9add96f5615f97014.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <20201124213917.GA14252@willie-the-truck>
Message-ID: <d4c7f311fbea91bb63d3b0eb164cf0d3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-25 03:09, Will Deacon wrote:
> On Mon, Nov 23, 2020 at 10:35:56PM +0530, Sai Prakash Ranjan wrote:
>> Now that we have a struct io_pgtable_domain_attr with quirks,
>> use that for non_strict mode as well thereby removing the need
>> for more members of arm_smmu_domain in the future.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 8 +++-----
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 -
>>  2 files changed, 3 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 4b9b10fe50ed..f56f266ebdf7 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -786,9 +786,6 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  			goto out_clear_smmu;
>>  	}
>> 
>> -	if (smmu_domain->non_strict)
>> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> -
>>  	if (smmu_domain->pgtbl_cfg.quirks)
>>  		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>> 
>> @@ -1527,7 +1524,8 @@ static int arm_smmu_domain_get_attr(struct 
>> iommu_domain *domain,
>>  	case IOMMU_DOMAIN_DMA:
>>  		switch (attr) {
>>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			*(int *)data = smmu_domain->non_strict;
>> +			if (smmu_domain->pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT)
>> +				*(int *)data = smmu_domain->pgtbl_cfg.quirks;
> 
> I still don't think this is right :(
> We need to set *data to 1 or 0 depending on whether or not the 
> non-strict
> quirk is set, i.e:
> 
> 	bool non_strict = smmu_domain->pgtbl_cfg.quirks & 
> IO_PGTABLE_QUIRK_NON_STRICT;
> 	*(int *)data = non_strict;
> 
> Your code above leaves *data uninitialised if non_strict is not set.

Ugh sorry, I should have looked at this some more before hurrying up
to post, will fix it.

> 
>>  			return 0;
>>  		default:
>>  			return -ENODEV;
>> @@ -1578,7 +1576,7 @@ static int arm_smmu_domain_set_attr(struct 
>> iommu_domain *domain,
>>  	case IOMMU_DOMAIN_DMA:
>>  		switch (attr) {
>>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			smmu_domain->non_strict = *(int *)data;
>> +			smmu_domain->pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> 
> And this is broken because if *data is 0, then you _set_ the quirk, 
> which is
> the opposite of what we should be doing.
> 
> In other words, although the implementation has changed, the semantics 
> have
> not.
> 

Will fix this to have quirk set only when *data = 1 and unset in case of 
0.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
