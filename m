Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F191FF9C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 18:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgFRQ4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 12:56:55 -0400
Received: from foss.arm.com ([217.140.110.172]:55186 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgFRQ4z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 12:56:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A46731B;
        Thu, 18 Jun 2020 09:56:54 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25A0B3F6CF;
        Thu, 18 Jun 2020 09:56:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] iommu: arm-smmu-impl: Use qcom impl for sm8150 and
 sm8250 compatibles
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200609194030.17756-3-jonathan@marek.ca>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8f63f12e-c0fc-04a9-0762-5dbc63b19206@arm.com>
Date:   Thu, 18 Jun 2020 17:56:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609194030.17756-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-09 20:40, Jonathan Marek wrote:
> Use the qcom implementation for IOMMU hardware on sm8150 and sm8250 SoCs.

Given a promise that anyone who wants to add more of these in future 
converts it into an of_device_id table exported from arm-smmu-qcom,

Reviewed-by Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/iommu/arm-smmu-impl.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index c75b9d957b70..f5f6cab626be 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -172,7 +172,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   		smmu->impl = &calxeda_impl;
>   
>   	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
> +	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
>   		return qcom_smmu_impl_init(smmu);
>   
>   	return smmu;
> 
