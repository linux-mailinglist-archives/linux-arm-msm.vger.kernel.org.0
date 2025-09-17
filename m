Return-Path: <linux-arm-msm+bounces-73966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF91B807F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102381BC32CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A250333AB5;
	Wed, 17 Sep 2025 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ0D0+Oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97A333A89
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122604; cv=none; b=CU6iL2Ba2ut3SJkET3d3tklwCH+cqqH/ZnNWdLXI1tfnZlP15inm+ADjyycz7lYSxRFfgjlu9q09A5SMrkqkwkAKj6jMdUIwiUJJDceoX0lLFyWYt6s9jVMpujPMp6FcExiKJraQHFbgDY4dUrbPRSnrK0F85DRps2ZV8xnWWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122604; c=relaxed/simple;
	bh=1wmPetXrkwjn/OEGRe78hFs2R6TljVAGC1Wn9+98Lls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/bf8YbF8DF6tgT6bkDPV7w2h3MKHrcJ+vQCKsRzqtthzJjhrgYKwtOsilWfVlsCfv9iw7YooK/Ec7zQTT0j2t9X3xVR2CMlX9MupeDLyhZIgCgUNvWDzbvrXzBqXAQAHC+HPrmYcw74m58Ndd068hImEJlbAsERVAu+3ZHoRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ0D0+Oy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Y3eL021911
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkuUdQX7nxBy44xM3O1Jw/UC+fZY6KNKeDJmrHrs58A=; b=JJ0D0+OyNT1Y3y2t
	53aL+5Y/zKB2As2DeC2JiHxwU2fqUFsIk+XMFzLSH2e6jMjbIQ+po4NmDHnM5Pdc
	5pzbDfZ0ElTVh7ND4bhqitEbd9ihIuCAqEwI6yTmpFVoZ+Z6SOMxBKcxmYCFjNI1
	7syTeArT3jLN+hPDXlEYELtrrN5T/C3Y4XeOXmBfwhr/v+wMZuh3k9Hy9+V5PlIi
	CusmWlkA0CNDT86Q9w4e78LRKD5F1IUHPddKa3IQRKMGAM6UEdV0rSG5OtS5+euQ
	L4uknADngoWU4PXolsp2gY9rnrtN5Xz6jKAauyfk+qa/rAtYdFMixNFBFzy6S9hC
	T1fhhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ava6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:23:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ced7cfa07so70558465ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 08:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122599; x=1758727399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkuUdQX7nxBy44xM3O1Jw/UC+fZY6KNKeDJmrHrs58A=;
        b=OCUAovlAz2DRrzIpjW/ufQ2kYXUfUAewAw0xt4AK1zEX6auug8iHBwlMX+uXPOKYvM
         tKgqr0Rz5Xdr2FFNHOg1RvY+gp/6usf+f18030M6Bmyo5Wr1RgeBJJK4lxIIFFHDxlzJ
         TalaKLXgR4Z5ENe0M/EIPRsE0B9yRS/3/Zl1MLcPANJ77H8qeY1ttdKnZXOzpl9Jo3u6
         4RPFp+m7OQboiMMsQhftPW5qo8pnC8Quxm4dOEsMNl5PAa8X33n6hVGibYNfGWmRtFdg
         46EefLz9RcYR413Aqdlgg4Kf/JwnWjLM+zsK6IsaITW8RViwpDxVSHGjAnNBmsNXJ3HB
         VEFQ==
X-Gm-Message-State: AOJu0Ywk/bOQ5ubO5jfhiDcI6VAOKeHh7lvUcdHci0cEku5jgxcmom6K
	TRVIAb4ltGNYlBN4VsYQ5Pzj+zrDDlzWeBvTJ6tmM7qzQL1Q8Ail4svdXD9mKvaZSIuS4nhqVS8
	FCDHOzKAcoiVjNH2UR2YibyvurwKm7d9Dv1krXXaDYqfnzjKReed22gk1eZeH/uqSPFr0
