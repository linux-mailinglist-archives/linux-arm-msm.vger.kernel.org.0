Return-Path: <linux-arm-msm+bounces-32103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD597D877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A801C2122A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961E061FCF;
	Fri, 20 Sep 2024 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U4NyjmsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605A1BF37;
	Fri, 20 Sep 2024 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850606; cv=none; b=lDFVMvaSv8XBvuU1/Ml2hcsJEYxwxLSNACIwKQr/o3f0xh3Pe9RKWsYQ7nxtXWaZ8fplQ0ZWe+o0sy3kvvj1dMqrGHCFIzU50uneeWGVSAnMJb0f+JgAaO7OsZpv+kYEH8c0prcUIGpQYX1S4X5fJqMCBQGLmBc6o/ESI1EKjIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850606; c=relaxed/simple;
	bh=2ecrE5zAEUaYipeEmhg8zvkz3H9Z090UdbreoNnaB78=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiA4E3Fprr53mV207fRivD8Y1uik5A5I+zhAg/craxeDP4olFrokdbnHA+gSz52SVQNFyD3qGHMDMO7L2D9F7nMsc/7By/P6bBGpPP00huIunyD5QIky4IcXCEbOw38fM72O5kNlBBB4VQiRYNEN0ARvYWgSj+GbH97KGL8cVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U4NyjmsP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K80Vo6004515;
	Fri, 20 Sep 2024 16:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJxujWK3kABirga5F1+mXI9v
	wjBDCCgpwsp6pU6CtnE=; b=U4NyjmsPMDneb6BtlfbDWShd7U3chjBPS1O536f3
	jvgpzCm1R16luIz1g0Lu9YXRDPK0rCPt6JVOsd3WnYK0O0A+VEn6eu0o9PnYHrCh
	SvNrVk5/wBg1hYFIieHA4RQvyu4ph7d9V0/xfqyu0Vc9wbz7t0vsNzlHvAspbtn9
	7b4hDdIUmpZ1QYWz320yWhAgFRUBC2tbPSBY9OMbvYJuKhYgzsMAaJKfLDuO4FhK
	zWm2YeYOSEQ89PtXXOwOAbg3PDNHic80Zzr1ff/zTOxubydF3tU3NhEmizbbHh5g
	InTRKamNzrixk8D3qhYzpIw+cuGi0tTwqaQBnaab9kiL+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4je2314-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:43:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KGhAZv007357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 16:43:10 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 09:43:05 -0700
Date: Fri, 20 Sep 2024 22:13:01 +0530
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
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 07/11] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Message-ID: <20240920164301.qpj3jaurqv3f6g5w@hu-akhilpo-hyd.qualcomm.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-7-95d48012e0ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240917-preemption-a750-t-v4-7-95d48012e0ac@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0rsllZFTZglF8vwJkrIoOqnT439HJ6va
X-Proofpoint-GUID: 0rsllZFTZglF8vwJkrIoOqnT439HJ6va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200121

On Tue, Sep 17, 2024 at 01:14:17PM +0200, Antonino Maniscalco wrote:
> Use the postamble to reset perf counters when switching between rings,
> except when sysprof is enabled, analogously to how they are reset
> between submissions when switching pagetables.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 12 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 57 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++--
>  4 files changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 355a3e210335..736f475d696f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -358,6 +358,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>  		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>  {
> +	u64 preempt_postamble;
> +
>  	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 12);
>  
>  	OUT_RING(ring, SMMU_INFO);
> @@ -381,6 +383,16 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>  	/* seems OK to set to 0 to disable it */
>  	OUT_RING(ring, 0);
>  	OUT_RING(ring, 0);
> +
> +	/* Emit postamble to clear perfcounters */
> +	preempt_postamble = a6xx_gpu->preempt_postamble_iova;
> +
> +	OUT_PKT7(ring, CP_SET_AMBLE, 3);
> +	OUT_RING(ring, lower_32_bits(preempt_postamble));
> +	OUT_RING(ring, upper_32_bits(preempt_postamble));
> +	OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> +				 a6xx_gpu->preempt_postamble_len) |
> +			 CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>  }
>  
>  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 7fc994121676..ae13892c87e3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -71,6 +71,12 @@ struct a6xx_gpu {
>  	bool uses_gmem;
>  	bool skip_save_restore;
>  
> +	struct drm_gem_object *preempt_postamble_bo;
> +	void *preempt_postamble_ptr;
> +	uint64_t preempt_postamble_iova;
> +	uint64_t preempt_postamble_len;
> +	bool postamble_enabled;
> +
>  	struct a6xx_gmu gmu;
>  
>  	struct drm_gem_object *shadow_bo;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index aa4bad394f9e..77c4d5e91854 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -97,6 +97,43 @@ static void a6xx_preempt_timer(struct timer_list *t)
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>  
> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> +{
> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
> +	u32 count = 0;
> +
> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> +	postamble[count++] = 0;
> +	postamble[count++] = 1;
> +
> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> +
> +	a6xx_gpu->preempt_postamble_len = count;
> +
> +	a6xx_gpu->postamble_enabled = true;
> +}
> +
> +static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
> +{
> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
> +
> +	/*
> +	 * Disable the postamble by replacing the first packet header with a NOP
> +	 * that covers the whole buffer.
> +	 */
> +	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
> +
> +	a6xx_gpu->postamble_enabled = false;
> +}
> +
>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>  {
>  	uint32_t status;
> @@ -187,6 +224,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	unsigned long flags;
>  	struct msm_ringbuffer *ring;
>  	unsigned int cntl;
> +	bool sysprof;
>  
>  	if (gpu->nr_rings == 1)
>  		return;
> @@ -272,6 +310,15 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	/* Start a timer to catch a stuck preemption */
>  	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
>  
> +	/* Enable or disable postamble as needed */
> +	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
> +
> +	if (!sysprof && !a6xx_gpu->postamble_enabled)
> +		preempt_prepare_postamble(a6xx_gpu);
> +
> +	if (sysprof && a6xx_gpu->postamble_enabled)
> +		preempt_disable_postamble(a6xx_gpu);
> +
>  	/* Set the preemption state to triggered */
>  	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
>  
> @@ -359,6 +406,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>  	a6xx_gpu->uses_gmem = 1;
>  	a6xx_gpu->skip_save_restore = 1;
>  
> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
> +			&a6xx_gpu->preempt_postamble_iova);
> +
> +	preempt_prepare_postamble(a6xx_gpu);
> +
> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
> +		goto fail;
> +
>  	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>  
>  	return;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6b1888280a83..87098567483b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>  	OUT_RING(ring, PKT4(regindx, cnt));
>  }
>  
> +#define PKT7(opcode, cnt) \
> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> +
>  static inline void
>  OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>  	adreno_wait_ring(ring, cnt + 1);
> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> +	OUT_RING(ring, PKT7(opcode, cnt));
>  }
>  
>  struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> 
> -- 
> 2.46.0
> 

