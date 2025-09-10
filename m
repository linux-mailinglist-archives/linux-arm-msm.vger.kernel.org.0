Return-Path: <linux-arm-msm+bounces-73018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868BB52324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 22:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E25ADA0641E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 20:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACE22FF16D;
	Wed, 10 Sep 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDapsa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26482F83D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537721; cv=none; b=Ec8X7bbX738Nh7+wuIDtcUjwZNmGr5Jqr7EKWYrrAvekTWLs/OQd5NRDBaAwb/1YYQpFPfaMazyg0NTgEkl6MANbohJhfZCq/muHvuNHRZ3oE0x6+ye+GA5GL6umTecTxdnDtnUJZqBbZN1LIW6ECXwIV0wMw0ET3lN8Pbz/HRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537721; c=relaxed/simple;
	bh=3NzwNDgiyd6a6o1jKKrHAuOu0Ceuy2dAHSQb5ma8/h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsTqn/VitFucJRSGLDk3ibE5gRsslUSyj1hs6SBTGYwttyDjjzYe+TxTxsA3rrDDMHRab654QizLOYfWp3+lNGfe2uG/n2OGenYnLQ2WR1+tlgTwvEHFiXvP+emZZcZFpiYbeyZRv+clrSwipxd67wUrSwl1dwJ3mUr1tvkg16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXDapsa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgPbG003840
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u053Z73zkai4Xa8yTebTvs2P
	Y20porEuaLkDE+bAlMY=; b=hXDapsa8K+egvdzRMaEhilqeP0yTemicIzJ0URnN
	wgwkvRdsBx3kxYKkiQ3s1OSx/KfUXHO0+Xmx3ndGS9iJmP79m5ufXz8HUQ2Ub00W
	utwmBv2RzHjZgjgiMd5RCs6cqzRxOjqk5hXRjudiGAvfOIbVX0qt2YZcC9oQMO2v
	9+Hv7SD7QbmaWyHwArB7ep33Xqu/dZeSn9oXyKrAdEkpPo9XCq4hXo8CnuFfgmxv
	uMgRHDw2kKWIeGc4ZqWfh6Jq7uvvmyRZVqdCzGAbnhDvHI9MTNHrEvRNi3RJd89e
	oyPv6e9Jpsmz/SO/UIj+MdQ3i6R/4KwFA2hPNrFgeNvUYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg538m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:55:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5d58d226cso2035841cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757537714; x=1758142514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u053Z73zkai4Xa8yTebTvs2PY20porEuaLkDE+bAlMY=;
        b=i6NTJS38u7vN+SJ2hy/1VMaU47J0EzdTfMbpAY1g/l31VqvcCHJ/G+XvVd7pMdj4GC
         RbQERLZX59VdTD41Yu3Hkaw67LAZvowbCHy7Bq3T+D/3WJd7RP3Dpdoc6mTRsmzGl3mG
         I20fzO8INjamoW/ZepvDAJQG7xompQNY0P82b8KTQaT9pTjMfqXfYGkA7krvpLlgVIhh
         0j1wBrxS9RrLCeMJO7aT6Ax3hrvAYLa9dmohfWTvZZby7HuN8PJlF53mWtWC4DOxwOoh
         qu3g7qA3HgHgEVboRl+JLcaGbfRU9TQYX0rDta0LoflTKYnTot8CaJ56ust6sS4Ys/3U
         ZJHA==
X-Forwarded-Encrypted: i=1; AJvYcCUV9DgPENBc3uinAOi6htEeUNGoI7ucpoqJgV64iC99Bmlixa6hGaOmViiL9xFMycNHne67KBa0U+167k/X@vger.kernel.org
X-Gm-Message-State: AOJu0YzFk8SpPxaMtQ8XbEalH+BGr2+5plVvhZXiw1BWfM4N+gZaWrwY
	wK6/nnpCY105iRSLuemKzJMfFtIVs3/+ko1NmixIlDd/CbRQdB8ykZB4KRvgxa5F6fnZccWG6dU
	8/H9AAgLgpwAz5dOljq0rw1+tPvgq2OEzUKfRnDmL8sdMl4/vOzwNQtPECA4UEuvx1aYm