X-Gm-Gg: ASbGncu44oZwehhlPdE2VHn9Qo00GVXSqx+sYAAF0daRkKE2XOLp5ooXPJrSvJyRCuP
	elAqzGPZNRgV70qLmAFkrLuPZEbJzEskl8/70h9W+bcKtu+ejWjFM6AA1AFmkGpmBbqNfu8yREw
	HISYXjNWkHBBonNNG8wvj/tB7nZYbza1DC4OKSU+CwQlOPKgVMpFq79uyN2sV70h7LUE53SIcrg
	/JiVvOBJW95EpyFIG0GRbKt4bz70TyonPDMWYmNq1gBPqjeUf9tsEhcBwWbsJIGcHf62JfMY5dl
	1E+kBZehV9VtSzkBS4iKLMYsmeCWI/LVvOhnfcWeBtHlUz7TSPAiy2ckW7zBKQ==
X-Received: by 2002:a17:903:38c3:b0:267:c984:8d9f with SMTP id d9443c01a7336-26812190909mr30627015ad.24.1758122599338;
        Wed, 17 Sep 2025 08:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjCSL/wVBrdr9GTni105ATqT9QvPqd/6Ymxhl3Pv/aweBNEgAX544T667idtInt4u95hUChw==
X-Received: by 2002:a17:903:38c3:b0:267:c984:8d9f with SMTP id d9443c01a7336-26812190909mr30626285ad.24.1758122598156;
        Wed, 17 Sep 2025 08:23:18 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2681650f85dsm19625645ad.119.2025.09.17.08.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:23:15 -0700 (PDT)
Message-ID: <c08872c9-cdad-4e62-827b-7985cb3b18de@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 20:53:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: preemption aware hangcheck
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-2-974819876819@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-preemption_aware_hangcheck-v1-2-974819876819@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YFSz1rJpBGceaEq4O_Wydgw274P3YkxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX10ZSFl1eHSDm
 q7IrdaKJEvJXqdZ+CgnY9Zojn/A1U6wNeF978scZYakhRHRP5sZzPYLgAi0xVSlcx4D81cb6R5j
 dQOe1MDvQIxN+fxZxHGPCt1SyloMFK5CVzHU4NETS4UdTOtJvq8EiTTskwqy/fuo/U/W1i1DYt9
 baYnHP6si1jktDp6lkVc8IZI3d/ECAYfhOsfbsFPvfOFf3AP+y6jVpjKUsI/n9+vvPMHN5OlOzr
 NYyuBgzGHa1FG/rlnGsZJIyeL89vEzmZ77sOuqHeG3Ov80WGmBgHBSpIyvI+s9xl0CnSCVvF/JT
 AjG+WAPPikYSTxz825UPjKDGnaTZobtJ0pQu1Rddu8a8Sx1FQN6G1yARx3zxYxwJXkmiybmkbpj
 Uw9WOS/G
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cad268 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=yYA4gsvIKTL2XcNT0icA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YFSz1rJpBGceaEq4O_Wydgw274P3YkxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
> Rework hangcheck code to work well toghether with preemption.
> 
> Track the time a job has spent in a ring by storing timestamps of the
> `CP_ALWAYS_ON_CONTEXT` register at the beginning of a job and when
> switching rings as well as reading it back if the ring is currently
> active.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  3 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 28 +++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 25 +++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  3 +-
>  drivers/gpu/drm/msm/msm_gpu.c             | 51 +++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_gpu.h             |  3 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |  6 ++++
>  9 files changed, 102 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 4a04dc43a8e6764a113d0ade3dee94bd4c0083af..cb4775a35da0706e571eb27ce617044de84ca118 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1255,7 +1255,8 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>  		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>  
>  	/* Turn off the hangcheck timer to keep it from bothering us */
> -	timer_delete(&gpu->hangcheck_timer);
> +	for (int i = 0; i < gpu->nr_rings; i++)
> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>  
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..103c19fa8669f06a6c1627ced1daf2bcd60415db 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -28,7 +28,8 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
>  	gmu->hung = true;
>  
>  	/* Turn off the hangcheck timer while we are resetting */
> -	timer_delete(&gpu->hangcheck_timer);
> +	for (int i = 0; i < gpu->nr_rings; i++)
> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>  
>  	/* Queue the GPU handler because we need to treat this as a recovery */
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);

