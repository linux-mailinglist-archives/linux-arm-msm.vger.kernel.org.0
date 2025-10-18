Return-Path: <linux-arm-msm+bounces-77884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648EDBEDC2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 23:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E93A940824C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 21:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03457277CAF;
	Sat, 18 Oct 2025 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7nCt1lK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4E25D208
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760822224; cv=none; b=SJWSgpgcVSJOL72XCkZ6YGV0t8TEmP4129UU87nIX3neaFIRNnsKSntdS+YQiC9RqjUZXhxzyAJEXjun3EVFWosHowSh8ckV5zveVqePvczxqvR6gHAKLmfQtKtoUNpZAa7jpATbNsuWyQ/Jhl/EuxRZ6WYytEfz6E3PuLdth1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760822224; c=relaxed/simple;
	bh=RSejMAOVCoS47PjU69RoKWtndQOm/8ftxN4IURL/+G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efFMFE1ITnX0i35rHLYn5i57Qumpcyn2njKGFhRaJNPbaW64Daz5DR8HgNfBWuXT+GE8QSv04f0sSCU7tV6RVLTQbO4iN/9sPgJPqWPQCmCpCDtm1yX7LSYEKYzoM9hplVpqdlz3zZ1gOVILv/UeqYJDzq8h0suLRLXbRGzFqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7nCt1lK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59IKmAkj013776
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 21:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrxfYT8Rg7BR1iZK2D5Bfqse
	b7Dp1q3QQoYVTBHmaUI=; b=P7nCt1lK854RKmL6G8DimTXTcdOd/BAqw/GLfAIK
	pcI8vnzt2OsZh80T4VbyUuedYWu56adfK/Xa0yhJCvn/CEGlNLkjw6KW8xXbolGw
	z14oRZv2hCTuzFF4TfzQMNTVJbpY5xDL1fsWkeuBrEnjxbIgm4sqK0UwlUFOVeJr
	cZs4k1mPDKpI4J8+LVsnBhCxOCY1G2anCxQIYDkgEIIQieFj5Bs8Jjkio0py7WF/
	5V2fQUX1E4XnUplclYwOtckiFWvYhzT47+FT6USBMvsrxsfXORVldBFuBQSDdCBK
	K4MvxaaDXSXmspllOWp1cCC6Ufau9IqYKMb1ZvmPatol5g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v46998we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 21:17:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1ed305b4so84621616d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 14:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760822219; x=1761427019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrxfYT8Rg7BR1iZK2D5Bfqseb7Dp1q3QQoYVTBHmaUI=;
        b=LrZez/LuoYqM78FH52O1szavpWAayrxxYI41vCawJnwSRpBVkgjcEY4z40qtETE6sY
         yTphGPyIIwXLkdf2UyXqou4Ya/ETpZJsktEcfpoiLs7ZF5WOhKGM8enhu5TNGbAnL+D+
         WdWDY0YqSdmdpSrKykOiAw4S7Tb/R+FGvZs+jT4nLWXYA15Ibm3YrG52hXOWtrzjqN8q
         ex5LqpjnG2Iog2i+SnFTE3US6fqnyvpApl7hMkFYUxo/YLikteIqE6LSb3Cm8t04xvXI
         /euQ5Udyn5ejsmMXDdDye62KXxac24Q4JMgrAW6Ody/UnNGAdDDwoRo6ipRCZAmz1PZi
         7XHg==
X-Forwarded-Encrypted: i=1; AJvYcCXP4T5w1nGI0MdT2CdeCYlDOGFkwHDJGjjJPEB4QKQiSsjOBulorbesoYf0ZyaULjEYEdhZTBhBUrtAM6gB@vger.kernel.org
X-Gm-Message-State: AOJu0YwiuA049cQwzZc+O2/udcPDJo2riK0vH632Ne6rEeGl0gAHR1AD
	gq+3XA0g26Sk3w4xR6hVjh96nVvz1dcwVJZMTQC0w8zVDaBrP0DKpUT8z1Fl4xLM9lqzlNb4P4W
	53z7Nz5kWDyicdp4caOyDMmUoQtP4lRLSCprLA3Gh4prA08Dp1xKt74LlxCUh1pj2w3nA
