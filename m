Return-Path: <linux-arm-msm+bounces-26390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3459333D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A43D32898B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7737441A;
	Tue, 16 Jul 2024 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgF/vs/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50151DFF0;
	Tue, 16 Jul 2024 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166380; cv=none; b=ebF1OzXBeMCgbfd/g+FWNE3l7oks/IuGQCkn6ntsjrzBrSL3Uu+2XJ+F/arUfAuhr4VyCUZbfGXKYygotAiSe6NMH/m/vkNYp/qRf6/QH6eZHGiW24NdOw8z/krOUgx0c6kZ71KJJ/lJDhAdpE7Ccd+ktaigP0gCs45KjqJkYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166380; c=relaxed/simple;
	bh=zx09CnLMa1P4KFoADWGgBoUU13YiL23yADvsNchBaZk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPTzf0KDfNVCBegxda1d+Anbl/6glTR4rfmSwyS38Dkn+ES7EaxAGwXen/6h6VtSsNCt9pOM+LOcsONBJhRsP65B0xn7+Tf0wyaC7XOPqfU9X94L0WVZCgLaj1PKJXej6fYEkUwNuYtwQuZc0e4slgefONzEhOFvdih6xDN9uWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgF/vs/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfHFx006715;
	Tue, 16 Jul 2024 21:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fKnTV4LcVbz67g1K508e2+42
	kCMP5+1mSLPggIPIB4c=; b=XgF/vs/sT5VgSjeGvKKW0Y9f7juxEcioQ2+H2KaX
	T0Mv3DThv10PD9mgeKc1ZmUg+WQlGMhqtkjeweHzqr2va6m3z1tk9FndFXhN0JyY
	CEDE21XQ+HwSx9kQWwX2fU0LmLX5bkmzPXqXqLbC0FuU0E2o9MUB6P3eGvyUrkJL
	LanuVxXKBHABk+O89KwACL8b/tfnZe5QDle882vzw2MANfd3tIX+hEezSx8MfGjU
	lTNh7hp2t3NKLrnVZh/Nhj2MOLTWNSNx9pt9B4dd1aCt98Q8a0eCM5uPLtEKg3pl
	kjpXtc6pKRc9rZFHstBpjxYNGX7aM0LqsifovHcCBOMoSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfx8egr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:46:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GLk9HI005823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:46:09 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 14:46:05 -0700
Date: Wed, 17 Jul 2024 03:16:01 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>, Sean Paul
	<sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Fix error return if missing firmware-name
Message-ID: <20240716214601.4th2ukmy7zzvhs4g@hu-akhilpo-hyd.qualcomm.com>
References: <20240716160631.386713-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240716160631.386713-1-robdclark@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OKVIFhJ3ovra2eSKvYUrUXm37rDs5RkZ
X-Proofpoint-GUID: OKVIFhJ3ovra2eSKvYUrUXm37rDs5RkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_01,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160159

On Tue, Jul 16, 2024 at 09:06:30AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> -ENODEV is used to signify that there is no zap shader for the platform,
> and the CPU can directly take the GPU out of secure mode.  We want to
> use this return code when there is no zap-shader node.  But not when
> there is, but without a firmware-name property.  This case we want to
> treat as-if the needed fw is not found.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index b46e7e93b3ed..0d84be3be0b7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -99,7 +99,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		 * was a bad idea, and is only provided for backwards
>  		 * compatibility for older targets.
>  		 */
> -		return -ENODEV;
> +		return -ENOENT;
>  	}
>  
>  	if (IS_ERR(fw)) {
> -- 
> 2.45.2
> 

