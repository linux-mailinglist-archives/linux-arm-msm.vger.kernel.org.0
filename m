Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E03D2665DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 19:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgIKRQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 13:16:22 -0400
Received: from foss.arm.com ([217.140.110.172]:39914 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgIKRNN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 13:13:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D80106F;
        Fri, 11 Sep 2020 10:13:10 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6733F68F;
        Fri, 11 Sep 2020 10:13:06 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com>
Date:   Fri, 11 Sep 2020 18:13:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904155513.282067-7-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 16:55, Bjorn Andersson wrote:
> Add a new operation to allow platform implementations to inherit any
> stream mappings from the boot loader.

Is there a reason we need an explicit step for this? The aim of the 
cfg_probe hook is that the SMMU software state should all be set up by 
then, and you can mess about with it however you like before 
arm_smmu_reset() actually commits anything to hardware. I would have 
thought you could permanently steal a context bank, configure it as your 
bypass hole, read out the previous SME configuration and tweak 
smmu->smrs and smmu->s2crs appropriately all together "invisibly" at 
that point. If that can't work, I'm very curious as to what I've overlooked.

Robin.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - New patch/interface
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 11 ++++++-----
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  6 ++++++
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index eb5c6ca5c138..4c4d302cd747 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -85,11 +85,6 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   		pm_runtime_put_autosuspend(smmu->dev);
>   }
>   
> -static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> -{
> -	return container_of(dom, struct arm_smmu_domain, domain);
> -}
> -
>   static struct platform_driver arm_smmu_driver;
>   static struct iommu_ops arm_smmu_ops;
>   
> @@ -2188,6 +2183,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	if (smmu->impl->inherit_mappings) {
> +		err = smmu->impl->inherit_mappings(smmu);
> +		if (err)
> +			return err;
> +	}
> +
>   	if (smmu->version == ARM_SMMU_V2) {
>   		if (smmu->num_context_banks > smmu->num_context_irqs) {
>   			dev_err(dev,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 235d9a3a6ab6..f58164976e74 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -378,6 +378,11 @@ struct arm_smmu_domain {
>   	struct iommu_domain		domain;
>   };
>   
> +static inline struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct arm_smmu_domain, domain);
> +}
> +
>   struct arm_smmu_master_cfg {
>   	struct arm_smmu_device		*smmu;
>   	s16				smendx[];
> @@ -442,6 +447,7 @@ struct arm_smmu_impl {
>   	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
>   				  struct arm_smmu_device *smmu,
>   				  struct device *dev, int start);
> +	int (*inherit_mappings)(struct arm_smmu_device *smmu);
>   };
>   
>   #define INVALID_SMENDX			-1
> 