I think a helper routine makes sense. We have to disable hangcheck
whenever recover_worker is queued.

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..7647e3dfd50db7446589e67949ed08d0a422f543 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -465,6 +465,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>  		rbmemptr_stats(ring, index, alwayson_start));
>  
> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
> +		rbmemptr(ring, last_job_start_ctx));
> +
>  	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>  	OUT_RING(ring, CP_SET_THREAD_BOTH);
>  
> @@ -1816,7 +1819,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>  
>  	/* Turn off the hangcheck timer to keep it from bothering us */
> -	timer_delete(&gpu->hangcheck_timer);
> +	for (int i = 0; i < gpu->nr_rings; i++)
> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>  
>  	/* Turn off interrupts to avoid triggering recovery again */
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
> @@ -1839,7 +1843,8 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>  	 */
>  	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
>  		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> -		timer_delete(&gpu->hangcheck_timer);
> +		for (int i = 0; i < gpu->nr_rings; i++)
> +			timer_delete(&gpu->rb[i]->hangcheck_timer);
>  
>  		kthread_queue_work(gpu->worker, &gpu->recover_work);
>  	}
> @@ -2327,6 +2332,22 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  	return 0;
>  }
>  
> +static int a6xx_get_ctx_timestamp(struct msm_ringbuffer *ring, uint64_t *value)
> +{
> +	struct msm_gpu *gpu = ring->gpu;
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	guard(spinlock_irqsave)(&a6xx_gpu->eval_lock);

Is eval_lock initialized anywhere? Also why do we need this?

> +
> +	if (a6xx_in_preempt(a6xx_gpu) || ring != a6xx_gpu->cur_ring)
This will race with preemption. I think we should wrap the preempt state
check and the regread under the preempt lock.

> +		return -EBUSY;
> +
> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);With IFPC, we cannot access a GX domain register (CP, RBBM etc) unless
we are certain that the GX is powered up. Could you please test this
series along with the IFPC series? If we hit the right timing, there
should be a GMU fence error in the dmesg. Not sure how easy it is to hit
that timing, but I believe there is a problem here conceptually.

