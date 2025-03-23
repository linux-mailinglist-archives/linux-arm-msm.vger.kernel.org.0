Return-Path: <linux-arm-msm+bounces-52254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC661A6CDA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 02:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312E53B881E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 01:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D9D136E;
	Sun, 23 Mar 2025 01:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuJBJc/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA41FE47B
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 01:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742692725; cv=none; b=JGxEp1Mb9FSfei6/kBFceWq3WQ+EmFQv4rSEEiDuTNf7aetgYoC+YncoN69tZcy3ckCxe9Sqog2y+TSlqlLqSEfA/JMWg8VUHXapyf9nN5AXbYDWRdthxyRH+BuBvWf9URWKWTf1oAV/jLOGZH96l3ZQhcvCAi/9do6AocXIGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742692725; c=relaxed/simple;
	bh=2ky60IaXpGICg8HniI6ovJiS/QU8uC/lhyixFAte1sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo1OGQ0dQiqb8VL7clFryMeuHZWR+ePw3LbEx8mqapRMLGLKGtZ61kNeaFeiO910/H+c76ChfNPYBmX7sGK/W67jZbeUfU2EdAOkxiH9KIlmBeZeLSVus8Sbg2ncBM34TomtQXNl/mQHpbvBmx+5xfhAprPjBn/PNEf9lTGQJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuJBJc/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N01tmW019107
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 01:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2R9ezOTp2OXuwq2T5MuT2vKZ
	RZJiv8BpmQQIAHvkRRo=; b=fuJBJc/p1pME36ADkN25DN8/FvUuW4LGyR0BJfGw
	LkfBleFjuQmWhD3r/zLQxhZevo4KIET1dD+C2qwlXWstLq60ZJZe1UcKDJIq43L3
	CbzhVWK8TZ8GFc0blvX23vdn1TKDHrcS7vkFjFiw5H8mO7VlstReT98uuc+nBpJi
	xjoytF7/xSAbzpfbBlsjpvvIrZoK6zyJYbZivwCcOmxoSPCIXag7aj3djHnuS6IA
	GNHuEJ7oZVXqxDF68QuzHldLNY8Tx7cWhb4EjGuO2lbqa+xbjdioZdfGU/bvRc6U
	BgdttTafXS3rzpFRgTL+wxNRTAok9q0/ier+QJvHf1GFiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnhkqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 01:18:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769273691dso62324871cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Mar 2025 18:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742692716; x=1743297516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2R9ezOTp2OXuwq2T5MuT2vKZRZJiv8BpmQQIAHvkRRo=;
        b=UA3JAvohSNWDIRTdDIBbryGnah6O+nHxAaWqViSbmK+2az2UmR+jz2wonNqLYdMJDh
         iWZi9jcz8MFiavJ4gd642spJAoOvFDnwPHtdjP75p8YNdQ9k9HSQPAkGRZAlPGq05B3C
         x3gh8lkbx7MyGW4tIpipy3pfoBeMsSs95dHsl7T0MHeRX8lyYkOwLEPPi4nRqOrK6VOf
         g98doEu6yewteUv9DTXzkMMr+zNB3XhylfrzYAMzmJD5mzuF/s/UtZsnqY7ZEdQrLPcn
         50y0JlcBEb/LGoa1FQSArPKe+1hRaPTKeaDms1ivm9PusvvwBFvy6cJCC3wvM+LbYECs
         OMKg==
X-Forwarded-Encrypted: i=1; AJvYcCXvYRP8XCFzQCqY4XqEwk5j9HZYueSEz5062yW0OwG0M36VSZk8TlCGjqechJHiZtY9ADn2N51WuzqtmUa/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfm729IolpPP73C0CJx4gfgCDuFL14pUWQ5MjdPgUbU3nMuhGt
	TWwLBtaiONr69GTMB/IsTd917lI9MoL86CGB7/Y5tOPlPHSI/VqyqGWyHRxvVPv7LkoTvoAPKGr
	rTkgrqHJZYvp9DpKuDPuzpbTFJlW9Q8JyTkK0RnsxdJgu5g9xgXmDxtvqgEQm504S
X-Gm-Gg: ASbGncsVRG0uDt/dvmgCJwFf7BA7Vp22btgUKsHzzwpji6YpDERZtoGtYd4t9RST3x/
	F2CJHbl16fHf7IQEkE87/gC9EeD4Y/+W+XF1BdFjC53s48BsOqRmJ/k3sUYqQpRIt0/BOOat5tE
	QGp6Dk+CCF454iCPE9N04l4giICNhUwhWeJlBohwL9rhitAHGheSMPct/59pt+fbQKMjJzN5i9n
	j1QORT+WDusitsMW+iSAp0oykpd+fsT35bPAdv3CHBB8WQnlMfrUWwN3cSAWYe5Cdi0pCgm2qDv
	1IALgVg756n/0yaCWbhDzVAdkC6dK8OuSyawFYXceyfgpzHRYAJef2SH4aPhgz920h+X+B5a1sp
	Lyv4=
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id d75a77b69052e-4771dd922e7mr125176601cf.22.1742692716013;
        Sat, 22 Mar 2025 18:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0/WAUbrypxHSD2MRLn7a/ohpYmGZD79AJWPxjbyAjULl0qmwkDIxxDUHGu7wO7VnkZgiMmw==
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id d75a77b69052e-4771dd922e7mr125176401cf.22.1742692715594;
        Sat, 22 Mar 2025 18:18:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64685besm635531e87.33.2025.03.22.18.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 18:18:34 -0700 (PDT)
Date: Sun, 23 Mar 2025 03:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Drop fictional address_space_size
Message-ID: <tih7arhudjn2sotdvjddzncqi7nyx3xgsvnfi472ve7xcwhhqd@2nlrtoyymkfj>
References: <20250321185437.5890-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321185437.5890-1-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67df616c cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=qQjcqu3RhaNh0RZ1ZdMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: N42kj_t5ZeNpI4W1Cr1XCWb8SLWjSmPi
X-Proofpoint-GUID: N42kj_t5ZeNpI4W1Cr1XCWb8SLWjSmPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_10,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=802 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230009

On Fri, Mar 21, 2025 at 11:54:37AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Really the only purpose of this was to limit the address space size to
> 4GB to avoid 32b rollover problems in 64b pointer math in older sqe fw.
> So replace the address_space_size with a quirk limiting the address
> space to 4GB.  In all other cases, use the SMMU input address size (IAS)
> to determine the address space size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  2 +-
>  3 files changed, 33 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

