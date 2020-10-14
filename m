Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27D128E397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 17:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgJNPxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 11:53:00 -0400
Received: from foss.arm.com ([217.140.110.172]:52200 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgJNPw7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 11:52:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21EBFD6E;
        Wed, 14 Oct 2020 08:52:59 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2A23F71F;
        Wed, 14 Oct 2020 08:52:57 -0700 (PDT)
Subject: Re: [PATCH 4/8] iommu/arm-smmu: Support test_smr_masks implementation
 detail deviation
To:     kholk11@gmail.com, will@kernel.org
Cc:     joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926130004.13528-1-kholk11@gmail.com>
 <20200926130004.13528-5-kholk11@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <00afa417-d897-22ee-25a5-cba1bf96c669@arm.com>
Date:   Wed, 14 Oct 2020 16:52:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200926130004.13528-5-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-26 14:00, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> At least some Qualcomm SoCs do need to override the function
> arm_smmu_test_smr_masks entirely: add a test_smr_masks function
> to the implementation details structure and call it properly.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 ++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 09c42af9f31e..446a78dde9cd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -977,6 +977,12 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
>   
>   	if (!smmu->smrs)
>   		return;
> +
> +	if (smmu->impl && smmu->impl->test_smr_masks) {
> +		smmu->impl->test_smr_masks(smmu);

Meh, this doesn't need a special hook - just have ->cfg_probe() 
initialise your masks early and bail out here if smr_mask_mask is 
already set. You could actually bypass this test as-is by marking all 
your SMR entries as valid, but that's likely to cause far more problems 
elsewhere than it solves here ;)

Robin.

> +		return;
> +	}
> +
>   	/*
>   	 * If we've had to accommodate firmware memory regions, we may
>   	 * have live SMRs by now; tread carefully...
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d890a4a968e8..2cd3d126f675 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -387,6 +387,7 @@ struct arm_smmu_impl {
>   	int (*cfg_probe)(struct arm_smmu_device *smmu);
>   	int (*reset)(struct arm_smmu_device *smmu);
>   	int (*init_context)(struct arm_smmu_domain *smmu_domain);
> +	void (*test_smr_masks)(struct arm_smmu_device *smmu);
>   	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>   			 int status);
>   	int (*def_domain_type)(struct device *dev);
> 
