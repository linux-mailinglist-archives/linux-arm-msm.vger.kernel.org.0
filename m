Return-Path: <linux-arm-msm+bounces-24741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F891D119
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 12:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E0E281DAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 10:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634D13211E;
	Sun, 30 Jun 2024 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QAnlfGOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E2E12F5B3;
	Sun, 30 Jun 2024 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719743153; cv=none; b=DRuQeUNGRiPaxJvBLyUDQ2XKvEw1s0Hcoep9y4POF4JecRKQNthoopt5xwUkobakwFIngRghcxUzM5Yo5hxiSKqOJmxi0GykUKZ+d2JkUzcyh2zgpDrn8b12x3ucHM2qu91BkQgwi8JLpk7HmS6HfRMt3EIuU38RD0FxDdxi5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719743153; c=relaxed/simple;
	bh=ERNPoMgab7edYwcAV401eBGZI79v7WllDbPw4mzHZKg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwkOYf367s1n6pVGLSkNTlL8E32JVn3Uqkr6P8L7+6YJAaJgIXYFjQiIWayKJUiVuc2JhhPaRfTJl2chZSAGQfRX1jm6SoI5cvWy63TJc/JxhSbRnLW01QDaM4mjrMz8utllsjpd9NhuNKWKuZrwxVG/s8m1FNsCP1i+slCGaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QAnlfGOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45U99xFY024734;
	Sun, 30 Jun 2024 10:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IS91P518NB5qx+yzIfVqp6xy
	OjGVz8XGtBbP53L1sPA=; b=QAnlfGOAHD/YsDigWoIXIxXTbsULhQbUQ2ES6BmU
	t7z03VOg0dYHb3hXYAxGpD4lz+UCUcV0Q7es1Eq7tB3vxDqEEgI7G1+VthoXFlZu
	SCv6UvU0YZ1XQpnpu6zbKw2+Sc2Lgj2YMHknsRSKZpFIcX7xkJ1sclrVivv+glTj
	pXo9OKh39xcPOtDjsTiaBT58kF7qiI2oIZOy1p2EvtX3o2k1T2ksY0bN1UXCebuw
	fWfXqPoJC1ltKHljotwBpU8cgKruFSvT3ujbT8D+JmDft5fxFd9P8mYFsjGQ55tP
	lwDd0z6t5NnRXLC/KzzBYn1s+3p1FwtxlM9saQFcZfi3fg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40297rj0k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 10:25:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45UAPXMa006638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 10:25:33 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 03:25:28 -0700
Date: Sun, 30 Jun 2024 15:55:24 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <20240630102524.talnb3qx5jfmcj5y@hu-akhilpo-hyd.qualcomm.com>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JHFAsILtmM6qFXL-TQKZpY7-lT_q8149
X-Proofpoint-GUID: JHFAsILtmM6qFXL-TQKZpY7-lT_q8149
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-30_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406300082

On Tue, Jun 25, 2024 at 08:28:06PM +0200, Konrad Dybcio wrote:
> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> abstracted through SMEM, instead of being directly available in a fuse.
> 
> Add support for SMEM-based speed binning, which includes getting
> "feature code" and "product code" from said source and parsing them
> to form something that lets us match OPPs against.
> 
> Due to the product code being ignored in the context of Adreno on
> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 41 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 ++++-
>  4 files changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c98cdb1e9326..8ace096bb68c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2124,13 +2124,15 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
>  	return UINT_MAX;
>  }
>  
> -static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
> +static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
> +				 struct device *dev,
> +				 const struct adreno_info *info)
>  {
>  	u32 supp_hw;
>  	u32 speedbin;
>  	int ret;
>  
> -	ret = adreno_read_speedbin(dev, &speedbin);
> +	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
>  	/*
>  	 * -ENOENT means that the platform doesn't support speedbin which is
>  	 * fine
> @@ -2290,7 +2292,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>  
> -	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
> +	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
>  	if (ret) {
>  		a6xx_llc_slices_destroy(a6xx_gpu);
>  		kfree(a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 1e789ff6945e..e514346088f9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -6,6 +6,8 @@
>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/socinfo.h>
> +
>  #include "adreno_gpu.h"
>  
>  bool hang_debug = false;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c6626747b98..6ffd02f38499 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -21,6 +21,9 @@
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>  
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
> +
>  static u64 address_space_size = 0;
>  MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
>  module_param(address_space_size, ullong, 0600);
> @@ -1061,9 +1064,39 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>  			   adreno_ocmem->hdl);
>  }
>  
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +			 struct device *dev, u32 *fuse)
>  {
> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	u32 fcode;
> +	int ret;
> +
> +	/*
> +	 * Try reading the speedbin via a nvmem cell first
> +	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
> +	 * "nvmem fuse is irrelevant", simply assume it's fine.
> +	 */
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
> +	if (!ret)
> +		return 0;
> +	else if (ret != -ENOENT)
> +		return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
> +
> +#ifdef CONFIG_QCOM_SMEM
> +	/*
> +	 * Only check the feature code - the product code only matters for
> +	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
> +	 * matching is concerned.
> +	 *
> +	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
> +	 */
> +	ret = qcom_smem_get_feature_code(&fcode);
> +	if (!ret)
> +		*fuse = ADRENO_SKU_ID(fcode);
> +	else if (ret != -EOPNOTSUPP)
> +		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
> +#endif
> +
> +	return 0;
>  }
>  
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> @@ -1102,9 +1135,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			devm_pm_opp_set_clkname(dev, "core");
>  	}
>  
> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>  		speedbin = 0xffff;
> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> +	adreno_gpu->speedbin = speedbin;

This value is exposed to userspace via MSM_PARAM_CHIP_ID. 16 bits are
reserved for speedbin, so we should ensure somewhere that we don't
accidently use more than that.

Also, what is the the max value of fcode? I think we should leave some
space for pcode too. We never know for sure if that won't be required in
future.

-Akhil

>  
>  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>  			ADRENO_CHIPID_ARGS(config->chip_id));
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index cff8ce541d2c..563c08b44624 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -79,6 +79,10 @@ struct adreno_reglist {
>  
>  struct adreno_speedbin {
>  	uint16_t fuse;
> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> +#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
> +#define ADRENO_SKU_ID(fcode)	(fcode)

> +
>  	uint16_t speedbin;
>  };
>  
> @@ -545,7 +549,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>  			 struct adreno_smmu_fault_info *info, const char *block,
>  			 u32 scratch[4]);
>  
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +			 struct device *dev, u32 *speedbin);
>  
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
> 
> -- 
> 2.45.2
> 

