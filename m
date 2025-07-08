Return-Path: <linux-arm-msm+bounces-64041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE78AFCB45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55166188B5DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B4F29A9C9;
	Tue,  8 Jul 2025 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JdFEu7PE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029A14AA9;
	Tue,  8 Jul 2025 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979787; cv=none; b=qIe6dR5t5bOfNZGMAZHUi7D9tyvPjmkjg76tO/kvrwNvfIul0a17m5Tk5ONZwlWGQWQjgP721b7QPMZ+E3/+CArdrUjN86bAh+bgkjI5lGW3RcwNNAmz5Q61OVv4RubyjE4M01OdW7IQX3Ru2DvYA1LZQQsOe0Lxoz31obQsxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979787; c=relaxed/simple;
	bh=ereuj6AlJpzu5i16+yC4jvV+PusLP+iYehDXGVRum1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOa6Tvfhn7Gf2VSmfMmTIqBqxs3sKRQdeZM8yFOfjGEi0Vb/IHy2w1bpPeKiVnR6A44RvFcZcPY6z7y/mpDqei2L5jHfmk7IGb0lYN9giGmg7OKXw9CLU0mu3cUwoYkyO/8YpSbezMv/3EanXtjkxT/85uoo0ymshbEBf8uYCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JdFEu7PE; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CyMyoOzxPeWjgAxgKPF6kohtSbJRtTIW2hnbquSOXqk=; b=JdFEu7PEjSL5zluijTDqwm7bFA
	KDlzpRB62hDf7FTri4sgFMFKZ9IAbPwIbYxurQtIBHxzwiWvg5jpYcdIw5ZV6JcMx18tCRGq54vWL
	K8zJscgwk4rVzcCcRm85O7NyKIaWwzFgKqUUD09LpuHl8Kw5Vc2NFrjxyc4gUZnr8kkxmIhhJFAzi
	WJdR3Rqn1sgRx4mr0s0c/UH5926jQuHMDLbdyLOnd/A/M7EZNEgwT9GQk9TkS5fSAvboLI2hv7Jv1
	nNXvHxy60BlEKNAApOnC74HQN94woOay2aU4owCh1Ue/GWN7kAGbHNIRnUnwCZRuHk+y1l+jvswqS
	DYPnZUTw==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uZ7xn-00E173-9x; Tue, 08 Jul 2025 15:02:23 +0200
Message-ID: <b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com>
Date: Tue, 8 Jul 2025 14:02:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>,
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
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>
References: <20250211111422.21235-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/02/2025 11:14, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d
> ---
> Changes in v4:
>    - Add forgotten driver accel/amdxdna. (Me)
>    - Rephrase the "init to NULL" comments. (Tvrtko)
>    - Apply RBs by Tvrtko and Maira.
>    - Terminate the last struct members with a comma, so that future
>      fields can be added with a minimal patch diff. (Me)
> 
> Changes in v3:
>    - Various formatting requirements.
> 
> Changes in v2:
>    - Point out that the hang-limit is deprecated. (Christian)
>    - Initialize the structs to 0 at declaration. (Planet Earth)
>    - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>    - Make the structs const where possible. (Boris)
>    - v3d: Use just 1, universal, function for sched-init. (Maíra)
> ---

8><

> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 9b8e82fb8bc4..5657106c2f7d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -836,8 +836,16 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>   
>   int panfrost_job_init(struct panfrost_device *pfdev)
>   {
> +	struct drm_sched_init_args args = {
> +		.ops = &panfrost_sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 2,
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout_wq = pfdev->reset.wq,

^^^

> +		.name = "pan_js",
> +		.dev = pfdev->dev,
> +	};
>   	struct panfrost_job_slot *js;
> -	unsigned int nentries = 2;
>   	int ret, j;
>   
>   	/* All GPUs have two entries per queue, but without jobchain
> @@ -845,7 +853,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   	 * so let's just advertise one entry in that case.
>   	 */
>   	if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGUATION))
> -		nentries = 1;
> +		args.credit_limit = 1;
>   
>   	pfdev->js = js = devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KERNEL);
>   	if (!js)

Stumbled on this while looking at drm_sched_init() workqueue usage.

I think this patch might need a fixup. Because somewhere around here in 
the code there is this:

	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
	if (!pfdev->reset.wq)
		return -ENOMEM;

Which means that after the patch panfrost is using system_wq for the 
timeout handler instead the one it creates.

> @@ -875,13 +883,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>   
> -		ret = drm_sched_init(&js->queue[j].sched,
> -				     &panfrost_sched_ops, NULL,
> -				     DRM_SCHED_PRIORITY_COUNT,
> -				     nentries, 0,
> -				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> -				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +		ret = drm_sched_init(&js->queue[j].sched, &args);

^^^

>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>   			goto err_sched;

Regards,

Tvrtko


