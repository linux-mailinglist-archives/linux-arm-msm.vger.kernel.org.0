Return-Path: <linux-arm-msm+bounces-103990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHZGE2cR6Gm2EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:08:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C4440CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315543024979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD0F139D;
	Wed, 22 Apr 2026 00:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pscRoS5m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/OQzw5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860571FC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776816461; cv=none; b=QZOhen711sgP7jslp5TehIEDBjUjfWdGLg1G4TtKBFj8tc0WXKAvjTJ1yTsR8ZwN+HHdmsCwD0mHE/F03CSwYg5xf9od2+wjTgiVmPDThZz7Ix8kFQE4HRi3UN00VHbnGyrk0RWAh7YVoENGmMxzvoTc4TeWwFcMsAyddioIdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776816461; c=relaxed/simple;
	bh=Dd6xThUIm7yeX6a2pMAlFlPOP9Ex0pMa9i/ePWx4Kn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lr8yjmRcwLsl7hPVOdhrBxC5MSBs7hUlKMJuBdXoiHrt2/hNvk6oGf7Su1hdTSjfs6d4VDCzdbOVU7zs2iXP09cPi+0KawFivR1e/qB7+iQ0f1HhvQHalpsBomnwtuRXpjBbePytOYrEVVPHzRzuCyTNyxOjx0kh+1MhJ30GR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pscRoS5m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/OQzw5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZhpx976175
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ClrHDpExnXUz9Tj4jHcXswWQ
	+f763M3nUQfd5faWuqE=; b=pscRoS5mKpok6mcdKxFDeFGFQdk/7/KBcnirCvBc
	0SI5ta2M3YPfQjtIbqyX8AcvR1H1HeSSu/VAJhy7+NKNQUFeGcP2npWDwioh8JrZ
	d0VMEjosCRXKREY/qm+3FEM2CtqzAvA+Svd9y1cIby/R7p3LP44UhtSszwNjNV2o
	yvsgtjKWTuUbqDZQTcb4vmk4VRXAGsztigOhT9d8HZFD4qaKFwprAN3TTivndgz4
	RUc1bsuPpxoviqewkH3mE050ygprVefIYhe6zvQezi6GFWWeDJz31l784pRG7jWP
	dohMTey3FfxAIKBjpuLrmNFrf9+TedrxUWoh4AryhG44/g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpene8vdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:07:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso2214172137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776816458; x=1777421258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ClrHDpExnXUz9Tj4jHcXswWQ+f763M3nUQfd5faWuqE=;
        b=e/OQzw5k5V33uVDubO5pgelGXDoUJvNDR6aOxrFHa74+mFpyrKIsf2wGuQ2F/kDWcg
         0nV+UzEg5RSivaLNQzZQpijZIjr452WaEWGVyHM9vikNrn3iXFIeTb/gHSsg56Vao5en
         PTOpbYdUUAoo+BkMPKomAPRYTOMahKVeIiG9sTGwaqZKY6EJ91dfyNN7yVM2o0QKWXNa
         DhyU3s+XE/jf53gP3Tgf/EWGPTYOqvknFxIT6HnBImVEe3upcQS5zx6YrD2Kmrr3EoGR
         HIAcPQSIu70qcWcs3stSEGMlxarkA9gupn+1jN5wvyAO2fiUrOXZ1bd5a+p5bqLmeHSa
         nUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776816458; x=1777421258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClrHDpExnXUz9Tj4jHcXswWQ+f763M3nUQfd5faWuqE=;
        b=h5vl2/Sintn2Q0RdY5a/hRor1ozC4w15jzOMCdaSWbduZH7zBmkt2rbgBbIhTWO+l9
         639XJgLogoRxBThXMYC7iXsk2lyeBjzXAJ7ICcx3v2A6180jjYoBlgFrzy5METuNR3l3
         2YruXuxKkl2eYcwLSNhUQpIPX3VFgvOb6YtPhQ3zO5o31EpQz48o1s7khV8f0LLupXL7
         7wgMzaAtGocRnj7qesMD7cfPbijFb7LnaJfwXSLOhBROawHlsz9IBbgGzcLh4E6pV6TE
         fgtdmgK3OtjQmEmUxNG6/d3dVkpu8AV9rwQUNptELa5ThityJFIgVD7TsUZYv1Rus8Fp
         Zmtg==
X-Forwarded-Encrypted: i=1; AFNElJ+LzbmRP2vT/uCZKQyDwD2VJcvcctMswpKUVWhcw5f74IIl8AyD72xrSH47g1Y5zqfg29MBEhs9IUEtdoeM@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfEkKnQet3D+HQZwcNprTFQyd+SpPEC3QwtqFA4frwsqdrMuk
	28XCFxhvdUb0CVv/GVZUrDygxmA13VatO5nraARcu4AyWlpbTFoe1objCU4OCknnWvp2fodhNIG
	zonWrPfTGNiRknJqKbiJ3Ir1daToV+BZvccyIeVhm63C1by0KCBSD1BQ2MIpUqXB5a8EnqTdgnl
	dA
