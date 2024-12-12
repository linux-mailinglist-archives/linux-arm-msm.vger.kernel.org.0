Return-Path: <linux-arm-msm+bounces-41777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 232809EEF34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7EDC292FCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A8A242A94;
	Thu, 12 Dec 2024 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XshvT53I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD74242A85;
	Thu, 12 Dec 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019156; cv=none; b=fQpnk7BlsHf2qSHtQQRYWI9nyGYZwg907n+qTcEvhrIvcYkoY0x4UU13qLmftJbZaGrhq10T0FpAAcWGYWgGq+7w8gNYlRkbJOtVzTIJtsXrByRJKXOik/pHbH30qw9BwspoRv6VXSX/myccar+Uk2AmCjxqpfmnhFkeaZd/oGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019156; c=relaxed/simple;
	bh=+tIZ7UaQyOpQrw7frsDBstVh2z0bplzuUUsLBvOLrAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cY2nZdO0f8WKhUgtHFCoXSdI+kja92zuyyefyQn7JdzzsrFVaBtdtFiGvH1OoOzwZootsEXAeo1bmv2UjjrHJRS75cbzuCIeJ0/i8BKM2Yj5gE8rOFLDkTKetiSPZsb6mJhRm40hhYbzgbLfd+CSAnCGtM4MkE72d88WGrH3zOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XshvT53I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kbKr030100;
	Thu, 12 Dec 2024 15:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cwd1QWLXsJblJgP1+CAEGbApy3EmQbLmYsWrDzULNsk=; b=XshvT53InKoFYitg
	u2TlH6MJrQeerEsCjUg/6SVrsB014EoLPLv7SmvAGYPrUI9KmnhfbHorUw87sP+L
	bkdEChpU7S1T6fshv6k+foDiGi4+3WWYFn5zzCa7IrqKNBKzPU6wpw6ziNgMF4Fy
	6mMCKjjByQptMlEe+1XOVcw+zhh19KBZQyahDM1gYxyszy/oOW51rZAJ4COS9V1P
	nB7TQMPxTyq0YuyrYhsB09quZ3JCyU0g7VDPDFlGHRaDah0YighjkVDVRFI/H5BD
	O4/SIIfxn/XlXrUhjLlL8tC4mgHRXZ9n6JCBiS8B2ZTJ6SdWRDO7JceMY3qQsKDm
	v4k+0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgeh14d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:58:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCFwua2015745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:58:56 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 07:58:51 -0800
Message-ID: <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
Date: Thu, 12 Dec 2024 21:28:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark
	<robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20241205165419.54080-1-robdclark@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241205165419.54080-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ULakOgjzRq9Mo0Ixmr3P1TfXnL6QOXZp
X-Proofpoint-ORIG-GUID: ULakOgjzRq9Mo0Ixmr3P1TfXnL6QOXZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120115

On 12/5/2024 10:24 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Performance counter usage falls into two categories:
> 
> 1. Local usage, where the counter configuration, start, and end read
>    happen within (locally to) a single SUBMIT.  In this case, there is
>    no dependency on counter configuration or values between submits, and
>    in fact counters are normally cleared on context switches, making it
>    impossible to rely on cross-submit state.
> 
> 2. Global usage, where a single privilaged daemon/process is sampling
>    counter values across all processes for profiling.
> 
> The two categories are mutually exclusive.  While you can have many
> processes making local counter usage, you cannot combine global and
> local usage without the two stepping on each others feet (by changing
> counter configuration).
> 
> For global counter usage, there is already a SYSPROF param (since global
> counter usage requires disabling counter clearing on context switch).
> This patch adds a REQ_CNTRS param to request local counter usage.  If
> one or more processes has requested counter usage, then a SYSPROF
> request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTRS
> will fail with -EBUSY, maintaining the mutual exclusivity.
> 
> This is purely an advisory interface to help coordinate userspace.
> There is no real means of enforcement, but the worst that can happen if
> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> profiling data.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> kgsl takes a different approach, which involves a lot more UABI for
> assigning counters to different processes.  But I think by taking
> advantage of the fact that mesa (freedreno+turnip) reconfigure the
> counters they need in each SUBMIT, for their respective gl/vk perf-
> counter extensions, we can take this simpler approach.

KGSL's approach is preemption and ifpc safe (also whatever HW changes
that will come up in future generations). How will we ensure that here?

I have plans to bring up IFPC support in near future. Also, I brought up
this point during preemption series. But from the responses, I felt that
profiling was not considered a serious usecase. Still I wonder how the
perfcounter extensions work accurately with preemption.

-Akhil

> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
>  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
>  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
>  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
>  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 85 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 31bbf2c83de4..f688e37059b8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		if (!capable(CAP_SYS_ADMIN))
>  			return UERR(EPERM, drm, "invalid permissions");
>  		return msm_file_private_set_sysprof(ctx, gpu, value);
> +	case MSM_PARAM_REQ_CNTRS:
> +		return msm_file_private_request_counters(ctx, gpu, value);
>  	default:
>  		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 6416d2cb4efc..bf8314ff4a25 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>  	 * It is not possible to set sysprof param to non-zero if gpu
>  	 * is not initialized:
>  	 */
> -	if (priv->gpu)
> +	if (ctx->sysprof)
>  		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
>  
> +	if (ctx->counters_requested)
> +		msm_file_private_request_counters(ctx, priv->gpu, 0);
> +
>  	context_close(ctx);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 82f204f3bb8f..013b59ca3bb1 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	gpu->nr_rings = nr_rings;
>  
>  	refcount_set(&gpu->sysprof_active, 1);
> +	refcount_set(&gpu->local_counters_active, 1);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index e25009150579..83c61e523b1b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -195,12 +195,28 @@ struct msm_gpu {
>  	int nr_rings;
>  
>  	/**
> -	 * sysprof_active:
> +	 * @sysprof_active:
>  	 *
> -	 * The count of contexts that have enabled system profiling.
> +	 * The count of contexts that have enabled system profiling plus one.
> +	 *
> +	 * Note: refcount_t does not like 0->1 transitions.. we want to keep
> +	 * the under/overflow checks that refcount_t provides, but allow
> +	 * multiple on/off transitions so we track the logical value plus one.)
>  	 */
>  	refcount_t sysprof_active;
>  
> +	/**
> +	 * @local_counters_active:
> +	 *
> +	 * The count of contexts that have requested local (intra-submit)
> +	 * performance counter usage plus one.
> +	 *
> +	 * Note: refcount_t does not like 0->1 transitions.. we want to keep
> +	 * the under/overflow checks that refcount_t provides, but allow
> +	 * multiple on/off transitions so we track the logical value plus one.)
> +	 */
> +	refcount_t local_counters_active;
> +
>  	/**
>  	 * lock:
>  	 *
> @@ -383,6 +399,13 @@ struct msm_file_private {
>  	 */
>  	int sysprof;
>  
> +	/**
> +	 * @counters_requested:
> +	 *
> +	 * Has the context requested local perfcntr usage.
> +	 */
> +	bool counters_requested;
> +
>  	/**
>  	 * comm: Overridden task comm, see MSM_PARAM_COMM
>  	 *
> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
>  
>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>  				 struct msm_gpu *gpu, int sysprof);
> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> +				      struct msm_gpu *gpu, int reqcntrs);
>  void __msm_file_private_destroy(struct kref *kref);
>  
>  static inline void msm_file_private_put(struct msm_file_private *ctx)
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 7fed1de63b5d..1e1e21e6f7ae 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -10,6 +10,15 @@
>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>  				 struct msm_gpu *gpu, int sysprof)
>  {
> +	int ret = 0;
> +
> +	mutex_lock(&gpu->lock);
> +
> +	if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) {
> +		ret = UERR(EBUSY, gpu->dev, "Local counter usage active");
> +		goto out_unlock;
> +	}
> +
>  	/*
>  	 * Since pm_runtime and sysprof_active are both refcounts, we
>  	 * call apply the new value first, and then unwind the previous
> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>  
>  	switch (sysprof) {
>  	default:
> -		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
> +		ret = UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
> +		goto out_unlock;
>  	case 2:
>  		pm_runtime_get_sync(&gpu->pdev->dev);
>  		fallthrough;
> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>  
>  	ctx->sysprof = sysprof;
>  
> -	return 0;
> +out_unlock:
> +	mutex_unlock(&gpu->lock);
> +
> +	return ret;
> +}
> +
> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> +				      struct msm_gpu *gpu, int reqctrs)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&gpu->lock);
> +
> +	if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> +		ret = UERR(EBUSY, gpu->dev, "System profiling active");
> +		goto out_unlock;
> +	}
> +
> +	if (reqctrs) {
> +		if (ctx->counters_requested) {
> +			ret = UERR(EINVAL, gpu->dev, "Already requested");
> +			goto out_unlock;
> +		}
> +
> +		ctx->counters_requested = true;
> +		refcount_inc(&gpu->local_counters_active);
> +	} else {
> +		if (!ctx->counters_requested) {
> +			ret = UERR(EINVAL, gpu->dev, "Not requested");
> +			goto out_unlock;
> +		}
> +		refcount_dec(&gpu->local_counters_active);
> +		ctx->counters_requested = false;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&gpu->lock);
> +
> +	return ret;
>  }
>  
>  void __msm_file_private_destroy(struct kref *kref)
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 2342cb90857e..ae7fb355e4a1 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-submit) perfcntr usage  */
>  
>  /* For backwards compat.  The original support for preemption was based on
>   * a single ring per priority level so # of priority levels equals the #


