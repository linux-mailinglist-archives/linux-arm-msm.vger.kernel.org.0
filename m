Return-Path: <linux-arm-msm+bounces-72147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C4B44A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0789A02626
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 23:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708C42F60A6;
	Thu,  4 Sep 2025 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJ5x9/nD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20B28152B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027965; cv=none; b=fIjJSEmrTpAp0NRYQqnUJ+32xJ+AU0qIetjPMdX8tk+zosXGfj0yFcYfNTcXZnzgkaT2m5Mp++jyMZcb3O3765oGB5LvUK4cnx9pKNrxYfZF0NUX8J2Qpn50YMr+ryXSEGlDnEFuOERX19W/3s8u10ktvjq1c0GeBDgxAtQoWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027965; c=relaxed/simple;
	bh=d+Sq6mF4s98JH1LQ5adEaa0Ic6JeXUlBr4QFvhvY/us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phw9KZ8UUAs5tTmcdkB7JgZsiqDNkMpJR3YCfGU37PIBb3WxRy/IYZtu562FYhq6M7M28uSi3EczOBGDoFcbpMA6yNzlJQHtDRjxAeLczL+FhoyxizGsP/QA7amYoVuPjc2qiC9F4iikrk4Dflb4vYWDk/7eXd0rJko8swZT7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJ5x9/nD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUlDD018103
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 23:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLamEPOoB01f6VolYXkg33VIoUWF3PW3lIXHLO79ORM=; b=dJ5x9/nDwqG0I6nG
	swbb8GiZTVtrD56ZTwIxLLIiuVNeDZ8Sc1Y61i0vOAyqhpBwmNMmVZIAfzslWWQr
	60uHkHujJSkMDb34pNGdci5ha/9K4O3u4rQPWHM7LX3V3aPoBz1NLT8SxkziKNcf
	b5kBirlxilwwF7Ti+OCxUHL0SvrvgrqRs8DCHqsapazATKeLFuhX3iRehFaHrXDg
	DWQ4oKbZt9PJQGC1Ppfzn7osLpOj5LjDZNyWyirm/8SviFNp8cbqFSAGnkgKmLVm
	WFt768rDvUC67QQU4hbSp2c+XsiwUse5SkUR8IFMK0E/R4XT67f8xZG2CRPqeOfV
	3a8Y0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebus12n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:19:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329dca88b5aso3258462a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027961; x=1757632761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLamEPOoB01f6VolYXkg33VIoUWF3PW3lIXHLO79ORM=;
        b=bxcC3b8iZI90K8ioMtpaYLmqxIXdmxNqlVQz5s5JqIn01pqI4H5XECTTlaym1FPXnB
         /Q6zpT81qs1KVUCg1hnHQp0IXj7EXrgwzlZw0RbI+6XcKkixmVAMhJTjAwcilexxs5oS
         CTSFgJD11EeI/kkUHl11lXnXrmcIB9wWdP81WNsAMZwPsh03rEynhYcy0VLxrMR8LXIX
         jN+qwzF7U6ILCs1AnxN4KIzYsinRo5XUDnEJxw2fcQkTPjTqmbmuDMPiE+87GdluSCXd
         cVW5L6nXOUidZAoDONSmZvTg3Om4iteMArzVXJtHnaI9Ihse90W/KjCDumEPE915Z2Yz
         cs4w==
X-Gm-Message-State: AOJu0Yxs5/Tu2rn4dCg+RiB77jkLxHBuCRD2z9Cgi8URs9YI+HbF6Io0
	1J6pjh/RH1Fqn/IVeeXLXfBUa8lthIpOk90yTSpAVks+Kx8Mkzns0pGdr9h4FP4yPH5l3Q4+6NS
	e+7VQPoz/2euidquKItgjJy5Ix+/ubxSypcsu2gkFaVvPflPj6NFvFFyaaYgkOT6dVBQW
X-Gm-Gg: ASbGncsQmYP5uYxE8DA1/eiJd6HNUn4+Bgu7fTLo5hcKwaM5zagkCNiXbcK3YgBJ+fY
	4y+Zzb4SXgYmkicGW5BGsFza06U9Gtm+HKzbwB9CXv8aIr8xgY2oMvpAKKGRSzZJ2W6gRZAdZ9u
	fTQQ9S7GqkxTPDs2kdhabhQf0JdfytXFyqWx07ZwfmPe9zDQy6jYXbvpMDkd/AjxbFJ5NYYATov
	fXzoWZEehkMfPJwrkTMyp1OS8PDhLyEiy5UAZ3K41ZnfuNe5SaWlgVWZiR3+mLfWOO48So88FSG
	aMvOY/V3J69P2aR/kaRCTpAT/BoY4/N2954sW+mWW0OjZMNdJNBsm4ZWiGzvuU6Xcy3b2/+qxIQ
	WIJut/xJ2eEY410l1WMl1XQ==
