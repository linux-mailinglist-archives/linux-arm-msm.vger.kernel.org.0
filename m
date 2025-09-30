Return-Path: <linux-arm-msm+bounces-75564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39FBABCE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C891926386
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9F3242D76;
	Tue, 30 Sep 2025 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hshRb6I+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B37277CA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217040; cv=none; b=HfS9fcINMpWI+HZD3RWAnS5aBf2PGlWAPWfUSs7dOivBwFGf7JXmJ2pskYKmvot6cZ5lEPbvCW9xZdnTl2N9IgJ3YLtesv7e2WgVJoUpBU0pwQ7YJv0rH+ykKKF5KZdAHkKbQN4bWoSDcxMP36TyKxeF18iFVmdxiBize6Aei8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217040; c=relaxed/simple;
	bh=ZgA1xLujZKlEfvb+QrPulixK+gcPs02HgGMtQGdszKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjZI/BfTrW9r358BcBqGOoi6O3qNEUqA0ri2rc++iT88Ho79m90/nO6x21SwIyOTVC0ToUyWy/p/xiR/i45D5ZnmPY/PDG0zR5hoW3w4qXk17GEvBVYlB/caQ92mrr8cSapedTyxBAqluawtB0SNfmL4x8cX5l4eTsruAEVsq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hshRb6I+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRuU030609
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9P8C3EgLujC+SyMjcSHJMVn
	TiYYgF5ShDLErcRG4l8=; b=hshRb6I+JHtIlOsVBCil9QBuCchiZ2SvX49aR691
	j4cL9/QnIkuDfSpqQfv3+WCgl/DPub0oI/kSe4TthzAOFULW+uiCdcogm52iRZQT
	ZJZMdP9SO4crLjRvGAKOwb8uPNXgd7fEbD0GWG/Dy4X0ITKMT83EHGCT01XV5xWt
	v0FyH5XcS92EFEQ2jA5VleBvCdiKss+wqWZsuoMPqfd+fXQEoo8AZI4ejb2ings/
	i83BZxxS1ABWC/x2xWYdwe5BqWPAxA5t6rGFisSQg6B9zYc/1EougHlhZ0oINwMM
	cpA1JPQ23+P2stdnT5+A/9rV6lpQ0hvJ45owHmpF6LB7Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdftnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:23:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-827061b4ca9so962793085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217036; x=1759821836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9P8C3EgLujC+SyMjcSHJMVnTiYYgF5ShDLErcRG4l8=;
        b=NBbFnC2HMd7X2osnYvfmvsBpN24VAuYHU8CaOyzBJPle5JwO7Aa47WWljb2gCb2BUF
         mduEtPJZmSdTzRc54WytT06gSPWd1Y9RiEQDkz2TxLOL8EWd0CsjKqbdAxP5wdgOgl0I
         scX7XuOIQS1PLgNfwJxmcB8HQrhBPxxK6QA8m1HKK67YAxnBUuyHz4eO7/SArFk37THe
         pjZggcD5FgdoprM6IrXfSOAWEo0LOygLoR0a7dR7/jh5rDCOeh8nm/tuSC+sYPKxMoQe
         y5Xy4axAxGjas+phswzjd08MFDPzzWw9jDw429a6LD5955Zd0vgJVbye+Yeq2SpqVtpY
         zILA==
X-Forwarded-Encrypted: i=1; AJvYcCUYPJ0O6iz+xBpnib4qZ0nO7OukcAnprsQjiFDaNtnfa7CO1+UM95QrQE7nlAXDWF1GJQjHQIEKvlS7z2Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyOnAsfkDdoobb4ZNvspeX1JRy6nMyJZQgPSr9jxeJ9rmTHt0
	TmvhH50rzi0efCCuFxSJrGJ+UsCb0m1btcg6iGH/KCM1aiztUcoEQcrWhn3vqRHr19hd/A2m3mB
	VNyk6nfnr562mAffb2eBxotWiJMfMq272+O8LhnDZETJFenya7KofMmHfjzUcoZyWkE8s
X-Gm-Gg: ASbGncvxl4jtbluU4+Qt2jCMGjnHF+f9wtJuQUxQDtaGm/OwEU+HKFT0VlO9m3U4RXt
	PQsYcWj5XLhegUgNOao4m6HG2+0rfJfo6vNMMCSqMAtBuvXmQDb/an0Br4Td5DENR49gTEzEgyF
	8HXc0Z5/7c6BGqhnPn3BQn1buW2XJnRiQpJyjhcoKkofIBcZsV/HZT+olBkonPWjz54PhmlYUd5
	0OO1xS7e+aQwdPncdHxd7/ZwTzRps2ZLiVRDRikicd6SPVWKEn4DFVWKL0p9fiXtvkHaaHoCQGE
	PAp5GQrTPNjzVcg/K97gTeSV/P3IaZAa7bbdwaAD3LKAEz/j5pOTufiqeE8aIK66L1vBdxUyryi
	XwnmGzBks/TyigvTZqem1zuKf9fdjYQ3zjPSNEZNkf5CYPu5BPvOu8gIqCg==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id af79cd13be357-85ae033ce46mr2294502685a.30.1759217036315;
        Tue, 30 Sep 2025 00:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtokqh05kg7AoFYMORm7EciWzypwxfanES3STHoDORc8Badi06y8IJ5mTLaRxU8ZjwP/+wMA==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id af79cd13be357-85ae033ce46mr2294499785a.30.1759217035829;
        Tue, 30 Sep 2025 00:23:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb771023esm31994681fa.41.2025.09.30.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:23:54 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:23:52 +0300
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
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: 2oC9ajZuiwDjRBItymN5xwRdCJtzM9q6
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db858d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xSz5tX2VPR3T1CvqFR4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2oC9ajZuiwDjRBItymN5xwRdCJtzM9q6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXyyi118EZ0ACJ
 64gEmR2fCmN9gQ3qPvkHZt0LOTrmhKs9xtZKJiK27ze60dYzxHFlnQvKzMmanBF75tkIUR68fBv
 ee08epVQ3MUQXXQRM3iXUr+OL2GZArF6GLFo1S/Mo4VNDL4kw1ihG50NoUwdP5slxEbNs6wkVJn
 eJWXiA15W05AzJpUXuNVdHHR+Lzz8Rzqhpb1xfKKu07nBf0sIAlMNvqyTyL0gnPA5wlMEah8E4H
 O2BJ/TtN/wYFODT25mENv1QTm8n/5KoC6ye0XvelDftqHUr6L1Wz2n8v3mE+9hrAw2zI0IMS6tb
 An2qj3Dtz1bNIb/3T9o3D81mJwM878STQV3WK5UGg1zTyHy9mrIb/Gien9fqSmalLGE0Wtc3PRk
 O62fL4b3y0FFpvyPvdaPXYUtQtv3pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu

I understand the code, but I think I'd very much prefer to see it in the
catalog file (with the note on how to calculate it). Reading resources
for two different devices sounds too strange to be nice. This way you
can keep the offsets for a6xx / a7xx untouched and just add the non-zero
offset for a8xx.

> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)

-- 
With best wishes
Dmitry

