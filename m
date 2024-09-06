Return-Path: <linux-arm-msm+bounces-31181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF996FC84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 22:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1171F21D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 20:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838E81D45F3;
	Fri,  6 Sep 2024 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hsesZ4B9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F3149C7A;
	Fri,  6 Sep 2024 20:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725653352; cv=none; b=jIjGgGp/4eInKxQlE9GUVWL3qAHtAEHXmYQ1fTgUU9WCnFv7rUEU0ZNgj9q6jongoOyfb57YsgwxCmnBbjDbYn7uZT7nUot1IGV6IHd3+TmiD17PjM/2byyKjUKIuCNh5cy3VbeXkkUCrerRZxDYpC/dzH7s2W70j9bTV4fgny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725653352; c=relaxed/simple;
	bh=cqxj7406mpM9N7FYJOSkCaW0K7CvzSuhrGdkHgpm15c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRH+Kcc1Rs8rNYV7qNLg57iXjJrZ17U95QuxZbsWpNnbVICDjtKkL+SYoxGfKTsQoCs6RZ7lTZnyBQ3QOcFuC0m9iUX42tHwA2MfoIu3WCo1KI5pCpTpgaWfd+SBEpSXfqMkOGt/qgBpkDIKzjXls3HE4vezFRT9vquxndzHeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hsesZ4B9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868h33Z009760;
	Fri, 6 Sep 2024 20:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n8/YSSQQ4bnXLRA/pjVrHJsf
	/MK1fhw/yRpLzpPDKlo=; b=hsesZ4B9PZg3CoBMBycvy/dM2XHnOaD4KrIjqpNj
	sqZdAMVS4Z7WVPHxMvQewkLebOYze+2aGX7XXmgcxBn6a4u96Nqd6CXX57BWIiyH
	00/0grFr+Kr+kHDOEEIrL9g8hIBQoQlOZYNGqs2wuvIotWrECvdrTLnH/fbYsWlH
	nUzoMtU3MDvO7Ho+0nTSDAjS3tLt5U1EBNgASFZGKbmFwV0l5v9hfarttF98VfNx
	FLmqt93ppzWygx7vZYcpJHicDhxVgP6nxoZsaki9lsVein2ia7ZzDAp+RaVwxuog
	zB7mvj0jykZBUNKN0fV0+1Os0PXdDoXbyR7bkKPO0AGOJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwruaqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 20:08:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486K8vlw027839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 20:08:57 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 13:08:51 -0700
Date: Sat, 7 Sep 2024 01:38:47 +0530
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
Subject: Re: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Message-ID: <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Aqt9A3GtNlZU4rQClJ39M1O-sdMCeODe
X-Proofpoint-GUID: Aqt9A3GtNlZU4rQClJ39M1O-sdMCeODe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060149

On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
> Use the postamble to reset perf counters when switching between rings,
> except when sysprof is enabled, analogously to how they are reset
> between submissions when switching pagetables.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>  4 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ed0b138a2d66..710ec3ce2923 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>  		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>  {
> -	u64 preempt_offset_priv_secure;
> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
> +	u64 preempt_offset_priv_secure, preempt_postamble;
>  
>  	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>  
> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>  	/* seems OK to set to 0 to disable it */
>  	OUT_RING(ring, 0);
>  	OUT_RING(ring, 0);
> +
> +	/* if not profiling set postamble to clear perfcounters, else clear it */
> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
> +
> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> +					a6xx_gpu->preempt_postamble_len) |
> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> +	} else {

Why do we need this else part?

> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
> +		OUT_RING(ring, 0);
> +		OUT_RING(ring, 0);
> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> +	}
>  }
>  
>  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index da10060e38dc..b009732c08c5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>  	bool uses_gmem;
>  	bool skip_save_restore;
>  
> +	struct drm_gem_object *preempt_postamble_bo;
> +	void *preempt_postamble_ptr;
> +	uint64_t preempt_postamble_iova;
> +	uint64_t preempt_postamble_len;
> +
>  	struct a6xx_gmu gmu;
>  
>  	struct drm_gem_object *shadow_bo;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 1caff76aca6e..ec44f44d925f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>  	return 0;
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

Isn't it better to just replace this with NOP packets when sysprof is
enabled, just before triggering preemption? It will help to have an
immediate effect.

-Akhil

> +
> +	a6xx_gpu->preempt_postamble_len = count;
> +}
> +
>  void a6xx_preempt_fini(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
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

