Return-Path: <linux-arm-msm+bounces-32106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF5D97D8D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D178B1F24EC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80341822F8;
	Fri, 20 Sep 2024 17:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dCJdeOtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73017DFFB;
	Fri, 20 Sep 2024 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851789; cv=none; b=hD1+ONWlvVptsG9bpC1JFam5QdT2dHi3mbnPGsYZ+i1NeMBWdXduWwDgjL/q5DSRgUUN2tdLk/OW9z9KwmrX1QlteRPVYGSwqd5wWtixX2QJxUFLBe3cHhsMYrFcK71j9xJlTfQ9RUlN7JaCkNtL5eNdxpUK0r/q4Pbu+ezEZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851789; c=relaxed/simple;
	bh=RPmP5BpeCsObG7kLGOtj/G5awciDsbBKj8GC7PwJ0mo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx4KlQmcFG0aBt3NkwAs29U9Oy04uogjY9tZp6zSJ7Xi+FXlG3g+l4uo/ue7HPyWpUdieJjb4mrtNEKRQQFkMe0QsnTgmxPc0Vlo8ptmFNpUdWQQv3Bj3WOEKXxzarVcRqO5UciScDj0LpUvcUZ4/Sf3JRgS/3vvyRVpVM8tjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dCJdeOtB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K8272V019421;
	Fri, 20 Sep 2024 17:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OCUjlCUatkYPytFkrybTejPy
	q/kvqSE1ByEn+x7nS7s=; b=dCJdeOtB8om8yn7A+ygEYi0+KbdVVw/zwhbBBDKp
	sd8528pHRUuhlTyxYHlWDjDvMFdyC4vca5jiKLl+ShY6nzoXrKAgnGJtqVOV+5ZP
	2R8d0hnm5O/V4VEbwox53UG+Q1lbEyzDNDC6RE1tO6kZZsd2135Mcwloi6nzDE+J
	mN6JICFxLmM0D/6ngfr4KJyzPTCPl3GLJy1Znhv1fHFMlEtTuAZEcS7jUkrSb2kR
	hJoZl88oiYViatLG3vsUSz4GzB+gOrR23RHHnyBQ67XOQHPG2v2f5702JiKNpQsm
	fnlYEw9Z2V9iRP+o8bylfpyqMV0Ep6lNHP6EeCOLf+J8Gg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhhyt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 17:02:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KH2o6c005257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 17:02:50 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 10:02:45 -0700
Date: Fri, 20 Sep 2024 22:32:41 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 10/11] drm/msm/A6xx: Enable preemption for A750
Message-ID: <20240920170241.2ukib2kpz4qhse7e@hu-akhilpo-hyd.qualcomm.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-10-95d48012e0ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240917-preemption-a750-t-v4-10-95d48012e0ac@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YtDiBJleAmZhfFMTNIV3vc6QL58ZRIDu
X-Proofpoint-ORIG-GUID: YtDiBJleAmZhfFMTNIV3vc6QL58ZRIDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200124

On Tue, Sep 17, 2024 at 01:14:20PM +0200, Antonino Maniscalco wrote:
> Initialize with 4 rings to enable preemption.
> 
> For now only on A750 as other targets require testing.
> 
> Add the "preemption_enabled" module parameter to override this for other
> A7xx targets.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 6 +++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c             | 4 ++++
>  4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 316f23ca9167..0e3041b29419 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_HAS_HW_APRIV,
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_PREEMPTION,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "gen70900_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index edbcb6d229ba..4760f9469613 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> +	extern int enable_preemption;
>  	bool is_a7xx;
>  	int ret;
>  
> @@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		return ERR_PTR(ret);
>  	}
>  
> -	if (is_a7xx)
> +	if ((enable_preemption == 1) || (enable_preemption == -1 &&
> +	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
> +	else if (is_a7xx)
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
>  	else if (adreno_has_gmu_wrapper(adreno_gpu))
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 87098567483b..d1cd53f05de6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -56,6 +56,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
> +#define ADRENO_QUIRK_PREEMPTION			BIT(5)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9c33f4e3f822..7c64b20f5e3b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -58,6 +58,10 @@ static bool modeset = true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>  module_param(modeset, bool, 0600);
>  
> +int enable_preemption = -1;
> +MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
> +module_param(enable_preemption, int, 0600);
> +

Is adreno_device.c a better place for adreno specific module params?

-Akhil.

>  #ifdef CONFIG_FAULT_INJECTION
>  DECLARE_FAULT_ATTR(fail_gem_alloc);
>  DECLARE_FAULT_ATTR(fail_gem_iova);
> 
> -- 
> 2.46.0
> 

