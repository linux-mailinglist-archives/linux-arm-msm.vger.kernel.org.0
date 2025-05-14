Return-Path: <linux-arm-msm+bounces-57973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CAAB75D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A573BACB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2092293457;
	Wed, 14 May 2025 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHA/JbaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39102920B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250584; cv=none; b=N+9vzhEurBxfg9IOKJoKtZ9mWj4h+vsoI5CJwuz2d7PmD2A7cLaZd3mrR/mxw9I6zSnPYyZf8OsDljpmtHBBzdmzlqOSkH79x6lXIOgl3T6nUKh4NXCacxsfvPzTDioZfhFf0EUB7bhfFnLYQrIfsE1H5uIU7W+W3E/lU6jEQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250584; c=relaxed/simple;
	bh=j9uir9V+Z0qRL1i3pxGeOyaqYFJZMvlZCDZP+qy5Goc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shrB1ooLNJKqOgsL8ZI8PYWONcfaIcEFct9yFy/BFCCuz0EuO5BTqG4ruGLWENPgTMSMVzH1q23B/Hj/spPdQRWZ/6ET3u6icPve0DLRyao7cUrRZyrOp8d3uxKZIEGwbbtx0wJuUAono0Cz+UdGTDhQkDMOE47SZtmOhl2FJ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHA/JbaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuwsF002583
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mKY2kA0Hg4toLKxTT6H9DxX4
	STNTctz5Vp4Wq2VSocY=; b=NHA/JbaBtrnn8S1Mi7izXk+v+tDAebAEvZrsK2Uf
	q0GBIWoVBmku2nPWQyXU/RqRfyZhPM9MDpGg6YvFcNGsLfbiwnjMMsl3ZGBtmw5i
	3fXrcUH2ezo60TSqGK0aaSFxaMdmOvvhj04EZj+wQBtcidFO/lqqcJJ8vAF5HmuC
	wBr8HlzK6JsKSXod5ZbUC5yI+wdQ0gpsiB7mNixXytmL9QOkzG9FpP3IU7nKhQlc
	rYvNjgaX+FLoAd2oZrKejdzfEmO0Kj3MenBfd3qwMsIh2dpPCT2dZs3ydanmRDvh
	WHJEeynonl7ZBsZWWO9b0wenoVGt8FGxWjA7elO+b5nScA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3u6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so25349385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250579; x=1747855379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKY2kA0Hg4toLKxTT6H9DxX4STNTctz5Vp4Wq2VSocY=;
        b=ZU5E78/Tvs4n8BIY5dYyf3FzdEYkgNL9INiv+gQJIhwwV8meMz7C9sTGlN5nIFbAio
         Gn6Zh2OiHU7RMBkOnpCO8WLG//sNkmFB54aLWrIbschARMjzo6Gc1TNBKzy5Yyke6jNY
         5oQiDNR6LKqM/cExliOoc1X0aw8roroF0wqhpto7LZGMdOBFNN2q3bTG4/HdMj+zn3NW
         XYx4ULq7YxQkfyzWRRdzyuyUiMQEOnWSMLCNcWu9qAke0Xx9BWJcyClJx9RCh0AQwNfk
         dL8xksLWvPti/dYe7Vq/BhoJ+mWQ5pedkQYYk3yxRIddmIvzNtaMJx2Tth3cJ/TKcFoA
         Xe5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpNUdtBMpFfD8ThpfViVFbc8aaKXGKGzXbgx7rl5+7i4uTQkI/1SyEnH2ueFsRKaVboNpFO7QbeHzDgCaS@vger.kernel.org
X-Gm-Message-State: AOJu0YxhX9qLZ2qiPDhO2rf2HOiBjGx9SZp3cMb+gcGqx1d1sOLCCq9D
	ZyAindl6iOGBe1dU1N4kYKcOUe67Y2CB2h5KcqG/H/axJ/BgT0wRWdTd1yqe/9EWryDpbiobf+K
	z8l2b8BSdSrVBAqmlxRn14VXS32dprsQClNvQWL4eSXZoysOz5v2xUNNIDnGVahBB
