Return-Path: <linux-arm-msm+bounces-24742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906491D11F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 12:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2F42281D04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 10:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E6B12DDAE;
	Sun, 30 Jun 2024 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f7h3cDh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448D1E878;
	Sun, 30 Jun 2024 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719743417; cv=none; b=gnD7nDHtzF9TC6Uud76/ImanJ6DM7hpRnMhqufL48i9s4nIiOsb9LzP8sLGBdo7CXiNtsEWww3vwtHzhR8qKJmcwSQO/Qjph4BtIC75f4LOSvd6WNKJxY8oHyMrnD0d0PiM6UuujRO+LrYKnR0sO72seJ93E0MAONsybN6x+RKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719743417; c=relaxed/simple;
	bh=am2DY6ozAXTWiF42MEbuDPT0SJrF1bML3JM/k4yZwhM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW39yqLpQQ7cIZb/kPXOJ5q22jUrINKoyWBu2kuAU9pmJ8gBSwDvb238FiIwf8UXe+T5mI+LUQwGYmMZ45TUiODzvzYPqZPgl0rpASyERVfTtuJFi2xZYe0FlHiVwPML6V5X/f8ghRhPEI150+KSEOLCBvfkDVjViKB3yfLhCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f7h3cDh6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45U9stGw018902;
	Sun, 30 Jun 2024 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zC6Bg1HL7s+Y7FI7wGCp3B0p
	3Sl+kxjsMqLGRcSmMdY=; b=f7h3cDh6+E7lm2Q9TMPcZlwzXm6KmVce0nxFvj7e
	0OFD3Ue2md1LJyapNThZnCV4mdgZIR6j1jvcE2BY1ul83dZPdr64UFn9MhMKObpk
	g9JY0tghmD5sic+qyqllRV3WO1b7nbFfKbUX/cLqToTXIdqikHwxpWkoQVtZAj6b
	rxjf3n3iDcCoIrg0gdq7ZW5lSiDhJasnB6r/ntKFb3qDdUPBJ5708cVXyr3mUAkb
	sKcxIh2Sqb/w+eBMn00nOxtkdyUJM/dGzz1x8cksQ1VXZVCJcxGxLqlZt/YaVGrs
	QCUQIYwItfWq4023Nl9FzATpDBSqxWZJ4PfnUEw0Q7LIww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402b1f1r9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 10:30:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45UAU5T4010984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 10:30:05 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 03:29:59 -0700
Date: Sun, 30 Jun 2024 15:59:55 +0530
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
Subject: Re: [PATCH v4 4/5] drm/msm/adreno: Redo the speedbin assignment
Message-ID: <20240630102955.uencakbjiugszphw@hu-akhilpo-hyd.qualcomm.com>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-4-f6f8493ab814@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625-topic-smem_speedbin-v4-4-f6f8493ab814@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cMef0PcOE4DPqxUFDAThNsdzOKhZgFo2
X-Proofpoint-GUID: cMef0PcOE4DPqxUFDAThNsdzOKhZgFo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-30_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406300081

