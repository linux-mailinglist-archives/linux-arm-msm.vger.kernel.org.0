Return-Path: <linux-arm-msm+bounces-72139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD61B449C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED993B41C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 22:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21772EB874;
	Thu,  4 Sep 2025 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0xc9Hbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9B199E94
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757025442; cv=none; b=EHOEX6Gw3epyRJVrAZu7ZsX73Q6VZOlo4lczSoEYfL74CE72v/q/O9omGoOkvb4BPmZEnWjaKKgUQ/uFkWJvB8A7T1/iCGp19ANhvQ4tLNjAPnv4HSy5qQ9bhIU0Y9zNlSZGu8BrczpO1uwgDhIP8vhKeFDSsavlMsO2fKylZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757025442; c=relaxed/simple;
	bh=f/5Gbyr1CWdsxodPVXRqAcGCWnBkiMwlR7r222vuNV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkjwN3ibX0nK2w1B6fg18g6+aWhU6L7e/iHgW6VLS879I36yoXe2Uiikitq5GECIGpuO8r9VsXtu5RRDEYBqSU1+FA57VsDLGyP1pgkooTvtxDDMEOKjAYQ+8bWWUdyuI9lQ7ZJRY3oxg132KdnZzFMyXlMDlr+e7BaxPvUS/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0xc9Hbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IbFgF022232
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 22:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2CGO/REBGrWC8A5KfH2aLIvx
	abm8DykPfCUfiGYyhVQ=; b=V0xc9Hbuhc2tGRsfn1/3nVtLdGG6ZF5yrK5PI/qF
	F4fBSBcRPSy+N8haIrPO5ZPF4qZxuoJkUHSBju52L8A6isYULPllXhVJHH4G0A4p
	x/1uWmzWVvaXbwnJlak2x3kGr8iF0rOxoHPC+ma1IJvhR9bYy+xavTQqjnfw7ivm
	7PXpS2L4kc9OcYFY6kiEfwO/MeSQ2P10zE8Chc/PSjPU1s/g+LYjiqgX3Axl61bg
	wvLf/dNQJJxNSI+HsPCewE91P465xjdZqf8PId4sOE1oUo6nFjdMiqxHPGn09P8K
	1d/Nb4HT4Umlrs78/HwXg3vJ5ImaS6lq3+CRsGK+dEm8YA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk98x4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 22:37:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so17528591cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 15:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757025439; x=1757630239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CGO/REBGrWC8A5KfH2aLIvxabm8DykPfCUfiGYyhVQ=;
        b=cdE9DaB0vheFBeOeRs73ddHoauvqOKurxNaM9N9N+R/wPr4f2FpwKy2IYz+LB6vjHo
         K2NzcD18AJqsgDBaCrwxiGiqJv9+4mpXVszLZ2CrMQMdSqgNjPs3R+DpOpjsG2Jisd4r
         8x0Ea42hy59YEqPqw0no1I8/1Qa9rAYdRcY1jcriTw0oabUhARw37Wwyzc3Ll6BpQ49Q
         znE0q87+GPCghyYRY+DkqBKnqipd8n1Orlz4y/OzWPMW0cqKaZ0ISO6LbTAi91S8q99u
         VBhOTqZ1yrq/vuncr+N8lqkeHUdZWKoS7WghV6GjEE8I7shrCC1vD2sGEkCQREgfLPOc
         GcYw==
X-Forwarded-Encrypted: i=1; AJvYcCU7zxAhua7Yey7Vq+naQgzCEDUThxXv5Cv6taGSZDprXfLfcu7t2e3m1zOGuc21Jy5A7+8FFBN60otP4kEz@vger.kernel.org
X-Gm-Message-State: AOJu0YzUu+kH1ozG/qkvEg4txsNnfEb87zq0AwlTEwc1RvYBFEyN7W+C
	1MDbvFB/FhhLjzESvRqSyQ2w2NulRgCRRpBWcAGxEAmAgkh9px0gJy0gO8KjqcViTH12qP5ks57
	XJbmcOveA8Ymho2y29mLQSGskQBmqUEHH/DFjysQ+zJ+FDqVNlm0ZnZap2bUObZeQpYvR
X-Gm-Gg: ASbGncsYi1Ou0Og9xK6GmsoLq81gSLMnPoUXEnkFegMUZwt3CpMlyF+dOcggUyfrMSC
	xtmPwyTSmrB8qhZDMvQlLzg7YIxZ5rASX1aCoq+H+xydcrK3f86ZzWqmGeixPjQ4nR9neW16E+E
	5EG/IEjV51ocQ6HveMgkqexkNn5a7shGNG+3QPWvFUptr6lly1kWRjwE1e3smfiDu6wycoqPZ4Z
	+kkQXf7ZV53liXSc1KqqW4oo6hGd9WWaJdgks+UrF5RCAJLKV0aaCbFWPZLneSjVJsgJG8lYT/+
	MmJHENyJ7XYqvT1Yrtybdi5V3Q2HfrTbiZ/EX6ivGIOZ8wsId+895pXprLwY6WtgexvUgUEd0YY
	UQ18QnFCHplB+uJVVWXAD0VInJh6TvVKCXc8/Fsct7Y4asUvmRnkf