X-Received: by 2002:a17:90b:1dc1:b0:325:4aa4:fbc5 with SMTP id 98e67ed59e1d1-32bbe21494bmr1348049a91.14.1757027961309;
        Thu, 04 Sep 2025 16:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG14iUJGLqN5Efv5E0YS8iVGtsqzNk5BuOTvAdvDoQ8LeCJbUThTNVtbm48oZSXTCF0CmSDPw==
X-Received: by 2002:a17:90b:1dc1:b0:325:4aa4:fbc5 with SMTP id 98e67ed59e1d1-32bbe21494bmr1348016a91.14.1757027960807;
        Thu, 04 Sep 2025 16:19:20 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab9esm26872664a91.4.2025.09.04.16.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:19:20 -0700 (PDT)
Message-ID: <6e8b5af4-c4c3-4354-84ce-5d35475032ac@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:19:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BF2hGNvdNgUlJ8jfBAnfRFWs47rV3eb4
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68ba1e7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4y6PIlbho9MLiPufaWQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXzXQjMEsF6bHe
 2RsCiCDESiLM8nUY54C4CmKtgdRekgfCOGjcgowTJaEN4l7UFPakI6yh8kgX9YKp1n7ogrD1fQg
 18aUlQQ1pTUChtb3MPrGTdYrppyT+xpNU2VjCaKD6quNfv558ZJ/6x1qhEnLvn8p9f6fFoOITk6
 HzL49Cgx+yuNxJeb5J+gM9MfcJq1qYVKqpsLAlYXpXG3pA3Q6H/GCfyvv6/omBOjIyI1ilk7rJ6
 69k2ZN6hMG5WHnI8Ihxt2Sukb8S7Vsb1VO/gv4VxagGoIi1FuLXTmmvMYiogOnTs/sKahN+Fma2
 mPJm1YZqYFoX/poniOOcpjtSViJoN6VXRhdY6CqQdnIUuj7w6Od+jrZ+wj21B1CR6DamgzpjvXS
 bchfE96G
X-Proofpoint-ORIG-GUID: BF2hGNvdNgUlJ8jfBAnfRFWs47rV3eb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
> _linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
> duplication and simplifying code flow fror the UBWC function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
>   1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 59c9427da7dda07b8e8ee3d070d2dfb3c165698e..195a6b7c4075eef40e7a5d0fee208168421cee35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		struct drm_framebuffer *fb,
>   		struct dpu_hw_fmt_layout *layout)
>   {
> -	int i;
>   	int color;
>   	bool meta = MSM_FORMAT_IS_UBWC(fmt);
>   
> -	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> -	layout->width = fb->width;
> -	layout->height = fb->height;
> -	layout->num_planes = fmt->num_planes;
> -
>   	color = _dpu_format_get_media_color_ubwc(fmt);
>   	if (color < 0) {
>   		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
> @@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
> -			goto done;
> +			return 0;
>   
>   		layout->num_planes += 2;
>   		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
> @@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
> -			goto done;
> +			return 0;
> +
>   		layout->num_planes += 2;
>   		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
>   		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
> @@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   	}
>   
> -done:
> -	for (i = 0; i < DPU_MAX_PLANES; i++)
> -		layout->total_size += layout->plane_size[i];
> -
>   	return 0;
>   }
>   
> @@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
>   {
>   	int i;
>   
> -	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> -	layout->width = fb->width;
> -	layout->height = fb->height;
> -	layout->num_planes = fmt->num_planes;
> -
>   	/* Due to memset above, only need to set planes of interest */
>   	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
>   		layout->num_planes = 1;
> @@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
>   		}
>   	}
>   
> -	for (i = 0; i < DPU_MAX_PLANES; i++)
> -		layout->total_size += layout->plane_size[i];
> -
>   	return 0;
>   }
>   
> @@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
>   		struct dpu_hw_fmt_layout *layout)
>   {
>   	const struct msm_format *fmt;
> +	int ret, i;
>   
>   	if (!layout || !fb) {
>   		DRM_ERROR("invalid pointer\n");
> @@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
>   
>   	fmt = msm_framebuffer_format(fb);
>   
> +	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> +	layout->width = fb->width;
> +	layout->height = fb->height;
> +	layout->num_planes = fmt->num_planes;
> +
>   	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
> -		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
> +		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
> +	else
> +		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
>   
> -	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < DPU_MAX_PLANES; i++)
> +		layout->total_size += layout->plane_size[i];
> +
> +	return 0;
>   }
>   
>   static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
> 


