Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612FF32B2C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242244AbhCCBPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:43 -0500
Received: from foss.arm.com ([217.140.110.172]:50850 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350767AbhCBMub (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 07:50:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 858D212FC;
        Tue,  2 Mar 2021 04:17:30 -0800 (PST)
Received: from [10.57.48.219] (unknown [10.57.48.219])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C8C3F766;
        Tue,  2 Mar 2021 04:17:29 -0800 (PST)
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Add support for driver IOMMU fault
 handlers
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20210225175135.91922-1-jcrouse@codeaurora.org>
 <20210225175135.91922-2-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <2d3c7595-0186-7231-96dc-ae52414480ee@arm.com>
Date:   Tue, 2 Mar 2021 12:17:24 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225175135.91922-2-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-25 17:51, Jordan Crouse wrote:
> Call report_iommu_fault() to allow upper-level drivers to register their
> own fault handlers.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfde6a61..0f3a9b5f3284 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   	int idx = smmu_domain->cfg.cbndx;
> +	int ret;
>   
>   	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>   	if (!(fsr & ARM_SMMU_FSR_FAULT))
> @@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>   	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>   
> -	dev_err_ratelimited(smmu->dev,
> -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> +	ret = report_iommu_fault(domain, dev, iova,

Beware that "dev" here is not a struct device, so this isn't right. I'm 
not entirely sure what we *should* be passing here, since we can't 
easily attribute a context fault to a specific client device, and 
passing the IOMMU device seems a bit dubious too, so maybe just NULL?

Robin.

> +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +
> +	if (ret == -ENOSYS)
> +		dev_err_ratelimited(smmu->dev,
> +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>   			    fsr, iova, fsynr, cbfrsynra, idx);
>   
>   	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> 
