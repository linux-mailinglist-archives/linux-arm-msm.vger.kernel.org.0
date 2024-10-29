Return-Path: <linux-arm-msm+bounces-36312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CFB9B4B06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A5281F23B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D8D20695C;
	Tue, 29 Oct 2024 13:36:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C83206517;
	Tue, 29 Oct 2024 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208996; cv=none; b=lkRSQocuFzTWRwJTHbi0R6xkXNaM2PGkJKZf6cdDLRsY+vPifKRI+k5TMPrNEfSEoI6l8M1t5eSVKsIYRUKa1mTslr7RLt6mPytPyBvLtm23Yf1YKSOzPdXDURK8QeCpp+VzAl5zhUfaDDz1yzyY6bKkC5EZgTrc3Hr+Pg8J980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208996; c=relaxed/simple;
	bh=x1jLr3vWrmltIQyQARGx1z8Pz2x/BNhjT643z7wYiAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2paQtVJXS+lMrOmj1N0Nltb+UYJ6SzDlfz+gk/y5nEtMl5bkr3mi4xJbXtmFb/1cxrN6v1b2ouMbTj+reX6vLZJp4oflztd7ShwIgPjUJuZ2a5poXI8k8q4kWShWS1rzLHAQcLi/qwY1sJYNyHkHZzu3ArgECHewNvbrzR0jU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1C24113E;
	Tue, 29 Oct 2024 06:37:03 -0700 (PDT)
Received: from [10.57.89.81] (unknown [10.57.89.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEFE43F528;
	Tue, 29 Oct 2024 06:36:31 -0700 (PDT)
Message-ID: <7f172651-7bc0-4c3b-8d33-1c796e016c84@arm.com>
Date: Tue, 29 Oct 2024 13:36:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/5] iommu/arm-smmu: add ACTLR data and support for
 qcom_smmu_500
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
 will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.

Hmm, I'd still be inclined to combine this into the existing 
qcom_smmu_client_of_match table by generalising the match data (i.e. 
make an explicit "wants an identity domain" flag as well), but that 
could always be tried later. This is pleasantly inoffensive enough as it 
is, compared to the previous idea :)

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 2d2c1e75632c..dd4fb883ebcd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,8 +25,31 @@
> 
>   #define CPRE			(1 << 1)
>   #define CMTLB			(1 << 0)
> +#define PREFETCH_SHIFT		8
> +#define PREFETCH_DEFAULT	0
> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>   #define GFX_ACTLR_PRR		(1 << 5)
> 
> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> +	{ .compatible = "qcom,adreno",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-gmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-smmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,fastrpc",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-venus",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8550-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ }
> +};
> +
>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   {
>   	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>   	.impl = &qcom_smmu_500_impl,
>   	.adreno_impl = &qcom_adreno_smmu_500_impl,
>   	.cfg = &qcom_smmu_impl0_cfg,
> +	.client_match = qcom_smmu_actlr_client_of_match,
>   };
> 
>   /*
> --
> 2.34.1
> 


