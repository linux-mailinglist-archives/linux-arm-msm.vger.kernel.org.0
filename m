Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D39C875E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 13:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfJBL3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 07:29:50 -0400
Received: from foss.arm.com ([217.140.110.172]:41972 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbfJBL3u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 07:29:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DAFD28;
        Wed,  2 Oct 2019 04:29:49 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E25E63F71A;
        Wed,  2 Oct 2019 04:29:48 -0700 (PDT)
Subject: Re: [PATCH v4 4/7] iommu/qcom: Properly reset the IOMMU context
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Cc:     marijns95@gmail.com, iommu@lists.linux-foundation.org,
        agross@kernel.org
References: <20191001220205.6423-1-kholk11@gmail.com>
 <20191001220205.6423-5-kholk11@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <968a89c4-7928-21be-e8cb-22c571c9cc29@arm.com>
Date:   Wed, 2 Oct 2019 12:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191001220205.6423-5-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2019 23:02, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> To avoid context faults reset the context entirely on detach and
> to ensure a fresh clean start also do a complete reset before
> programming the context for domain initialization.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>   drivers/iommu/qcom_iommu.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index c8957ec83b92..b4a38ef129e3 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -220,6 +220,23 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +static void qcom_iommu_reset_ctx(struct qcom_iommu_ctx *ctx)
> +{
> +	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_FSR, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_PAR, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_TCR2, 0);
> +	iommu_writel(ctx, ARM_SMMU_CB_TCR, 0);
> +	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, 0);
> +	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
> +
> +	/* Should we issue a TLBSYNC there instead? */

Unless there are outstanding TLB invalidations, it wouldn't achieve 
much. That said, doing a TBLIALL as part of the reset sequence *would* 
generally be a good idea.

Also, since the write to SCTLR affects the overall enable state of the 
context bank, it would be best to do that before touching anything else.

Robin.

> +	mb();
> +}
> +
>   static int qcom_iommu_init_domain(struct iommu_domain *domain,
>   				  struct qcom_iommu_dev *qcom_iommu,
>   				  struct iommu_fwspec *fwspec)
> @@ -267,6 +284,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>   			ctx->secure_init = true;
>   		}
>   
> +		qcom_iommu_reset_ctx(ctx);
> +
>   		/* TCR */
>   		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
>   				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
> @@ -412,8 +431,8 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>   	for (i = 0; i < fwspec->num_ids; i++) {
>   		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
>   
> -		/* Disable the context bank: */
> -		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> +		/* Disable and reset the context bank */
> +		qcom_iommu_reset_ctx(ctx);
>   
>   		ctx->domain = NULL;
>   	}
> 
