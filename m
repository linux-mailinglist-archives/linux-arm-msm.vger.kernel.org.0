Return-Path: <linux-arm-msm+bounces-32104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05A97D896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FFB8285218
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF8C1442F4;
	Fri, 20 Sep 2024 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RknH9mcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368F79C0;
	Fri, 20 Sep 2024 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851044; cv=none; b=hF824G5iOZ5Ze+oQMF6k3qG5BCgViVaPDCzySoZgVaaOBLCQ//bP2wX4XbsoQdMb3Mq/sleA3F3SuKiT4YU0xLNe7Zg94FZEZrkOI0fqLUbF0Gt5JeWpRIlNLqc4sqWJSelNuhb5ZDuSHV/ebInm9NDQTtGeMagr3w/uSsaqg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851044; c=relaxed/simple;
	bh=d4jnAU59gkuRmwmVeuys9RrrZGBDhlr8lDcXgVmqy7Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1ajgVl3cUFVRJ7exHW24ga/5uZZBW26wBJmB5U2xehbia3rPZzoitw00yBtH5BV/lv3sCv/P69XZgG/nSbDG/9/xpLaqNlw5C7Hbjxwp+4tHVHyy+0tjCp8FkbLnYCEiXHPsB0RhpfWD9daqw4bWXYO9Rvw+jHWKZaY/4M59mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RknH9mcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K88eK4007564;
	Fri, 20 Sep 2024 16:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nfYzDJE+MhWyU0a5I8hJ8kR1
	DVujo/61H9YE0vbABO8=; b=RknH9mcGjqGhEGaCZ3LFQJGvQq0J8xFt8jpmdZGh
	gdhiieJe29bMeizSadApFSAxfmMnIIARa6eh2vbEaeciJAGfr7EsdlFev5MgtVUX
	Yqy/QCMQnbcbyW8ofz4MEW7bYsBe9P1mGSiavChrM4dEXE2rTHikMilHSz12yoGi
	rt5kOxZ/LBjk+f96vkiEOcc0uE0H5HCbrlG/LW7CU2L9/no83UcSD9O+eRok8VdA
	B0meYgTq6s5WBYYdTu40yyrbqJ1Yhsfz7y3mVV0w8CyTK6IdkBKCWZqQiVL+jU+R
	UNbEbxB3uPXZCiaLK8qgi0NmxXT1Ao70VpKFeUNCD8Jn3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jf22dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:50:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KGoQ5R020450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:50:26 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 09:50:20 -0700
Date: Fri, 20 Sep 2024 22:20:16 +0530
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
Subject: Re: [PATCH v4 08/11] drm/msm/A6xx: Add traces for preemption
Message-ID: <20240920165016.zq6aymqoidaoysfe@hu-akhilpo-hyd.qualcomm.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-8-95d48012e0ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240917-preemption-a750-t-v4-8-95d48012e0ac@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oe6n_2yb4ts0PgmNU9KYt81h9WHTrTjF
X-Proofpoint-GUID: oe6n_2yb4ts0PgmNU9KYt81h9WHTrTjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409200122

On Tue, Sep 17, 2024 at 01:14:18PM +0200, Antonino Maniscalco wrote:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>  drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 77c4d5e91854..4fbc66d6860a 100644
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
> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>  	/*
>  	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>  	 * is skipped due to it being already in flight when requested.
> @@ -295,6 +298,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	 */
>  	ring->restore_wptr = false;
>  
> +	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
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

