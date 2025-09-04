Return-Path: <linux-arm-msm+bounces-72144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F08B44A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2001899A20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 23:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F208E2ECD21;
	Thu,  4 Sep 2025 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrdUwGyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBD2EE5F0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027208; cv=none; b=jLPmjI6pfoIEp+9zg9o6zqTnApSqywqq/n6m9zxe1BzkWu/0CFOxbXJ09Ttbpm92i5wXgkJllbK6X1YuOsNH2wmW3+n8JiZyieqtwdmPIVVO3uuAwe068NFwQsizXHVpiapJMPeq2Vn+JPlvUlaaKZvvdpNKx0VW0L/gZ+UXJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027208; c=relaxed/simple;
	bh=aDwrEm2VIC1xhFSWtzaKyRKBx5TOl1LwZce6mwFZnXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvW/WbOAeqtLlL7dEOnGozSrzrDqTq4Wj/azfQQtMyOubqZqdL/fMcv3yflmUUx6etuBZP8io3JqXk0CzOxqfBeyFiA8y4+V6H6CxOW0HL/xd1KP3GpDGmH/SaKitKUxfqPpetIeoFj2Tq4rnrTXjDPu1Oy7yF1G49EMNXSGhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrdUwGyI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IfJN1007823
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 23:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY9gK+ThVgdI5BFWW5e5N19jUdr6ztEXbR+lsuj6qWk=; b=CrdUwGyI84hs96ga
	0JaoYzxVoEoh9RJQRiRs7mEEnOsMTWRzPhIaSBH3pwAHc2MwGDe/tcMJXVQ6ehhc
	1caTBAbDcyWD7uX2T0vxSGjDNr0IkD7kMiV8PWC2NKu0YI9xY3at8keHzI9OPuLV
	P3J2TSBoFmOd2YWr//2sfTpH8YIUwnL6QMqxX3R9u1wDAGK0VbUdl6SIP3/GZJcQ
	2r8DCuDcr7wNijLTUnmtgg0ScCsypSahmAv6dmrZdh8R82vuTrguyi3KBHlBKHIJ
	cKFASzWqjSwL94WH2xaJHXSZrfs1i/Mp1fZX8/PHdQ6ofMG2V3JhRA51WU805p98
	WRsjGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura91234-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:06:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-249118cb74cso18227645ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027205; x=1757632005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pY9gK+ThVgdI5BFWW5e5N19jUdr6ztEXbR+lsuj6qWk=;
        b=psDE6xjGeCK/DLOO1fOHEbS+vKDQANZCDUIt6lHJ8XpxQcbAtaZ6y58fXdRKMUQtxD
         lk4RmErBpZOW5lRISEeFoB76IqF5KsTJac6YQohJJkQXg8l5fzlJmixg6MRSLPhG89mc
         McnN8mlSkD95bmg+2tnqGjvt1CFjzjfdZsLftZS+jhbtRkf/aWkHEyuW52SHF4G8wX2Z
         2hy6EPB+Jn7cR2Zn7fyCWN0q/BHBMx6kEl6Owv/jdLaPtDkvam3i1PLVrlEYbnvNNZQQ
         hwKsEl3NG+DfqsDDBu6HdMF+Q4sGJMI/3ucucB1i/99SpXIF5KfttEAZnD5M2SJNOj1X
         e7mw==
X-Gm-Message-State: AOJu0Yz9tCSGe5ujHxoPFVZWDBBdcwIvqPSiB91IcXnJgE/i1SZHu/mi
	2jQGu0eQRmSM/BxDjrbjY1vTPTNq1ZRSZXqMzViIX/bgTdBtoBSIVYyQZBUEWZs9pjIfY3oAr1b
	+QZb8tOs/GZe5hh2niZ0PAHuEZxV3E2xxkrdMmyG6ogRRka9cZu++w7Pc1D+jkfxa7D+n
