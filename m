Return-Path: <linux-arm-msm+bounces-66099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAFB0DC0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2671898AA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F752EA484;
	Tue, 22 Jul 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuBseHBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DEA2EA15A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192527; cv=none; b=TfqGpPH61pJsnlrCI3bahWbDNgkLpwl6i02g3lYsB0TB3ZZOR6eIlF6sK7glLnDb51ihS5K7ymnM3WcSADdc7PXlP7uqehY+s1UE7tq+bt5O5OJzF9AfuB+im19f9Keo0MfbuZvjspNDcwDY/IRbTufEqvsSI2YphnayOLa56zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192527; c=relaxed/simple;
	bh=GBTzSlcaDzz96MR9va1WR5wV7oiVzBZYPUB4IHnpsZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dml4P0WKv9m6mmH4ivP6p6oDGU5SeKoMzwRTSzI/9hSEbCJ9HDWJFyGuuU9LbiFkbs1i08y5V7xfYVoxMKZhjsdKcG+4M9hPIkUvutqtTQkG5JqgW6GXQkR/buWWUyMhp6lDi7kxSc2A5+gMLEN6N86gSQUAcRdvS8SN/xNfBv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuBseHBs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LTgA013263
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8FxxfuLmav3rtJMFdmgEGtcB
	RN24c33Z4J181Ntj5cw=; b=OuBseHBsJciLM9V9eyKUMsshokS4fXHHtBYtObDQ
	1NdSZffq9+hHUkMoF9P/gVIzXe6oS3TMwvf0kGptLxR0m0xY6UdjXJ5+wnQfRvnd
	kwlUputlxh/BL4WFsnFcBQdD9wV+soilJFXZWTTfucdvl7J3Z/5Lh5XE3C6T/ir6
	UeuIhDVoLfHUnif9UfbNQlnOLpQuoeyZHk2CSjr7ajPFblgK3/XVybnKWGzMeZUF
	N5Xb871llrP6vGQb1l3/q68sDjsDjQKV6gKqyRHomf8IDLkqk2QYkWwkmgwe/y+B
	x4Dz4EhTl6icbUxvwiODIWTZ2KA3AvXy6u13LgoRJaVTAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emek3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:55:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e1aeab456cso643200785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192523; x=1753797323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FxxfuLmav3rtJMFdmgEGtcBRN24c33Z4J181Ntj5cw=;
        b=v5MOUA3tMVWd74Y+Y91OT8/w6BrON+DDi7Lj26sxx9Iurx04tngQ29s+jQ+fwxXHls
         CYg5bW3oDRKvIzrVYe+46jlQf/57M6TfMxc4lfIDWvOI0xqnaCqFPnIxMeU2AQ/jYXWW
         vukOib2neCfWs18ZETlA+VNksBTUWuF9bSIvYJfF/p+PHzTFAxAI5SkCHNWLjpLCgaeV
         AMLzNzDyePz1uEjqfqB0VFEXlCKGS61Zyc40ePki7l9eIZgVnH04JmFNN56yMIwNUp7y
         jaPm101hTKoouLywCDGXIZLtCaeX5YIY0l3PumH2Pg++yTgLajHcuu9Vp9ZRGlDSDgsA
         yFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViVXQxmKCo8kcqx9XywEHVJ5ytRxiSxAigrsEkA/vJVQHXLxHZtFLIa8sNuFF6u5F/uzPoRLe/JJDnNZOM@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGZqOQiwj1x8+jXO8qPc2O4IHY8LsqXfgnmTFfbeqbPBhm5TD
	Qmy4iI6gjDtyolOD6W/B89wCLO/LUS1gyL27Yp1a28WNgaoBVF4kvxg5FYWa9DeQTtek14PBA7p
	N82vbU48Kf99apN4oCelnpz5KPd6/3xiWa1guIDmjvySCEQUrlr3YZmjchFLOyAVsKg1ObHWBos
	HO
X-Gm-Gg: ASbGncuWeJvqmFy4KN1eRM4Dxnilhg9NDC8X5c4jk93V6HgiNJlswAaFezQiKSn/drA
	KMh2YEcXEqYTOhjiBdHKPWkYpuDckuzBUmstTHQM01ISAYXWa/CRqX5q1IJ1F8Xce1SLqniZ/aD
	e71OoY8yRONHTo79L9XorLBv3hx8ppdVc5wUsI0M8vMcVXbqrE17Gae2jZ0EubAXNMED7+Oqc5S
	SapylBDa2pXBQGEJlbArjqCxCtkRF8cuSq4x3OKLQ5XNwe9OTT3Xa8Z2TOrEH2fPI9nwzPhegM0
	NSKfpVov3HzEGs7THKXvL+44kiyb6qq8Pj9JTC4ub88n29fipDIV1Zb834/RVJum5CKGXZROIsH
	FWx1s5+MRnVgCOIzbWJzTu4KqEg9EK6fuS6Vi+MzeXHVjiQAnNkpR
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id af79cd13be357-7e342aaa43cmr3564065985a.14.1753192523329;
        Tue, 22 Jul 2025 06:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTMlUUIcQ5GQ34bJaL5Zr/uF8zkXIHPl/bxOYdlNcBILtA/tK5Op9PqoPa06PAlpWzt9uJQ==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id af79cd13be357-7e342aaa43cmr3564062785a.14.1753192522837;
        Tue, 22 Jul 2025 06:55:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31dadfbdsm1951812e87.216.2025.07.22.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:55:21 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:55:20 +0300
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
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
Message-ID: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m3HReIU1LXRADPFALQB2nUSJNHLr0_H6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNCBTYWx0ZWRfXy29UpzpLfWm2
 23LylbjSORKZyI8cUgL10QxfjMhjLNa+Bg0rEFBNqST173eBGqfzbjeGVHy+CvrcLFJ9g4AJ0Tc
 O5rLrSHMoMroO+x0u5yUtD9nCBOWy/v+PxwFBFXqMi3Ov83Hni9lKReHTce1eoRujo2w2+qeETo
 RoqNPWZ1++gC1F4VCcVULtA19Wl3Mh0qMmGhX642V17Wu+DmrMr4f9AcakJ44YoI6LEhPvzOb6Y
 SwlAQgNHqiGPljA8BCBZgfNaiV6Dqq+Aab+F2lDtw5PqzDG5oi9pMlZY1adHYejWC/5BLVCg6Vp
 JIWHiL2crc+KZ9TEd4Z50PYCZTsORIAhUqILyqLDWrRLQV9QLJx/MpOpuKDNuMjMT8/UPT5TqcC
 sU2klj9aaez1VahlmlJCRxVNQqDFrbBTCpEENY/+q3fDGKfd1GHE3Jx4wFGSwJCl+M9dHIJy
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f984d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dsTHFzNMvnhyJiqkEZwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: m3HReIU1LXRADPFALQB2nUSJNHLr0_H6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=613 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220114

On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.

Nit: GPU

I can't stop but notice that KGSL enables IFPC for a bigger set of
SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
supported on those platforms?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

