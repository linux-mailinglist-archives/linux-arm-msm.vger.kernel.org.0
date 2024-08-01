Return-Path: <linux-arm-msm+bounces-27732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4E944CFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B95B1C255F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450931A0AFF;
	Thu,  1 Aug 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TTjh5UDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939C1A0722;
	Thu,  1 Aug 2024 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518190; cv=none; b=X0ayo7QFzesKfX+PEwkBOlVwxkwD5PHRc3VbMlZKZAbeKVr8RCDyEeoWGRVv7cF2nI9HQrd7wH9LsN77qm+lZ7+ymQ2R7O/Cl6LVZgOzW+ezecjmoJ44fpzNNqXIst2Q0TEKX/GfeEXT4aYZ+W1VTYcsK9X5F6oLP2FAgJPxjuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518190; c=relaxed/simple;
	bh=5en9m8Gs1jsdpjDgOpeb6mVbrcUigrewBe3vDCyMapc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4JCx0p1D0exHyTcBPpb2fxalVVv6Ia4YXa4YcFJ4ubJpB39lpur+Q44oQ9AliHpY1WD+KXx76NUuUMSZLj/ok3g3J0q3dK7sexF9+j9Ply3On81GS9qOpYy44g0tKqPGaS2fV+uv6otIpR6L23zHfrnEks2KaqgsS6fHS54I7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TTjh5UDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4718MmXr031823;
	Thu, 1 Aug 2024 13:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+jGFwM0q9oTRR/HiOXDvxvPJ
	1ZWki6pE7NEMpFnUJ+8=; b=TTjh5UDyfbjYk5/SytU8c1CJt7ZCvsN8fwtJsOis
	6aWv1SkN/5zgkpZ1BSXUJIDDBaXI8Eq97T0Wa2Q5e2LfrjbPUzqgFKx2EWRCd4qU
	qsXdWl9fTzA11srE0i1uff6H+fKTKzO1DaH2fbTIOA4cTMFiOUzIvbo+BxBLq1Qy
	0ulDt/rzXK+Yq6sT+lXPh0w3AFVZrmHsuNUn0GUqjyFuQk3liQ3Ofeg+AVm+ykuy
	9bq60bnrcjy4+ptmtSVmhTzX/UdTM+QiT3fET0Pqp6h2VfyTdcNQRFX8R5qwocR5
	rLcEcEOC6ibfi22EofrJkuCp+N4IOZkCxhU546fMcbijRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms43f1un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 13:16:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471DGI1s019059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 13:16:18 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 Aug 2024 06:16:14 -0700
Date: Thu, 1 Aug 2024 18:46:10 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Jordan Crouse
	<jordan@cosmicpenguin.net>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
Message-ID: <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-3-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711100038.268803-3-vladimir.lypak@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SubwBaCb1ii2FIuBNsf4-AUBeHL5kqKU
X-Proofpoint-ORIG-GUID: SubwBaCb1ii2FIuBNsf4-AUBeHL5kqKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010086

On Thu, Jul 11, 2024 at 10:00:19AM +0000, Vladimir Lypak wrote:
> Two fields of preempt_record which are used by CP aren't reset on
> resume: "data" and "info". This is the reason behind faults which happen
> when we try to switch to the ring that was active last before suspend.
> In addition those faults can't be recovered from because we use suspend
> and resume to do so (keeping values of those fields again).
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index f58dd564d122..67a8ef4adf6b 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
>  		return;
>  
>  	for (i = 0; i < gpu->nr_rings; i++) {
> +		a5xx_gpu->preempt[i]->data = 0;
> +		a5xx_gpu->preempt[i]->info = 0;

I don't see this bit in the downstream driver. Just curious, do we need
to clear both fields to avoid the gpu faults?

-Akhil
>  		a5xx_gpu->preempt[i]->wptr = 0;
>  		a5xx_gpu->preempt[i]->rptr = 0;
>  		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> -- 
> 2.45.2
> 

