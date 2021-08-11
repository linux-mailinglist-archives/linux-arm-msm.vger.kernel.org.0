Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B13E8F14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 12:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237180AbhHKKyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 06:54:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39318 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231143AbhHKKyC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 06:54:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628679219; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qlpDNvJjcRJ+wsfFRoWvzfj53K6Rwd/daWeirz+kr0U=;
 b=LXU6hHwZC3OUmDuVEQUOimwAGk4qgaabL/FRRGpFRJBpVjAjZ3ehA4b+MM3d9L28d5YKWMpl
 HFm6pleE+xRR7GXW+3NAttCKUpFaYoaLVPO87dsr6ie9BcBI1ArIg989aCSB3aaG9p0r+Q5F
 wSrzh6jg2mnhqhomCDmIZdr/faQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6113ac1e91487ad520c1b6f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 10:53:18
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D8FDC433F1; Wed, 11 Aug 2021 10:53:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C94CEC433F1;
        Wed, 11 Aug 2021 10:53:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 16:23:16 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
In-Reply-To: <20210811103011.GD4426@willie-the-truck>
References: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
 <20210811103011.GD4426@willie-the-truck>
Message-ID: <47c50d2010a0c8f9c21c20584fb8db5e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2021-08-11 16:00, Will Deacon wrote:
> On Wed, Aug 11, 2021 at 11:37:25AM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index f7da8953afbe..3904b598e0f9 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned 
>> long iova, size_t size,
>>  static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
>>  				     size_t granule, void *cookie)
>>  {
>> -	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> -				  ARM_SMMU_CB_S1_TLBIVA);
>> -	arm_smmu_tlb_sync_context(cookie);
>> +	struct arm_smmu_domain *smmu_domain = cookie;
>> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +
>> +	if (cfg->flush_walk_prefer_tlbiasid) {
>> +		arm_smmu_tlb_inv_context_s1(cookie);
> 
> Hmm, this introduces an unconditional wmb() if tlbiasid is preferred. I
> think that should be predicated on ARM_SMMU_FEAT_COHERENT_WALK like it 
> is
> for the by-VA ops. Worth doing as a separate patch.
> 

Ok I will keep this as-is for now then.

>> +	} else {
>> +		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> +					  ARM_SMMU_CB_S1_TLBIVA);
>> +		arm_smmu_tlb_sync_context(cookie);
>> +	}
>>  }
>> 
>>  static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather 
>> *gather,
>> @@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  		.iommu_dev	= smmu->dev,
>>  	};
>> 
>> -	if (!iommu_get_dma_strict(domain))
>> +	if (!iommu_get_dma_strict(domain)) {
>>  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> +		cfg->flush_walk_prefer_tlbiasid = true;
> 
> This is going to interact badly with Robin's series to allow dynamic
> transition to non-strict mode, as we don't have a mechanism to switch
> over to the by-ASID behaviour. Yes, it should _work_, but it's ugly 
> having
> different TLBI behaviour just because of the how the domain became
> non-strict.
> 
> Robin -- I think this originated from your idea at [1]. Any idea how to 
> make
> it work with your other series, or shall we drop this part for now and 
> leave
> the TLB invalidation behaviour the same for now?
> 
> Will
> 
> [1] 
> https://lore.kernel.org/r/da62ff1c-9b49-34d3-69a1-1a674e4a30f7@arm.com

Right, I think we can drop this non-strict change for now because it 
also makes
it a pain to backport it to 5.4/5.10 kernels because of large number of 
changes
in dma apis in recent kernels. I will let you and Robin decide if it's 
ok to
drop this change and introduce it later with a different patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
