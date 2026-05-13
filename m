Return-Path: <linux-arm-msm+bounces-107484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKWlJjDpBGrCQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:12:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4F53AE5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9761C300B9FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6147F39C00E;
	Wed, 13 May 2026 21:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQCAQtp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8783955F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706732; cv=none; b=E2HweH7IeXUmXjNuxXmej1Kdt19BsoQn6/8BSamCJR0RIsq9QozSDBnN5MA8WnktM4dO+xyS7iQaqeXGuG0QO76vfSkDjgw2UWX8gn38CfboJhwx3vYsxA7YNPxewUaBcF+ZT148pHU+mjgHV53a6svEMRwE8zxZHtWdSmdTwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706732; c=relaxed/simple;
	bh=bCstxQAbe/HLpZJsEANhbqZoWzhiE5/Cfcak9R9sU8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kp8Ghc5qBtadqTRfxG/O+ArYc/suzHOdNqLqg28B8AtD2MmcR5khl8/PrQ4IwC1mEh+fTIi9Jz2fi2aMb9p6wwpjKdMKiUnyU084JkntCg4LHT0EhW34T72i672psA0K5Ng9O+j14kfcBwAEzKT3abWGh5rRgysTc3p4ULswTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQCAQtp5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso5873044f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778706729; x=1779311529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9TJEllZVBVlfNRyGXAoH6FjyIcbPkUmAnCqlgQgp5k=;
        b=sQCAQtp5kziX+4oJ/RA3vwQ24Pk7nWpp4/WzDkaJU+hhMh9+mWzYr94FInSZMv2iWV
         QJ0WEOZS09FT99u0/+FbYaAe/moDxZQWKU02zOTvZZYEvNTIfmTDpco05qTrCP9ttssl
         8NaT4FKpR6SzFq6Zf4XUmmtpIIVi8iHysRciawWXquu4W5YHoA9oAI7/A7C4BpHi81gf
         cUyBZ6TvH5FRh8OkP5E3/+HYwF9MzIQwh0/8Iv4HWe4K8uQFlH9WbsgeZM3jmmTUNyAY
         clHiyKn/luAU5uh8T2tnV2sT3UkDde28iPHAulPQU2M6kxTiTUh6N5L+8sb6gXhoy3kD
         Lg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778706729; x=1779311529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9TJEllZVBVlfNRyGXAoH6FjyIcbPkUmAnCqlgQgp5k=;
        b=I7xJbY2E+iaHEtfGtGt8wz9TAtlBxBrTlB7YxEYmDPyXwpfwNM7PBx3F2U2uZRmGoL
         ueXDg/OFnYwdW3bsZMCPb1YhSgiYhDzuOruNRua5+YvavB2V9K20VXgDSCiyGS4rUwKt
         eZWRdS1FLUEcTe/KonXyPW/A5rv4LgJyTxAiDUUDltiqg563Pav5nA9XNZZxYIIGWvzb
         OtYbnL5sG6fs9b0LDMC3TJexlQ0n82o4qFKz0cEezKI71Tif7UGjz0S0eZZJvJzi42Pr
         8NyDRMPuxxdg+NmISs2IghdGfUmBK2QcXF+iU1E/McnsVqJ7Q+R66HzzLadHrwC8Z7xa
         oJxA==
X-Gm-Message-State: AOJu0YxF0OG5pSna1955UHjNaMzF/kr+y921glNjw7Km3mfr25L7PuKd
	Lsq9i8wllR3HnF1OqDfdK0TpNj3dunS2d9+8OawihoANSA462vbvLZI=
X-Gm-Gg: Acq92OGbJE5thnIbCE9rpZz4Ui532cY14QwOOQFoN1KFQF9AAeuhW8V8Fr80i43QdNE
	WHFq9ocm7h6IFJCFF5jOPuG9O8M5Msr8T+bXwTstDi4tyBO8DqlTz3f8YwL8051fiX1XI2/nR44
	tqyHPtsQ4xoxGRr7OGxLhH2mgotb73L0pyCw51QOXvdrjpNarUuILidDB2BzieMC/Z3UbyrVvt/
	SoDFanyIb9J20LD5hZmIOUzmMM1SGerk3ybuF3xBkrzKBqDGM+tpbPTPcwhsuyvVLNczp91Zkzs
	eA0m4pCu4oIlx96nKFkPgNfVU32M/Re8wNxbjyByc0tqt8ojjY4R2xgk0+YI2318REpeTVgwO76
	F621G4X6r2EY1G8LGD+O3zDLy9/CyhJXnLVBbJ/mN9kTVYLpQlg0JuC6kZebldLRXXLnSrkHQAd
	zr+DK575GlfYy+n67x45lc7HjGY4eBXoE0hIKPsukbbPqJKRCZcxYksO2GZuzxj39WnvO5qDMvE
	hHYgRD6Wg==
