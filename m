Return-Path: <linux-arm-msm+bounces-32598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C2987711
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 17:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D141C25A74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 15:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2614C1581F3;
	Thu, 26 Sep 2024 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L8eY9ljI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5614B086;
	Thu, 26 Sep 2024 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366203; cv=none; b=RU5/q47I9cGC23ldMqhcfqLHE8VTNySIDGE7FFJ1D2JUb32TG9UBvMVQ1ympjgsujZSisqtiGCf2htsnFtA7D1W10YlvdecohlD0sI5Y68Lbbks+8tWA1vpcokIwWlmXu17XbgeYEXB6YxtrbvwUzlz0Vs305wkeLvKAYNOsXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366203; c=relaxed/simple;
	bh=fq7JZuKMvGwlG0zOURKKpBi6IDM8NnPtCmgJXstoMqQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5j0SnfwuNBX5w4u8Zdd+eZHHrvDPMmfVsJeCKtxRViby2D0uVZ4NJeEM/uwmT+b8FB3cAF3UuoE22/prz5jhSc2EbH21GET39KuZm6j452CWU73qmKCczLxbfhmiZywWToBPfXVuL8iWmjteNXRuYgpia3seh6jCrGaMZQn4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L8eY9ljI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q9fJH0021497;
	Thu, 26 Sep 2024 15:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r0Y0efsoMElBDcZQJXlIL64S
	UPCW9t0wz/gYXRupPgc=; b=L8eY9ljIVSSqoZrIiN+DyY1qg34PvsZBZZXZfwyH
	JczP8rh9H/8CWl7w1oJox0Xx1IM+R0GwLt2nMjn70FS5IZnwpAyHU/P+e7i67E7o
	eC8bRvCHq5wPvQCEpRMExm5D74h+/1HXnIlt3jX+6Lgknhn4smsv5/HnuUQz+ekZ
	5ihw2Mc/1CImA7nVMTH/EtPorqyuz5/JHSCP6PNUYoH3KGZd+/8kF8qJAjWMS6/x
	YUgeIWQZ1UddePFxsqT3FGeMALTTWA85hppQOtpB917PwhxVjo6OmRDaORK4bNZp
	GWVG4z1d1l5S8v0LbnvDli9h7Vm9UV52d6ww75kYyO/BSA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9fw3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 15:56:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QFuN93002570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 15:56:23 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 08:56:19 -0700
Date: Thu, 26 Sep 2024 21:26:15 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, Connor Abbott <cwabbott0@gmail.com>,
        "Rob
 Clark" <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
Message-ID: <20240926155615.y33wehbowzg57c32@hu-akhilpo-hyd.qualcomm.com>
References: <20240913195132.8282-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240913195132.8282-1-robdclark@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: es8GdKCSvMSM_g_AwFDUC2KyHS-qFbTW
X-Proofpoint-GUID: es8GdKCSvMSM_g_AwFDUC2KyHS-qFbTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260111

On Fri, Sep 13, 2024 at 12:51:31PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> devices (x1-85, possibly others), it seems to pass that barrier while
> there are still things in the event completion FIFO waiting to be
> written back to memory.
> 
> Work around that by adding a fence wait before context switch.  The
> CP_EVENT_WRITE that writes the fence is the last write from a submit,
> so seeing this value hit memory is a reliable indication that it is
> safe to proceed with the context switch.
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index bcaec86ac67a..ba5b35502e6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>  }
>  
>  static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> -		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
> +		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
>  {
>  	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
> +	struct msm_file_private *ctx = submit->queue->ctx;
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	phys_addr_t ttbr;
>  	u32 asid;
> @@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
>  		return;
>  
> +	/* Wait for previous submit to complete before continuing: */
> +	OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
> +	OUT_RING(ring, 0);
> +	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> +	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> +	OUT_RING(ring, submit->seqno - 1);
> +
>  	if (!sysprof) {
>  		if (!adreno_is_a7xx(adreno_gpu)) {
>  			/* Turn off protected mode to write to special registers */
> @@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	struct msm_ringbuffer *ring = submit->ring;
>  	unsigned int i, ibs = 0;
>  
> -	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +	a6xx_set_pagetable(a6xx_gpu, ring, submit);
>  
>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>  		rbmemptr_stats(ring, index, cpcycles_start));
> @@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>  	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
>  
> -	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +	a6xx_set_pagetable(a6xx_gpu, ring, submit);
>  
>  	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>  		rbmemptr_stats(ring, index, cpcycles_start));
> -- 
> 2.46.0
> 

