Return-Path: <linux-arm-msm+bounces-58317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D0ABAF3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F0118993B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C79D1DF973;
	Sun, 18 May 2025 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqYmtgij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BB1ADC97
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747563454; cv=none; b=WA8022oihy3O3zgRIwN7Fj5yrMsr3nYclsYKpdbKbMYd+jyQ+dHPSv8evqKE0CHW3Uic5wf/lAC1lzDAbzddn+LnA7KzEW0aT3o7t6tBH/tibHMOtSd+U6HfFB6wZoiu6MJWM2sR/8ZPqXv7doNpDDV1QwqGLUZERbfx88UoLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747563454; c=relaxed/simple;
	bh=culphbIjQKSAVceom6DR+nNUbn37uifukgB0Zsxyyus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG6bPGDdIIYEYNGcBEy74ayeDkQEj6WUKkZHgoGmDu2cOUyuKlBiCOHNZ2Itrv/U8qq7mBFywHVknmKpaOhJgd4QuVX076uN1GbVOiL49RNTEk/IaoZwRyiUFa0qE+/Csd2siPaoh8OxU3aiEPoaDbKFv1dHQH4QhSVAd7T9P5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqYmtgij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6Gnag011978
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xhP2SUjlpvQeAhCQLCmidVhe
	TvgcNKpIoIA/DfNmF0w=; b=aqYmtgijKPblFq2cjnFlErAz+xLO8o76zBtq84Ey
	la+rOgsOL8EX9MRiz/0iCCQOwjc1F/zhnepbT7Sei80RzXhxDebmiMjvFZBG8T7z
	8ie0S2evStccKTK+8jPrHmUNdE3ypmM3ipv4MThgKjcfF/bxWX06NHRd+eu5yA0L
	3MqRFYhSkNO+Zd+H0qR40nANgLa4w89X920/ntIYSHrKSzCIlcoaFGWEfv6uiEDp
	OvID5V44n5pM090M1QltDdYZtANQV8mpOWwHJAnQg0eM2H4RfxvkRxMO5Jn5IM9O
	X8oHMAAl5W0RcrYaBIyZKYfe18lM8TmujdGbB4ibxqduig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmestug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:17:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso34012166d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747563451; x=1748168251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhP2SUjlpvQeAhCQLCmidVheTvgcNKpIoIA/DfNmF0w=;
        b=K6d+xZfBha5ynVsAX6n85pHXJHcTI8isq739N68W9fgDCCevQ5V8dvcEOc19lZnsaa
         yYUWvBFXeH4i7DvTnOC2QKePqo/nhyTVvxvlswGFW0Nr4aM9Q59xAb79p2k2Bf6JEgl+
         apjX+n+ScpYphP1D1LjSWFPY/xJ89b+oSLs0l+pdkQMv4L8Qk5fDyArYpHe+lXPku9Nd
         ugYeu3IDBD2ynd6MPtvgQAzieApXn6onvl1Ly0sFbMiwkDdHZxeN31spL0AqYOgV8MTU
         sb1LaG0SGzb/+CxMhtZrXH1nm8fvYAmyc0zMFwWMcn9bwiAhlCZFH6xKuui3oDh23gUF
         Ykjw==
X-Forwarded-Encrypted: i=1; AJvYcCWIWe0w3DaJxcxoSEBD/9Q62gfFwGlja359wymiT1LaLScqWAa/5IcUe2bU2AexWkI99iaMELQLuZSA4qsn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc/QAk32bpgFgxyU143enqbVYpPDD56QHbr7tIjhTSy35xRU+7
	5jdUOYAefVwlRA6sX5Pm77SZp96vfpRlTVTVDlPms5uub4fg4wapABk2V/gqbLiFT1bqX8Ip9iy
	tbZ5CVmzDjbmkmuDrXaEZ0z2bCdgVIcSa4TEQIHtQtmi/wn/UG4yKMaIO7NEnr7HHG9OF
X-Gm-Gg: ASbGncsnOy6RmxkW1X+hWyhx8indeM2sFWW8DGhBi2rG9AQN/C5HXDJhbGhTc2lb2EA
	tBNf9KjFBitjv0k7RCJzyL8hjSVxgdstF9+fjUZfVPphU9IbDeEyEoUO3wgdx20voKZ/KDexDS3
	MRngBv9M4wMlMjJMR2DOWZqZNdOFAt6KKTGR5/BNfUv/AimqLUfrQZaQjcNbC80SFfqK0M0loA+
	9onmTDsx6U2xGeGPqzJdcARqSl5omEDBXkocaLb/Z6Z0x3TKvC9uPRpuIKlWtux+Ppn9YAK7grk
	Jr3N4j8djeD/Xo2LmfPubFzusN1lh+81huL9AVs/Z8npNa4LGkfrPkqIaSXr3lupTcmiUB8vV7o
	=
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id 6a1803df08f44-6f8b2b67f15mr145182196d6.0.1747563450914;
        Sun, 18 May 2025 03:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/QdroMCAgOdxUn8/7R10XW9Bp00ARKToH4sQUo+1oHi7NcXV+IvTd0N1GOa+Vj7DtOkw51A==
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id 6a1803df08f44-6f8b2b67f15mr145182006d6.0.1747563450612;
        Sun, 18 May 2025 03:17:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e8bea4b0sm1319372e87.19.2025.05.18.03.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:17:29 -0700 (PDT)
Date: Sun, 18 May 2025 13:17:27 +0300
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
Subject: Re: [PATCH RFT v3 14/14] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <dwhxtakgpjzd54krxqxpocpuwrk3cgh7sfiel4thgawsolo63b@ty7me7p6a3lo>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829b3bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=dxQFKmM27UcP91gbFjcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fLXW2V5iO8tZ2uOtsuLTo-KkqLEAw3F9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NiBTYWx0ZWRfX9q0GwmXdOWzB
 KBqQcVIz9Is5gjpbHcjLB43z7dlMHwjDSN1cL8EM0X4bAwGodk4dc+ahJjlpPtnXFLFoY7eFySl
 M5QRdJB+jne9K3exAXCU/eYY8JjNjRmZIZJA+0xYGtEc8gAlEaAjanLkjAvquGHKqn0qbqQNufn
 vciqFtGoeR075BzeumDpilsWYSRDSn5crkAc26Rpu1tOTJrf2LKNtUWFRBpqSJ67ZQTc/4FPaB8
 RCaFRzAUL+Kl/ILM6cVMq3LITkgVEnUWdY55vtZqYyQ15MfbFLPdR6CK3ZUegSXn9m/FtElYs1h
 juaJvmjRwMk1ehZNfA9zsdHiRZs6B7AHJXl0t1U5X5QFlP0mlicn/OjIdfEQOmfJGXNTnaD9oUe
 aHp01OdcuoX+0WoaZOxTPsZtuVuV9Fe6YJT8lquOKP/23/p3hr1WKk7c3mcQ8MDUGPTFFmCK
X-Proofpoint-GUID: fLXW2V5iO8tZ2uOtsuLTo-KkqLEAw3F9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=877
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180096

On Sat, May 17, 2025 at 07:32:48PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 76 ++++++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 +++----------------
>  4 files changed, 60 insertions(+), 87 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

