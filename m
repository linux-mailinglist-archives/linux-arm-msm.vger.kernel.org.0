Return-Path: <linux-arm-msm+bounces-3704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D28088C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53A3281E31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276FC3DB97;
	Thu,  7 Dec 2023 13:06:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24E2910CB;
	Thu,  7 Dec 2023 05:06:16 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D0011FB;
	Thu,  7 Dec 2023 05:07:01 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051FD3F6C4;
	Thu,  7 Dec 2023 05:06:13 -0800 (PST)
Message-ID: <6397268c-7990-42f6-9453-44fdc638d5c9@arm.com>
Date: Thu, 7 Dec 2023 13:06:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/msm-iommu: don't limit the driver too much
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
 <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2023 12:54 pm, Dmitry Baryshkov wrote:
> In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
> driver just to those machines. Allow it to be built for any 32-bit
> Qualcomm platform (ARCH_QCOM).

Acked-by: Robin Murphy <robin.murphy@arm.com>

Unless Joerg disagrees, I think it should be fine if you want to take 
this via the SoC tree.

Thanks,
Robin.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 7673bb82945b..fd67f586f010 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -178,7 +178,7 @@ config FSL_PAMU
>   config MSM_IOMMU
>   	bool "MSM IOMMU Support"
>   	depends on ARM
> -	depends on ARCH_MSM8X60 || ARCH_MSM8960 || COMPILE_TEST
> +	depends on ARCH_QCOM || COMPILE_TEST
>   	select IOMMU_API
>   	select IOMMU_IO_PGTABLE_ARMV7S
>   	help

