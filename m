Return-Path: <linux-arm-msm+bounces-29010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB0957568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 22:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2AC1C21EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 20:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC932187FF1;
	Mon, 19 Aug 2024 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Spabyq9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DD18E0E;
	Mon, 19 Aug 2024 20:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724098308; cv=none; b=KsxWL1Mz9Ffx4DzKrUYlO/ePxp9k3YuJAZGNs7Rm2UvO2Ztw+nzokSTaVI5dvwIgSwDdnGIU2oHPoMJieK4GYoRzJejSwCm91DvNPxUbQkjZGfvbX2q2AJtpsGkmoHyc1R0XSIs6D+t6yTLfjH4pVwaCInd7HypYXGPjMhp/4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724098308; c=relaxed/simple;
	bh=BLJUk0bX9gUGDfph6GSWzGp+ykZIol8Qjt3bgRDSUSs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO1CW1JRZKzcr13gbnNntsF4L1YT7GgfrtPfbwSeBiMwhf4Vav5ftNwwjViT6PaehBELE02lU/1F89xhbc6QjsHkn6yid05UqwN5vGSJ1P3OHQcneTW/IbCAjYQzxzW+CEs2XlfhM/pdMYtdhiWm2KEon1yogzQrgdyoBbrv0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Spabyq9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBKObu024364;
	Mon, 19 Aug 2024 20:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMCdps7tyA/GIXXPts3+LiH/
	hDUXJKkOVbES7nigmTs=; b=Spabyq9bKoHLfrbWGKS6qL/qKx/H/HRpsgaPF8wp
	h9C1YAncIuDtssfuAFqoAc+pxoSOJQgQpbgfi1H7s3eZ9rhmPyQfqoEaD8/4gou4
	fcZxiGpCMiPtLZ2Cgtb3emKHmRW/gxNbISH91jNkGTx4GvMGyHBPvKL9x5ldudjL
	xIHuC+narVEYuRRH7gy4Aq/JsudkAzeCpYcmmk+DnFqNgQPtEDo0MvH9bb1uknrg
	s3DzjLPqDs3uW4HJY6uQHKQ8dDqrOdHacFVhW0sb+khnFJueiN8f3giWHlKdfgyl
	owGWEqkULNC+IMYfvQ57JMNF/L3KCee5AW6KPfWlkuQfww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmen9hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:11:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JKBWTf024737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:11:32 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 13:11:27 -0700
Date: Tue, 20 Aug 2024 01:41:23 +0530
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
Subject: Re: [PATCH 5/7] drm/msm/A6xx: Add traces for preemption
Message-ID: <20240819201123.6eeahdbf5ezaloof@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-5-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-5-7bda26c34037@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CbAK1L18m79P62SU4h5auEz3UKhTCsIh
X-Proofpoint-ORIG-GUID: CbAK1L18m79P62SU4h5auEz3UKhTCsIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190137

On Thu, Aug 15, 2024 at 08:26:15PM +0200, Antonino Maniscalco wrote:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
>  drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 0d402a3bcf5a..2606835f3c6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -7,6 +7,7 @@
>  #include "a6xx_gpu.h"
>  #include "a6xx_gmu.xml.h"
>  #include "msm_mmu.h"
> +#include "msm_gpu_trace.h"
>  
>  #define FENCE_STATUS_WRITEDROPPED0_MASK 0x1
>  #define FENCE_STATUS_WRITEDROPPED1_MASK 0x2

These seems unused in this file. I think the previous patch added this.

> @@ -146,6 +147,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>  	/*
>  	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>  	 * is skipped due to it being already in flight when requested.
> @@ -262,6 +265,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	 */
>  	ring->skip_inline_wptr = false;
>  
> +	trace_msm_gpu_preemption_trigger(
> +		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,

Can't we avoid this check? I mean GPU has initialized on one of the
RBs at this point.

-Akhil.

> +		ring ? ring->id : -1);
> +
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
>  	gpu_write64(gpu,
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index ac40d857bc45..7f863282db0d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
>  		TP_printk("%u", __entry->dummy)
>  );
>  
> +TRACE_EVENT(msm_gpu_preemption_trigger,
> +		TP_PROTO(int ring_id_from, int ring_id_to),
> +		TP_ARGS(ring_id_from, ring_id_to),
> +		TP_STRUCT__entry(
> +			__field(int, ring_id_from)
> +			__field(int, ring_id_to)
> +			),
> +		TP_fast_assign(
> +			__entry->ring_id_from = ring_id_from;
> +			__entry->ring_id_to = ring_id_to;
> +			),
> +		TP_printk("preempting %u -> %u",
> +			  __entry->ring_id_from,
> +			  __entry->ring_id_to)
> +);
> +
> +TRACE_EVENT(msm_gpu_preemption_irq,
> +		TP_PROTO(u32 ring_id),
> +		TP_ARGS(ring_id),
> +		TP_STRUCT__entry(
> +			__field(u32, ring_id)
> +			),
> +		TP_fast_assign(
> +			__entry->ring_id = ring_id;
> +			),
> +		TP_printk("preempted to %u", __entry->ring_id)
> +);
> +
>  #endif
>  
>  #undef TRACE_INCLUDE_PATH
> 
> -- 
> 2.46.0
> 
> 