X-Gm-Gg: AeBDievdLhEvTNTCiIXy8j7e/ueRJ8SwsROIl6/gNPmtelTISmGDBsnR2E+mvygu4z9
	1l5SUbV1IjN7rs1D3D4IU+vOfes4w34WEfvE9x83byuUeM1CZg36bnt9KAyrX33WUeQchJ9eOXv
	3weC/jjOwcWzGRVbgDqo0EuO0qxHCT9uvZhAsA9/eyf55mw7bi5FCdLJ/50OzG+eSTkfG1O/myv
	raNUlxhzrJa4l16lGy7k2UjN5gAwbVT1ltq0q/nki92+Cy3v8+UCds0ZMDLP+fPO+GiiJ0Jb7//
	w9yzyEjMZwTb4LrAv5juvq+4JtmLs1B5Oa3VL+CrUJ5kBrojDbVCXaOQsn3ESwpdB5oOlAQyFq/
	+bqmrTQWDWCyR1GlerVU981zlDo5DiZBKZ0h0Yh/LdKIRgsx7jil+aiE1q/dF5rCL+8/t64VviD
	zyRJbvAKYsHk+z9MY+MJ4I8hN0Vp1BQ9aswkEpVVNcHZFN9Q==
X-Received: by 2002:a05:6102:6c9:b0:607:f24a:1bef with SMTP id ada2fe7eead31-616f60b3913mr8703368137.13.1776816458207;
        Tue, 21 Apr 2026 17:07:38 -0700 (PDT)
X-Received: by 2002:a05:6102:6c9:b0:607:f24a:1bef with SMTP id ada2fe7eead31-616f60b3913mr8703358137.13.1776816457732;
        Tue, 21 Apr 2026 17:07:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb713becsm35930181fa.28.2026.04.21.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:07:35 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:07:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/msm: fbdev: Calculate buffer geometry with
 format helpers
Message-ID: <kywf5seogl4dmh6msqcmfyxdxyg7i5y2jyr2z6fcbu7qrpemhy@nemrwv3lyg7i>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-5-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIzOSBTYWx0ZWRfX6HJC7sI/iL1Q
 mOykHO7ZBkgd2hBFsymkEERqBSztsjPql+kIEM26UJsh+4Pt0hmO9eLX67lS1ycQUtXwRkKZuRC
 X3ZxB5ctdSlfnRRpxITxIeuyl2Yy1D9qZ69bw4o8ZZqdUU+8cKFPb0NBps0sCMNcSJ9uv6frzS6
 scHo92JyYsnBDHJ1xgMkhP5K+rJ1HMXQtYlj/F4leW6h2PBtDTdI9D5dq4MsHuIDExtxt955NFj
 RQWu2Lyw69Ok5dOPy8VS0pFOnjF3/JI313BG0coaPYvt4mYxOqjk9+vRsTG1phSY8bkKC3s9qzW
 37Gr3Oc2xxd3UmWD5zXWOyP6afU39AtfIvsGsPyjHgUTHt1E1T5AwXhUC18afuBUORLnP30I3gT
 L7n0Rlk2Li2lrwsfC8T39VEvaBpJFxeMhYiX57MVVmo09ivt8COEUjqfcZUMyLVLsxNUcWr0nqq
 qa0cDHKwxGWcsEvvjSw==
X-Proofpoint-GUID: GaJ1wUXb25dUzih6ZdkI82WCPqYgSgIm
X-Proofpoint-ORIG-GUID: GaJ1wUXb25dUzih6ZdkI82WCPqYgSgIm
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8114b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=X6xMinCX8PrUbKJZ2cQA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210239
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103990-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A64C4440CC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:17PM +0200, Thomas Zimmermann wrote:
> Replace the geometry and size calculation in msm's fbdev emulation
> with DRM format helpers. This consists of a 4CC lookup from the fbdev
> parameters, format lookup, pitch calculation and size calculation.
> Then allocate the GEM buffer object for the framebuffer memory from
> the calculated size.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h   |  7 -------
>  drivers/gpu/drm/msm/msm_fbdev.c | 26 ++++++++++++--------------
>  2 files changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b3173fa4d222..00c50d7437d6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -509,13 +509,6 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  
> -static inline int align_pitch(int width, int bpp)
> -{
> -	int bytespp = (bpp + 7) / 8;
> -	/* adreno needs pitch aligned to 32 pixels: */
> -	return bytespp * ALIGN(width, 32);
> -}
> -
>  /* for the generated headers: */
>  #define INVALID_IDX(idx) ({BUG(); 0;})
>  #define fui(x)                ({BUG(); 0;})
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 1eb0368a6d07..5532c5779f17 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -95,23 +95,25 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	struct fb_info *fbi = helper->info;
>  	struct drm_mode_fb_cmd2 mode_cmd = { };
>  	struct drm_framebuffer *fb = NULL;
> +	const struct drm_format_info *format;
> +	u32 fourcc, pitch;
> +	u64 size;
>  	struct drm_gem_object *bo;
>  	uint64_t paddr;
> -	uint32_t format;
> -	int ret, pitch;
> -	int size;
> -
> -	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	int ret;
>  
>  	DBG("create fbdev: %dx%d@%d (%dx%d)", sizes->surface_width,
>  			sizes->surface_height, sizes->surface_bpp,
>  			sizes->fb_width, sizes->fb_height);
>  
> -	pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
> +	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
> +	/* adreno needs pitch aligned to 32 pixels: */
> +	pitch = drm_format_info_min_pitch(format, 0, ALIGN(sizes->surface_width, 32));
> +	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);

Hmm, why do we need to align the size to the PAGE_SIZE? I might be
missing a point, but it would be nice to mention it in the commit
message.

Other than that, LGTM.

-- 
With best wishes
Dmitry

