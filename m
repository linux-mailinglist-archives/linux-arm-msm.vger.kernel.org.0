Return-Path: <linux-arm-msm+bounces-75561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCFBABC2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3583A6E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEEF2BD587;
	Tue, 30 Sep 2025 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMRR12IS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB226F462
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759216204; cv=none; b=FFXI+3VTBfG7pZKLnKoPxcJlwlnXNVVVvnDEjYO6i+8VYm7uplzwM0wCBpjPap1qbg2i1tVEK+WMoSIcAC8p79wmafkwxYyYIvyD4DXt76XEfDPFd8OMABFcTQDALnhMGGIX/fG+XPvr3g4GnhFD6Gd+tEThU2z0d/Chl8q46Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759216204; c=relaxed/simple;
	bh=cKThLw0NHU6Wc+n3bczOyNlGGspAuEG7VB62WabHm6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdkerRi15M5DB+rsRlOcAVPDe8onxPgBw4XuRpS++OKpL4SbnTOYjzgOpm4TxYqPSrv1/qe1QwHVc2wqLIZ3Pm4jYJYkKbogYD6lKp01cmS/oKOVOVc5ptSy0Pb9klVaSK6mOR4CjKsFAKo32LLZj/VnZ4MmfTvdG3306Zuqjv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMRR12IS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOX8026864
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mWB5st6dCk5SY60IEgGtzAA+
	H2jR/8jDg8gNG+7YCGs=; b=kMRR12IS8enm8CrZ8x9ZiNOF+G75w47cVG7mJiT0
	4MJCbnIMoifsmQJF6Qw1/CexJ1LSiBRaQp9oqReXZnznbu9/QH112t/NEIx+Krud
	5vN+2sk+w002UwpGj8tjqEZgh/c96L4wMX3RZ8Jwj8fCSpfnC5/ZZQX7ymP00+X8
	4VWnT5zGFBv2d7SVA9PiTWaA4ENPUYV/KhGo9XBZqbAQq78ZG2h2OwQK1UaYGDUY
	NRs9rGVEq4wiN9orST9RFK3banvnqwa1y2Pdd0qgyaXPNfQhj0/Hvd+q1GVuiaCF
	TZ9wz+TV2siD6SMBEZ68Gs2AbLvGi/p1X8n25Cr184U9Kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1k1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:10:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d905ce4749so110452501cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216201; x=1759821001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB5st6dCk5SY60IEgGtzAA+H2jR/8jDg8gNG+7YCGs=;
        b=AM7D/klkMGxApWiglMwzV0LDxp5YCCLLjUbksOzNg+px0UuBB78hKmS6kBYg9Me6zT
         994rQ+mwLilh+J1ryXm6rn+Lc3F/eUAf/59Ik+jw3YktZfwDXXM3UXsFiVafi2IkUQlL
         R8V+hmaII21jWlmi+pnZ/zCPc2KvuRX3gGbxibAo4CbsTttHseXRWNIt/h3FWa97jDIO
         kV4gGj16bQRn/xYQm8rYmQeTiKSfEbJ3euO1UbSbLffxlFWFuqo6Emis1LuzPD2J9a7r
         xz541I9dG45V0T/AJBi+WJYcOSxsJg2/41p7qqoyGM7ebZowsIb21s/rYVJt/EEvbzPb
         MpBA==
X-Forwarded-Encrypted: i=1; AJvYcCUgnXZsUtt7XuaOkicIUW92Xh7mGVfavSrSiW3qCPSuKRPu/HTMGQFRpKK5LCEVC0pqza2xd1E5kQhIU7z+@vger.kernel.org
X-Gm-Message-State: AOJu0YyZWaEiTT9it7uXzpS+VaAkfbUVGGjhhHkwKB09v/UVwyQgbIrN
	wnYyLCQVue0z0k5viYVi9uPH59Tn9fmiNKzBsWLKpuKuQf7uuc6Th+gky7UMz2APalxgU7npCEy
	+KVH0yFS7/+osFWHsKkdIL3nUelRvY+2TRcGdwWtGH/IHrETBtNaRwNrBIJgKRWbCJ5rr
X-Gm-Gg: ASbGncs/9lpU7Bsz62XBAzhldm1KydzkzT1QiyT+9rZ+7LylEwrM/nf/jE0GrhCXrI7
	wK7YMYBdSIBm3FPcSVkwSKtgVn3361U4XK8p679nrbdxGxe8Jvb61uR0Q0DouI9cAucEPxrWubl
	ct4VbxSBF/aVV3MpdKtcLYUwKoevqXfbP07oo0nMtQ2j3owaFcNnJoBcbWsJt+SvgfUyF49hpp1
	w/dH5YHW+GSGvV+9BFP3xGVRFrIsWkH2k42khAL0gshe7e59OrtEwlsojR0fLiL+nZrN47HkW8/
	e49VB9Ct2KFn6l3fzWh072TgwDUYqKNhm52FjTgG8/lSRDmscbjAafGBJZSIgRh18mhpzVah2r7
	QApr5R/UbA0t+ZxtEE+TTgBOCHTEZCE27EMKLMZqhg2hvs8dU7K15WN2jaw==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id d75a77b69052e-4da4b13ee9amr205820001cf.48.1759216200598;
        Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqfXjb8BDoz0OLkhbqOSkOjFYvwz8YqZOgVTFVVpG1nTKdQgXBzxVthwYLzYpdiitvJ/C4Vg==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id d75a77b69052e-4da4b13ee9amr205819771cf.48.1759216200128;
        Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710256sm31171981fa.45.2025.09.30.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:09:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:09:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VRRvJrn6zsfEcyhCfT3S8nZdJTtcOfV_
X-Proofpoint-GUID: VRRvJrn6zsfEcyhCfT3S8nZdJTtcOfV_
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db8249 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KsGV-J2CeG6-G7wVncMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX1cHPW7O4cUbj
 2aC73Y9djj0ZWsKuK1ZaSPJGxYYEavSAXhmwIcIpVwyiiIXrzDITV48Zlfwo+Qu3w8/AtRszVYG
 j5MUhcC4Mso8gujzAKpHLcIsuv7sOgPSPEfm5XpHcGEx9mEmfsf7ER/tdeFAabCngLuEQ83zvnX
 uMr+n/xhkO/xS9gc2kMDKAJ0JzYdanauX4kcvurBv7iWQwjOXxAoP1EEAkncqo6ys3WrYgnDLQN
 vloCTwTAbX1lI86Rr+CyzvRGbLOuoiU0ndiA6mfBgyyWlBgaYYKD4Kg4Z/0GWP30p1JxLPyB9os
 9HQ1crHPIv7qCXyDnczcxrSMRAQQE+DjVPcbgsRzhwXlq2eJaZLl+XXXjMNmBq9JqrA/qScXohd
 7EOToTIZV3VSWrp1/cFCvjQIyFtpGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>  12 files changed, 275 insertions(+), 262 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> @@ -8,6 +8,8 @@
>  
>  #include "adreno_gpu.h"
>  
> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;

Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
otherwise.

-- 
With best wishes
Dmitry