X-Gm-Gg: ASbGncvaATYAli3dGV8UxeM3okLmxqTJBzpW03nXZqiiH9I/yTIpJp6FBR4wGA16ucA
	j27DWm6RI6TDi+nDNzrnnOhHqRI2KYb/lPvYlcrGuM9DLad5I3IPX3OyBnfexHWKFqqZuKeFIs4
	FDjMXm87mJRzkc2AAjUfPFfBxImM5hDJkFTcu5qS4sN+drt8ofresklD6lUI36BRePvPLiajdNh
	a2YbGFX4YHohR4fiMbNp2K2sGK702Gjx3K5XXwpk5tZKh+0RHaUzJ4JUbGbJnMaj6fBntX/V+A+
	HX9TrEEWOLBZh+z3dujUjSbnrcEiW55Wd/ZL0/+7Rb0Fi00/GB45taRQFYVDLPxHA7s6kevkQr4
	i5kkXmG2i3PeaNvzro1rAt5NQ/KmNf1C87j2GNVuh+SAKsEXjODou
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id d75a77b69052e-4b5f8464f56mr172407731cf.64.1757537714458;
        Wed, 10 Sep 2025 13:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuiI0Sq3dAwccCIQjFGmfMsKB4O9JNHlu6WabCdhUocfd0ddszBa/a1EYJO1myy3iU8qHCg==
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id d75a77b69052e-4b5f8464f56mr172407211cf.64.1757537713811;
        Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50332cdsm47364151fa.36.2025.09.10.13.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Date: Wed, 10 Sep 2025 23:55:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
Message-ID: <7vs4f2cofte5jkvoh2dzd6hm7pwqaiz4holt7fosjo5uwsavrb@oigtd3lozmgt>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DsRNaBdNDY4xlxOWBgreY3KnNsHoljdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX43cqDZTMPu4I
 4Ayh68kR/ABNx8x6dxIC+N7ojmam6WrSc5Xgi5sbuspegV7UEWH6dIFmBDUJVuECO5ggTRjuTtU
 Um23x/Hf+cvs3n6DJqMuc9dFdupu1/pyQknXkjZBToeVEjBszQZp2Skm7p7AhCu7SnPPVtMrIQE
 WAvQeGpQHalBdOoMNx62uQToRFWUzhNOsJ5jCV3wmOdrfQFzi6/M5c/4ECcJftghKQtu2K/Wp8k
 8uWtXN+y6uPdi0CXbL1umSul0oSPup63cSap+JeR/xQL+uykxLPsrzB7ZGlr+ZmiPkbRHW+XmY/
 ItS91E8k7NGENYH3xrpZJi8+U5RvpCG8h/enR7VHco3evFEju5NqYnW5qbhjj6Jdz4A4Nr1cigi
 TNDDsip+
X-Proofpoint-GUID: DsRNaBdNDY4xlxOWBgreY3KnNsHoljdh
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c1e5b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ui4H84HzkJsvguT1G-cA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Thu, Sep 11, 2025 at 02:14:03AM +0530, Akhil P Oommen wrote:
> A few changes and fixes that were lying in my stack.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Wink-wink

> - Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (4):
>       drm/msm: Fix bootup splat with separate_gpu_drm modparam
>       drm/msm/a6xx: Fix GMU firmware parser
>       drm/msm/adreno: Add a modparam to skip GPU
>       drm/msm/a6xx: Add a comment to acd_probe()
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c              |  1 +
>  include/drm/drm_drv.h                      |  3 ++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20250901-assorted-sept-1-5556f15236b8
> 
> Best regards,
> -- 
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

