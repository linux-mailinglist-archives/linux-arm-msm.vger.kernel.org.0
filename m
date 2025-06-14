Return-Path: <linux-arm-msm+bounces-61284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E7AD9C2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 12:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09BF67A7904
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 10:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD5B1F2C45;
	Sat, 14 Jun 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrO+aVBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B661552FA
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897545; cv=none; b=hRJGkGT2tQsqt4AmCam7XNg1xoLy7K5AX3oQqcbZ1eVOwUm4bgRCDE0xg1roYbyh1o9D00yYavIYtvWOuZxlHOwF8dZgUVIXgyKg/qEFezToyjz7cVEOoKQtRIt7wzEfBMgV82y07QidaKqPn81UDov91weCx7l5kcyFo9UW1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897545; c=relaxed/simple;
	bh=pPgjRoj5orgLQLzyVoWNsFO95k32W7oj9FSd8YcExp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMMuf+YnW/aGaQmRn0JRViUwMkJNN0296RZvlL/7k+baM1+D+9at2hjHwf7Phic8PO+WN21jcs5EVSOmkmknYnIDyOKaCHwNKIa+d7Gl0JZc9tR1t1ODaE9/Bborc8HmZI2jBiaaIfWTxgipjuuiBYkZpxfQraD48STTWaUXSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrO+aVBE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749897542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
	b=WrO+aVBEOKaq+olIyXLVx3KOynbP1innw8Yh4SjOTS/UzkBbRA5mv1k1Z8Hh9PeH3slZ3Z
	95mAkckPG9/1bnyzQ/C1KLXNHIzGsQqfNR/7b0RVb6Tu5ecsBS2SrnCaz0Tl0rUZCN2n4P
	+NwmYFcr2eDIjnHrEpbnpUW7Df+SC5M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-t94l5yTrMSOHK0yvToBmVQ-1; Sat, 14 Jun 2025 06:38:58 -0400
X-MC-Unique: t94l5yTrMSOHK0yvToBmVQ-1
X-Mimecast-MFC-AGG-ID: t94l5yTrMSOHK0yvToBmVQ_1749897537
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5780e8137so125153f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 03:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749897537; x=1750502337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
        b=UNtk+BWgjzdDyUqBu4DTz63nZPQ4ItUV/M5E8d1EE8u3hLBomd3Z0wrwFTh8iLaG+e
         k3RjybY+n+uqxNUld/GwKm5jjHch/47q9SHe+xnrB3XLZz+XPXlIoOLLPU3K5RELaIjT
         0Sh1cFTdIpjH6j1ydN7+2DXCrdq7u0ksSdzaxzHOrR6m7onjDHT8/1a9SFPN/Obnwm7f
         qE/4SJYzp+R1Lpm8a0XsJr9yt9Kx73uccwylDe4KqRlaboXy71F6K1kSI2W5r4Af3OJw
         ax7myTs182YcCXEGstd3BqEsEmtLgM8LrmUMBd1LNUEpweuxHElFSE/hzEvKBpbWkK8E
         Rgsg==
X-Forwarded-Encrypted: i=1; AJvYcCUrQ6fcGmHa2zCQ+tG1CagQBbVTfwAvWarnldsGJsoLnnN5jqZX+I/LgdFA39QiyDKbGkOTBGzCvy+9ve7g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78z0FPWti2dVImiIOslfMMPCksvwxzvN6iL38HaI3AA7rGj7F
	lMXxIe0uT8RAR0wtcvJ0WC9P7yWsPNlPZEyIVQY43KKp3me6NJowHwe12CkF6DrWqTDPL3yDiWx
	LJ7xAZ5QPNxRvT/c8NI9SzEx8WjlYTrzRqJJSUE8/TJXT2J3Vd63M5lGtmaLpJb4wx8U=
X-Gm-Gg: ASbGncvTqDhd2Sh1CB0IoQEptvWDmEn91Cg3NqMvg8cdEb2vB3hJIOjCa1pLzPQL0HJ
	XVq797XzStFc0bYgNmPuHAGUXPr/ojykP1HzmDVktTdJ+hVifH1Nn2024+K//0q4QIQidq4+SiF
	PcYbX4VyKxH/+LVKTwV4N6MvQt1as3w99+n3AXXxXVZZn7ThZFDMzaolbgr/+zvJG6QOfY3DqMy
	dyszW1Phk/zEaKu6WN8VhPMiBOzXjXQWSuar9TFopmALEnEODm9Eq6ycLHCOq4jJXYcq6MOfWHV
	isUKY6CqkNc=
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a56d84b061mr4246575f8f.27.1749897536728;
        Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHukkp3GXm05X8ih8L/6TcAy+frWDO/6fM05ksvQmhRxI5FcoJb191KQKxBwD3XgtEhegeu5Q==
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a56d84b061mr4246560f8f.27.1749897536294;
        Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm79561175e9.27.2025.06.14.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:38:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:38:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aE1RPZ_-oFyM4COy@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>

On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.

Yes, that's a common use-case. I think drivers typically iterate through their
drm_gpuva_ops to lock those objects.

I had a look at you link [1] and it seems that you keep a list of ops as well by
calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.

Please note that for exactly this case there is the op_alloc callback in
struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
msm_vm_op) that embedds a struct drm_gpuva_op.

Given that, I think the proposed locking helpers here would make more sense to
operate on struct drm_gpuva_ops, rather than the callbacks.

Besides that, few comments below.

--

One additional unrelated note, please don't use BUG_ON() in your default op
switch case. Hitting this case in a driver does not justify to panic the whole
kernel. BUG() should only be used if the machine really hits an unrecoverable
state. Please prefer a WARN_ON() splat instead.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c?ref_type=heads#L1150

> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.

I'm not sure about this part, how can we be sure that's the case?

> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  8 ++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..197066dd390b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
>  
> +static int
> +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> +{
> +	struct drm_exec *exec = priv;
> +
> +	switch (op->op) {
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.unmap->va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
> +		return 0;
> +	case DRM_GPUVA_OP_UNMAP:
> +		if (op->unmap.va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
> +		return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct drm_gpuvm_ops lock_ops = {
> +	.sm_step_map = drm_gpuva_sm_step_lock,
> +	.sm_step_remap = drm_gpuva_sm_step_lock,
> +	.sm_step_unmap = drm_gpuva_sm_step_lock,
> +};
> +
> +/**
> + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()

I think we should name this drm_gpuvm_sm_map_exec_lock() since it only makes
sense to call this from some drm_exec loop.

> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @num_fences: for newly mapped objects, the # of fences to reserve
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
> + * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> + * will be newly mapped.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +		      struct drm_exec *exec, unsigned int num_fences,
> +		      u64 req_addr, u64 req_range,
> +		      struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	if (req_obj) {
> +		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> +		if (ret)
> +			return ret;
> +	}

Let's move this to drm_gpuva_sm_step_lock().

> +
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> +				  req_addr, req_range,
> +				  req_obj, req_offset);
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);


