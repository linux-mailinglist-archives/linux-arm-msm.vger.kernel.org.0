Return-Path: <linux-arm-msm+bounces-76383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF04BC49FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C4CA400D9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C0B2F7AA6;
	Wed,  8 Oct 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwqS+2Up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839C2F4A0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924285; cv=none; b=tUfJwU3KjKHTRfRdQQL8GfrzVSi3agpHPid6kZOOnONheLQC/TT4raSpGfYwftCS2lfSc/opszAUjv0daKjCTHugyE2JzIXBfMYtfwc/FKg+9D+ecNtXS08ZqF+joJdUBQjJQbR2ArBiX74M3vWCGqttq4A4x3jJwp1oBQwbSaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924285; c=relaxed/simple;
	bh=pa+gkLWrp2QAqUUYjdb+zf9q7W84puc3aqeGewFO0Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WR+QOnPaEOPkcHIX6CkfaTOw96t+tw7S0KZqyeLtL83tuWxykMQt8sRHMT4Rp7j8Kf8g3oL+2W7lGsQ/n3Ztm3OfLNyxt+tAOt0V2RVgOxjZVYxHnqRM3W09DGd8U3P0wKn73fnIeNUJOcuq+mo/6UGsLUA/Wyl1sCK66I4AJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwqS+2Up; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Nr1021137
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=; b=LwqS+2UpafhDGXMn
	Md4iM6GKpIekhqaCFz7wXsm620Hpq15SUXKTd5hrq6u4CMxSSbdB7NU/JgbYYor6
	eIl9p6Ie88g2nnDXQysZo3YslcjeJjAw4TY44eTsOyGaAKtyLrddepQrFtebSDTc
	JpOBlhFTNmSqWwnGt2mJj8u2H2p6MNyKJJrrStfnifBDGgnnGQOPs13qnRePKx8S
	fcKcgr8jWXjH/sWfDDIM+Zq96LbQZbEwxH4W6pxh9JMKq9VqI7JuuFNM/ShdG3C6
	IhH9Jl/28oWOmhozi0AC8Zf4fLErFyoPHdnkp3DeXLaqKD3jMP4SdeFa7Z0Hje9v
	rxAukg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1t813-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:51:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso21542451cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924282; x=1760529082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=;
        b=NIZ0GowOgFqceygL6uS0LYUnqTtYqIXgVuJiixCHHBWK+UMMOScl/0wFoInsWeM7Dt
         pNrVMwfFtfGc3NH8F89vR3qFzDzEpCr0vz9MRnVfy8cTSIqx5y/wayS2QeWH/Ep9jvbq
         vdffuE6x0EVWN94uU5CkSqIpfZE1klDZYwjkDrmbrp9xKOabYW0zsQ4wl4Ai2ZAO79m0
         OwIth4Q1Bt/JUBMB38xzVKedeu9Bl+N1HyNU8JFkipSx5HdEFHRRMOncwO9wY+3iIypj
         SatFJJt4lkYeh1FvmZWD+cmamrHllaAr3TsCQW1XsykFsa1tdl8e5vkxmNIh3xro1oUd
         16Cw==
X-Gm-Message-State: AOJu0YxP1RbJ77cEJBHLhGgV5JY7Qirsal7351cvaH3h3ZEdEjFWdZ+l
	Pz2/MVXj0RPhpQGcmEI7h4IZXY8axbsVdI6LijResvERFG9iOMUP1z593t7nH5BD2iG4TgUnSQ9
	poSJEWIAsNa2gW6VGVMco+5EabhbQiKEyOEDvw9Q5G3f83BDV9NcMCsBoUMe4bWOMEHHb
X-Gm-Gg: ASbGncvOQ7wz9vIh4ZpNH3xrGf+D3w3HKmSs7xy1sFgMGYM4y7BKk8sn+b//wbrIFxZ
	f2c+YpORgt/nnLOV2gNuoHJsb2cJ2kRJuPbW5k1m3SBTE23/fAVUURXahXHlBLujxTlfGzlzse5
	MAaqPvyjuLh/QP2hmZxXD2GBgMdpNaG2fckU3hrKt+xKfessuD4ZgYo0FeSAy02rrmAdSmtWMU1
	xboJ7175ahkMbcOWus185Eg1LBBHkPTX9l73R47SJGfPtWYKXJlXmoECTcVJAQFtCG32Svuvja/
	FWOdZdcqAx4wqBXY0FRSYRB3Rss2bd5BnaNy5qR3xWRKTUA5qhOcjwDBim+K4bc0l7Gh89IxTDo
	a1iVJQs/XcrNTT55A9KDYSoobpBI=
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e6ead5eeb7mr27149901cf.11.1759924281811;
        Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gWRn31Utay2MX1qgHKnxPLPzAbFxKTM0QkU36eLSGUOX9zyx3iPasVrXq6nEJTPeMh4/9g==
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e6ead5eeb7mr27149701cf.11.1759924281298;
        Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b37bsm1681982366b.53.2025.10.08.04.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:51:20 -0700 (PDT)
Message-ID: <5a027440-8720-4df9-a793-5ac3a624ef60@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:51:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lI757oIIE2bgGqYZImu2w0OTZZfgomFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX/RTvC/FbLljA
 sWvRozZ8QZbqM5vdD02pjnCYZj62o/DdL2oUBKr8SroY78KurGDnHzez7LdqQx1JMiWrUrWpdOj
 jsNHZ7414CU+BaLqOYuQPsDohsVlayH8ETkdBq+LT52QzjMBbMNsmQMTxAT3rsrmFp8EJkx+X+n
 zAXYdRD35sHPvS3Qou9JYO5PPmro1hvCXuFxdUBXp99K3B1Ly8Ul/P6CzP8+gIbd4iUxBTmfftl
 AI7CS2nntbF1KHTBDWQLSVJcVGcOmqvMcIqROQzhZrkfNt95ruNR+y9/mLh+60wxSrtKGdISEko
 Jaot65SLeRzlRjzsEyF3Suk/yxCTOWS5uMu0T9jxt9Z+MdFimJu0ynPj/YUje57HNIde+20iF3u
 y3N1JeEJuZcWFuDPWJo15VKx39MYUg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e6503b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=abYYEtMJDLCSMuBgjaEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lI757oIIE2bgGqYZImu2w0OTZZfgomFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc717c9474ca5bdd386a8e4e19f43abce10ce591..72d64eb10ca931ee90c91f7e004771cf6d7997a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -585,14 +585,14 @@ static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>  }
>  
>  static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> -		const char *name);
> +		const char *name, resource_size_t *start);

Maybe you can keep this offset variant and switch to a simple

devm_platform_get_and_ioremap_resource()

for others (also letting us get rid of a number of iounmap() calls)

[...]

> +	/* The 'offset' is based on GPU's start address. Adjust it */

That's what an offset is, no? ;)

I think we can drop this comment or move it above the #define

Konrad