X-Gm-Gg: ASbGnculPzoabsFfzKzb+0Op9mPnAEF3+VX8zPW/wL+2m1b52890shi82SPvocIaAFc
	ZPzI6lv4df+MzmgxJ44IEgXQptldIzJTBTJJ/ioToulctzLZkoTlfmLvlyhMfFOSGodt+rGsAqa
	PBEfePX2WJcz4Fq7jocuRdl1jSb+td5rXLCr4lx84NfSgZZSAoTRbRGswXacdu9pzh6a29ipMwG
	3MS+zo01Km3wg9ad7+HcnmhJMh039c/3RkyO87VjfgbkQFD0xIsXYcyDCiv7e0SPPesBYnBjSkW
	S3/oasPwJfxr+4cKPIU4zoE2jbQ9MZEAhlEu9i0gY+FF/n68a9eB5mpGn5Ry6UEGY1BNLeeOX1J
	pCHphYDSV7jwdCZxWycFzkqmHpgaf/3ezHdHhSILBgcRV6X6oWtkf8aGGHpRv5vSa9NbiakGpvw
	+M9c3y2y4KbCg=
X-Received: by 2002:ac8:5795:0:b0:4e8:b846:d9c with SMTP id d75a77b69052e-4e8b846128bmr19763891cf.39.1760822219191;
        Sat, 18 Oct 2025 14:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhMckk6vv3eZfcCkUZgmjTi4d3z78dKv7YVQm6GKjnzp6ZqtUqwANaCiyEgjQEUuP2X+X8KQ==
X-Received: by 2002:ac8:5795:0:b0:4e8:b846:d9c with SMTP id d75a77b69052e-4e8b846128bmr19763641cf.39.1760822218592;
        Sat, 18 Oct 2025 14:16:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91f49basm9074441fa.16.2025.10.18.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 14:16:56 -0700 (PDT)
Date: Sun, 19 Oct 2025 00:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        nicola@corna.info, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM
 property
Message-ID: <5gdqqsl3a33z6aj5yl2hgm5dulkdg4aqbb4k34yrfiyslzeg4j@s3bcgldjs4bp>
References: <20251018-dpu-add-dspp-gc-driver-v1-1-ed0369214252@izzo.pro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-dpu-add-dspp-gc-driver-v1-1-ed0369214252@izzo.pro>
X-Proofpoint-ORIG-GUID: TR-JyP9MUkKAlw-QOcYrMSVQfJSzTUtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX/Dg6/5tsMj4/
 wwXTyVXShaeJHWHL7mSy+LIJFQMgNuNsD7XYKaRNMaa6rHGLIY7inKJcR4E3Vcf3q2+3GShfZaY
 O7H9oWl+8/t74UI8UxQghMu3xH73yYxOZpInodGfqli8QSkuxkUVVrXM9VN/GxxvQkAonS0Mbgx
 phJsH7UQJV/CBHeixcPJoIqkbpVOSJhhX/RHqYCmKbx6jkDFVTJP//3tGSxrs2JsRBo7tcSF6Uw
 njXTHusgxPqdQJlbtP2zwRZ6BIUCoDnHKcDbCuXYowOwe4UQF7NICkKbg2Iw73Al5GpP9iYYEJq
 5dwNajFCZ7fbcbHdQLf/QMLFQYyDTFpYi4egrHoV2DGi8mkkeq7fEnz2SedqG4vDVc/XvI0HInp
 Cpmz3Qe7dZV+3TVHHSiMWBxZ5eQOxg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f403cc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8
 a=A8Lk8QbXsLJbOl2LSk4A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: TR-JyP9MUkKAlw-QOcYrMSVQfJSzTUtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Sat, Oct 18, 2025 at 03:18:29PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> This patch adds support for DSPP GC block in DPU driver for Qualcomm SoCs.

Please see Documentation/processes/submitting-patches.rst. "This patch"

> The driver exposes the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.

Nice!

> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.
> 
> The patch was reviewed by postmarketOS contributors here: 
> https://gitlab.com/sdm845-mainline/linux/-/merge_requests/137
> During review the patch was tested successfully on hamoa (X1E).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 90 ++++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 56 ++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 26 ++++++++
>  6 files changed, 169 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4b970a59deaf..f2c97c4ef0af 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -812,12 +812,44 @@ static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
>  	cfg->b.b = CONVERT_S3_15(ctm->matrix[8]);
>  }
>  
> +static void _dpu_crtc_get_gc_lut(struct drm_crtc_state *state,
> +		struct dpu_hw_gc_lut *gc_lut)
> +{
> +	struct drm_color_lut *lut;
> +	int i;
> +	u32 val_even, val_odd;
> +
> +	memset(gc_lut, 0, sizeof(struct dpu_hw_gc_lut));
> +
> +	lut = (struct drm_color_lut *)state->gamma_lut->data;
> +
> +	if (!lut)
> +		return;
> +
> +	/* Pack 1024 10-bit entries in 512 32-bit registers */
> +	for (i = 0; i < PGC_TBL_LEN; i++) {
> +		val_even = drm_color_lut_extract(lut[i * 2].green, 10);
> +		val_odd = drm_color_lut_extract(lut[i * 2 + 1].green, 10);
> +		gc_lut->c0[i] = val_even | (val_odd << 16);
> +		val_even = drm_color_lut_extract(lut[i * 2].blue, 10);
> +		val_odd = drm_color_lut_extract(lut[i * 2 + 1].blue, 10);
> +		gc_lut->c1[i] = val_even | (val_odd << 16);
> +		val_even = drm_color_lut_extract(lut[i * 2].red, 10);
> +		val_odd = drm_color_lut_extract(lut[i * 2 + 1].red, 10);
> +		gc_lut->c2[i] = val_even | (val_odd << 16);
> +	}
> +
> +	/* Disable 8-bit rounding mode */
> +	gc_lut->flags = 0;
> +}
> +
>  static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>  {
>  	struct drm_crtc_state *state = crtc->state;
>  	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>  	struct dpu_crtc_mixer *mixer = cstate->mixers;
>  	struct dpu_hw_pcc_cfg cfg;
> +	struct dpu_hw_gc_lut *gc_lut;
>  	struct dpu_hw_ctl *ctl;
>  	struct dpu_hw_dspp *dspp;
>  	int i;
> @@ -830,19 +862,40 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>  		ctl = mixer[i].lm_ctl;
>  		dspp = mixer[i].hw_dspp;
>  
> -		if (!dspp || !dspp->ops.setup_pcc)
> +		if (!dspp)
>  			continue;
>  
> -		if (!state->ctm) {
> -			dspp->ops.setup_pcc(dspp, NULL);
> -		} else {
> -			_dpu_crtc_get_pcc_coeff(state, &cfg);
> -			dspp->ops.setup_pcc(dspp, &cfg);
> +		if (dspp->ops.setup_pcc) {
> +			if (!state->ctm) {
> +				dspp->ops.setup_pcc(dspp, NULL);
> +			} else {
> +				_dpu_crtc_get_pcc_coeff(state, &cfg);
> +				dspp->ops.setup_pcc(dspp, &cfg);
> +			}
> +
> +			/* stage config flush mask */
> +			ctl->ops.update_pending_flush_dspp(ctl,
> +				mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>  		}
>  
> -		/* stage config flush mask */
> -		ctl->ops.update_pending_flush_dspp(ctl,
> -			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
> +		if (dspp->ops.setup_gc) {
> +			if (!state->gamma_lut) {
> +				dspp->ops.setup_gc(dspp, NULL);
> +			} else {
> +				gc_lut = kzalloc(sizeof(*gc_lut), GFP_KERNEL);
> +				if (!gc_lut) {
> +					DRM_ERROR("failed to allocate gc_lut\n");
> +					continue;
> +				}
> +				_dpu_crtc_get_gc_lut(state, gc_lut);
> +				dspp->ops.setup_gc(dspp, gc_lut);
> +				kfree(gc_lut);
> +			}
> +
> +			/* stage config flush mask */
> +			ctl->ops.update_pending_flush_dspp(ctl,
> +				mixer[i].hw_dspp->idx, DPU_DSPP_GC);
> +		}
>  	}
>  }
>  
> @@ -1340,7 +1393,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 *
>  	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
>  	 *
> -	 * Add dspps to the reservation requirements if ctm is requested
> +	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
>  	 *
>  	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
>  	 * enabled. This is because in cases where CWB is enabled, num_intf will
> @@ -1359,7 +1412,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	else
>  		topology.num_lm = 1;
>  
> -	if (crtc_state->ctm)
> +	if (crtc_state->ctm || crtc_state->gamma_lut)
>  		topology.num_dspp = topology.num_lm;
>  
>  	return topology;
> @@ -1471,7 +1524,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>  
>  	/* don't reallocate resources if only ACTIVE has beeen changed */
> -	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
> +	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
> +		crtc_state->color_mgmt_changed) {

Please align the text to the same column (so that crtc_state are one
under another one.

>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
>  			return rc;
> @@ -1831,8 +1885,16 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>  
>  	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>  
> -	if (dpu_kms->catalog->dspp_count)
> -		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	if (dpu_kms->catalog->dspp_count) {
> +		const struct dpu_dspp_cfg *dspp = &dpu_kms->catalog->dspp[0];
> +
> +		if (dspp->sblk->gc.base) {
> +			drm_mode_crtc_set_gamma_size(crtc, DPU_GAMMA_LUT_SIZE);
> +			drm_crtc_enable_color_mgmt(crtc, 0, true, DPU_GAMMA_LUT_SIZE);
> +		} else {
> +			drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +		}
> +	}
>  
>  	/* save user friendly CRTC name for later */
>  	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6641455c4ec6..8a4b9fc3ac84 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -382,11 +382,15 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
>  	.pcc = {.name = "pcc", .base = 0x1700,
>  		.len = 0x90, .version = 0x10007},
> +	.gc = {.name = "gc", .base = 0x17c0,
> +		.len = 0x90, .version = 0x10007},

.len = 0x40

>  };
>  
>  static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
>  	.pcc = {.name = "pcc", .base = 0x1700,
>  		.len = 0x90, .version = 0x40000},
> +	.gc = {.name = "gc", .base = 0x17c0,
> +		.len = 0x90, .version = 0x40000},

The version is incorrect, see sdm845-sde.dtsi

.len = 0x40

>  };
>  
>  static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index f0768f54e9b3..3ea67c1cf5c0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -77,9 +77,11 @@ enum {
>  /**
>   * DSPP sub-blocks
>   * @DPU_DSPP_PCC             Panel color correction block
> + * @DPU_DSPP_GC              Gamma correction block
>   */
>  enum {
>  	DPU_DSPP_PCC = 0x1,
> +	DPU_DSPP_GC,
>  	DPU_DSPP_MAX
>  };
>  
> @@ -314,9 +316,11 @@ struct dpu_lm_sub_blks {
>  /**
>   * struct dpu_dspp_sub_blks: Information of DSPP block
>   * @pcc: pixel color correction block
> + * @gc: gamma correction block
>   */
>  struct dpu_dspp_sub_blks {
>  	struct dpu_pp_blk pcc;
> +	struct dpu_pp_blk gc;
>  };
>  
>  struct dpu_pingpong_sub_blks {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index ac834db2e4c1..36a497f1d6c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -399,6 +399,9 @@ static void dpu_hw_ctl_update_pending_flush_dspp_sub_blocks(
>  	case DPU_DSPP_PCC:
>  		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
>  		break;
> +	case DPU_DSPP_GC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> +		break;
>  	default:
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 54b20faa0b69..7bf572379890 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -24,6 +24,18 @@
>  #define PCC_BLUE_G_OFF 0x24
>  #define PCC_BLUE_B_OFF 0x30
>  
> +/* DSPP_GC */
> +#define GC_EN BIT(0)
> +#define GC_DIS 0
> +#define GC_8B_ROUND_EN BIT(1)
> +#define GC_LUT_SWAP_OFF 0x1c
> +#define GC_C0_OFF 0x4
> +#define GC_C1_OFF 0xC

lowercase the hex

> +#define GC_C2_OFF 0x14
> +#define GC_C0_INDEX_OFF 0x8
> +#define GC_C1_INDEX_OFF 0x10
> +#define GC_C2_INDEX_OFF 0x18
> +
>  static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>  		struct dpu_hw_pcc_cfg *cfg)
>  {
> @@ -63,6 +75,48 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>  	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
>  }
>  
> +static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
> +		struct dpu_hw_gc_lut *gc_lut)
> +{
> +	int i = 0;
> +	u32 base, reg;
> +
> +	if (!ctx) {
> +		DRM_ERROR("invalid ctx %pK\n", ctx);
> +		return;
> +	}
> +
> +	base = ctx->cap->sblk->gc.base;
> +
> +	if (!base) {
> +		DRM_ERROR("invalid ctx %pK gc base 0x%x\n", ctx, base);
> +		return;
> +	}
> +
> +	if (!gc_lut) {
> +		DRM_DEBUG_DRIVER("disable gc feature\n");
> +		DPU_REG_WRITE(&ctx->hw, base, GC_DIS);
> +		return;
> +	}
> +
> +	reg = 0;
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C0_INDEX_OFF, reg);
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C1_INDEX_OFF, reg);
> +	DPU_REG_WRITE(&ctx->hw, base + GC_C2_INDEX_OFF, reg);
> +
> +	for (i = 0; i < PGC_TBL_LEN; i++) {
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C0_OFF, gc_lut->c0[i]);
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C1_OFF, gc_lut->c1[i]);
> +		DPU_REG_WRITE(&ctx->hw, base + GC_C2_OFF, gc_lut->c2[i]);
> +	}
> +
> +	reg = BIT(0);
> +	DPU_REG_WRITE(&ctx->hw, base + GC_LUT_SWAP_OFF, reg);

