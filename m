Return-Path: <linux-arm-msm+bounces-72136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB4B448A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 23:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8C9D17F0CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 21:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF0D2C158F;
	Thu,  4 Sep 2025 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdqixAeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36B2C0289
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757021725; cv=none; b=KYyA5i6xPcHohvv110JLqLPz5XD73XA9FULaXQ39z7cuIKG30VNIqdvrUynxbIhWYdTIznwIn4tQsgi0YqCkD9OeBrQMKvqMVlS2Y7yYthE9Twl7J5jcWXr3akN5NGT5HSMee1LXPre6FL/WSVN3aS9BT5G6IBLxgeoT+QpXVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757021725; c=relaxed/simple;
	bh=p5azPGRp8fKE0V5AF13q31U7ZbgOwVv7U572k0NlXhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ix/HXH1aae3fEjswUHYb/5voGObMNnb0eRLSl+qNfyb93ztVoVgtUiw2jd3ovblLcLEurst4rBlH0d5dwDVNNH0rrDkARSCslLeKb65hdvSbK79epKxK0f1tmh8XRsVaNMFLrjVDXDoO/J2kdJ6Xz+L7/2NcdLwSmAe5wiFCX28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdqixAeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HfSrJ032388
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 21:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=; b=mdqixAeoCJkWbooj
	iV81lDSVcjKJFNLnue60LYvsuNufsVhkyrkaHuZjCQ6xdYNP0O0KXjdv9VSrg0/Y
	2U46AT+05RG7V4DeTZRgeoss2aKXORmiJ4Apy79wl7F1DhF1jUfQLRjU5aiN8+EY
	8iOhu7ngq99teEifZeWsPCbYCe/Ow7tt710HQu6FDbfMfV6htbPCgfNXasAwRtYZ
	OEa4srooUnaggtqJ+z6gYfZHNtB7slNFqhoA2PL2fVx5SYXD6fniBIyhfbIesPX+
	SYYWl3K4zlwSwj0RUJWjJzlu6Q8biP0dNmLR2tUn4FF1+45ELwPLftvheg1mu9Od
	/9Nlsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnph4p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 21:35:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24caf28cce0so30650485ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 14:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021715; x=1757626515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=;
        b=w7YAlTrsBMuVCnra9m5qysqxFyNky4Dq19v+WAtRxpAeoDbp9/UdplFAxkLW+2AoKn
         b44aC/nDnrg82q025zsPmZrzmoj0PBLrm/UQP415sk/oEmktfCjmpDkKJftNR6On3TrA
         zHsgRC+V7f9gYoZg0M199+fLFiGUh6OvZSpDMtUYKnXocWVKmXGY2CkfUPvdx50/5B/N
         HBBrJw/vw0PSPj25zhdtRR8gPUc/xt4NQgV/c4ysSwOHOM2HJ1tLfaqAwYOjZdZGu73z
         BGqm1okxbdyhTR2x1qaRxhClLPhae3VmyuLMCcNBnds+nif5YFKqpBio39Q9lisD5wei
         M5VQ==
X-Gm-Message-State: AOJu0YyZ/Cj7Lz4HJYwLhiTlqWzbHR1VI5wvlX3lIXCh6MyxrgC66vqZ
	J2HDuuOlvZwFRK+hjxqsaf74CbgFVDj8iw0wb27aTEZlm+irZuKvU/+uD4wFfUTq/1ggTl3RXBb
	COFhlX+L4KeTN36K2RDr5qKIDWoMnyNXjQ8qPeK1v86/vuR4QDE670VswBdlWHIq+g14e
X-Gm-Gg: ASbGnctqoq0sXVjYswWiYmI6aEsrcPFJbi8q0248BDUqGNkZg0S1qcxyPY5YSvsYJAj
	4fGlyJMkS6eowsty66//ATYrIq3R8L3wz2QqyJiO0EKuTTbXFA4JWNDILm/1qE/h4cg5kgvE8Pb
	7O5GlqxH6Qrav93UCNQ8EcanwjZBcgHeLypXXVxvoojI0Jccjas6GRFksrqDN6Ck2H8rbyrTXLR
	lXnpjj9l/i9s+ezFNdvWK35fi3zxyljmRZCr+fKepjX2JurtmXTR3GDSzGP9jxqNoECw+IQgrh5
	JZcxVU/JXIWPvcSl5AvkvcsWgU458nijNNaV7scCi5oLvhn6j+hxTslA1KD8xAz5XL54Q9KRFo5
	ZaUlmFVsIahcUEjvYSnHRag==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id d9443c01a7336-24944b1fc6emr283192335ad.59.1757021714798;
        Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp3igpntYcHLO4XqweUiLyIuxXfhO1KED/bu92vbMqGflTJz2eGcJkzb2pbmcEUuUIo7WMCQ==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id d9443c01a7336-24944b1fc6emr283191985ad.59.1757021714309;
        Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd76e157sm22652365ad.107.2025.09.04.14.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:35:13 -0700 (PDT)
Message-ID: <c80e6933-8985-4da4-8498-66cedaa87b1f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
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
 <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i-T55sC4D084dp3H0XavUhrD50dyIyD-
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba061a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2YQhiLfsl84BKudLmi8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: i-T55sC4D084dp3H0XavUhrD50dyIyD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4sU59Yvt1QSM
 djMtDQYOOfvIeO2UpMmkvGoKMDrWA/OnP/tbOSQaxbnLrPbeavYSf4MaaH5O7YxNIQrE4CaTu08
 EHt+sghzGBhNVa9aBnJcV2SlCvUjuLZUphkaCR+ZcMJBR3EEfdXRn/lkyztX228EkZcXVbEk4o3
 c/6SgIUxWMHaw2vL3Z8unpYd7TNTLt/5lyeBIN8H0U/PDbuheW5QCUmxZEg4zqHvuVyhR4clehq
 MJUfzkiM4o7nhV0FSW2PMcyhBF6sI2EUuoMDGfEPaw1HWDF6bLbB40nHMhD3c6xFg0h75RXw+Ez
 k0f8a7Z0GqRUqUQwop9bYvVkHZX+/egkK6Dso1zX/JpErRJL8NuAEwEUADJZMfR3ZBvVjQCQ9Bf
 +TEZLb9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
> Specify num_planes and fetch_mode directly in the macro and remove
> unused parameters.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
>   1 file changed, 39 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define MDP_TILE_HEIGHT_NV12	8
>   
>   #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
> -bp, flg, fm, np)                                                          \
> +bp, flg)                                                                  \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> @@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
>   	.chroma_sample = CHROMA_FULL,                                     \
>   	.unpack_count = uc,                                               \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
>   	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
>   	INTERLEAVED_RGB_FMT(ARGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB888,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR888,
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB565,
>   		0, BPC5, BPC6, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR565,
>   		0, BPC5, BPC6, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ABGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ARGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XRGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(BGRX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XBGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	/* --- RGB formats above / YUV formats below this line --- */
>   
> 