X-Gm-Gg: ASbGncuCzJ9pSDnmIb7wu865iJM/NzxypAzSJh6jtTjiiEdYur6dL9Mh+iTdW+0gvi9
	qzrfoD+TZyKxfZIeAT6cNMyp7b0zH3EK8d48vLNt1YUKq2++ZXVWaNv2uUstS1lpIanI/IZkXIU
	9D4zcQynTY5LmH2PUh6qQyWZhS0SkRlJZobcQlZ4575oTQXcrefgwNdJnLumnKdO7IIytflUeNp
	IGK/dbu//1iUwOpdYrB6TtqNQc/lK+EMd97j5mF8rlrqrTTqdtWGV7Y4HWyBQUluLX0lWyv+4Hj
	zxrwmSJGUka/Z/1xh904ZeSggWKsHKTOvYc8Glcczg6i8zwi0Ya8ANHwD4McFLrWQG0FFo86hFY
	=
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cd28846e95mr586958585a.43.1747250579142;
        Wed, 14 May 2025 12:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYk5rRAMy+pvInB6ryC0ZgCWwQPsPkasd4Ia5p0Xo2g1JVmVd9E35s1zaspBWgK2FjvyRDqQ==
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cd28846e95mr586954885a.43.1747250578639;
        Wed, 14 May 2025 12:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a3c1sm21135191fa.1.2025.05.14.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:22:57 -0700 (PDT)
Date: Wed, 14 May 2025 22:22:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX8KQkTbXDgOWU
 T+wglWCWjQV7tDVLE8frVRskPG1hj41HwQDXMO7vD3EECyAsxoiPZUKc+0SPHl2OCGlpw6OdBEf
 i4HFfD++It0XOqmQxt0ePVDpH++LS/LB8MNE2DvZwXpq8OvUbvMEf/qDeWVPVrOYTokFtlfPzIJ
 1r/5fMJuIuRHLTjvx9PyvcqII3Z/PuUR0Wer15sEL3PmLipCLVaJIwLLw7hQhB7L5BmGQg6MOFt
 DaH+0tn/dp2ih+JNG+9+Wnxh2OUrYF7gYb5ZjLvQfXGUGuHtqxZ3N+yjM3/zEgh3DTSIYjq3bsX
 DlJ9VrhcVzQShM3eCk9pzaOZP6X0kEesEUaoOeByv9vKYwW/wHFx0wLu7pWgM0nA+78qJIaLhyq
 TXvVK5rlbqeoUywehrF7DEuKRFGIppaKPTYX0xbN7+9Z9gscO7xkoZYGamVQamuJAXqZG+AC
X-Proofpoint-ORIG-GUID: n8_qKkJGqmSuCt6LO09Tu5oxlGH4JXKM
X-Proofpoint-GUID: n8_qKkJGqmSuCt6LO09Tu5oxlGH4JXKM
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824ed94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UGnGT-y4eEc3t3GJXRIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>  4 files changed, 50 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>  
> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>  
>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct qcom_ubwc_cfg_data *common_cfg;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>  	a5xx_preempt_init(gpu);
>  
> -	/* Set the highest bank bit */
> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
> -	else
> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
> +	/* Inherit the common config and make some necessary fixups */
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
> +		return ERR_PTR(-EINVAL);
>  
> -	/* a5xx only supports UBWC 1.0, these are not configurable */
> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	adreno_gpu->_ubwc_config = *common_cfg;
> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;

Ugh. I'd rather keep the ubwc config r/o.

>  
>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  
>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +	const struct qcom_ubwc_cfg_data *common_cfg;
> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
> +
>  	/* Inherit the common config and make some necessary fixups */
> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> -	if (IS_ERR(gpu->common_ubwc_cfg))
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
> -	gpu->ubwc_config.macrotile_mode = 0;
> -	gpu->ubwc_config.highest_bank_bit = 15;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	*cfg = *common_cfg;
> +
> +	cfg->ubwc_swizzle = 0x6;
> +	cfg->highest_bank_bit = 15;
>  

This begs for WARN_ON(cfg->ubwc_swizzle !=
gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
after testing we should be able to drop r/w part of the config.


>  	if (adreno_is_a610(gpu)) {
> -		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.ubwc_swizzle = 0x7;
> +		cfg->highest_bank_bit = 13;
> +		cfg->ubwc_swizzle = 0x7;
>  	}
>  
> 

-- 
With best wishes
Dmitry

