Return-Path: <linux-arm-msm+bounces-36902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A82A9BB127
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E85F1C20CBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FCF1B0F2C;
	Mon,  4 Nov 2024 10:32:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9D41AB505;
	Mon,  4 Nov 2024 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730716340; cv=none; b=Zc7/0DwGbeIHhpFuUb09R81ElHw+GfsLCroxO2vWXZio27QuytDq0x/Z1FDdjWjB9Z5zCcHgs3h59JckWhYpIUAe9Id6TmaL1q7EkqNGLL8DVuE9tL3DB2stwecICafexZYf+zRi0e6+n9UBqpL5mdHBvRmE6DJC1H1zaF8RJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730716340; c=relaxed/simple;
	bh=0g6fsbrfbKoeB1+lLzNSUUJqImvH5HnzCsnnVU3FqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWaI8QntkZ2xupu4k139hN+X4DHET8npsXKV/71iGSwxrlcx9h1MAcZ/hWHPe8DzguE7mqQmaQP+/2aX+ke3EBk/bvB//RW4bBXI9QzuvRblRz1Kh2dNXWKGVrGHrX2/R5jSNdKd4kLAcaLg9QM3gx/W0WXIil1KG3iRYyOIpH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 583E4FEC;
	Mon,  4 Nov 2024 02:32:47 -0800 (PST)
