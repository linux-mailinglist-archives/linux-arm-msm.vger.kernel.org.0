Return-Path: <linux-arm-msm+bounces-29012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDD9575E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 22:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D5CBB22844
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 20:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503F215921B;
	Mon, 19 Aug 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UbBGO0sA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E086415958E;
	Mon, 19 Aug 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724100088; cv=none; b=HfYU5sUpMKDHLjpO2BApNfm/vCgiBKcaIMe1hqMzcGeMCwafxsKBoB3INAIM+Phx/w7nc+rx14ugoPonb8ujlhs0pvVKm3nV38Kq+SL1s3L+Nf9D+WCqpZZeHHeqnwYW8561knbQ42pQqIaLqo2vk3Gk34KUpsJjasjScY/HWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724100088; c=relaxed/simple;
	bh=M3rd5uZzfmYIhd5G2TNL+iK3FOZ2LTq7dUFOgqOJu0I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltwJWzWvbciCkn1OC/kjE5iYtcDhaYDoIZJdiiRiqPPpxCzAytXnp3t1hcOAT94LpU2K1APs8WpnaAzUcm7nkWCG1Ya1gQ1MhUArPht9znkHwcEB29JTEz0kZBbBHvFOxsP4OxWgv8Ttzr85zLnyHMOVvj5ebNp+ztftgReKIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UbBGO0sA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBGZhq023383;
	Mon, 19 Aug 2024 20:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UrVYAyWClBfPZIuMpSgpl1hc
	Co+15rrUjpgphJBxI7M=; b=UbBGO0sA4yxx8MQpBaAaLKJyt7r4RRFwUT97Etj1
	4M459GUO1pJQfQ/0utlm9CgKKpank2FuKPpQIIQkb3gRXoorgAsHWJlZ3b0be+4w
	58+Q/WjLl+pc9TbqTTmKntgaMkD+HM5khlWPj5qIrkBejYGF61pG7osfw6ZyejoS
	jXjZTtJp30lFdNvHkdrl13GaDetX00rP+03YHsl/6z2+dDYyq1bheqRVj/i/Ywe1
	1KN5h0lByNIeG0sDsqICS1hO3Jw7RwEbkiMNuuFyQ/y/JAGa+pBWZD0QEoqlbfgG
	MxqUgDB/+mz52inDJpGpYysIUj8jT0upl3ezASS7FZD75Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412jtrwgqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:41:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JKfDph009010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:41:13 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 13:41:08 -0700
Date: Tue, 20 Aug 2024 02:11:04 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] drm/msm/A6xx: Enable preemption for A7xx targets
Message-ID: <20240819204104.ifa4cgefdnr3olhb@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-7-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-7-7bda26c34037@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dkCXm6kb_9hGGkZZW7GhZXL1MVcxgwpn
X-Proofpoint-GUID: dkCXm6kb_9hGGkZZW7GhZXL1MVcxgwpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190140

On Thu, Aug 15, 2024 at 08:26:17PM +0200, Antonino Maniscalco wrote:
> Initialize with 4 rings to enable preemption.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 86357016db8d..dfcbe08f2161 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2598,7 +2598,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	}
>  
>  	if (is_a7xx)
> -		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);

Ideally, we should test each a7x target before enabling preemption
support. We don't know for sure if the save-restore list is accurate or the firmware
used has all the necessary support for preemption.

-Akhil.

>  	else if (adreno_has_gmu_wrapper(adreno_gpu))
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
>  	else
> 
> -- 
> 2.46.0
> 
> 

