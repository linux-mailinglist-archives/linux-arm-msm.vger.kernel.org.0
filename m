Return-Path: <linux-arm-msm+bounces-33125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB809904A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB2C1F22884
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DC620FAB8;
	Fri,  4 Oct 2024 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="QHjyg/CY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840215853E
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049266; cv=none; b=WG6nvI1VcB0bBeZvUQNEoTxO7X9W+pPv212tvMRGFvkJMZIuRGd1bfFqKrgR3ZAtl8/oMizwrBuT1/ruLMlaefOixSj92FQ0SQIlm54Krww3fvZIsmrkD1qKkn1IXn3hl89w5PfOZjkIxpp1+DTtZGSJsqI7vvs7C9JXnrj81J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049266; c=relaxed/simple;
	bh=q+s5GuXXXawx2WzxaP99zhgP3tdxt9cIbKhvFkhQgXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCC9YNegYoXhnz57L6yNPDMDrbDhj1cvAGx3qZa2enxKMnIIhKhhGIgUZGsum8b5hhx46K9Ji1nxV5hHrwmx2dXMar+9Q62SVYV8b1cj17VuU+wuJSloZ/fkiiVC+2q/+T3n6ffO+4Hk2iI1hdssJlRyt0hKywcA7CUzRkvjFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=QHjyg/CY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso1411026f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1728049263; x=1728654063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJJaYG/UjcPI9Vu1xZCbyJCG1qpp93Sl6ieZKzkzV10=;
        b=QHjyg/CYUmdEt0CE1hn5QeW59VOcvaIscoMCcf940fYH635FdiGz1T/zRvWLQrSxKz
         Mto2D4jQUBZZrS3/fcEA3QZr3Y+6jeqPLOW3LmxcmiluAEBCCp/fiRLwxAqbinYEEixv
         je/1AsC1Cy24H6SYB2CBBqtSJzdrfFDlJoc2R+7tnAD1f467dudkAtoxalLgxjThygjO
         EKO61o4Ms5QKvCyRlfQl7mlp600QE/yrhNtNKq5HWavOS9kXJ5ME/qv72jRXBda/v5ST
         EEiZzFL0NrjJFd+8ckYGxjkSA470Qw7IyyWgLKdPD0tsQB6pOLPsLPc1IDp1MHF/0YZ+
         yiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049263; x=1728654063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJJaYG/UjcPI9Vu1xZCbyJCG1qpp93Sl6ieZKzkzV10=;
        b=sJcmCpPgm5Bs7Wm0AqtnpYzEc8RUx/MCGM4yfC7HSWnQIFqZALplv9ybhq+E+a3yVL
         II1gf7UjqbKet4dsHub2eQN0n+ZN8SkQUyrYdrlqa0tA146ycN4uPWM/QDyk+Cr7DvwT
         7wRq65/UFSgeoEZykM8WxjTjBdbizopJweVppfl/0bvDf9dekJHtBM8Tze/6MzvdItvb
         yopGz3mSEFOdpJ6aBmfIUckqv/Hpe7BRa4ldcZGuRvZodaMD1iSq0fuRwWX221Fj0K1i
         2DYz2Pe3KvA7JYGyhCSHivsgjcekEQWysxvWr1LdB6mpnbqiy1SP4sWxS/E6d2sclhtG
         ZsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXDNHi4WAqOlZUMyhzp9BPvO4zz7TpRWN6tz9itc6g1nuTRCcGZQqIjLOPwYVj/HsG5HsYr7AWbaubzK8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ayuIAv7fryrm/G14qVLgu4AQqcYvKbLm7XKn2bpCXVR4Q1c5
	daTTI85MQ5DRGW+6rcRX+ZcdqzBtSdM/Rw46Jsra0P2zZN833jXjPUUh0UnhmhY=
X-Google-Smtp-Source: AGHT+IG4vBGF4NpEzfHeDyzIbE6mmFfjm+kFefPRmd5EuR7GcJ/3YlWKWt2QrBk+FicBBqpl77sSaA==
X-Received: by 2002:a5d:68cc:0:b0:37c:d20e:37c with SMTP id ffacd0b85a97d-37d0e8de7f9mr1579644f8f.36.1728049262455;
        Fri, 04 Oct 2024 06:41:02 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0822995fsm3291067f8f.38.2024.10.04.06.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:41:01 -0700 (PDT)
