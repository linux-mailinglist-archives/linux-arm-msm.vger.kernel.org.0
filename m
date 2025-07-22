Return-Path: <linux-arm-msm+bounces-66097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6705B0DB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28821895DD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F312EA464;
	Tue, 22 Jul 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix42LYcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBA2EA15C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192232; cv=none; b=ZTv8r2yR2yjnNqv+EyZhBy7NFUSEXV1LjZtyTEyzeQUTMZmIltNAjs2zjGmRVen1gms4R3or6PXdnxlx8mKJyrjHN7xXvuN8e8bk/uEq+1e1NTHISNKSdeya0jyVhkhs0l46m6v8yYW194TnKPZunbeDaxg+uhpZixb+fdq4oZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192232; c=relaxed/simple;
	bh=auUxOfmMTfJ+/H3qGfJfqPYuL8l0YO1U63ewL1KfwMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iyg3W2T+qrqYgXGV7gO2mbPseRcjMd1Q7SMVCRURfjCNeNWjWVzBoYKx0iTEAwPHI+6IfNj8RASsU9RKcGnt4LhfD4uxMj2HR6o1notP7CpM9f0ukTHUbaRc8OCsqcJMmZrYMgAlakwKuKQpGBc0MjUP6GGSDh0F2jzUX4iPB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix42LYcP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83ujZ010584
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7oqjF5MC0Hy5JGq0yn/Rg4yv
	Ty+q3NvX6dPRW/kHnLY=; b=ix42LYcP8E5Pht/0iwXaYs+xrWcU+zW9wPtggSO6
	h63UIPkl0QcoaMtO0SUkrK8OvjWzP9xr1Kbb8fWWMQg2ojSXpntOE0D2XReKNe0V
	CP2veRtOFsdVXuFQFNmFa4l5/0ZLa9rQxp2aZEcnEzNY4un/9UxPe7pp/Y19LfWW
	MiMO+NibsZJhTW+MoIq+ZNV30BlEWE7f9/49+T2CJALY/JBIXAVGWf9fPzGSadnq
	BL9ksGZj+Z6Yl4YkExSJm6J80UTGI9owO/m3jYn3aOsdeCZM9NSKU0O2WwAhGejA
	uniajui6/Fe8J0p9gZQnXt81nxGIZVgOLSjsgFKXqjSPqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t18ysy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:50:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e06402c7daso794087085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192229; x=1753797029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oqjF5MC0Hy5JGq0yn/Rg4yvTy+q3NvX6dPRW/kHnLY=;
        b=c3yo9F+OJzoq0ao0D10kZ1dl1gsU+hbs6yupsd7t77d1/g9FbvW5nW/ITkHerK/G4d
         ViziLOanaV1nKvt6yKhJ+pwuaRTzBYymZ3JgZWaz/WwR66vbh/b9MCkFpygDMnPXDFZX
         /DDC4XX9naHO1pzbqYRwRPhWWfz5VGppAZRaRPNm5aA+Fk03EVqSCmtFwda3KmfJe2VP
         FrQnYBdFdZXV+JWayJIk5AJOIY82NPcVk8z8vRvNkEojReNuty4ltticM9W1dw+bKa5o
         aJVRKb93Z7FTL0v5Txp/G5lJtfo4+XD52MFxnh4eL7n64ITo+i2iNUqDFytgOCofqufa
         rY0w==
X-Forwarded-Encrypted: i=1; AJvYcCUr4CNI16Kj2TYEl2vfZmp72lpajNPiZgb/LuY6o2iOi9atNiICK+YcT5to3GUu7eJfFM7Hp8oAtb1y2iL0@vger.kernel.org
X-Gm-Message-State: AOJu0YyMjIjVZVryydP/LQWNpBCWR9JfwBrcMfX8/EJIyifrzgDrNipG
	iM/NDsnm68SaxlMMfU8E73FjPy8o36dFigG/0SmA1zOI1NZVYqU20mNnpghpiiJav2Mc58xnCxa
	RI9lx+U/Fy2VGnFSGthkes8G3Vo+2o1E2QM6HEJJzMC3OIEqQXZbrVfWhwmJUJ39k1t5s
X-Gm-Gg: ASbGncvX0lb9iT9M5R3KNtDV1/OPF3Wm/NpNunx+Y1RLbZ3RejTH7GMGvl2TJHObsyC
	31lnur5p2YfxX6hspn1zON8dIfq1EAF49HEYR2D1xUsqXAQKQZifrgQNQ+JMcv4wP+W4OF+mNZi
	S2tkaszmtMAhOvj2jDbGEHefA39H4pAwWb2D5Z0Q3Tbsbip2OyjwP2pbmBif//u1Fpp26Qh2OAA
	pS3Yi/7s08UtPrku39EeadIPEHYMO/RNZq3jVtZoOgLtMoDTRVIdzJ1gTvrIsHnTrPjp0ufnqxa
	HMGRIKBIaNr1+S6IuVKPslf6Z87WWybOzfm3XYDn0aB8S+BmW8q/qOoUodbzh4PordcgTxL3/db
	cfDTQR7PQ/qZ4F6fcmJQg1pZKIXa7NR5d8HFSNHR88aP8vhDgdnoB
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id af79cd13be357-7e342b8a298mr2785852585a.50.1753192228775;
        Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzoLA1jXenC0NKgRvJhDeIPSOC85lNKUs27uryhYpwh2Gr5qB128g74mtSw4KV/STcGN9WhA==
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id af79cd13be357-7e342b8a298mr2785848085a.50.1753192228272;
        Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f1fe5sm18015331fa.104.2025.07.22.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:50:27 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:50:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
Message-ID: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-GUID: _koUf1mkrkUJ8bSizKrPGgBVHuSuaYGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX6BHIq2/P35is
 zsaIhFYvLDyfMWPiibWdXHDKA0+cOeiHDFFPj8iW3hW2FZg0DMr4+0g8m+PNBgpWH2CQQAfU+yx
 c0tYtSaw6mEiKrXu9jQW5aG56jELDfg/L5RsLnQOmlw9bzpGNSMHCm7klVCVpxLF+Pa2otGxTLT
 744Abk2oIYCGlOOUzfo8O08jazmsunp9VAdpqrSZyW4YgAk6HpprQ903BaoBHkVouspyfGEXQqM
 697aD91Z/xLkzewQtwIsD8eN2s1+3Z2WeuF1F6Gt5WEzkZxsI3YyaqxoHXiUEIjZdxDXTFLvR+1
 w1zRLIlkmbYqVFj8+hgrl7Dz0uk8YCou2L9wxslqRAAcSFaIdBromWHgVc4RS+zbiTwJklDX5Em
 DQ2Ak0M5qgfRO1FGBhvrTfLZaAHc75ce3KdjifL6GERctx+NrmR8AuF74ShVYcHdbGhQtry3
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687f9725 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lzCaEFjWca4eqRuaUDUA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _koUf1mkrkUJ8bSizKrPGgBVHuSuaYGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220112

On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> When IFPC is supported, devfreq idling is redundant and adds
> unnecessary pm suspend/wake latency. So skip it when IFPC is
> supported.

With this in place we have a dummy devfreq instance which does nothing.
Wouldn't it be better to skip registering devfreq if IFPC is supported
on the platform?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include "adreno/adreno_gpu.h"
>  #include "msm_gpu.h"
>  #include "msm_gpu_trace.h"
>  
> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
>  	/*
>  	 * Cancel any pending transition to idle frequency:
>  	 */
> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
> +
>  	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>  			       HRTIMER_MODE_REL);
>  }
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