> +
> +	return 0;
> +}
> +
>  static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -2555,6 +2576,7 @@ static const struct adreno_gpu_funcs funcs = {
>  		.get_rptr = a6xx_get_rptr,
>  		.progress = a6xx_progress,
>  		.sysprof_setup = a6xx_gmu_sysprof_setup,
> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>  	},
>  	.get_timestamp = a6xx_gmu_get_timestamp,
>  };
> @@ -2584,6 +2606,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
>  		.create_private_vm = a6xx_create_private_vm,
>  		.get_rptr = a6xx_get_rptr,
>  		.progress = a6xx_progress,
> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>  	},
>  	.get_timestamp = a6xx_get_timestamp,
>  };
> @@ -2616,6 +2639,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
>  		.get_rptr = a6xx_get_rptr,
>  		.progress = a6xx_progress,
>  		.sysprof_setup = a6xx_gmu_sysprof_setup,
> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>  	},
>  	.get_timestamp = a6xx_gmu_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..7248d3d38c6d8a06cb4a536043bf4877179447cc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -80,6 +80,7 @@ struct a6xx_gpu {
>  	struct drm_gem_object *preempt_postamble_bo;
>  	void *preempt_postamble_ptr;
>  	uint64_t preempt_postamble_iova;
> +	uint64_t preempt_postamble_cntreset_end;
>  	uint64_t preempt_postamble_len;
>  	bool postamble_enabled;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index afc5f4aa3b17334027f3c20072cc3f059a9733b7..88a65549fa8038d4836eb5aeaea775d679415315 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -99,11 +99,15 @@ static void a6xx_preempt_timer(struct timer_list *t)
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>  
> -static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
>  {
>  	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
> +	uint64_t last_active_ctxcycles;
>  	u32 count = 0;
>  
> +	if (ring)
> +		last_active_ctxcycles = rbmemptr(ring, last_active_ctxcycles);
> +
>  	postamble[count++] = PKT7(CP_REG_RMW, 3);
>  	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>  	postamble[count++] = 0;
> @@ -118,6 +122,15 @@ static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>  	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>  	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>  
> +	a6xx_gpu->preempt_postamble_cntreset_end = count;
> +
> +	postamble[count++] = PKT7(ring ? CP_REG_TO_MEM : CP_NOP, 3);
> +	postamble[count++] = CP_REG_TO_MEM_0_REG(REG_A6XX_CP_ALWAYS_ON_CONTEXT) |
> +		CP_REG_TO_MEM_0_CNT(2) |
> +		CP_REG_TO_MEM_0_64B;
> +	postamble[count++] = lower_32_bits(last_active_ctxcycles);
> +	postamble[count++] = upper_32_bits(last_active_ctxcycles);
> +
>  	a6xx_gpu->preempt_postamble_len = count;
>  
>  	a6xx_gpu->postamble_enabled = true;
> @@ -129,9 +142,9 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>  
>  	/*
>  	 * Disable the postamble by replacing the first packet header with a NOP
> -	 * that covers the whole buffer.
> +	 * that skips the counters reset part.
>  	 */
> -	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
> +	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_cntreset_end - 1));
>  
>  	a6xx_gpu->postamble_enabled = false;
>  }
> @@ -338,8 +351,8 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	/* Enable or disable postamble as needed */
>  	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>  
> -	if (!sysprof && !a6xx_gpu->postamble_enabled)
> -		preempt_prepare_postamble(a6xx_gpu);
> +	if (!sysprof)
> +		preempt_prepare_postamble(a6xx_gpu, ring);
>  
>  	if (sysprof && a6xx_gpu->postamble_enabled)
>  		preempt_disable_postamble(a6xx_gpu);
> @@ -454,7 +467,7 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>  			gpu->vm, &a6xx_gpu->preempt_postamble_bo,
>  			&a6xx_gpu->preempt_postamble_iova);
>  
> -	preempt_prepare_postamble(a6xx_gpu);
> +	preempt_prepare_postamble(a6xx_gpu, NULL);
>  
>  	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>  		goto fail;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index afaa3cfefd357dc0230994c8b5830a14c6d7a352..58f1e2a95bbfb00feb5a3bb91853e6bb533ec631 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -334,7 +334,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>  		struct msm_gpu_fault_info fault_info = {};
>  
>  		/* Turn off the hangcheck timer to keep it from bothering us */
> -		timer_delete(&gpu->hangcheck_timer);
> +		for (int i = 0; i < gpu->nr_rings; i++)
> +			timer_delete(&gpu->rb[i]->hangcheck_timer);
>  
>  		fault_info.ttbr0 = info->ttbr0;
>  		fault_info.iova  = iova;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 17759abc46d7d7af4117b1d71f1d5fba6ba0b61c..a3c5073aca1f65e450e0673262e8ca4bc7a5be6f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -463,7 +463,9 @@ static void recover_worker(struct kthread_work *work)
>  	struct drm_device *dev = gpu->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_gem_submit *submit;
> -	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
> +	struct msm_ringbuffer *cur_ring = gpu->hung_ring ?
> +		gpu->hung_ring : gpu->funcs->active_ring(gpu);
> +	gpu->hung_ring = NULL;
>  	char *comm = NULL, *cmd = NULL;
>  	struct task_struct *task;
>  	int i;
> @@ -613,11 +615,17 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>  	mutex_unlock(&gpu->lock);
>  }
>  
> -static void hangcheck_timer_reset(struct msm_gpu *gpu)
> +static void hangcheck_ring_timer_reset(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> -	mod_timer(&gpu->hangcheck_timer,
> -			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
> +	mod_timer(&ring->hangcheck_timer,
> +			  round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
> +}
> +
> +static void hangcheck_timer_reset(struct msm_gpu *gpu)
> +{
> +	for (int i = 0; i < gpu->nr_rings; i++)
> +		hangcheck_ring_timer_reset(gpu, gpu->rb[i]);

It triggers my OCD a bit that there are multiple timers flying around
waking up CPU clusters. But this is okay for now I guess. :)

>  }
>  
>  static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> @@ -635,11 +643,33 @@ static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return true;
>  }
>  
> +static bool check_ring_timeout(struct msm_ringbuffer *ring, unsigned long timeout)
> +{
> +	struct msm_gpu *gpu = ring->gpu;
> +	struct msm_ringbuffer *curr_ring = gpu->funcs->active_ring(gpu);
> +	u64 start, end;
> +	int ret;
> +
> +	if (!gpu->funcs->get_ctx_timestamp)
> +		return !made_progress(gpu, ring);
> +
> +	start = ring->memptrs->last_job_start_ctx;
> +
> +	if (!gpu->funcs->get_ctx_timestamp(ring, &end))
I suppose you want the other way. ie, if get_ctx_timestamp() returns
-EBUSY, which means gpu is either under preemption or in a different
ring, use the memptr data.

> +		end = ring->memptrs->last_active_ctxcycles;

Assuming my above comment is correct, if GPU is under preemption, there
is a chance that the postamble might not have got executed. So with a
stale 'end' value, the below calc may go wrong?

> +
> +	if (end >= start)
> +		return (end - start) < timeout;
> +	else
> +		return false;

In case of an infinite shader blocking preemption, wouldn't we always
return false here?

-Akhil> +}
> +
>  static void hangcheck_handler(struct timer_list *t)
>  {
> -	struct msm_gpu *gpu = timer_container_of(gpu, t, hangcheck_timer);
> +	struct msm_ringbuffer *ring = timer_container_of(ring, t, hangcheck_timer);
> +	struct msm_gpu *gpu = ring->gpu;
> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>  	struct drm_device *dev = gpu->dev;
> -	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>  	uint32_t fence = ring->memptrs->fence;
>  
>  	if (fence != ring->hangcheck_fence) {
> @@ -647,7 +677,7 @@ static void hangcheck_handler(struct timer_list *t)
>  		ring->hangcheck_fence = fence;
>  		ring->hangcheck_progress_retries = 0;
>  	} else if (fence_before(fence, ring->fctx->last_fence) &&
> -			!made_progress(gpu, ring)) {
> +			check_ring_timeout(ring, priv->hangcheck_period * 192000)) {
>  		/* no progress and not done.. hung! */
>  		ring->hangcheck_fence = fence;
>  		ring->hangcheck_progress_retries = 0;
> @@ -658,6 +688,7 @@ static void hangcheck_handler(struct timer_list *t)
>  		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
>  				gpu->name, ring->fctx->last_fence);
>  
> +		gpu->hung_ring = ring;
>  		kthread_queue_work(gpu->worker, &gpu->recover_work);
>  	}
>  
> @@ -911,7 +942,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
>  
>  	pm_runtime_put(&gpu->pdev->dev);
> -	hangcheck_timer_reset(gpu);
> +	hangcheck_ring_timer_reset(gpu, submit->ring);

