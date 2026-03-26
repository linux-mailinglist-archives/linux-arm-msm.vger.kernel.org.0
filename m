Return-Path: <linux-arm-msm+bounces-99985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHt5B02TxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:00:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951732E239
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F4093069679
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0156638E5EB;
	Thu, 26 Mar 2026 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFsMF761"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B2186A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490055; cv=none; b=ERq5Zafv9Hh0KodJuKjMptkKt48Py9wWZ9TBliHqzUq+ljuGkf+1yYyaEre8vCCtgX2OFWkrOLuCFxgPgBlVZJsUiorPYBLOeRc8TtTq7pb4porunaoNTq/1XHGUNmRJEEt0BOmF51CoNBe0LXuvP+xqrAtN9u/kMxcFrbmEZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490055; c=relaxed/simple;
	bh=hWVdFUpGT8pUe61SceF3AT0j9MA+qROa0BHE5CK7SAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcrSjhzzv1R46beVGDCQEucpKhIspYU+FFUrNFvM570hHYjykdRtjg63qI4jRa0IQuC5ZW4wZvqKHtxA1Ri2V7atNpGbIRhYOg18puOO+ap5LWCjHEWkRei/CaoQVRj/ybJT4Fc7nDcKpTbOvMPzWj8oaP2RvRsJ196a+yzlzbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFsMF761; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so401942b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774490053; x=1775094853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcdp7IsK8iyD34L5HISg9Ao7kXj1r2bEu5hpo8TsYx0=;
        b=bFsMF761WCfH/p9EE0bdksCQZEWUJUl0XhC7pJq/jGYjL/ovJ80m51hvTmgy/mQJme
         wOBfQ+rCN9E3bPZ9bKE3T81Kq8HN+3OMhLX6cYgYsHKdo7gx8mn1Uk6AePahA2XxRR69
         7HotJGPXtib3rVdZK+ABrhFK17bMiP6ydf+gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490053; x=1775094853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xcdp7IsK8iyD34L5HISg9Ao7kXj1r2bEu5hpo8TsYx0=;
        b=lDcR5HfQJtiZZuoicy1SeySdl/STemzXnRisIPMrNERAlqOfx5TexJSfdr7+QU1sAI
         oWIAiP/OYbpMDxwtJ6kITbB5sxdAzEqEFYLUMWUfVbzNxvts76b9OWg1jJ1GkYmlzB4t
         Pmxmxh/38k641bOw8ra5AfAnYYUQdNClh5qOR2mZRbN1sutnb2PNNzrssl3p7DcgmeXn
         LpyFLhmWN8aumX+sIhohIaPVViEUfxgH3Pcj8Pe4cxCxDILsN2t13WVsPZs62cSZLiI0
         0De3JF7W+HWrnlgO2ot7qug1tat1Il6pUW6x4rgGdcxIBVYrCKqkgYYR2DLz40SB+B1W
         /S4A==
X-Forwarded-Encrypted: i=1; AJvYcCU64mMWh5mYm94Wnd9Vn7GUhuBj4SRNcezvNqZ4vT/3B4sWZFsuTgGVSAJpxbE+o+V1NBubt6yb++pundGU@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEjhv3ZGKLH7l3jDZrZhmGlv8z6YOcRJhAYBFCpE/IZWVfF28
	xvxR28nuoJKEAeYlNxH4owg/rTMKeqwkfBq3r79IW3kAeWXA/eZXskOxGN/baY4P7w==
X-Gm-Gg: ATEYQzxRe04DvrDzG21rG4IakQxQTW6VdTjx/2C4bJhDCXUTrH2AYeRa1QizNy2SxKW
	M2TRtsS+AUnwW49aYFqK3IsPxVSpWGb2gluSIR7omBWJQ0Ro3U/DkE0Mn1YxO+fR3B+QC1z3SFn
	nJ2nExCdy3PrzfQe+wlYcLhZnfwaaZQ+Fwryo4h1Rd8yvg6tTOqbtcKI6gg5ePzZd1PaMSOc9xE
	zXwvTuj5wVLP2/+9LDP+v1t5LpPpxGFCUIt2yoz9a9xGn31CcwHGmhZIiZSvEpxDaWVziIKRHxv
	67gdZ2YMfF6XtY029x5zi+K0fxi8yXkf68EkEiDdwTVoZaKPj8pEbzpln4FjiRaCBmk+tkgYJQ+
	IMY6UEVDtE7kOOovnJbr7gq39H4ATgljq7AEluviBHH1ToVVf76wxlMMFnVJFv5R0d2Gp/hTXyG
	zj38CaoF4+wpCg6mhHpVaJmYhHfLXjsDBdenU+pQPw+63Gzr6w7BrRbc6ld4lGycM=