X-Received: by 2002:a05:622a:8c9:b0:4b3:14c:e0ea with SMTP id d75a77b69052e-4b31dcd5f14mr281730551cf.79.1757025438771;
        Thu, 04 Sep 2025 15:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGRkrckqsL6cuoIERBEUVjYou+AKsBsGMaWClqZwQ9jBr3qfnwyiCR3nprT4Q6fdcGeWHpwg==
X-Received: by 2002:a05:622a:8c9:b0:4b3:14c:e0ea with SMTP id d75a77b69052e-4b31dcd5f14mr281730261cf.79.1757025438335;
        Thu, 04 Sep 2025 15:37:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace7e2dsm1443558e87.69.2025.09.04.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 15:37:16 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:37:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
Message-ID: <476yq6wmrjfcejmuf65mlimwnly6pmjjetlj3fmkvfypifwgke@uqdvmdovwnhi>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
 <cd389c5c-b290-47e8-a374-63ad1ae886df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd389c5c-b290-47e8-a374-63ad1ae886df@oss.qualcomm.com>
X-Proofpoint-GUID: oCevwziE15gETKz7WkYzmMrbOMgs3rua
X-Proofpoint-ORIG-GUID: oCevwziE15gETKz7WkYzmMrbOMgs3rua
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba14a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8QVSaPe9EzaLP-9jffwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXyy347Ohsb9GJ
 b+NyM12/drBFCL0SHvqBAdw1XYkG3ZnMjEmOli8RKeh8W3gfcGnAADtO4694ociBXAzGj6R4zs5
 qnkzMGo4bEboNY6E8lv+ng8CeahGmDt0FixM6x0FtRt4+jLqYssry6xK5U9q1a0wdVO6OMcDfQF
 8wlk/OAzyINljI67ylMZT+C2pkBg4ty2vpwF8WqvhDBcacN4UEwSmQ/EeIPjkyM31n05fqTNkem
 BlXIv30zqZoh6vMwSW1mpA11P0v97Qqn/BKhcK7HQk9hOmE217hQMalBYVNhbwsICtN4YbCgD6K
 b0272x8yPyHT4U10y713afbP1ovtwT5A9NKj77drdwSD3eLPjfN/YdfOuFxA5ISeGRfIS8795CR
 Zg3pkTm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Thu, Sep 04, 2025 at 03:22:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> > Pull common params of tiled YUV formats into corresponding macro
> > definitions, simplifying format table.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
> >   1 file changed, 13 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> > index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> > @@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
> >   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> >   }
> > -#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
> > -flg, fm, np, th)                                                          \
> > +#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
> >   {                                                                         \
> >   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> >   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> > @@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
> >   	.bpc_g_y = g,                                                     \
> >   	.bpc_b_cb = b,                                                    \
> >   	.bpc_r_cr = r,                                                    \
> > -	.bpc_a = a,                                                       \
> > +	.bpc_a = 0,                                                       \
> >   	.chroma_sample = chroma,                                          \
> >   	.unpack_count = 2,                                                \
> >   	.bpp = 2,                                                         \
> > -	.fetch_mode = fm,                                                 \
> > -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> > -	.num_planes = np,                                                 \
> > +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> > +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> > +		 MSM_FORMAT_FLAG_DX |                                     \
> 
> Hi Dmitry,
> 
> This sets the DX flag for NV12 when it previously wasn't being set. Did you
> mean for it to be that way?

No :-(

> 
> Thanks,
> 
> Jessica Zhang
> 
> > +		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
> > +	.num_planes = 4,                                                  \
> >   	.tile_height = th                                                 \
> >   }
> > @@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
> >   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
> >   	PSEUDO_YUV_FMT_TILED(NV12,
> > -		0, BPC8, BPC8, BPC8,
> > +		BPC8, BPC8, BPC8,
> >   		C1_B_Cb, C2_R_Cr,
> > -		CHROMA_420, MSM_FORMAT_FLAG_YUV |
> > -				MSM_FORMAT_FLAG_COMPRESSED,
> > -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
> > +		CHROMA_420, 0,
> > +		MDP_TILE_HEIGHT_NV12),
> >   	PSEUDO_YUV_FMT_TILED(P010,
> > -		0, BPC8, BPC8, BPC8,
> > +		BPC8, BPC8, BPC8,
> >   		C1_B_Cb, C2_R_Cr,
> > -		CHROMA_420, MSM_FORMAT_FLAG_DX |
> > -				MSM_FORMAT_FLAG_YUV |
> > -				MSM_FORMAT_FLAG_COMPRESSED,
> > -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
> > +		CHROMA_420, MSM_FORMAT_FLAG_DX,
> > +		MDP_TILE_HEIGHT_UBWC),
> >   };
> >   const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
> > 
> 

-- 
With best wishes
Dmitry