On Tue, Jun 25, 2024 at 08:28:09PM +0200, Konrad Dybcio wrote:
> There is no need to reinvent the wheel for simple read-match-set logic.
> 
> Make speedbin discovery and assignment generation independent.
> 
> This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
> which has no representation in hardware whatshowever.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 34 --------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 56 ---------------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 51 ++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 --
>  4 files changed, 45 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index c003f970189b..eed6a2eb1731 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1704,38 +1704,6 @@ static const struct adreno_gpu_funcs funcs = {
>  	.get_timestamp = a5xx_get_timestamp,
>  };
>  
> -static void check_speed_bin(struct device *dev)
> -{
> -	struct nvmem_cell *cell;
> -	u32 val;
> -
> -	/*
> -	 * If the OPP table specifies a opp-supported-hw property then we have
> -	 * to set something with dev_pm_opp_set_supported_hw() or the table
> -	 * doesn't get populated so pick an arbitrary value that should
> -	 * ensure the default frequencies are selected but not conflict with any
> -	 * actual bins
> -	 */
> -	val = 0x80;
> -
> -	cell = nvmem_cell_get(dev, "speed_bin");
> -
> -	if (!IS_ERR(cell)) {
> -		void *buf = nvmem_cell_read(cell, NULL);
> -
> -		if (!IS_ERR(buf)) {
> -			u8 bin = *((u8 *) buf);
> -
> -			val = (1 << bin);
> -			kfree(buf);
> -		}
> -
> -		nvmem_cell_put(cell);
> -	}
> -
> -	devm_pm_opp_set_supported_hw(dev, &val, 1);
> -}
> -
>  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  {
>  	struct msm_drm_private *priv = dev->dev_private;
> @@ -1763,8 +1731,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  
>  	a5xx_gpu->lm_leakage = 0x4E001A;
>  
> -	check_speed_bin(&pdev->dev);
> -
>  	nr_rings = 4;
>  
>  	if (config->info->revn == 510)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 8ace096bb68c..f038e5f1fe59 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2112,55 +2112,6 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return progress;
>  }
>  
> -static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
> -{
> -	if (!info->speedbins)
> -		return UINT_MAX;
> -
> -	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++)
> -		if (info->speedbins[i].fuse == fuse)
> -			return BIT(info->speedbins[i].speedbin);
> -
> -	return UINT_MAX;
> -}
> -
> -static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
> -				 struct device *dev,
> -				 const struct adreno_info *info)
> -{
> -	u32 supp_hw;
> -	u32 speedbin;
> -	int ret;
> -
> -	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
> -	/*
> -	 * -ENOENT means that the platform doesn't support speedbin which is
> -	 * fine
> -	 */
> -	if (ret == -ENOENT) {
> -		return 0;
> -	} else if (ret) {
> -		dev_err_probe(dev, ret,
> -			      "failed to read speed-bin. Some OPPs may not be supported by hardware\n");
> -		return ret;
> -	}
> -
> -	supp_hw = fuse_to_supp_hw(info, speedbin);
> -
> -	if (supp_hw == UINT_MAX) {
> -		DRM_DEV_ERROR(dev,
> -			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
> -			speedbin);
> -		supp_hw = BIT(0); /* Default */
> -	}
> -
> -	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -
>  static const struct adreno_gpu_funcs funcs = {
>  	.base = {
>  		.get_param = adreno_get_param,
> @@ -2292,13 +2243,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>  
> -	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
> -	if (ret) {
> -		a6xx_llc_slices_destroy(a6xx_gpu);
> -		kfree(a6xx_gpu);
> -		return ERR_PTR(ret);
> -	}
> -
>  	if (is_a7xx)
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
>  	else if (adreno_has_gmu_wrapper(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6ffd02f38499..5b4205b76cdf 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1064,8 +1064,8 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>  			   adreno_ocmem->hdl);
>  }
>  
> -int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> -			 struct device *dev, u32 *fuse)
> +static int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +				struct device *dev, u32 *fuse)
>  {
>  	u32 fcode;
>  	int ret;
> @@ -1099,6 +1099,46 @@ int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
>  	return 0;
>  }
>  
> +#define ADRENO_SPEEDBIN_FUSE_NODATA	0xFFFF /* Made-up large value, expected by mesa */
> +static int adreno_set_speedbin(struct adreno_gpu *adreno_gpu, struct device *dev)
> +{
> +	const struct adreno_info *info = adreno_gpu->info;
> +	u32 fuse = ADRENO_SPEEDBIN_FUSE_NODATA;
> +	u32 supp_hw = UINT_MAX;
> +	int ret;
> +
> +	/* No speedbins defined for this GPU SKU => allow all defined OPPs */
> +	if (!info->speedbins) {
> +		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> +	}
> +
> +	/*
> +	 * If a real error (not counting older devicetrees having no nvmem references)
> +	 * occurs when trying to get the fuse value, bail out.
> +	 */
> +	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
> +	if (ret) {
> +		return ret;
> +	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
> +		/* The info struct has speedbin data, but the DT is too old => allow all OPPs */
> +		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> +	}
> +
> +	adreno_gpu->speedbin = fuse;
> +
> +	/* Traverse the known speedbins */
> +	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++) {
> +		if (info->speedbins[i].fuse == fuse) {
> +			supp_hw = BIT(info->speedbins[i].speedbin);
> +			return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);

Can we do this if supp_hw property is not present in opp table?

-Akhil

> +		}
> +	}
> +
> +	return dev_err_probe(dev, -EINVAL, "Unknown speed bin fuse value: 0x%x\n", fuse);
> +}
> +
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
>  		const struct adreno_gpu_funcs *funcs, int nr_rings)
> @@ -1108,7 +1148,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	struct msm_gpu_config adreno_gpu_config  = { 0 };
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	const char *gpu_name;
> -	u32 speedbin;
>  	int ret;
>  
>  	adreno_gpu->funcs = funcs;
> @@ -1135,9 +1174,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			devm_pm_opp_set_clkname(dev, "core");
>  	}
>  
> -	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> -		speedbin = 0xffff;
> -	adreno_gpu->speedbin = speedbin;
> +	ret = adreno_set_speedbin(adreno_gpu, dev);
> +	if (ret)
> +		return ret;
>  
>  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>  			ADRENO_CHIPID_ARGS(config->chip_id));
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 563c08b44624..dc579f7afdc7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -549,9 +549,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>  			 struct adreno_smmu_fault_info *info, const char *block,
>  			 u32 scratch[4]);
>  
> -int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> -			 struct device *dev, u32 *speedbin);
> -
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>   * out of secure mode
> 
> -- 
> 2.45.2
> 

