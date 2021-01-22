Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAA5300386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 13:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbhAVMyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 07:54:38 -0500
Received: from foss.arm.com ([217.140.110.172]:46288 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727533AbhAVMyd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 07:54:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD7511B3;
        Fri, 22 Jan 2021 04:53:41 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF2D3F66E;
        Fri, 22 Jan 2021 04:53:18 -0800 (PST)
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: Add support for driver IOMMU fault
 handlers
To:     Will Deacon <will@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
 <20201124191600.2051751-2-jcrouse@codeaurora.org>
 <20210122124125.GA24102@willie-the-truck>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8ba2f53d-abbf-af7f-07f6-48ad7f383a37@arm.com>
Date:   Fri, 22 Jan 2021 12:53:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122124125.GA24102@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-22 12:41, Will Deacon wrote:
> On Tue, Nov 24, 2020 at 12:15:58PM -0700, Jordan Crouse wrote:
>> Call report_iommu_fault() to allow upper-level drivers to register their
>> own fault handlers.
>>
>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> ---
>>
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0f28a8614da3..7fd18bbda8f5 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -427,6 +427,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>>   	int idx = smmu_domain->cfg.cbndx;
>> +	int ret;
>>   
>>   	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>>   	if (!(fsr & ARM_SMMU_FSR_FAULT))
>> @@ -436,11 +437,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>   	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>>   	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>>   
>> -	dev_err_ratelimited(smmu->dev,
>> -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>> +	ret = report_iommu_fault(domain, dev, iova,
>> +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>> +
>> +	if (ret == -ENOSYS)
>> +		dev_err_ratelimited(smmu->dev,
>> +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>>   			    fsr, iova, fsynr, cbfrsynra, idx);
>>   
>> -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>> +	/*
>> +	 * If the iommu fault returns an error (except -ENOSYS) then assume that
>> +	 * they will handle resuming on their own
>> +	 */
>> +	if (!ret || ret == -ENOSYS)
>> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> 
> Hmm, I don't grok this part. If the fault handler returned an error and
> we don't clear the FSR, won't we just re-take the irq immediately?

If we don't touch the FSR at all, yes. Even if we clear the fault 
indicator bits, the interrupt *might* remain asserted until a stalled 
transaction is actually resolved - that's that lovely IMP-DEF corner.

Robin.

> I think
> it would be better to do this unconditionally, and print the "Unhandled
> context fault" message for any non-zero value of ret.
> 
> Will
> 
