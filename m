Return-Path: <linux-arm-msm+bounces-63574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BEAF8192
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FF88582A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 19:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39FA2980A4;
	Thu,  3 Jul 2025 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRsJwaD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12341C6FE9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572032; cv=none; b=AX8HKYKKbk4jXC7zhR0wPwshHSOIvdV4LlvjAhtKBnEHDstdtVX8qGT6EBwm5Zn3DK3ROnk/OfxlOpp93kf5EZOEjT5InJkrKqL5LXHxtvbuZpb/y8X5htF2NgmNH5q2xbKyrDERime/RFXeLoEFiJaBV/nZ6BmQVw8LcKIrmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572032; c=relaxed/simple;
	bh=dVrI2uRTpPJyEYGggSErauXb36AaLTMk0AYHXyC3+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOpOgD1gM59CAQl9M7aSR0nVq27BQvxc/97pWjvFpdeGpUXhus/iSzTiEhHA5Qxr4I0QR57Bn5P94zo/A5af6XhVzKGELFAl3NBxmvTGstbaVzKjNugo3/8cUfdN4uPrrGzbgJ609J+E19X1bOyIB+qOuRFnhPeHtVh1rTEfbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRsJwaD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563EYNwM018581
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 19:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyjs9KtRSFqqWdHu/SnN7ykY
	05Jh3LfVZ1F5/zy/um4=; b=RRsJwaD4JTLFe9in0afKI1Ngl1YV4Ai1WnVCglxl
	jmf4tzEOSUWJtM3sVCUn0xHaEPn17UUXb4Jn89i8W3YfCa7gQSUcbSIyoMLx5nuc
	pqoQlTnGS6AR6OfyHlc5z47Y6QpMZA4WuL60a1tlRsB+b1J9tvL4HUI2pqPUKy7A
	St/p8y5SjWwVFzHE7zQfiPXWn8EoRKK+26Dt8+noAx9uyh3pJ6JoPEdJd5tVZsT3
	1s53SRBsLzqqKvuUWIY6XJa6zyPSpTXJQ8UmnKVo8jn/aZ60i3jZnj8yJAxCfc4i
	ZWhJxVkz7tni9RYBoihlxpkzcWMHiDlxA9YGIE7cdCZK1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxsn7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 19:47:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f6471cso32368085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751572029; x=1752176829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyjs9KtRSFqqWdHu/SnN7ykY05Jh3LfVZ1F5/zy/um4=;
        b=wmSJXUVaKrpWSwc2YTU7IWNpRsEcRCF2+/eE1kZgcjf2/QNT9YbPJrLh70/Y/0MimA
         8Qw6BOUzmpBZyP4QmCKcgxcWNFri7MnavaMGBfECqJTf52UvgObaWjniH4TKbHOlrFM5
         kUWq8F5m+cmra2g2CPAybz01HQ34pVBIrmaQ7bM8exFDeUqmogcESFGVnEq13E5I6zJq
         Zz/lKbAW4rNOlJnxwbErWT+W5XaZtje7TkjLq0tEDit0ICic3aWHslxKEVFTEZg7dIIB
         YzfSitliGP9CHjTEPoVa4nnwSMy+eM23gh8Wme8BDSTea1G0aGMtKqFBSZHsoaxSqMgK
         kqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz1rjHZwq+fGSYEesFQpUO1bK92g2KTM2QWfgnG+IjV3UVT1K0ocmkyYmm8P0E8ljC1cVXX0e36ysLyOjN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh29+1ydBNakH4kupfbRdt1kTT5nE9+fszhuTh0iFjMYZzQ3Ia
	PxC4RpaMCHUsugfQc22xCnHX59No8SXO/hXKAlpxjba7T3LzxzQHfdhF3EBuFug0Jqhey8sBvwr
	xTa30PLQnE/F/yVPUt944TyYCNEhIYnF5Jg0Y3mglcetP7YhWdVL9yQ/DgR+Gxb3bY0gm