Received: from [10.57.88.110] (unknown [10.57.88.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FB933F66E;
	Mon,  4 Nov 2024 02:32:12 -0800 (PST)
Message-ID: <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
Date: Mon, 4 Nov 2024 10:32:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Clark <robdclark@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Michael Shavit <mshavit@google.com>, Mostafa Saleh <smostafa@google.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Georgi Djakov <quic_c_gdjako@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241104064650.799122-2-u.kleine-koenig@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241104064650.799122-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-04 6:46 am, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/iommu to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.

I dont see any major concern with doing it this way. FWIW,

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of drivers/iommu. While I usually prefer to
> do one logical change per patch, this seems to be overengineering here
> as the individual changes are really trivial and shouldn't be much in
> the way for stable backports. But I'll happily split the patch if you
> prefer it split.
> 
> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend. (Having said that, I
> recommend b4 am -3 + git am -3 which should resolve most conflicts just
> fine.)
> 
> Best regards
> Uwe
> 
>   drivers/iommu/apple-dart.c                  | 2 +-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 2 +-
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 4 ++--
>   drivers/iommu/ipmmu-vmsa.c                  | 2 +-
>   drivers/iommu/msm_iommu.c                   | 2 +-
>   drivers/iommu/mtk_iommu.c                   | 2 +-
>   drivers/iommu/mtk_iommu_v1.c                | 2 +-
>   drivers/iommu/omap-iommu.c                  | 2 +-
>   drivers/iommu/riscv/iommu-platform.c        | 2 +-
>   drivers/iommu/sprd-iommu.c                  | 2 +-
>   11 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index eb1e62cd499a..c5bde50d1c42 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -1352,7 +1352,7 @@ static struct platform_driver apple_dart_driver = {
>   		.pm			= pm_sleep_ptr(&apple_dart_pm_ops),
>   	},
>   	.probe	= apple_dart_probe,
> -	.remove_new = apple_dart_remove,
> +	.remove	= apple_dart_remove,
>   };
>   
>   module_platform_driver(apple_dart_driver);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 826db8894fb7..efbc78bffd33 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4679,7 +4679,7 @@ static struct platform_driver arm_smmu_driver = {
>   		.suppress_bind_attrs	= true,
>   	},
>   	.probe	= arm_smmu_device_probe,
> -	.remove_new = arm_smmu_device_remove,
> +	.remove	= arm_smmu_device_remove,
>   	.shutdown = arm_smmu_device_shutdown,
>   };
>   module_driver(arm_smmu_driver, platform_driver_register,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 8321962b3714..4e9bb9f4c4bd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2372,7 +2372,7 @@ static struct platform_driver arm_smmu_driver = {
>   		.suppress_bind_attrs    = true,
>   	},
>   	.probe	= arm_smmu_device_probe,
> -	.remove_new = arm_smmu_device_remove,
> +	.remove = arm_smmu_device_remove,
>   	.shutdown = arm_smmu_device_shutdown,
>   };
>   module_platform_driver(arm_smmu_driver);
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index b98a7a598b89..9ce2fe50b22c 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -759,7 +759,7 @@ static struct platform_driver qcom_iommu_ctx_driver = {
>   		.of_match_table	= ctx_of_match,
>   	},
>   	.probe	= qcom_iommu_ctx_probe,
> -	.remove_new = qcom_iommu_ctx_remove,
> +	.remove	= qcom_iommu_ctx_remove,
>   };
>   
>   static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
> @@ -931,7 +931,7 @@ static struct platform_driver qcom_iommu_driver = {
>   		.pm		= &qcom_iommu_pm_ops,
>   	},
>   	.probe	= qcom_iommu_device_probe,
> -	.remove_new = qcom_iommu_device_remove,
> +	.remove	= qcom_iommu_device_remove,
>   };
>   
>   static int __init qcom_iommu_init(void)
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index ff55b8c30712..074daf1aac4e 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -1159,6 +1159,6 @@ static struct platform_driver ipmmu_driver = {
>   		.pm = pm_sleep_ptr(&ipmmu_pm),
>   	},
>   	.probe = ipmmu_probe,
> -	.remove_new = ipmmu_remove,
> +	.remove = ipmmu_remove,
>   };
>   builtin_platform_driver(ipmmu_driver);
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 989e0869d805..ce40f0a419ea 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -838,6 +838,6 @@ static struct platform_driver msm_iommu_driver = {
>   		.of_match_table = msm_iommu_dt_match,
>   	},
>   	.probe		= msm_iommu_probe,
> -	.remove_new	= msm_iommu_remove,
> +	.remove		= msm_iommu_remove,
>   };
>   builtin_platform_driver(msm_iommu_driver);
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index c45313c43b9e..72b68d037b95 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1794,7 +1794,7 @@ MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
>   
>   static struct platform_driver mtk_iommu_driver = {
>   	.probe	= mtk_iommu_probe,
> -	.remove_new = mtk_iommu_remove,
> +	.remove	= mtk_iommu_remove,
>   	.driver	= {
>   		.name = "mtk-iommu",
>   		.of_match_table = mtk_iommu_of_ids,
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index ee4e55b6b190..480e57ea6635 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -745,7 +745,7 @@ static const struct dev_pm_ops mtk_iommu_v1_pm_ops = {
>   
>   static struct platform_driver mtk_iommu_v1_driver = {
>   	.probe	= mtk_iommu_v1_probe,
> -	.remove_new = mtk_iommu_v1_remove,
> +	.remove	= mtk_iommu_v1_remove,
>   	.driver	= {
>   		.name = "mtk-iommu-v1",
>   		.of_match_table = mtk_iommu_v1_of_ids,
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 3f72aef8bd5b..b8ced5d0581c 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1285,7 +1285,7 @@ static const struct of_device_id omap_iommu_of_match[] = {
>   
>   static struct platform_driver omap_iommu_driver = {
>   	.probe	= omap_iommu_probe,
> -	.remove_new = omap_iommu_remove,
> +	.remove	= omap_iommu_remove,
>   	.driver	= {
>   		.name	= "omap-iommu",
>   		.pm	= &omap_iommu_pm_ops,
> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> index da336863f152..382ba2841849 100644
> --- a/drivers/iommu/riscv/iommu-platform.c
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
>   
>   static struct platform_driver riscv_iommu_platform_driver = {
>   	.probe = riscv_iommu_platform_probe,
> -	.remove_new = riscv_iommu_platform_remove,
> +	.remove = riscv_iommu_platform_remove,
>   	.driver = {
>   		.name = "riscv,iommu",
>   		.of_match_table = riscv_iommu_of_match,
> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> index a2f4ffe6d949..e84806eee281 100644
> --- a/drivers/iommu/sprd-iommu.c
> +++ b/drivers/iommu/sprd-iommu.c
> @@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
>   		.suppress_bind_attrs = true,
>   	},
>   	.probe	= sprd_iommu_probe,
> -	.remove_new = sprd_iommu_remove,
> +	.remove	= sprd_iommu_remove,
>   };
>   module_platform_driver(sprd_iommu_driver);
>   
> base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c


