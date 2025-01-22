Return-Path: <linux-arm-msm+bounces-45869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F5A19AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0E41608E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629761C5D72;
	Wed, 22 Jan 2025 22:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mA1k1KJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1581C5D61;
	Wed, 22 Jan 2025 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737583735; cv=none; b=fnVKDtLpMgsN4BOLLhY9esqdZqetst5Qdz9NR+QRR+IJmziYqCLyp1cTFuMjpJidRP/BPTQFgUOUoIZs6jR7z0Ym1OFwgX6Kpfoi4qFJXLcXCs/ELMMQw6JAUFWLjEoo3oEMNfU5kysSuZy2/iikr3FC9aKDy3WcnwhNRcTGyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737583735; c=relaxed/simple;
	bh=yWlwYQhAXvT//5Qsut7eRQzQ9ZX9WVLem+ZOJxpWC10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5nTMwc4KG/8W79+N95IQlhSNnb6RF4r68deopYvge5dmhMhTlHGX95mpTd9i9dRiod7vVO3Zxq/pKw7BQSv7IZ8Ma/+X+dUgu4gXxH2Auv3v7v5eGVJN4atBMk6XJCwK1ipsNsQhFNAnDsQ126JbQEU3kx/38wmzvR+Bux4ZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mA1k1KJI; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1WYF6M+0CSJdt3h1AzPBNG/BZgVXB1aen9q/MZc6pzU=; b=mA1k1KJIYW/LaqhT735rrrLujh
	bIYEqMROLaZqKfzs1Tbso5PVw97QpGje+0gdKtEwdqM/PiOiJM/ta4NLRToqg0xNw+uqRHceaAE3u
	AoE1jvCV7ZRRpdcmEa9MWtcOP69XWozCcziel2ozzwJSq0d9ox067a2m8LXywcIiHfA10NnI1egY8
	/fhw/FqsYvhBwvIWHhe6oUygkp7RFvCR1pNViP6qGAwxmzY0jPioVMwaA/Vs5638P03mGUvBNQi7u
	iNmwg3rI1qjw7Qx19hLvYjTc3JdwmImKvwUqPxxXsHXy7AJDCwueU/d7yE0FOWKDqj0GqIxUzGppz
	iF+aDjkQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tait9-000vc9-My; Wed, 22 Jan 2025 23:07:55 +0100
Message-ID: <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
Date: Wed, 22 Jan 2025 19:07:38 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250122140818.45172-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philipp,

On 22/01/25 11:08, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Howdy,
> 
> I have a patch-series in the pipe that will add a `flags` argument to
> drm_sched_init(). I thought it would be wise to first rework the API as
> detailed in this patch. It's really a lot of parameters by now, and I
> would expect that it might get more and more over the years for special
> use cases etc.
> 
> Regards,
> P.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  21 +++-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  20 ++-
>   drivers/gpu/drm/imagination/pvr_queue.c    |  21 +++-
>   drivers/gpu/drm/lima/lima_sched.c          |  21 +++-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |  22 ++--
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |  20 ++-
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  22 ++--
>   drivers/gpu/drm/panthor/panthor_mmu.c      |  18 ++-
>   drivers/gpu/drm/panthor/panthor_sched.c    |  23 ++--
>   drivers/gpu/drm/scheduler/sched_main.c     |  53 +++-----
>   drivers/gpu/drm/v3d/v3d_sched.c            | 135 +++++++++++++++------
>   drivers/gpu/drm/xe/xe_execlist.c           |  20 ++-
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  19 ++-
>   include/drm/gpu_scheduler.h                |  35 +++++-
>   14 files changed, 311 insertions(+), 139 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 99ac4995b5a1..716e6d074d87 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
>   	.free_job = v3d_cpu_job_free
>   };
>   
> +/*
> + * v3d's scheduler instances are all identical, except for ops and name.
> + */
> +static void
> +v3d_common_sched_init(struct drm_sched_init_params *params, struct device *dev)
> +{
> +	memset(params, 0, sizeof(struct drm_sched_init_params));
> +
> +	params->submit_wq = NULL; /* Use the system_wq. */
> +	params->num_rqs = DRM_SCHED_PRIORITY_COUNT;
> +	params->credit_limit = 1;
> +	params->hang_limit = 0;
> +	params->timeout = msecs_to_jiffies(500);
> +	params->timeout_wq = NULL; /* Use the system_wq. */
> +	params->score = NULL;
> +	params->dev = dev;
> +}

Could we use only one function that takes struct v3d_dev *v3d, enum
v3d_queue, and sched_ops as arguments (instead of one function per
queue)? You can get the name of the scheduler by concatenating "v3d_" to
the return of v3d_queue_to_string().

I believe it would make the code much simpler.

Best Regards,
- Maíra

> +
> +static int
> +v3d_bin_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_bin_sched_ops;
> +	params.name = "v3d_bin";
> +
> +	return drm_sched_init(&v3d->queue[V3D_BIN].sched, &params);
> +}
> +
> +static int
> +v3d_render_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_render_sched_ops;
> +	params.name = "v3d_render";
> +
> +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched, &params);
> +}
> +
> +static int
> +v3d_tfu_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_tfu_sched_ops;
> +	params.name = "v3d_tfu";
> +
> +	return drm_sched_init(&v3d->queue[V3D_TFU].sched, &params);
> +}
> +
> +static int
> +v3d_csd_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_csd_sched_ops;
> +	params.name = "v3d_csd";
> +
> +	return drm_sched_init(&v3d->queue[V3D_CSD].sched, &params);
> +}
> +
> +static int
> +v3d_cache_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_cache_clean_sched_ops;
> +	params.name = "v3d_cache_clean";
> +
> +	return drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched, &params);
> +}
> +
> +static int
> +v3d_cpu_sched_init(struct v3d_dev *v3d)
> +{
> +	struct drm_sched_init_params params;
> +
> +	v3d_common_sched_init(&params, v3d->drm.dev);
> +	params.ops = &v3d_cpu_sched_ops;
> +	params.name = "v3d_cpu";
> +
> +	return drm_sched_init(&v3d->queue[V3D_CPU].sched, &params);
> +}
> +
>   int
>   v3d_sched_init(struct v3d_dev *v3d)
>   {
> -	int hw_jobs_limit = 1;
> -	int job_hang_limit = 0;
> -	int hang_limit_ms = 500;
>   	int ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			     &v3d_bin_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +	ret = v3d_bin_sched_init(v3d);
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			     &v3d_render_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +	ret = v3d_render_sched_init(v3d);
>   	if (ret)
>   		goto fail;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			     &v3d_tfu_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +	ret = v3d_tfu_sched_init(v3d);
>   	if (ret)
>   		goto fail;
>   
>   	if (v3d_has_csd(v3d)) {
> -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				     &v3d_csd_sched_ops, NULL,
> -				     DRM_SCHED_PRIORITY_COUNT,
> -				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +		ret = v3d_csd_sched_init(v3d);
>   		if (ret)
>   			goto fail;
>   
> -		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> -				     &v3d_cache_clean_sched_ops, NULL,
> -				     DRM_SCHED_PRIORITY_COUNT,
> -				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +		ret = v3d_cache_sched_init(v3d);
>   		if (ret)
>   			goto fail;
>   	}
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
> -			     &v3d_cpu_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     1, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_cpu", v3d->drm.dev);
> +	ret = v3d_cpu_sched_init(v3d);
>   	if (ret)
>   		goto fail;
>   


