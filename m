Return-Path: <linux-arm-msm+bounces-29003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6472D95752C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 22:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D76B22CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 20:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38321DD392;
	Mon, 19 Aug 2024 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dfXAaaIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FB18E0E;
	Mon, 19 Aug 2024 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097700; cv=none; b=ecdR+VeVnch9cFYyQEv3snefBUHt7t/cZYspsF7YnhcGbxCs+gzTu11g6rNuFK2+/5jNc/5Z64tAGIJBtPAMe921qdA4d07HRKU1gLrrsrYTWvXfXolUZdep4CAgQCX0fAr5y9WcLvO6CbCY89HutwM8h1dubhsIhePN17ew2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097700; c=relaxed/simple;
	bh=zLgbPCj9b7OjXy8pJex2kKqNY/BG1VYm/PeuIpBDpMY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw7vHhujMZUz4pIfzFWYLFWHOsM02sMaQNkDeCHY0+V8MqL8IGbziKBLIxpIc+f5ZKdeMk6asybVIf4HCGEBQwWDmxDDcMIOCRY8joztDLXmtY7FaawiiuvxxVj40TFA+bYCoxAfMpdENtMCEhcMR2btg+fkHGDqXVgl0ucSG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dfXAaaIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB5XB3002666;
	Mon, 19 Aug 2024 20:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lQ0u4CiUTE5OJALyFxA32o7J
	UUcWZg58ewWxavwKVHI=; b=dfXAaaIGJky0+5SgV0ob4E0f5P61B3cZHCCLy+lL
	RXaZA7zDv0JGb+Hx+7zdUyJSHxxz+VQFK3S0gZQd0agg19Qc2OBBvDeHLOZkP2g9
	FCf0tAeDsmWdz9d814AqeJK3NNwJdznAOFL1N5O2imKkjCf4y+sndHUE4O1nGMTY
	qkvH2ry189zQlKnc9Eh28FQiFB1k/0b1nsY2/jctvb+N4T7aHLwvtN38FUkArbXS
	CegwL97HoCAP0WtbbITLDciLhmzNLfvpaBie7rnGgWWtwodGZSflsKLM7YL02tvF
	Pfo778DR98W6OUGzN32DFzZzWd8Ns1uaKS3EySUpy251Mg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32ncgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:00:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JK0wwg022090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 20:00:58 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 13:00:53 -0700
Date: Tue, 20 Aug 2024 01:30:50 +0530
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
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 2/7] drm/msm: Add submitqueue setup and close
Message-ID: <20240819200050.uxx4eadh7pfxt42p@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9L5jYPAmiYzqD3jVgcTTRsbh1PBS43bu
X-Proofpoint-ORIG-GUID: 9L5jYPAmiYzqD3jVgcTTRsbh1PBS43bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190137

On Thu, Aug 15, 2024 at 08:26:12PM +0200, Antonino Maniscalco wrote:
> This patch adds a bit of infrastructure to give the different Adreno
> targets the flexibility to setup the submitqueues per their needs.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/msm_gpu.h         |  7 +++++++
>  drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 1f02bb9956be..70f5c18e5aee 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -92,6 +92,10 @@ struct msm_gpu_funcs {
>  	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
>  	 */
>  	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> +	int (*submitqueue_setup)(struct msm_gpu *gpu,
> +			struct msm_gpu_submitqueue *queue);
> +	void (*submitqueue_close)(struct msm_gpu *gpu,
> +			struct msm_gpu_submitqueue *queue);
>  };
>  
>  /* Additional state for iommu faults: */
> @@ -522,6 +526,9 @@ struct msm_gpu_submitqueue {
>  	struct mutex lock;
>  	struct kref ref;
>  	struct drm_sched_entity *entity;
> +	struct msm_gpu *gpu;
> +	struct drm_gem_object *bo;
> +	uint64_t bo_iova;
>  };
>  
>  struct msm_gpu_state_bo {
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 0e803125a325..4ffb336d9a60 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -71,6 +71,11 @@ void msm_submitqueue_destroy(struct kref *kref)
>  	struct msm_gpu_submitqueue *queue = container_of(kref,
>  		struct msm_gpu_submitqueue, ref);
>  
> +	struct msm_gpu *gpu = queue->gpu;
> +
> +	if (gpu && gpu->funcs->submitqueue_close)
> +		gpu->funcs->submitqueue_close(gpu, queue);
> +
>  	idr_destroy(&queue->fence_idr);
>  
>  	msm_file_private_put(queue->ctx);
> @@ -160,6 +165,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>  {
>  	struct msm_drm_private *priv = drm->dev_private;
>  	struct msm_gpu_submitqueue *queue;
> +	struct msm_gpu *gpu = priv->gpu;
>  	enum drm_sched_priority sched_prio;
>  	unsigned ring_nr;
>  	int ret;
> @@ -195,6 +201,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>  
>  	queue->ctx = msm_file_private_get(ctx);
>  	queue->id = ctx->queueid++;
> +	queue->gpu = gpu;
>  
>  	if (id)
>  		*id = queue->id;
> @@ -207,6 +214,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>  
>  	write_unlock(&ctx->queuelock);
>  
> +	if (gpu && gpu->funcs->submitqueue_setup)
> +		gpu->funcs->submitqueue_setup(gpu, queue);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.46.0
> 
> 

