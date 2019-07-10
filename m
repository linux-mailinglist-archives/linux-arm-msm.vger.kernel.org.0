Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2882664AE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 18:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfGJQpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 12:45:47 -0400
Received: from foss.arm.com ([217.140.110.172]:36582 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727287AbfGJQpr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 12:45:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F4C360;
        Wed, 10 Jul 2019 09:45:46 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12B3A3F246;
        Wed, 10 Jul 2019 09:45:44 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 3/3] iommu/arm-smmu: Add support for
 DOMAIN_ATTR_SPLIT_TABLES
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
 <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <aeae2aa1-9473-d661-dcf3-f086fe36d02a@arm.com>
Date:   Wed, 10 Jul 2019 17:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2019 20:00, Jordan Crouse wrote:
> When DOMAIN_ATTR_SPLIT_TABLES is specified for pass ARM_64_LPAE_SPLIT_S1
> to io_pgtable_ops to allocate and initialize TTBR0 and TTBR1 pagetables.
> 
> v3: Moved all the pagetable specific work into io-pgtable-arm
> in a previous patch.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/iommu/arm-smmu.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 653b6b3..7a6b4bb 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -257,6 +257,7 @@ struct arm_smmu_domain {
>   	bool				non_strict;
>   	struct mutex			init_mutex; /* Protects smmu pointer */
>   	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> +	u32 attributes;
>   	struct iommu_domain		domain;
>   };
>   
> @@ -832,7 +833,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		ias = smmu->va_size;
>   		oas = smmu->ipa_size;
>   		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
> -			fmt = ARM_64_LPAE_S1;
> +			if (smmu_domain->attributes &
> +				(1 << DOMAIN_ATTR_SPLIT_TABLES))
> +				fmt = ARM_64_LPAE_SPLIT_S1;
> +			else
> +				fmt = ARM_64_LPAE_S1;
>   		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
>   			fmt = ARM_32_LPAE_S1;
>   			ias = min(ias, 32UL);
> @@ -1582,6 +1587,10 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>   		case DOMAIN_ATTR_NESTING:
>   			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>   			return 0;
> +		case DOMAIN_ATTR_SPLIT_TABLES:
> +			*(int *)data = !!(smmu_domain->attributes &
> +				(1 << DOMAIN_ATTR_SPLIT_TABLES));

I'm not really a fan of always claiming to support this but silently 
ignoring it depending on hardware/kernel configuration - it seems 
somewhat tricky to make callers properly robust against making false 
assumptions (e.g. consider if the system is booted with 
"arm-smmu.force_stage=2").

Robin.

> +			return 0;
>   		default:
>   			return -ENODEV;
>   		}
> @@ -1622,6 +1631,11 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>   			else
>   				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>   			break;
> +		case DOMAIN_ATTR_SPLIT_TABLES:
> +			if (*((int *)data))
> +				smmu_domain->attributes |=
> +					(1 << DOMAIN_ATTR_SPLIT_TABLES);
> +			break;
>   		default:
>   			ret = -ENODEV;
>   		}
> 
