Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA8B28E3A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 17:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgJNP4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 11:56:20 -0400
Received: from foss.arm.com ([217.140.110.172]:52284 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgJNP4U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 11:56:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B33FCD6E;
        Wed, 14 Oct 2020 08:56:19 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D09F3F71F;
        Wed, 14 Oct 2020 08:56:17 -0700 (PDT)
Subject: Re: [PATCH 6/8] iommu/arm-smmu: Move stream mapping reset to separate
 function
To:     kholk11@gmail.com, will@kernel.org
Cc:     joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926130004.13528-1-kholk11@gmail.com>
 <20200926130004.13528-7-kholk11@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <70da2261-df85-e982-7646-8b3b8988a9fc@arm.com>
Date:   Wed, 14 Oct 2020 16:56:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200926130004.13528-7-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-26 14:00, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Move the stream mapping reset logic from arm_smmu_device_reset into
> a separate arm_smmu_stream_mapping_reset function, in preparation
> for implementing an implementation detail.
> 
> This commit brings no functional changes.

Please coordinate with Bjorn's series so you're not wasting time 
developing 'competing' implementations of the exact same thing. You 
don't need these last 3 patches, for reasons I've already explained over 
there.

Robin.

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 446a78dde9cd..8c070c493315 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1652,14 +1652,9 @@ static struct iommu_ops arm_smmu_ops = {
>   	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>   };
>   
> -static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static void arm_smmu_stream_mapping_reset(struct arm_smmu_device *smmu)
>   {
>   	int i;
> -	u32 reg;
> -
> -	/* clear global FSR */
> -	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
> -	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, reg);
>   
>   	/*
>   	 * Reset stream mapping groups: Initial values mark all SMRn as
> @@ -1673,6 +1668,18 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   		arm_smmu_write_context_bank(smmu, i);
>   		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);
>   	}
> +}
> +
> +static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +{
> +	u32 reg;
> +
> +	/* clear global FSR */
> +	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
> +	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, reg);
> +
> +	/* Reset stream mapping */
> +	arm_smmu_stream_mapping_reset(smmu);
>   
>   	/* Invalidate the TLB, just in case */
>   	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_TLBIALLH, QCOM_DUMMY_VAL);
> 
