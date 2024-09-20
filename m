Return-Path: <linux-arm-msm+bounces-32105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DE97D89E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 771AC1C21929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9CC170A1B;
	Fri, 20 Sep 2024 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UYI5qlAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEC79C0;
	Fri, 20 Sep 2024 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851291; cv=none; b=cplJJ/JkVDZgogrOaoPleIsQqvsgnUmG96faP1HhNAIKSLnP+RwpdcEEcx2bhS3bKdrTaeezgt5Hhxr7aWj8e3H6bFz7xZgV+x/NIpOEkJER+g+3hiC7nnnTGlKN0ocYwqmzVk8gZJeaep3AaQgG8dRRYjfFzB42AIFkFUUemNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851291; c=relaxed/simple;
	bh=ko6Ky/IOZiMbwaA0aCVHbv+HZ4tLrztg8zKOJEpiqsI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vuxj76NkBdYTmSlter3ZXjcszTHlTUFjVVnwSzVRSc1WRjd0ulYtBPjS4uywAf0G1Pk3Gzwsnu3woiOZVydr1rXqpQ5jJxg/P6mDb8EefEHVXBikrqL6ymLa/iuICp+g4bBOwnR0ldHMA/0DohEl16D1yBAkPQoM8zcg0/hzh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UYI5qlAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K83o6T006727;
	Fri, 20 Sep 2024 16:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fvYxS2fQ1DWtUltxJZdBT4oH
	1hBwrXRzerbQSjMR43I=; b=UYI5qlAQgHR/vzpiHIx254NJLXzcpUWoGeMycoYk
	O5F7tt5CdZVAkNiFh7rsfQOkOQocEMPDfhvnBictfRMSp67PAgRPaLAbmJ7OBrLa
	G9VjjxUHHYoz+VxzBd+H5SE91yOhQRQlVra4c7DbeiNJu8blKb4Y5T0HYR3EE6Bn
	Fg5mSYEAjuzK73Vc25MR1D5fLyMUUuNpRNYYO7ZG6kfeRDXEKs0dx5KkkFazQDfb
	caHJgI92H0vNLXV9mTrjzyzDutetbjs+IWhWQC81wFEyEmMgY6XjgBSj/rsdFNTB
	+KyUPWsASPNvJR9Nr7LXMpD5I3HBGizmEA1qGnLDrS3Msw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4k122hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:54:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KGsaPC007883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:54:36 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 09:54:31 -0700
Date: Fri, 20 Sep 2024 22:24:27 +0530
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
Subject: Re: [PATCH v4 09/11] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Message-ID: <20240920165427.wikjsywhbcb2kz7h@hu-akhilpo-hyd.qualcomm.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-9-95d48012e0ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240917-preemption-a750-t-v4-9-95d48012e0ac@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f02thMQb7fZY54CaWQH77Z5oUFjOnOtC
X-Proofpoint-GUID: f02thMQb7fZY54CaWQH77Z5oUFjOnOtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200122

On Tue, Sep 17, 2024 at 01:14:19PM +0200, Antonino Maniscalco wrote:
> Some userspace changes are necessary so add a flag for userspace to
> advertise support for preemption when creating the submitqueue.
> 
> When this flag is not set preemption will not be allowed in the middle
> of the submitted IBs therefore mantaining compatibility with older
> userspace.
> 
> The flag is rejected if preemption is not supported on the target, this
> allows userspace to know whether preemption is supported.

Just curious, what is the motivation behind informing userspace about
preemption support?

-Akhil

> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
>  drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
>  include/uapi/drm/msm_drm.h            |  5 ++++-
>  3 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 736f475d696f..edbcb6d229ba 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_PKT7(ring, CP_SET_MARKER, 1);
>  	OUT_RING(ring, 0x101); /* IFPC disable */
>  
> -	OUT_PKT7(ring, CP_SET_MARKER, 1);
> -	OUT_RING(ring, 0x00d); /* IB1LIST start */
> +	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> +		OUT_PKT7(ring, CP_SET_MARKER, 1);
> +		OUT_RING(ring, 0x00d); /* IB1LIST start */
> +	}
>  
>  	/* Submit the commands */
>  	for (i = 0; i < submit->nr_cmds; i++) {
> @@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  			update_shadow_rptr(gpu, ring);
>  	}
>  
> -	OUT_PKT7(ring, CP_SET_MARKER, 1);
> -	OUT_RING(ring, 0x00e); /* IB1LIST end */
> +	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> +		OUT_PKT7(ring, CP_SET_MARKER, 1);
> +		OUT_RING(ring, 0x00e); /* IB1LIST end */
> +	}
>  
>  	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>  		rbmemptr_stats(ring, index, cpcycles_end));
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 0e803125a325..9b3ffca3f3b4 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>  	if (!priv->gpu)
>  		return -ENODEV;
>  
> +	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
> +		return -EINVAL;
> +
>  	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
>  	if (ret)
>  		return ret;
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 3fca72f73861..f37858db34e6 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
>   * backwards compatibility as a "default" submitqueue
>   */
>  
> -#define MSM_SUBMITQUEUE_FLAGS (0)
> +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
> +#define MSM_SUBMITQUEUE_FLAGS		    ( \
> +		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> +		0)
>  
>  /*
>   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
> 
> -- 
> 2.46.0
> 

