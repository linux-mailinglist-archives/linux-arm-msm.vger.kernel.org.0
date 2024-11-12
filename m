Return-Path: <linux-arm-msm+bounces-37692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 956559C646C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2987B29209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 20:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D3621744D;
	Tue, 12 Nov 2024 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftZAx+wX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AD1FA829;
	Tue, 12 Nov 2024 20:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731443433; cv=none; b=m2u/BGqC3cx5KMvXk34FCBvT8gyUy9n17CXR5k4BHycCjk6R6Phxk6hyaCXCEUDxl3IP+B/I3joj2VDisBPlIgs8uuH6DudN3xu56SMSzfAOGHL1Ys/OYR3g3dNpY96/XWzQZx2NZYUqSDhAZMv2neUBn1xRPPzeqBUi7LnFpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731443433; c=relaxed/simple;
	bh=+PUVRgggdhPSTIkIBl/ezF6/hWqD9yQj8MKY0IoHDko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IX86qWRHVRt/QAU0oOWPvb7YuGOpE1dQ2iw2Gv97SQpKzEgQCCsJj1jhEygS8CWgBAmFff52ew7SWu+u7HwxQXq9dT1ckWTITFGbX48TZA2one9dxLrWlHvQDeLuaec5rEirs3VIB2r5Z6v7W1yv7L8qJI2ornXb6mFwf+2Sp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftZAx+wX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCGhv7005745;
	Tue, 12 Nov 2024 20:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Au4EFGKypvp3GDzbOIj5YnMCOF2q1QNzsySezonXE2k=; b=ftZAx+wXpl8Lg50x
	vQl5jLUXXnMTnR2avmFkgwKw4olieFdOvWqDrur2naYIJf9ERfS3+li5LayzyhUU
	DpaFMLtcVltZsJIDN08DyFePXy1B/cyyf/4MoSn3xygJi95rV1d3ssR7H5I7wSeB
	40SqmYBikyD0/Zehht4QCdWsOYVhnwxUyu7xNgYDqYQH3SFN//q5Qf8yPhzEcnzc
	USKIFeC3yYmAH060YzeOLRpPClSFH6+jL2pZBC4tDM27Yz2M2/T82IRPXU2WMdpe
	pfnc/3QAblt0Dct8UNFGE0SVzR1UwRtQuMLVGJGqyR3CA7c9g5OLMgDZPcjzl2jd
	kChA3w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5jqys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 20:30:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACKULXv006224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 20:30:21 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 12:30:16 -0800
Message-ID: <eb665284-31f0-4e95-8f24-c2782bec72bd@quicinc.com>
Date: Wed, 13 Nov 2024 02:00:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xZXpRrSehdhS4gDgZuKMyLCWgIDajSip
X-Proofpoint-ORIG-GUID: xZXpRrSehdhS4gDgZuKMyLCWgIDajSip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=965
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120164

On 11/12/2024 11:52 PM, Colin Ian King wrote:
> The call chain on a5xx_gpu_init is such that pdev is not going to be
> null, so the null check on pdev can be removed. This also cleans up
> a static analysis warning where pdev is dereferenced before the null
> check which cannot actually occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
> 
> V2: rewrite Subject, remove null check on pdev
> 
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ee89db72e36e..4edf9109d1d8 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1760,11 +1760,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	unsigned int nr_rings;
>  	int ret;
>  
> -	if (!pdev) {
> -		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
> -		return ERR_PTR(-ENXIO);
> -	}
> -
>  	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
>  	if (!a5xx_gpu)
>  		return ERR_PTR(-ENOMEM);


