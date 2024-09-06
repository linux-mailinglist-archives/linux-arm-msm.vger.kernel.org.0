Return-Path: <linux-arm-msm+bounces-31182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BDF96FC8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 22:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67761F22F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 20:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6051D5CDB;
	Fri,  6 Sep 2024 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KYrdCm+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908C1B85E2;
	Fri,  6 Sep 2024 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725653486; cv=none; b=DmF9Nl2/F7PGxau7ERyd3EfWJtFZ/j/frVd0YiYE6qq/mIUFfUynxZ6nzLmj/ZmYrEscVHUldyB6N2yAAGmn9MacO+NjtONRh+SLkoLAUiHznGwdWqR/s3I0urt9CR7BynHK4rMz6/gtW6rZ9V2tbey6HZBHFE8+eYSFBEbov00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725653486; c=relaxed/simple;
	bh=A+OMpTXUaRI/S78xVXgxVpqoAfOOi3uMbQQi5jqkPV0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdVnPSoVEgc51ttqQB5WCwxDemfLPnzQ3hSU08vkzI3Lbhm5ZGgH4j6+f44EteCx0GTbW25Yax5IckxCwVO+0JI5HHU78PpYZ1PZRi3i2Jmxl0piasYPsEGXV2LMfYxREEBbEukdNhCuX6qQMzDXNzlE1GUtlqW7Wb8X6kiIhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KYrdCm+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868WQbk021072;
	Fri, 6 Sep 2024 20:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EV6+EYvyqVo/NojOhxcmhL9I
	LHynzi+QXQw6XNlyCPc=; b=KYrdCm+kBaNWiSJX0iHfvgColBj0TbjcmkL2jJba
	3MghOmMYWU566eJm/9KXAlOvkW4tdG4WqqyGfgFbT0FSMhrg0qZsVHtf+fHbXR5d
	WNM5Mze9HC4mifspTp9hKNyUfBtGCs3lZtkUqNimvOhBwpla9FRauJfMtvSi+WUQ
	t2vJuTf0vAh9D6II3B0K6tF3goO6lROu7c7P6f0jvkiIodYVwt9AC7d7j3UEzLi5
	aLvqmun1a0aB+tIEqOzR6okfl4sBdb83LqGD09ztMWrwVSkF5EcBTHGNnshVfgHB
	ZJWCW+G6s2axmg1g2fiVoLNCKsoHbPB89i4GtU17quXpyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws3ajw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 20:11:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486KBA8f009365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 20:11:10 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 13:11:04 -0700
Date: Sat, 7 Sep 2024 01:41:01 +0530
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
        Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
Message-ID: <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sPdJv4uGTuf7V4czPRRw5RfKz49spxFu
X-Proofpoint-GUID: sPdJv4uGTuf7V4czPRRw5RfKz49spxFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060149

On Thu, Sep 05, 2024 at 04:51:25PM +0200, Antonino Maniscalco wrote:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
>  drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index ec44f44d925f..ca9d36c107f2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -7,6 +7,7 @@
>  #include "a6xx_gpu.h"
>  #include "a6xx_gmu.xml.h"
>  #include "msm_mmu.h"
> +#include "msm_gpu_trace.h"
>  
>  /*
>   * Try to transition the preemption state from old to new. Return
> @@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>  	/*
>  	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>  	 * is skipped due to it being already in flight when requested.
> @@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	 */
>  	ring->skip_inline_wptr = false;
>  
> +	trace_msm_gpu_preemption_trigger(
> +		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,

Can't we avoid this check?

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

