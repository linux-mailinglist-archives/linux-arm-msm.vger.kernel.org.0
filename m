Return-Path: <linux-arm-msm+bounces-75575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E2BABE2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734F6167C57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE51D242D63;
	Tue, 30 Sep 2025 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vw/XAKGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814022B5AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218363; cv=none; b=pgdxY8YUuUXub2zHqtOJwdvJqqvqMpFQAi6dfBXkQRd+bBBz7Vk+ufe96e7oNbbB11asnMq015tqCGFZN5ls9fot7geLgYRIGGksOwhJYCOOHEjqnbGCVTOusCSNMNfBcl7hojg4xjlmrOpuC06tIxssI2ibYN9YOZaO2aXCTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218363; c=relaxed/simple;
	bh=BefZSX9fm1ONvnB9eur1YvCHDGRIRGcUqr+hf2kx83s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNErfSY9hMRnzHjYvU5J2/4KhidbJFGOPJHg8bwGhZi5P+PYaN5sJrz2cqentAp5Q/zDMpYNUWXK4F02UJJ3UU0WzScP00lvk3xGQL57olode635ki30uNbok1TRBWdwLrWmqyKG3qkJe+pFMUg+X8JmrW3etKR0Gevn4C8dmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vw/XAKGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hofx017486
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kji2nmZ2FEr3Raw9eE5h6cYw
	gKVR2CawlGpJNJ1zd3g=; b=Vw/XAKGE1YO/T9KY5F5Hr22nkn+F1e2vVFdW0Yk5
	HucrueTDHPW8bQKdDS7ZSJUH3pMjsUmxgjV5CwqWy22p0FkJGOSH8eDfhqa99wnu
	5vEcvfNhuri2ynbFqymBxNt7EZXstZtoGedJRH6A5Pyrm4eC0yqYDV27uLk/EqRt
	o/cXfEAV0/hfQyepZ4CuB64ceNJN5tA5Gx22Wf7at+joGv3XvywLEfUK/d6N5dI6
	tO/IDDnLwKdrQ6WtRWBlhPalt9dKwRC6wSlNQ5DSkDFSkfVTKugIaHAwexVG3Q4X
	HiJbykLLeuMB/0zcLomnZoSPDz6RSPpIlh7S9P4PFf8sqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfuvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:46:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b302991816so105788151cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218359; x=1759823159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kji2nmZ2FEr3Raw9eE5h6cYwgKVR2CawlGpJNJ1zd3g=;
        b=FI8us2reFGqWiQEB/i8iQeZDH9rQUwVTRlMfimfb2TUjGi7qB5B8+2BOYxq0T8OFEB
         XNCt6sBRczxzwOhT6hFZQawKXfPImJqvCwTC374Rrf+174KpxpoK7bBvhun5RISmfT6b
         M9BkrhQkqzvsy0/rjLU3HL6UrqXaBYa1SlR06qF7QFlaDETTCfggGY8akIdijcxylX+I
         F0HI/Vsstz/hO582R5LAM6UCHCE8wLsHElU6ya8mRayc31glnP8UoOqgBD170ZUwfHUu
         LMtSsUMMTAYvetUx7vxMIZuhAGl1x1mSzlYq05YmPTRJX2132AkpUimbU7hq4G74MD8t
         rQtw==
X-Forwarded-Encrypted: i=1; AJvYcCX7DGENWopLYxIowVpgCOCfx3GDqpqbSsmluTrNUWCmtKCsDMPOk/lUIXKAHqE90ceMaRe4I9yb16K5OTeT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0mvdf93MZt4xu0oZNsSCYZLg2pUBm31DCP9vyZ2v+qVvYNsQ
	uxWbL8FhZEJmY1JJ1tJqvCu5ywmH7Et4OQ5lHeQycMSxPXhX/P896EtmU0PBeG2z6PpKcCvpVT5
	JouuYa4SmGL/LvB3qMY2VuI6AVzr4rVYiG0exXxNNdu7v9vW4vGpwiXkSigoZzFhpnz+s
X-Gm-Gg: ASbGncvXPd73hqWOknuULKyUZfZWivm5siVplC0NZA598vhkVGGemj+ye9jmvyrOosN
	SHtoe8mEaqbaoj1x4pgNYcZkSnf/eSQuhFRPoPYmh3F2ltVoSx+/K/aQmP0lgM+uSf5Uh3RYzfz
	MJ/x4GMI0eMp3AF0NuNv0xwCLUsSJfOOfWE0uoZnMQEljK9Fxjs0t+sS2JHbywoDTRMAyvAnjZb
	QlLtwR692fX14VD9V00c9VMnPOXD5W4E/hHtLgzaOGGGY5eMj6ar8m2oj2iLLYRFt3UdI3mJuKP
	6qBYRYHe+FmTBcbtVezbNAj1c/ma8PmZtMrTsvLqhR/0wNxhS7drTLv3W13DNrWa01fBYwOVDyi
	Emeh6Pu7Mbni3GBYCQrDVM2geHyA5kFIsKcW5gqhBlX98wxXzTOQI2+883Q==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id d75a77b69052e-4e2661da9f5mr51016231cf.35.1759218358976;
        Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECErpsVHn/gl20DmHz+69GFvY5gifpdT4tSpKn1PuYqRHRES76ncOLU7Pd8idEKbvO7WTlFQ==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id d75a77b69052e-4e2661da9f5mr51015931cf.35.1759218358442;
        Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37289559058sm17247361fa.2.2025.09.30.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:45:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:45:56 +0300
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
Subject: Re: [PATCH 14/17] drm/msm/a8xx: Add support for Adreno 840 GPU
Message-ID: <r2spx7vu4sg4ydk2pvhe5gq6wxaiahmec3f5dpijvw5mseldmb@755zm7c2nv4z>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX3sRY9Z705FM5
 G96a1/X3nNzGl7klSVKy/g6zlQLGL+NNMKd3L9rKG3c++QOYo1MRUClSXfjtTRjPM7zO9KVyn1E
 kF73GWEMWZeiNSAhI2WS+LFiHUhVQ0SfJ1jRCohpJRl0MyVuFj435+aSyC9IhkUDUX9tHz2MtPO
 OKr0tT3XUDkmH5AYVfPIxGqWbz+FBgf1/eg0Kv52NiL1HPFwIJVhU+1Dcq5OdeAmlpORliC6fog
 cp1QrzTA92sdTt+MjsDcRfArdOk20TO9zMWEMRvI82mc6Ld/8IvZskyabeaQnb60/asVcLNdq02
 fUxZKCxu/SIb6oEQ3liF6Kw0ClNc5pmPBz4YtkZjmaFvCxrmApWNcCpiM1AwSN/LzD+EpG0D46C
 quji1AtzDuJDP+n0Cd5XUVWhZQ6Ijg==
X-Proofpoint-GUID: l2TCMez0n4HErVakGlZSRh17ksSXynMw
X-Proofpoint-ORIG-GUID: l2TCMez0n4HErVakGlZSRh17ksSXynMw
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db8ab8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=90rIqVWp54D9reHQgRkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Tue, Sep 30, 2025 at 11:18:19AM +0530, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 211 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   5 +
>  4 files changed, 225 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

