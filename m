Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494BA261B12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 20:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgIHSnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 14:43:31 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:59140
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731376AbgIHSmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 14:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599590527;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=EiaJlKj7Ne8nGiRMenHLunM8+6hemqqH4NYaF6fj2gk=;
        b=UXjpc4d3J4kdrkvJMUMlEJ7v6iyaAhnMQT8+aKKfjBTPeSNMmeGWiul22/4ROW8J
        gO/tROv+DAg98gxSmyRftIdzLzrIBe3nGYyPHdeIjhsACivQYxOs6UmOWOEBQi1ZE0+
        dpfyKMXU06sfSVcZ3HQ08MIeM7piIERdMsbXXEDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599590526;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=EiaJlKj7Ne8nGiRMenHLunM8+6hemqqH4NYaF6fj2gk=;
        b=lS++G9P7DVZfXsH+OtbtsMcJSUtpj6VVt9YtSHm3NHvZCB9A0Ufn2dvG0cGEoDMa
        /gThhYcGGr1eaZBXh9/v5tUhO8pylgtR47ASa2DiTMSFa24/aglQuNLruSD2iZa7j8C
        eHabgsDBLgIob5gNlgh0dShnQmqJUbXG6EDJaB6I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B5B5C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 8 Sep 2020 18:42:06 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] iommu/arm-smmu: Refactor context bank allocation
Message-ID: <010101746f066e2c-c8c73cb8-a6ca-4a64-922f-16064f24a55b-000000@us-west-2.amazonses.com>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904155513.282067-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.08-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 04, 2020 at 03:55:06PM +0000, Bjorn Andersson wrote:
> Extract the conditional invocation of the platform defined
> alloc_context_bank() to a separate function to keep
> arm_smmu_init_domain_context() cleaner.
> 
> Instead pass a reference to the arm_smmu_device as parameter to the
> call. Also remove the count parameter, as this can be read from the
> newly passed object.
> 
> This allows us to not assign smmu_domain->smmu before attempting to
> allocate the context bank and as such we don't need to roll back this
> assignment on failure.

Much nicer.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Note that this series applies ontop of:
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
> 
> This could either go on its own, or be squashed with "[PATCH v16 14/20]
> iommu/arm-smmu: Prepare for the adreno-smmu implementation" from Rob's series.
> 
> Changes since v2:
> - New patch
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  6 ++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 23 ++++++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
>  3 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 2aa6249050ff..0663d7d26908 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -91,9 +91,10 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>  }
>  
>  static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> -		struct device *dev, int start, int count)
> +					       struct arm_smmu_device *smmu,
> +					       struct device *dev, int start)
>  {
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	int count;
>  
>  	/*
>  	 * Assign context bank 0 to the GPU device so the GPU hardware can
> @@ -104,6 +105,7 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
>  		count = 1;
>  	} else {
>  		start = 1;
> +		count = smmu->num_context_banks;
>  	}
>  
>  	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index bbec5793faf8..e19d7bdc7674 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -623,6 +623,16 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>  
> +static int arm_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> +				       struct arm_smmu_device *smmu,
> +				       struct device *dev, unsigned int start)
> +{
> +	if (smmu->impl && smmu->impl->alloc_context_bank)
> +		return smmu->impl->alloc_context_bank(smmu_domain, smmu, dev, start);
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, smmu->num_context_banks);
> +}
> +
>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  					struct arm_smmu_device *smmu,
>  					struct device *dev)
> @@ -741,20 +751,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		goto out_unlock;
>  	}
>  
> -	smmu_domain->smmu = smmu;
> -
> -	if (smmu->impl && smmu->impl->alloc_context_bank)
> -		ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
> -				start, smmu->num_context_banks);
> -	else
> -		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> -				      smmu->num_context_banks);
> -
> +	ret = arm_smmu_alloc_context_bank(smmu_domain, smmu, dev, start);
>  	if (ret < 0) {
> -		smmu_domain->smmu = NULL;
>  		goto out_unlock;
>  	}
>  
> +	smmu_domain->smmu = smmu;
> +
>  	cfg->cbndx = ret;
>  	if (smmu->version < ARM_SMMU_V2) {
>  		cfg->irptndx = atomic_inc_return(&smmu->irptndx);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2df3a70a8a41..ddf2ca4c923d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -437,7 +437,8 @@ struct arm_smmu_impl {
>  	irqreturn_t (*global_fault)(int irq, void *dev);
>  	irqreturn_t (*context_fault)(int irq, void *dev);
>  	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> -			struct device *dev, int start, int max);
> +				  struct arm_smmu_device *smmu,
> +				  struct device *dev, int start);
>  };
>  
>  #define INVALID_SMENDX			-1
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