X-Gm-Gg: ASbGncunsnWrQ4enKaJbZPeHKPSXZDOpucsUbnfzbwPjzgZg1/pMTFqNRB6W4Y1wXXE
	Rrv7dcEu4XmuPOmn2gbt7p/1rY//D4u/n+l/T+P7N/xX/Re8/t+wwiViBH4I5haVrVv/7533Nz2
	THW7ONCw0IU7vM2QlXAglPlI7r6qw2GuP/l6d/sH09DBqQXhwn1B5o7PjgVwv7A20TLjPmYxH5P
	vO3FQvB0ZMtK1O0e3Sov4rhkKInkc4ObvzyEMJCEk26m5Ac2oG2MOne/exdZEpoohYdSIpY1aTS
	KE1BDEYBU6nvIjfny+MIe8Zjk10lnUEcQapdaQi29+Sgf5mkvf3hcU7EIkrY9ugzYCqlh9WeqjR
	k5LP4fI1BsUeHFFGc67orNjJuXVJRaxBfivY=
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr30092285a.11.1751572028392;
        Thu, 03 Jul 2025 12:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj2tRf9bBt4hGhXkfgtHAuEkZL3reD1egDOqsmHrUX4JA7cNn7ybYXWLKFG4hgzOlB5osvWg==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr30088485a.11.1751572027963;
        Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b141ea0sm391081fa.78.2025.07.03.12.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:47:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Update register xml
Message-ID: <kwexjh3eaxerlfbzpsmd6nim5si6zdjpdthrpzcpakhwmodasl@vosfzxpkehxv>
References: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX0qOYhc9doOm5
 Ykw5Pjw//Kk5y1m6Wv59JEumxhJRlnRnyZlwv8H6SGnrkh/qHfaS23f/Iv/NYFSpHELvE0e0hQb
 ccsnRb9V3gwBahDJOItvRHlgymPMgM7osyGxsXMBm5c7TrPXPpE4wwr/YOOJYZXJm2UOuXja8YD
 wFjRG+f+vgP5BcBvtVK93yg5vvKt0X8UjFNXbNoaCbXJnAvDD5LfcK2Q0xAc2Xy7Xz3vcvDkR97
 fXgsTpsozp0407/YSWFz4/VfwU4pl9wNTN2mvZfr4/kI6LXq6JrcDX8l4VQ65O+wdI5zBML+D9R
 qXdd4CpFU0vAVnCfFMpDZBw2dEFx4hW39xst2S87RqU0T95gsaSWNOkLjhFdpBCPxeb50xYsMWg
 6W07i3MJvCC2JD0IBOrTdyX/THr2CI4N5wYfijo5K7ajP3XZZw92i1U3J/6EH8tExDd1qHsR
X-Proofpoint-GUID: Dip7VtuhDu_Vr6Zcu_uZcHdoZ6I4P_LH
X-Proofpoint-ORIG-GUID: Dip7VtuhDu_Vr6Zcu_uZcHdoZ6I4P_LH
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6866de3d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VrLyofq7WMs6qTrs2fUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163

On Thu, Jul 03, 2025 at 10:51:19AM -0700, Rob Clark wrote:
> Sync register xml from mesa commit eb3e0b7164a3 ("freedreno/a6xx: Split
> descriptors out into their own file").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |    5 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |    4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
>  .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h |    4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 3582 +++--------------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  198 +
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  383 ++
>  .../msm/registers/adreno/a6xx_perfcntrs.xml   |  600 +++
>  .../drm/msm/registers/adreno/a7xx_enums.xml   |  223 +
>  .../msm/registers/adreno/a7xx_perfcntrs.xml   | 1030 +++++
>  .../drm/msm/registers/adreno/adreno_pm4.xml   |  302 +-
>  14 files changed, 3312 insertions(+), 3027 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.xml
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