inline reg, pleas

> +
> +	reg = GC_EN | ((gc_lut->flags & PGC_8B_ROUND) ? GC_8B_ROUND_EN : 0);
> +	DPU_REG_WRITE(&ctx->hw, base, reg);
> +}
> +
>  /**
>   * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
>   * should be called once before accessing every DSPP.
> @@ -92,6 +146,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
>  	c->cap = cfg;
>  	if (c->cap->sblk->pcc.base)
>  		c->ops.setup_pcc = dpu_setup_dspp_pcc;
> +	if (c->cap->sblk->gc.base)
> +		c->ops.setup_gc = dpu_setup_dspp_gc;
>  
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> index 45c26cd49fa3..d608f84e9434 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> @@ -33,6 +33,25 @@ struct dpu_hw_pcc_cfg {
>  	struct dpu_hw_pcc_coeff b;
>  };
>  
> +#define DPU_GAMMA_LUT_SIZE 1024
> +#define PGC_TBL_LEN 512
> +#define PGC_8B_ROUND (1 << 0)

BIT(0)

> +
> +/**
> + * struct dpu_hw_gc_lut - gc lut feature structure
> + * @flags: flags for the feature values can be:
> + *         - PGC_8B_ROUND
> + * @c0: color0 component lut
> + * @c1: color1 component lut
> + * @c2: color2 component lut
> + */
> +struct dpu_hw_gc_lut {
> +	__u64 flags;
> +	__u32 c0[PGC_TBL_LEN];
> +	__u32 c1[PGC_TBL_LEN];
> +	__u32 c2[PGC_TBL_LEN];
> +};
> +
>  /**
>   * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
>   * Caller must call the init function to get the dspp context for each dspp
> @@ -46,6 +65,13 @@ struct dpu_hw_dspp_ops {
>  	 */
>  	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
>  
> +	/**
> +	 * setup_gc - setup dspp gc
> +	 * @ctx: Pointer to dspp context
> +	 * @gc_lut: Pointer to lut content
> +	 */
> +	void (*setup_gc)(struct dpu_hw_dspp *ctx, struct dpu_hw_gc_lut *gc_lut);
> +
>  };
>  
>  /**
> 
> ---
> base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
> change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770
> 
> Best regards,
> -- 
> Federico Amedeo Izzo <federico@izzo.pro>
> 
> 

-- 
With best wishes
Dmitry