Should we reset hangcheck whenever there is a submission to a random ring?

-Akhil

>  }
>  
>  /*
> @@ -1011,8 +1042,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	if (funcs->progress)
>  		priv->hangcheck_period /= 2;
>  
> -	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
> -
>  	spin_lock_init(&gpu->perf_lock);
>  
>  
> @@ -1097,6 +1126,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			goto fail;
>  		}
>  
> +		timer_setup(&gpu->rb[i]->hangcheck_timer, hangcheck_handler, 0);
> +
>  		memptrs += sizeof(struct msm_rbmemptrs);
>  		memptrs_iova += sizeof(struct msm_rbmemptrs);
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index a597f2bee30b6370ecc3639bfe1072c85993e789..7bf1b7f4bc4b61338bfa4c1463eb549f8c22d5c3 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -93,6 +93,7 @@ struct msm_gpu_funcs {
>  	 */
>  	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  	void (*sysprof_setup)(struct msm_gpu *gpu);
> +	int (*get_ctx_timestamp)(struct msm_ringbuffer *ring, uint64_t *value);
>  };
>  
>  /* Additional state for iommu faults: */
> @@ -257,6 +258,8 @@ struct msm_gpu {
>  	/* work for handling GPU recovery: */
>  	struct kthread_work recover_work;
>  
> +	struct msm_ringbuffer *hung_ring;
> +
>  	/** retire_event: notified when submits are retired: */
>  	wait_queue_head_t retire_event;
>  
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index d1e49f701c8176e50d2b9a5cca35acee67f75209..316247fb089f26bd657ccf8464a5039e1cd1ac45 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -37,6 +37,8 @@ struct msm_rbmemptrs {
>  	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
>  	volatile u64 ttbr0;
>  	volatile u32 context_idr;
> +	volatile u64 last_job_start_ctx;
> +	volatile u64 last_active_ctxcycles;
>  };
>  
>  struct msm_cp_state {
> @@ -73,6 +75,10 @@ struct msm_ringbuffer {
>  	uint64_t memptrs_iova;
>  	struct msm_fence_context *fctx;
>  
> +	/* Hang and Inactivity Detection:
> +	 */
> +	struct timer_list hangcheck_timer;
> +
>  	/**
>  	 * hangcheck_progress_retries:
>  	 *
> 

