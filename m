Return-Path: <linux-arm-msm+bounces-45815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C297A193E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E150D1888340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E14145B00;
	Wed, 22 Jan 2025 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoExUnlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1BF1F94A;
	Wed, 22 Jan 2025 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737556260; cv=none; b=mk5M/IdWLPgMBggy3PXhVwtQ2ul69Ky3Oj0AIx/EVUNKK4BJ0atG4AIMtSyGSpwC9iGUnwzFXXaLO/Mxk4Hkx5zpG1AsD7zU4u/dAEPW/D8cJtJdtnXf+13ojMKl4cPAhKFZXQDOKu9XAFUA/iagfZnUTtM1peZTw78+Cd6VEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737556260; c=relaxed/simple;
	bh=L4xfmNQJCKh9MNyQ82sBfCVFL00apkkWMuchp88L1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws/uXu8Byy7eLuaPAB+Rj5TQXj9oJhW8y4dDgTo9KL8LSMnV7DWKMNKl57YPrA2irP54+k+FMUAv7EoBW9Be1zaIgRMcvZiQaWXBSQ2Ng8YI7hgNyz/muZGwRfXlYl00xp2om0Hm4fHHp7/EV11vaUbIe9pk5tp2XA9w5rJGCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoExUnlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429FAC4CED2;
	Wed, 22 Jan 2025 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737556259;
	bh=L4xfmNQJCKh9MNyQ82sBfCVFL00apkkWMuchp88L1Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoExUnlZlW41Os5LUsw5Tx7xkoNrR5Qy/wWhYhFdgpO2rXT5uYPU8F4+yuH8Avdl4
	 /AaN0z+MY4hgCpiTA5Gl72aR2SLF4yfu/vm8zH3bboGgIfZ2xRX80+WhQ5MXbzyU7z
	 05O9hYZ7cAIMlIgzli3FgNwTIHnad2DT+1uNkzPkuW3TDFkx3ZGSvkdPQuqZtCKUMJ
	 KZuXpiFi1DWmcau9yexQ0AvZwEwd0b0EM/0OH5jdAzNYe61bm+B6lkhGmYxElRcYYe
	 07fSOiMKc/mQF74SHpk3mnNsa+DUhnn9Zg89LBMcRoRI+9CEWw1b9JSJoM+tB3oGXJ
	 Hr1GVeXlCqB0w==
Date: Wed, 22 Jan 2025 15:30:47 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5EBF7W706aGJoVt@pollux>
References: <20250122140818.45172-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122140818.45172-3-phasta@kernel.org>

On Wed, Jan 22, 2025 at 03:08:20PM +0100, Philipp Stanner wrote:
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  21 +++-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  20 ++-
>  drivers/gpu/drm/imagination/pvr_queue.c    |  21 +++-
>  drivers/gpu/drm/lima/lima_sched.c          |  21 +++-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  22 ++--
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  20 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  22 ++--
>  drivers/gpu/drm/panthor/panthor_mmu.c      |  18 ++-
>  drivers/gpu/drm/panthor/panthor_sched.c    |  23 ++--
>  drivers/gpu/drm/scheduler/sched_main.c     |  53 +++-----
>  drivers/gpu/drm/v3d/v3d_sched.c            | 135 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_execlist.c           |  20 ++-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  19 ++-
>  include/drm/gpu_scheduler.h                |  35 +++++-
>  14 files changed, 311 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index cd4fac120834..c1f03eb5f5ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2821,6 +2821,9 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  {
>  	long timeout;
>  	int r, i;
> +	struct drm_sched_init_params params;
> +
> +	memset(&params, 0, sizeof(struct drm_sched_init_params));

I think we should drop the memset() and just write it as:

struct drm_sched_init_params params = {};

<snip>

> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..1a834ef43862 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
>  	struct device			*dev;
>  };
>  
> +/**
> + * struct drm_sched_init_params - parameters for initializing a DRM GPU scheduler

Since this is a separate structure now, I think we should point out which fields
are mandatory to set and which of those have a valid default to zero.

> + *
> + * @ops: backend operations provided by the driver
> + * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> + *	       allocated and used
> + * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
> + *           as there's usually one run-queue per priority, but could be less.
> + * @credit_limit: the number of credits this scheduler can hold from all jobs
> + * @hang_limit: number of times to allow a job to hang before dropping it
> + * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used
> + * @score: optional score atomic shared with other schedulers
> + * @name: name used for debugging
> + * @dev: associated device. Used for debugging
> + */
> +struct drm_sched_init_params {
> +	const struct drm_sched_backend_ops *ops;
> +	struct workqueue_struct *submit_wq;
> +	struct workqueue_struct *timeout_wq;
> +	u32 num_rqs, credit_limit;
> +	unsigned int hang_limit;
> +	long timeout;
> +	atomic_t *score;
> +	const char *name;
> +	struct device *dev;
> +};
> +
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		const struct drm_sched_init_params *params);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
> -- 
> 2.47.1
> 