X-Received: by 2002:a05:6000:1a8e:b0:43f:dfb6:78e1 with SMTP id ffacd0b85a97d-45c5859efdemr7339438f8f.8.1778706728525;
        Wed, 13 May 2026 14:12:08 -0700 (PDT)
Received: from [192.168.1.7] (host-87-11-168-94.retail.telecomitalia.it. [87.11.168.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm1568446f8f.22.2026.05.13.14.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 14:12:08 -0700 (PDT)
Message-ID: <8bb75390-62be-43ce-a44b-da3eb8e35a4a@gmail.com>
Date: Wed, 13 May 2026 23:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] drm/msm: Add basic perfcntr infrastructure
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
 <20260511130017.96867-11-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20260511130017.96867-11-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3BD4F53AE5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-107484-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action


On 5/11/26 14:59, Rob Clark wrote:
> Add the basic infrastructure for tracking assigned perfcntrs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile               |   1 +
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
>  drivers/gpu/drm/msm/msm_drv.h              |   6 +
>  drivers/gpu/drm/msm/msm_gpu.c              |  12 ++
>  drivers/gpu/drm/msm/msm_gpu.h              |  57 +++++++++-
>  drivers/gpu/drm/msm/msm_perfcntr.c         | 124 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_perfcntr.h         |  23 ++++
>  8 files changed, 230 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 337634e7e247..2466cb32dac5 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -122,6 +122,7 @@ msm-y += \
>  	msm_gpu_devfreq.o \
>  	msm_io_utils.o \
>  	msm_iommu.o \
> +	msm_perfcntr.o \
>  	msm_rd.o \
>  	msm_ringbuffer.o \
>  	msm_submitqueue.o \
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fc38331ce640..7f20320ef66a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -307,8 +307,10 @@ MODULE_DEVICE_TABLE(of, dt_match);
>  static int adreno_runtime_resume(struct device *dev)
>  {
>  	struct msm_gpu *gpu = dev_to_gpu(dev);
> -
> -	return gpu->funcs->pm_resume(gpu);
> +	int ret = gpu->funcs->pm_resume(gpu);
> +	if (!ret)
> +		ret = msm_perfcntr_resume(gpu);
> +	return ret;
>  }
>  
>  static int adreno_runtime_suspend(struct device *dev)
> @@ -322,6 +324,8 @@ static int adreno_runtime_suspend(struct device *dev)
>  	 */
>  	WARN_ON_ONCE(gpu->active_submits);
>  
> +	msm_perfcntr_suspend(gpu);
> +
>  	return gpu->funcs->pm_suspend(gpu);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 72b71e9e44f0..ee0bcf985934 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -702,11 +702,10 @@ void adreno_recover(struct msm_gpu *gpu)
>  	struct drm_device *dev = gpu->dev;
>  	int ret;
>  
> -	// XXX pm-runtime??  we *need* the device to be off after this
> -	// so maybe continuing to call ->pm_suspend/resume() is better?
> -
> +	msm_perfcntr_suspend(gpu);
>  	gpu->funcs->pm_suspend(gpu);
>  	gpu->funcs->pm_resume(gpu);
> +	msm_perfcntr_resume(gpu);
>  
>  	ret = msm_gpu_hw_init(gpu);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e53e4f220bed..f00b2e7aeb91 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -235,6 +235,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  int msm_ioctl_vm_bind(struct drm_device *dev, void *data,
>  		      struct drm_file *file);
>  
> +int msm_perfcntr_resume(struct msm_gpu *gpu);
> +void msm_perfcntr_suspend(struct msm_gpu *gpu);
> +
> +struct msm_perfcntr_state * msm_perfcntr_init(struct msm_gpu *gpu);
> +void msm_perfcntr_cleanup(struct msm_gpu *gpu);
> +
>  #ifdef CONFIG_DEBUG_FS
>  unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
>  #endif
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 1bac70473f80..bf6845e5719e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -1028,6 +1028,17 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	refcount_set(&gpu->sysprof_active, 1);
>  
> +	mutex_init(&gpu->perfcntr_lock);
> +
> +	if (gpu->num_perfcntr_groups > 0) {
> +		gpu->perfcntrs = msm_perfcntr_init(gpu);
> +		if (IS_ERR(gpu->perfcntrs)) {
> +			ret = PTR_ERR(gpu->perfcntrs);
> +			gpu->perfcntrs = NULL;
> +			goto fail;
> +		}
> +	}
> +
>  	return 0;
>  
>  fail:
> @@ -1066,6 +1077,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>  	}
>  
>  	msm_devfreq_cleanup(gpu);
> +	msm_perfcntr_cleanup(gpu);
>  
>  	platform_set_drvdata(gpu->pdev, NULL);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 19484774f369..be922641a14f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -25,6 +25,7 @@ struct msm_gem_vm_log_entry;
>  struct msm_gpu_state;
>  struct msm_context;
>  struct msm_perfcntr_group;
> +struct msm_perfcntr_stream;
>  
>  struct msm_gpu_config {
>  	const char *ioname;
> @@ -93,6 +94,13 @@ struct msm_gpu_funcs {
>  	 */
>  	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  	void (*sysprof_setup)(struct msm_gpu *gpu);
> +
> +	/* Configure perfcntr SELect regs: */
> +	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> +				   const struct msm_perfcntr_stream *stream);
> +
> +	/* Flush perfcntrs before reading (optional): */
> +	void (*perfcntr_flush)(struct msm_gpu *gpu);
>  };
>  
>  /* Additional state for iommu faults: */
> @@ -266,6 +274,11 @@ struct msm_gpu {
>  
>  	const struct msm_perfcntr_group *perfcntr_groups;
>  	unsigned num_perfcntr_groups;
> +
> +	struct msm_perfcntr_state *perfcntrs;
> +
> +	/** @perfcntr_lock: protects perfcntr related state */
> +	struct mutex perfcntr_lock;
>  };
>  
>  static inline struct msm_gpu *dev_to_gpu(struct device *dev)
> @@ -311,10 +324,52 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
>  	return false;
>  }
>  
> +/**
> + * struct msm_perfcntr_group_state - Tracking for the currently allocated counter state
> + */
> +struct msm_perfcntr_group_state {
> +	/**
> +	 * @allocated_counters:
> +	 *
> +	 * allocated counters for global counter collection.  The
> +	 * corresponding counters are allocated from highest to
> +	 * lowest, to minimize chance of conflict with old userspace
> +	 * allocating from lowest to highest.
> +	 */
> +	unsigned allocated_counters;
> +
> +	/**
> +	 * @countables:
> +	 *
> +	 * The correspnding SELect reg values for the allocated counters
> +	 */
> +	uint32_t countables[];
> +};
> +
> +/**
> + * struct msm_perfcntr_state - overall global perfcntr state
> + */
> +struct msm_perfcntr_state {
> +	/** @stream: current global counter stream if active */
> +	struct msm_perfcntr_stream *stream;
> +
> +	/**
> +	 * @groups: Global perfcntr stream group state.
> +	 *
> +	 * Conceptually this is part of msm_perfcntr_stream state, but is
> +	 * statically pre-allocated when the gpu is initialized to simplify
> +	 * error path cleanup in PERFCNTR_CONFIG ioctl.  (__free(kfree)
> +	 * doesn't really help with variable length arrays of allocated
> +	 * pointers.)
> +	 */
> +	struct msm_perfcntr_group_state *groups[];
> +};
> +
>  static inline bool
>  msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
>  {
> -	return refcount_read(&gpu->sysprof_active) > 1;
> +	return (refcount_read(&gpu->sysprof_active) > 1) ||
> +		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
>  }
>  
>  static inline bool
> diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
> new file mode 100644
> index 000000000000..dad98c96863c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_perfcntr.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "msm_drv.h"
> +#include "msm_gpu.h"
> +#include "msm_perfcntr.h"
> +
> +static int
> +msm_perfcntr_resume_locked(struct msm_perfcntr_stream *stream)
> +{
> +	return 0;
> +}
> +
> +int
> +msm_perfcntr_resume(struct msm_gpu *gpu)
> +{
> +	if (!gpu->perfcntrs)
> +		return 0;
> +	guard(mutex)(&gpu->perfcntr_lock);
> +	return msm_perfcntr_resume_locked(gpu->perfcntrs->stream);
> +}
> +
> +static void
> +msm_perfcntr_suspend_locked(struct msm_perfcntr_stream *stream)
> +{
> +}
> +
> +void
> +msm_perfcntr_suspend(struct msm_gpu *gpu)
> +{
> +	if (!gpu->perfcntr_groups)
> +		return;
> +	guard(mutex)(&gpu->perfcntr_lock);
> +	msm_perfcntr_suspend_locked(gpu->perfcntrs->stream);
> +}
> +
> +/**
> + * msm_perfcntr_group_idx - map idx of perfcntr group to group_idx
> + * @stream: The global perfcntr stream
> + * @n: The requested group_idx
> + *
> + * The PERFCNTR_CONFIG ioctl requested N counters/countables per perfcntr
> + * group, but the order of groups is not required to match the order they
> + * are defined in the perfcntr tables (which is not stable/UABI, only the
> + * group names are UABI).
> + *
> + * But the order samples are returned in the stream should match the
> + * order they are requested in the PERFCNTR_CONFIG ioctl.  This helper
> + * handles the order remapping.
> + *
> + * Returns an index into gpu->perfcntr_groups[] and perfcntrs->groups[].
> + */
> +uint32_t
> +msm_perfcntr_group_idx(const struct msm_perfcntr_stream *stream, uint32_t n)
> +{
> +	WARN_ON_ONCE(n > stream->nr_groups);
> +	return stream->group_idx[n];
> +}
> +
> +/**
> + * msm_perfcntr_counter_base - get idx of the first counter in group
> + * @stream: The global perfcntr stream
> + * @group_idx: the index of the counter group
> + *
> + * For global counter collection, counters are allocated from the end
> + * (last counter) to minimize the chance of conflict with an old UMD
> + * which predates PERFCNTR_CONFIG ioctl (since UMD assigned from 0..N-1).
As is this comment seems to imply that userspace wont't be allocating from the start anymore which isn't the case.
May I suggest:
For global counter collection, counters are allocated from the end while UMD
allocates them from the start. Since UMD always allocated them from the start
it also minimizes the chance of conflict when using old UMD which predates
PERFCNTR_CONFIG ioctl.

Aside from this nit series is:
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>> + *
> + * Returns the index of first counter to use.  An index into
> + * msm_perfcntr_group::counters[].
> + */
> +uint32_t
> +msm_perfcntr_counter_base(const struct msm_perfcntr_stream *stream, uint32_t group_idx)
> +{
> +	struct msm_gpu *gpu = stream->gpu;
> +	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
> +	unsigned num_counters = gpu->perfcntr_groups[group_idx].num_counters;
> +	unsigned allocated_counters = perfcntrs->groups[group_idx]->allocated_counters;
> +
> +	return num_counters - allocated_counters;
> +}
> +
> +struct msm_perfcntr_state *
> +msm_perfcntr_init(struct msm_gpu *gpu)
> +{
> +	struct msm_perfcntr_state *perfcntrs;
> +	struct device *dev = &gpu->pdev->dev;
> +	size_t sz;
> +
> +	sz = struct_size(perfcntrs, groups, gpu->num_perfcntr_groups);
> +	perfcntrs = devm_kzalloc(dev, sz, GFP_KERNEL);
> +	if (!perfcntrs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++) {
> +		const struct msm_perfcntr_group *group =
> +			&gpu->perfcntr_groups[i];
> +
> +		sz = struct_size(perfcntrs->groups[i], countables, group->num_counters);
> +		perfcntrs->groups[i] = devm_kzalloc(dev, sz, GFP_KERNEL);
> +		if (!perfcntrs->groups[i]) {
> +			msm_perfcntr_cleanup(gpu);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +	}
> +
> +	return perfcntrs;
> +}
> +
> +void
> +msm_perfcntr_cleanup(struct msm_gpu *gpu)
> +{
> +	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
> +	struct device *dev = &gpu->pdev->dev;
> +
> +	gpu->perfcntrs = NULL;
> +
> +	for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++)
> +		devm_kfree(dev, perfcntrs->groups[i]);
> +
> +	devm_kfree(dev, perfcntrs);
> +}
> diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
> index 7f0654182496..bfda19e01535 100644
> --- a/drivers/gpu/drm/msm/msm_perfcntr.h
> +++ b/drivers/gpu/drm/msm/msm_perfcntr.h
> @@ -35,6 +35,29 @@ struct msm_perfcntr_group {
>     const struct msm_perfcntr_counter *counters;
>  };
>  
> +/**
> + * struct msm_perfcntr_stream - state for a single open stream fd
> + */
> +struct msm_perfcntr_stream {
> +	/** @gpu: Back-link to the GPU */
> +	struct msm_gpu *gpu;
> +
> +	/** @nr_groups: # of counter groups with enabled counters */
> +	uint32_t nr_groups;
> +
> +	/**
> +	 * @group_idx: array of nr_groups
> +	 *
> +	 * Maps the order of groups in PERFCNTR_CONFIG ioctl to group idx,
> +	 * so that results in the results stream can be ordered to match
> +	 * the ioctl call that setup the stream
> +	 */
> +	uint32_t *group_idx;
> +};
> +
> +uint32_t msm_perfcntr_group_idx(const struct msm_perfcntr_stream *stream, uint32_t n);
> +uint32_t msm_perfcntr_counter_base(const struct msm_perfcntr_stream *stream, uint32_t group_idx);
> +
>  /**
>   * struct msm_perfcntr_context_state - per-msm_context counter state
>   *