X-Received: by 2002:a05:6a00:390b:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82c6df8e77bmr5314949b3a.30.1774490052823;
        Wed, 25 Mar 2026 18:54:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:bba3:6463:d2dc:395a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d390979sm947769b3a.32.2026.03.25.18.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:54:12 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:54:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <acSRDNA8fCP7qAFJ@google.com>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127073341.2862078-1-senozhatsky@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email]
X-Rspamd-Queue-Id: 8951732E239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/01/27 16:33), Sergey Senozhatsky wrote:
> We sometimes get into a situtation where GPU hangcheck fails to
> recover GPU:
> 
> [..]
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> [..]
> 
> The problem is that msm_job worker is blocked on gpu->lock
> 
> INFO: task ring0:155 blocked for more than 122 seconds.
> Not tainted 6.6.99-08727-gaac38b365d2c #1
> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_preempt_disabled+0x30/0x50
> __mutex_lock_common+0x410/0x850
> __mutex_lock_slowpath+0x28/0x40
> mutex_lock+0x5c/0x90
> msm_job_run+0x9c/0x140
> drm_sched_main+0x514/0x938
> kthread+0x114/0x138
> ret_from_fork+0x10/0x20
> 
> which is owned by recover worker, which is waiting for DMA fences
> from a memory reclaim path, under the very same gpu->lock
> 
> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_timeout+0x1f8/0x770
> dma_fence_default_wait+0x108/0x218
> dma_fence_wait_timeout+0x6c/0x1c0
> dma_resv_wait_timeout+0xe4/0x118
> active_purge+0x34/0x98
> drm_gem_lru_scan+0x1d0/0x388
> msm_gem_shrinker_scan+0x1cc/0x2e8
> shrink_slab+0x228/0x478
> shrink_node+0x380/0x730
> try_to_free_pages+0x204/0x510
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x1d4/0x4a0
> __alloc_pages+0x9f0/0xc88
> vm_area_alloc_pages+0x17c/0x260
> __vmalloc_node_range+0x1c0/0x420
> kvmalloc_node+0xe8/0x108
> msm_gpu_crashstate_capture+0x1e4/0x280
> recover_worker+0x1c0/0x638
> kthread_worker_fn+0x150/0x2d8
> kthread+0x114/0x138
> 
> So no one can make any further progress.
> 
> Forbid recover/fault worker to enter memory reclaim (under
> gpu->lock) to address this deadlock scenario.
> 
> Cc: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>


Folks, can somebody please review/pickup this patch?  It solves a real
(deadlock) problem that we observe in the field.

// keeping the patch body just in case

> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 995549d0bbbc..ddcd9e1c217a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -17,6 +17,7 @@
>  #include <linux/string_helpers.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
> +#include <linux/sched/mm.h>
>  
>  /*
>   * Power Management:
> @@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *work)
>  	struct msm_gem_submit *submit;
>  	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>  	char *comm = NULL, *cmd = NULL;
> +	unsigned int noreclaim_flag;
>  	struct task_struct *task;
>  	int i;
>  
> @@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *work)
>  			msm_gem_vm_unusable(submit->vm);
>  	}
>  
> +	noreclaim_flag = memalloc_noreclaim_save();
> +
>  	get_comm_cmdline(submit, &comm, &cmd);
>  
>  	if (comm && cmd) {
> @@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *work)
>  	pm_runtime_get_sync(&gpu->pdev->dev);
>  	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
>  
> +	memalloc_noreclaim_restore(noreclaim_flag);
> +
>  	kfree(cmd);
>  	kfree(comm);
>  
> @@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>  	struct msm_gem_submit *submit;
>  	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>  	char *comm = NULL, *cmd = NULL;
> +	unsigned int noreclaim_flag;
>  
>  	mutex_lock(&gpu->lock);
>  
> @@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>  	if (submit && submit->fault_dumped)
>  		goto resume_smmu;
>  
> +	noreclaim_flag = memalloc_noreclaim_save();
> +
>  	if (submit) {
>  		get_comm_cmdline(submit, &comm, &cmd);
>  
> @@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>  	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
>  	pm_runtime_put_sync(&gpu->pdev->dev);
>  
> +	memalloc_noreclaim_restore(noreclaim_flag);
> +
>  	kfree(cmd);
>  	kfree(comm);
>  
> -- 
> 2.53.0.rc1.217.geba53bf80e-goog
> 

