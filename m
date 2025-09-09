Return-Path: <linux-arm-msm+bounces-72825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49EFB5008E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B5B37AA4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D3A350D6C;
	Tue,  9 Sep 2025 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq5ymuoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02248352094
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430110; cv=none; b=KHfaheRp1Z/y4YBCJfVB2KfZanqVLUgCAPR6bQhmN1h6Xg5sXFK/M56h0DF9nXSUzSmf0C4h2K1eJkj71ayeh6VmxOO9Jh3jWOOkjcjIjqMm4+LBTlS2QLDeLXbn3mNjq48vQdaiwUFbQiFrs0YijIsE0Wa4Pl1YdVZAFeysDTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430110; c=relaxed/simple;
	bh=C1KSsn2fwC2E/SLQEDeJ174av+Kw/fJ8vG0zw/sGLog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQ8ZkkCvlgCOBr1MhmhwjZWLPX/kLtsIjQYvwfkdWD2PmNmO9VVISHCfvd1J8L/1FnkJLxaNJltQj3nLnnfhHZrXXFkabp7qb0e+F2q7I9lyzF2u6jY9la6prAKRa2zScTH8NYxTYjPSfDv1sgNF9bPNM4goMBvqh38YAgAnfGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq5ymuoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSB3003613
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+YAkGp0Was8SY+eD78frAm2r
	kjGCrvc6KWsSn1t2uZE=; b=fq5ymuoAhCxfolSJ7QsAym0GWLEar7BQu4+tpmuq
	o+JzNNpJQxs4yIecyqSOB/xNjJQlO9N347rAkP7ZFcqiuZXPMbMv+zwM2Y9GhVV/
	s5jvxgSEGG+IQlKe3s34ii9GYGguXNOhEqSWacsDMmxW6uPYXgHJ1xkJPHTRcuAb
	nz1n8yUcCxfG0OMnlj6Ys8VvJc6+OXo+9M9mmAFMRgzffJbiNTXrRV/np8G8P+XM
	zY0DcvMHF1f3ILkY8XU6FWhMUDZ2pkBiGe1uZ3Vi1XTNW1Y9JIPzcK+cLIPm0jCV
	Vwer4dyuWdpJ9jlYLXCtjGGJoGAiJZw77FiF+xC2R0ogAQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgwb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 15:01:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-8972110658cso10878809241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430103; x=1758034903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YAkGp0Was8SY+eD78frAm2rkjGCrvc6KWsSn1t2uZE=;
        b=pZRBN5w+Az+5IOKDHmgQWWOhoBjHJf0Kwq/sMbHRDPAhQq56WUrVam7tuFOmopyps1
         PPRlj6uQfJuBm3yWKzMVoX1YOljFUBjKB+Pb3LkmsWmGudbW/M8VxOUCDbKtsaJV3DhY
         x2kh8EomuXG04/16xvYWvof04N0tovVL1zyrx2UzFSjOzQIJVBFKFTfh+NM660JB5t7M
         in7SkWzs3BPCJOu6qUEheaapMtmgMVMMQTSemieyQVppV5iedLh7q3cpLSbb7FbniwhM
         x52HOZe39g0hchwLTsxbTA4QVUdgM/oHyuOPgwkmhk6UlBxQqarMO8C2Cd0wUWCmVIvu
         vZIg==
X-Forwarded-Encrypted: i=1; AJvYcCWQt+U384qzfvOA4S9Y3bzeovP8LCjZR1O1tBQMiVEqBydYABWQC+JQJC7szQSYt3O04W6Jnqh0+BNbSujU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2t2ArKDxRZuO08oky632ixwjYRwr+aVI6aJgoN34ixex5O/TF
	yp82mHdsnJ8zdjcokODKigGbLYrFbIPoCCHOTSzk53cgWb2I6uGeIHtX4bESOLSPK7QAQke/9oH
	OsDnSKgTaA8bW6wN7N/yVMFECIdG9ELdAnxt0TtbhBV1NVzKVmCiDo9S2j+TnMdBK0gcE
X-Gm-Gg: ASbGnctum8zHu+lsZW3RCNjQSknxb0gNZm/YX54Aw08wvIZ/kMxpdDl9KC/ndpwuNx6
	s2JoOm69W2rnxHE3b+G6YSD2sDsyBuncoFETQ3EmOqwbyyml9di/u+K70e9vZMpTXYxXniySYMF
	qrTqeX57H5LCI5E2/clitwNpkdxgYAf/5MBXnBchiVU/KEzO646W095sB52LnbOGlPAS0aCtS2M
	b6jJiGiAcj5UbKrjRGcb8dMG1JE7aAP/KSXQ9Ccq/T+NZRUjhycmc/dP6qa55FBWeT2vWg+IUjT
	sLE0zNfWglzF2imhDBX4h2RAjr1dEcFnTEiWo09ATVfU5Os7ZjaJ0unnQ3K1YjHdJWexcTEZ1n9
	StLiBXZj3WTXenl/8z8qC0Z+gcivwp21vtTA5WbgpRFZlz6jIDqb8
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-53d1c3d661cmr4304900137.9.1757430103183;
        Tue, 09 Sep 2025 08:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbmFVS3O9rFOkq1qoy/EYq4X6azRKsts/lxojCWvOsI6IFbFnDvbit2/OPl1wUqGZICszRTA==
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-53d1c3d661cmr4304813137.9.1757430102638;
        Tue, 09 Sep 2025 08:01:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cfe2496sm587402e87.61.2025.09.09.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:01:41 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm/msm/registers: Sync GPU registers from mesa
Message-ID: <2rlos7qjnawikqhotu27svqyo4yevpc25cugscc7tihxz6go73@rfas2xavrn2n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c04158 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=rLiRm7ZfGlefp7lywOQA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: e0zXiU6kryDcPzscD85l8nUMWyAY5Yyo
X-Proofpoint-ORIG-GUID: e0zXiU6kryDcPzscD85l8nUMWyAY5Yyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0UO1ylTpoU9A
 tErPiRhDDB30tUbc5BHWAXYJdOLQUZRsHPxgi6BIhS2xNIhGWxc3luj++TE1Yci6yOozdxqWSRs
 YEQGANSVN3/whvTT9BqWn1kO16l0Yo4PeFdt824e2Sf3Hj6wWyxfNcggpFZjefD87K+C/HVVKI3
 AhbeFboALZTwWwGKrDruUgP1y9SB3935GWU27MpEQBO2iOyjhIEMoC7tdH/ZQFWHmMCyWYKE1VQ
 eSCY//KVa+mWHc3gJsuaU9i7pQJldpl7bUL8FAEK5jKsOMOL5tEKlgC4UZQKP6nfDhE/dnU1KSh
 9Lo2NYU+ZN31Bl7u2b6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060000

On Mon, Sep 08, 2025 at 12:30:08PM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 15ee3873aa4d ("freedreno/registers: Update GMU
> register xml").
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 702 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  6 files changed, 508 insertions(+), 475 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