Message-ID: <6657b080-f41e-4c95-8895-e474f1ca5d57@ursulin.net>
Date: Fri, 4 Oct 2024 14:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/drm_file: Add display of driver's internal
 memory size
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
 <20241002234531.3113431-2-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241002234531.3113431-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Adrian,

On 03/10/2024 00:45, Adrián Larumbe wrote:
> Some drivers must allocate a considerable amount of memory for bookkeeping
> structures and GPU's MCU-kernel shared communication regions. These are
> often created as a result of the invocation of the driver's ioctl()
> interface functions, so it is sensible to consider them as being owned by
> the render context associated with an open drm file.
> 
> However, at the moment drm_show_memory_stats only traverses the UM-exposed
> drm objects for which a handle exists. Private driver objects and memory
> regions, though connected to a render context, are unaccounted for in their
> fdinfo numbers.
> 
> Add a new drm_memory_stats 'internal' memory category.
> 
> Because deciding what constitutes an 'internal' object and where to find
> these are driver-dependent, calculation of this size must be done through a
> driver-provided function pointer, which becomes the third argument of
> drm_show_memory_stats. Drivers which have no interest in exposing the size
> of internal memory objects can keep passing NULL for unaltered behaviour.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/drm_file.c              | 6 +++++-
>   drivers/gpu/drm/msm/msm_drv.c           | 2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
>   drivers/gpu/drm/v3d/v3d_drv.c           | 2 +-
>   include/drm/drm_file.h                  | 7 ++++++-
>   5 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ad1dc638c83b..937471339c9a 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -856,6 +856,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>   	print_size(p, "total", region, stats->private + stats->shared);
>   	print_size(p, "shared", region, stats->shared);
>   	print_size(p, "active", region, stats->active);
> +	print_size(p, "internal", region, stats->internal);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>   		print_size(p, "resident", region, stats->resident);
> @@ -873,7 +874,7 @@ EXPORT_SYMBOL(drm_print_memory_stats);
>    * Helper to iterate over GEM objects with a handle allocated in the specified
>    * file.
>    */
> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
>   {
>   	struct drm_gem_object *obj;
>   	struct drm_memory_stats status = {};
> @@ -919,6 +920,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   	}
>   	spin_unlock(&file->table_lock);
>   
> +	if (func)
> +		func(&status, file);
> +
>   	drm_print_memory_stats(p, &status, supported_status, "memory");
>   }
>   EXPORT_SYMBOL(drm_show_memory_stats);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index edbc1ab0fbc8..2b3feb79afc4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
>   
> -	drm_show_memory_stats(p, file);
> +	drm_show_memory_stats(p, file, NULL);
>   }
>   
>   static const struct file_operations fops = {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 04d615df5259..aaa8602bf00d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -609,7 +609,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>   
> -	drm_show_memory_stats(p, file);
> +	drm_show_memory_stats(p, file, NULL);
>   }
>   
>   static const struct file_operations panfrost_drm_driver_fops = {
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index fb35c5c3f1a7..314e77c67972 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -195,7 +195,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   			   v3d_queue_to_string(queue), jobs_completed);
>   	}
>   
> -	drm_show_memory_stats(p, file);
> +	drm_show_memory_stats(p, file, NULL);
>   }
>   
>   static const struct file_operations v3d_drm_fops = {
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8c0030c77308..661d00d5350e 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -469,6 +469,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
>    * @resident: Total size of GEM objects backing pages
>    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
>    * @active: Total size of GEM objects active on one or more engines
> + * @internal: Total size of GEM objects that aren't exposed to user space
>    *
>    * Used by drm_print_memory_stats()
>    */
> @@ -478,16 +479,20 @@ struct drm_memory_stats {
>   	u64 resident;
>   	u64 purgeable;
>   	u64 active;
> +	u64 internal;

So equally as in the last round of discussion back in June, internal in 
my mind still does not fit alongside the categories.

Reason is that in some drivers, at least such as i915, "internal" can be:

a) Backed by either system memory or device memory - so this does not 
provice that visibility;

b) They can also be resident or not, active or not, etc - so from that 
angle it also does not fit.

Do you lose anything if you add the internal objects into their 
respective regions and under the existing categories? Like do you have 
an use case in mind which needs to be able to distinguish between 
userspace and internal, or the problem simply is internal are 
unaccounted for?

Regards,

Tvrtko

>   };
>   
>   enum drm_gem_object_status;
>   
> +typedef void (*internal_bos)(struct drm_memory_stats *status,
> +			     struct drm_file *file);
> +
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region);
>   
> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);

