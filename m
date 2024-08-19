Return-Path: <linux-arm-msm+bounces-29004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B4957537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 22:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D507E1C23CDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 20:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A172E1DD38C;
	Mon, 19 Aug 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J12Qjr2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEF17837E;
	Mon, 19 Aug 2024 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097827; cv=none; b=MdwTMDPcfCpyzt2m7BalZvtdQTLuq/FPIvHIxLLrVNN1GLYhHAzYQfaJGRzFILyirzUnN1pW+WHcSckpKuulR5yD/dm5ZZ3+qdab3LcmfADlJ01ZWUaHIDlyh8FoaE44tzW1hR+u6B4eunwL0y3miRcH1W9u9DdAYgR7pOB/XBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097827; c=relaxed/simple;
	bh=7iyWtOYQf2ISgaWZ+y8IHZ2PAOQlKq54OTTAKTl/4fE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGIejEyaYaKXurS5roRVRJXBG2OzboZA0ZhIai1rMhFOkziFfQYzMkk4BIAZKrWgCwlgqJbilABXx08P0R6m69ovpSXTRs6xHCuT5NG56Eum0YpOV8EaSenJuYcBr9musPxGZI0xYqrskIc9XjfiZo+xZBXuvAHcBmPYHDRdYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J12Qjr2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JAowXO015828;
	Mon, 19 Aug 2024 20:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xiX9psDJfh9QbkY+SD49imBS
	Ean91Wb5PVejcmz4AHI=; b=J12Qjr2APIeykFRHj6GIovcm4N9deiGVXgt65c6R
	G7N/uJUYgOmkd89Zf1krbsii6KYr6ZgyjlbABSA+a1fuhgwWBrIIIv2u8e7csLGp
	T0MM1rwa0nHjXVz6ERXbCY5pn2AhMwf/zeiaQs+gmEmuvyzTePFRHbOcs+ZhD9kA
	JxH7bE2nEJ3G78vr78kzxsCKZTbpTknTv+l5u/xhYg/3raue8S89gefYH8uAUpUM
	IMrN/h7KF1sr+hfTZLfdeduRLLf6ft/2J6vKPfE+/90/rH+rD4vivrGlcV4FyPse
	EoOlrSGJSywgeLFsYLVugx9lfy2kBiFI1bzrB8y0yXzlAw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m875ffu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:03:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JK3RKq024812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:03:27 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 13:03:23 -0700
Date: Tue, 20 Aug 2024 01:33:19 +0530
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
Subject: Re: [PATCH 3/7] drm/msm: Add a `preempt_record_size` field
Message-ID: <20240819200319.hvztz7e2h2id6cjp@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-3-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-3-7bda26c34037@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iDlDzcrPKJ9jo2mDkCUTlzTx5LgkfuwI
X-Proofpoint-ORIG-GUID: iDlDzcrPKJ9jo2mDkCUTlzTx5LgkfuwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=786 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190137

On Thu, Aug 15, 2024 at 08:26:13PM +0200, Antonino Maniscalco wrote:
> Adds a field to `adreno_info` to store the GPU specific preempt record
> size.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 68ba9aed5506..4cee54d57646 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.protect = &a730_protect,
>  		},
>  		.address_space_size = SZ_16G,
> +		.preempt_record_size = 2860 * SZ_1K,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
>  		.family = ADRENO_7XX_GEN2,
> @@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.gmu_chipid = 0x7020100,
>  		},
>  		.address_space_size = SZ_16G,
> +		.preempt_record_size = 4192 * SZ_1K,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */

We can use 4192KB for X185. With that,

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil.

>  		.family = ADRENO_7XX_GEN2,
> @@ -1245,6 +1247,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.gmu_chipid = 0x7090100,
>  		},
>  		.address_space_size = SZ_16G,
> +		.preempt_record_size = 3572 * SZ_1K,
>  	}
>  };
>  DECLARE_ADRENO_GPULIST(a7xx);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 1ab523a163a0..6b1888280a83 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -111,6 +111,7 @@ struct adreno_info {
>  	 * {SHRT_MAX, 0} sentinal.
>  	 */
>  	struct adreno_speedbin *speedbins;
> +	u64 preempt_record_size;
>  };
>  
>  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> 
> -- 
> 2.46.0
> 
> 