X-Gm-Gg: ASbGncsPp7Col2oXRDSNCsiIzIKyUiv1uE70dtiNJhzwD4gLaHh3hfOKbNosyqQUOlC
	DHyuo6OQjMtspgekqEjQU4GwsedecsT6Cu0pWem72/+Zb8Z3jPHE0ENpI3VZ9Z0+4FJtiDN/XPW
	DRQ8h53ySNmFt89h72No6da1Dfndkoedb4t6rwjMXNrV+ndboDAQAk8zfrWrz1rYFD4rdBsEnMJ
	AIzTRn6G5v44a7EmFI8q/Df6J2Jm2JLubGWDahWDdoKFHbGkGAHCrImHpydQ5CewmjE1VGwVRVn
	3OqIyNWazzciqotAN0XtXhUnrKSWlPR0TrFjpg7RiGpjSfnuhLs4B55bQLd2leSWO+B8aps3jwU
	+gQE7K8kRcELaKDz61lQ8Hw==
X-Received: by 2002:a17:902:c40c:b0:24c:b2a4:7089 with SMTP id d9443c01a7336-24cb2a4744fmr96647775ad.31.1757027204613;
        Thu, 04 Sep 2025 16:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAW4qcjG7Y8A2utGWv8f38r6vB8fRI7Y1MOVvBYSZsUgaoyRNVFvDzjj+8gtnXDUuWGYNuWw==
X-Received: by 2002:a17:902:c40c:b0:24c:b2a4:7089 with SMTP id d9443c01a7336-24cb2a4744fmr96647415ad.31.1757027204091;
        Thu, 04 Sep 2025 16:06:44 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c7f3b762fsm62808245ad.44.2025.09.04.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:06:43 -0700 (PDT)
Message-ID: <8ce859b6-c4de-44c4-8fc4-f1edeae1c06f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:06:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
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
 <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k19f9Gu5une3VR9Qx3E9Ka9AjTlKNjAZ
X-Proofpoint-GUID: k19f9Gu5une3VR9Qx3E9Ka9AjTlKNjAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX8eNy4Sl1VDVi
 24G7W0LiYtXr8y65f+U4KyzD2S7uH5XN91d2X6rRCB+eB689BK9fo00nAXlqkzcceyNZ6W0oY12
 fnprywlV3G6g0cpVcEpca9AtX/ooVzsvmJM8E6CYvrR0mBkj7VN7rQ1XbrjpNq3i/rmaCJDUJhv
 96aCIRpLaB6YR31TjZtJj6/b1HN2nIunovmc8I4ZMCUc+iN+dOmVoyBd+VcOghJG5L5p74Y7a2S
 vfwUick2TI7xRitQEyYOBRDdNgrWWKQq/d40lNSmGkStvNfsMB5eEOZLNgO56LWf42bNttl5yD9
 jX60k3FUkfv1udvcP3kCg6IuIzC4exTMsAjkAbRtub88vI93Ye1jwtCUE/5ZFLfvPQXJ7kW0sGI
 fnQUPVMd
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba1b86 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QKBbl6H3c_T8Obeb1L4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Define several additional macros, capturing tiled RGB format classes, in
> order to simplify defining particular RGB* format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
>   1 file changed, 85 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
> -alpha, bp, flg)                                               \
> +#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), 0 },                               \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = 0,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 3,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
>   	.element = { (e0), (e1), (e2), (e3) },                            \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
>   	.bpc_a = a,                                                       \
>   	.chroma_sample = CHROMA_FULL,                                     \
> -	.unpack_count = uc,                                               \
> +	.unpack_count = 4,                                                \
>   	.bpp = bp,                                                        \
>   	.fetch_mode = MDP_FETCH_UBWC,                                     \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX |                                     \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
>   	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
>   }
> @@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
>    * the data will be passed by user-space.
>    */
>   static const struct msm_format mdp_formats_ubwc[] = {
> -	INTERLEAVED_RGB_FMT_TILED(BGR565,
> -		0, BPC5, BPC6, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
> +	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
> +		BPC5, BPC6, BPC5,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
> +	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	/* ARGB8888 and ABGR8888 purposely have the same color
>   	 * ordering.  The hardware only supports ABGR8888 UBWC
>   	 * natively.
>   	 */
> -	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
> +	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
> +	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
> +	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	/* XRGB2101010 and ARGB2101010 purposely have the same color
>   	* ordering.  The hardware only supports ARGB2101010 UBWC
>   	* natively.
>   	*/
> -	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	PSEUDO_YUV_FMT_TILED(NV12,
>   		0, BPC8, BPC8, BPC8,
> 


