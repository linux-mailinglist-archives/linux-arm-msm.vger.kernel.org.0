Return-Path: <linux-arm-msm+bounces-54559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30111A90F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAC187A3483
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E524A28E3F;
	Wed, 16 Apr 2025 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMfnBcr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F9248166
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845120; cv=none; b=fvh5bojAZcsa7VgRJQP6oG8qNa1doryWESzeubp/VVoRbUBnEWXo9ERq5jsPMdaDyBsKcxandFAQ6koM9V/tLom5xCcxYCA1C4IsE0bPeltRqeAThlt/sGbAAonTHHY6YTn2Quup4dIQnk3bF1TVkL8LjONK304PUEh63whT4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845120; c=relaxed/simple;
	bh=HvqzOVu+JAeTVaLGzhd177+MVdXkNQAqTHwFGndoIp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8yBbgyTqgzQCf+t0Rbc2kMVHZ/WAUVJVBASfqrPn3zh6AYwOJ5EsPF4xMxiz9TTkfG5+1IbNOLH3x7WVrxCXChjiNdXq3uGCJ1qaenCe5M9wLhiLX6AYc2xlRLEHpIDDXyRkrlwUWC9cJ694J1SFAYS5ZhS2orXqMgYth1EGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMfnBcr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLvWpr021318
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=10e9Gm2RPGDf+oQLDehdobGU
	Daa+U5XpyPoSez3rMCg=; b=aMfnBcr5HCNeSj3J1sOS2UQQrEYYtqAMgtbc13hx
	jrEzDtXXg3gWz6c/NrKgCvfKPZC2j40txojwvXbjEsizncb4L6qY7gHYOdZljgfm
	SDw/HUs5kAQzeCZNC0oL8XFZxP8y3Y2iw0HGEYU7EFtcAmQvW6NPsjiIAos6Q9eO
	fOS8ohEQ2RuImLrQiioMaGRH2satLxtF6m2T3A1aiE6aOiAfx17EnuKzOiZ0QPqh
	Q+ygy9ShgjRD6CMklNGkOG02z3NTVTLxKLg8hsSvIEbtSMdVq0RssXiYgLWsJA47
	hTnkCKFIcnkZw+N1zW4hPf0/+9Tkv1duW6l+RAx3s/Slng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9cykn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:11:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8feea216aso20454286d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845117; x=1745449917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10e9Gm2RPGDf+oQLDehdobGUDaa+U5XpyPoSez3rMCg=;
        b=fg8jNM0vlOzvFovm9glCTLj+g0yT1Zb4PRuF2LuSEiwr+M1FwdYmfpXVlQ2qQzICzM
         qZd+J7XAre5ff//+V7Kci6NhwZsybjDO5fjzGvo5hjbajXV9nF1jLDvqt9QzigGJVT9f
         D8Kge03V6tmpUeSsL3jr13x2vs+YuD9Af8qtUUXSXMdfmc+a7h+oaFdKpfVByNx4GvmM
         H5J83Jfxbu94oHYe74IpQgyzpt2hDGvgfJ0QFkvBcVWCN3Lfgq4eM6BmUxfvxeCj59lK
         0IxRaPPOzCHjfj+DWnFHhjNdV3gQQgluA6mz8fxUH3q4j690IGnT8Myg5p6OMHlVrjCt
         v8gA==
X-Forwarded-Encrypted: i=1; AJvYcCXaV9oSpFW5H042VRjLZ6wwg0EIb0yDqmBeMUabJvpRZtwtvMZ9iq1aPfN+BapiyWQJ36MxdWl0h/mBUEF8@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPfmj3Cgqk629VLdDflWQj5UEs7aAGijQZmfmjdRjLTNps9+c
	KY7BcAYfP+cu9P+OFhuHcGV9rBx0bpNRevyaZoanEZNu4NXY1vJQQW/IyEdfuft7x2E5niIppa2
	f7TqZL9OTC1DeHPlL9Q0fjLJ42vJQNKvqiyA8Y0H0RYFW1qUge4VSLeOcia977KUh
X-Gm-Gg: ASbGncueL+QmR73jHMImigL/I9Q0qqoPUAMDAuAUWg4Kze94f8XY2bs2GTCnQrKsSdX
	QtsFumjrApf4oc9bT/MorXr2ZI9mQKgVPRaxxfSUNaGmIsOu0fxa2e/fL1vKUqrEb0ieL4ZgFt/
	5TihU3T/xH3yP08bZ9SVOB6uid5IemqGV8lxDlC7h2wstcxhDedssVg5lw0rvxyBx02IhU3/adl
	BvQchWOgJQZWVypSKC79VqU6Zhdepm3ND8AP9xu/SwKzsg7Ldk1v3H3+S6/kU66tdXkR/yfxFoG
	7vJNecMf5q5iKQCCHRE/PPRWUnTRM53TQl4SrPTwWndM0H0j2T8S9/DE5hYokQp03NVDPYv6AwU
	=
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6f2ba665fecmr13701406d6.8.1744845117437;
        Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgAiezriok5YJFlEPY56geiSrXUHE9y3nHh405AYuoPCKrzUZwk1oQwHN9lCS5j+H7KnD9zQ==
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6f2ba665fecmr13701116d6.8.1744845117120;
        Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9f2dsm25270101fa.53.2025.04.16.16.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:11:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:11:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 05/34] drm/msm: Rename msm_file_private -> msm_context
Message-ID: <lb4to65g2xr3ryzhhabrejau3h6b7impchrlcfpv7bogme33r4@5b5gdqldk5h2>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-6-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-6-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: AlakN9SWfLh0E_5V_pfTqxkJaY1NrpZW
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6800393e cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=OUvj5yb-mTn8qsDSrQoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: AlakN9SWfLh0E_5V_pfTqxkJaY1NrpZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=763
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

On Wed, Mar 19, 2025 at 07:52:17AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This is a more descriptive name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
>  drivers/gpu/drm/msm/msm_gem.c           |  2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
>  drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
>  drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
>  9 files changed, 49 insertions(+), 51 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

