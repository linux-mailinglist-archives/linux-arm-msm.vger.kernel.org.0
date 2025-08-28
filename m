Return-Path: <linux-arm-msm+bounces-71199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CAB3AE49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 01:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC958684866
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 23:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C402D7395;
	Thu, 28 Aug 2025 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d43CzfJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7C2D0C91
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756422687; cv=none; b=LzV6AxSdEPs7dHrzGgVBOloazcidV52UjcSngv4Xu1J+WQ484HsF3Se64npGuC8yPOZPwYRw6RKsmAzXD+pqcviGcAuXh2ip2Jl75q0WE0wWMEqwLVdZkAIp3HJMBSHSeOkTP+1/WMuSTsnsSmxxIa3NsOTkdVWA7n2JIeTDffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756422687; c=relaxed/simple;
	bh=1j4WdwrHnByDSgy1mNxjpBE/DzKlTCKPkMm+zi6X0Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0D8AhfXeC4ft12HzQQ0+NfiBD1dC5anmc0D/f8PpgnXVCMutK/K3EPfFVFobbPj6/r5gnKxNQA8Y1/Vk7xCMxfGMorTSZAgIOrbvUf63SU084BbjAao0KzYtUZnqTAW7kRRg/dCncFEfiQ8dlfuUsvBw/ZbA90zko4owWO97jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d43CzfJk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWeJw006277
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 23:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CcwPb98D2xg5sUyCBoeco6KS
	Je0ON7jV0q8gk3wftUg=; b=d43CzfJkVtNCcnXvTigbg9V2wZhs9tPvt3pGpY48
	UMtN7J9Z3LNjTXjydLSp1gFM3mmRW+FKQverrMHoObEWbtNKOvpPVszoUy5kwjnE
	lj+5+S4hExYK8MW+4ruwCCFZ5j6rwtDoIYG6zNKtleyYQuNot14ymqJexK20uWqw
	x3jJt1zKSPb9tHFJMl0Ss2O0/KZ59UAiw8mwK8Ax52G9Me0Tigz4ERp/IKiJsrWW
	RowNZtFJeEf1klzJSd9G+DJtizvZ+VxTpdrD5/Z7v975jxRM9zQjyioumPbd7tq7
	QQlofmvZrRGQbzU2a0hX11We+jnezP+nFvJDwGXCgwgjeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgktw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 23:11:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b308e4de16so22119601cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 16:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756422684; x=1757027484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcwPb98D2xg5sUyCBoeco6KSJe0ON7jV0q8gk3wftUg=;
        b=eFBRS6PiFVjL2FkfbRpNKUs3NROppqswB8HhhzFJd6k9CT9FtsIpOpq/VF9OFw3vH4
         pdNX6fqLTjv+ZPOCW5UdJhas/d0D6JXQ2rL9OJXGBlCm4dTNmQNO2uwjYY6LE+JH/fQe
         ltLR/HKavtk21c+ofdJFQqJKtFzSs4JOH9chd5w7c3E879dRxEBY10ovWKPeBWQsWZtI
         4Bim8Cn5pC7AxLhbp/2SXE9t1iMYGSjZZarga13qf7uotkzaB7omi4tloB+2dL1ilMv1
         Ae1+FdjXqWHK9a1lWitP6WfWtlDz5PcA+Vno4AqfyLyLh9XC+7hxBLD5cmGRbnIHE5dz
         NDEA==
X-Forwarded-Encrypted: i=1; AJvYcCV196ruD+qGOWJvgo/kVfYMNYlppifAjWBeQzowMLsfAikBMYUUYNRnYLKJ7poC3FbfJFJliihpTWhfHYIh@vger.kernel.org
X-Gm-Message-State: AOJu0YznO8XoNjdOTvceJm8xrs0em/2uWvMTwGBxhZaL6prlP7HdiGhL
	I8SbuLUhJY8mFYgPU6+cQETqzZmmU7CETl53O0fd94iXiM425rJ3gPhh4UmOyJkhNJDpHdbbY2u
	QJrL0oAZps7GO/n19B7cZzYOy7YsOb9VX2oKbQXgZRK3n7immQSBaklIXqLTYLKpMtNaT
X-Gm-Gg: ASbGnctVAGac+KO885VOOfpiFXD2bTydb3lp7SY4O8GTCufxXySbuXjF4s5UKKhd0am
	6fmK0HdxciXWcYRrZrEq2OF6CNmOKqZTdC1s1pWft2udZSsvdfDKWlBMpIc6oLbZ1Fx6AcNJIN4
	XqC7VgW3vK3cB+O7fQqrI0PuLJ/KOkIDVUkFp6RIdtbo7gcR+Udk3/CD5G729iWD4PpoJf9ECiV
	QLrDt6GXTDTk2lCd5r9IQXYg8pm/fBsosUgdO288Nc1RyDjaxfSZz+ZLlC32RSpk/yitEv9gdLt
	4ZSBmv9STkL5SgcvJelAUfIsd+rWyJCa/U+cR9PwCEZjJFSx3Fjf9hZnNvl/8Ic0zU5E4daHhyU
	YwjmE+8E0jwkHoi2uATl6y81yf48KoxtrZD0gANL+Qq9eijZyuLMt
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id d75a77b69052e-4b304d91c8fmr37454731cf.46.1756422684216;
        Thu, 28 Aug 2025 16:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgdun2fn1jFqmiQbfyBvO+zPjYV9lB5FdqpEXRjyP1PtkoydoYjW2c/bS7zgz7W252CkZPg==
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id d75a77b69052e-4b304d91c8fmr37454411cf.46.1756422683667;
        Thu, 28 Aug 2025 16:11:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b4613c10sm1461051fa.1.2025.08.28.16.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 16:11:21 -0700 (PDT)
Date: Fri, 29 Aug 2025 02:11:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Drop unneeded NULL check
Message-ID: <l5t72pobsea2mcsulxsomrqpbeezj22vdtp7gqg6zjlqwzkjgk@p624paf4vhn3>
References: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: 1hY6JmDTV3Ve_-CIUWppAHcLEwgCbVB_
X-Proofpoint-ORIG-GUID: 1hY6JmDTV3Ve_-CIUWppAHcLEwgCbVB_
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b0e21d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX9PlG755lrbZb
 qErQ1hPaWqCrKzSJNsSmQ7fgKQl/HqgJ/GfL3X+rs/07PubPeMNd4MI62B2jq6XR4mJnPE582dR
 zNd5V0OFGjvR5XcD/4DBDxWLFKI6hwmnTBLdgNdPXK3m16s2hHsbNHGzQZx9g8cfKzd256uwkh8
 wEMmCCSCRYrZfZSE525EEaMk8Ajf32xW9m2DbpV3f8zLgTc9bl49BMcOIXVxlb9QMy4pZdCB+TI
 T2WtuDINIIsOUCagDTq5inhQRR4sNjWKkFC/U74Q7UcD6YRBipz+K140xtmgo9Wnj+FEcQHm2L3
 DVgoUxWqSggj8mxHwPg5PSoiRyA2S53vSa0/q2qd5f3HwsdwZtFmNdVN5OKIskn+jke4Cpu9GfS
 gW7ZEn5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

On Thu, Jul 17, 2025 at 08:12:01AM -0700, Rob Clark wrote:
> This is always set in msm_gpu_init(), and can never be NULL.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

