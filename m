Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31822928B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 16:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgJSOCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 10:02:11 -0400
Received: from foss.arm.com ([217.140.110.172]:58170 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbgJSOCK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 10:02:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D943FD6E;
        Mon, 19 Oct 2020 07:02:09 -0700 (PDT)
Received: from [10.57.19.34] (unknown [10.57.19.34])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2C043F66E;
        Mon, 19 Oct 2020 07:02:07 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 1/3] iommu/arm-smmu: Allow implementation specific
 write_s2cr
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
 <20201017043907.2656013-2-bjorn.andersson@linaro.org>
Message-ID: <e5ee0dad-3b52-3bf2-a473-f624415cdf67@arm.com>
Date:   Mon, 19 Oct 2020 15:02:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201017043907.2656013-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-17 05:39, Bjorn Andersson wrote:
> The firmware found in some Qualcomm platforms intercepts writes to the
> S2CR register in order to replace the BYPASS type with FAULT. Further
> more it treats faults at this level as catastrophic and restarts the
> device.
> 
> Add support for providing implementation specific versions of the S2CR
> write function, to allow the Qualcomm driver to work around this
> behavior.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - New patch
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 22 ++++++++++++++--------
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>   2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index dad7fa86fbd4..ed3f0428c110 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -929,14 +929,20 @@ static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
>   static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
>   {
>   	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
> -	u32 reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, s2cr->type) |
> -		  FIELD_PREP(ARM_SMMU_S2CR_CBNDX, s2cr->cbndx) |
> -		  FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, s2cr->privcfg);
> -
> -	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
> -	    smmu->smrs[idx].valid)
> -		reg |= ARM_SMMU_S2CR_EXIDVALID;
> -	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_S2CR(idx), reg);
> +	u32 reg;
> +
> +	if (smmu->impl && smmu->impl->write_s2cr) {
> +		smmu->impl->write_s2cr(smmu, idx);

Nit: just add an early return here to avoid reindenting the whole 
function. Otherwise this looks like a reasonable level of abstraction to 
me - we'll still have plenty of flexibility to adjust things in future 
if necessary.

With that change,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +	} else {
> +		reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, s2cr->type) |
> +		      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, s2cr->cbndx) |
> +		      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, s2cr->privcfg);
> +
> +		if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
> +		    smmu->smrs[idx].valid)
> +			reg |= ARM_SMMU_S2CR_EXIDVALID;
> +		arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_S2CR(idx), reg);
> +	}
>   }
>   
>   static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 1a746476927c..b71647eaa319 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -436,6 +436,7 @@ struct arm_smmu_impl {
>   	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
>   				  struct arm_smmu_device *smmu,
>   				  struct device *dev, int start);
> +	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>   };
>   
>   #define INVALID_SMENDX			-1
> 
