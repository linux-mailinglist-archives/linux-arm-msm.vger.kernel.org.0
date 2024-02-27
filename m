Return-Path: <linux-arm-msm+bounces-12765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72865869EB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 19:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 124351F23017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 18:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D994F5E6;
	Tue, 27 Feb 2024 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g3bMKRZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33E145354
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057705; cv=none; b=h5G8rWoePlrA6ec+KzM96yj3GXSw5FUdbAVID+bQbSwS44oBuLxDTl6R7FyErwZ39Y4RMpOQVWy7UJK2eWt4HPQHABky2uU1uj5Dc7LKnGJX3iiUq3uxBdGJYVlNbEOyW2iRzUW9Ae0kIz6SmJtAQr+aqg6vxukvuTN2j2eYnZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057705; c=relaxed/simple;
	bh=+YGlht2j8DKNiyJTxizt7m7K6VT5e57wafvM3lFhmI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYef12y/VDOjSoZSZsnknwL+aMGpXx8bDRozk7+xZkSdGcHerPaHTsTPS4AL4GCNQyOMrSXZdP9goWH6NLliHEmzOSjfUi2b3spd+UWVVR1v2+gve9MmL2P6tocrtq+fkJLwLjd5PlPvpFJLW9urq4Rf6yol4WVGVOjFvihSslM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g3bMKRZR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709057701;
	bh=+YGlht2j8DKNiyJTxizt7m7K6VT5e57wafvM3lFhmI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3bMKRZR8z46141kcoZ+/3ISYqCWcnf2sDx309BP6HtZ5OMyM1xvUwcax9hAxy/B5
	 91N9GfiPOvoR2alFxNnQpooyTqAtUmAs7HqMK4pX8L7whYcPnyjZUgKN1r8u4hdUH+
	 UJyn17e6HXA+5rPlTmHYhxPngj5uSP3icELO1rnNY5dGY7bN42Ot7nvW4LvB+ot4SJ
	 CAUG+el9HsuiCmXP9KodUlbfOb8o2QlAVUATRalEsdXHFC1EaJ+nxfqwvOz5fR26aK
	 b7fTsR1RrX7ubrIkRzSSVbLTTyjQTwLI9hmQapb+GkZp7FmwoVVsFrg2CWGAe2iGdc
	 bLXAlX4YE+fZQ==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CDEBB378000B;
	Tue, 27 Feb 2024 18:14:59 +0000 (UTC)
Message-ID: <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
Date: Tue, 27 Feb 2024 21:14:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Thank you for the patches!

On 2/27/24 13:14, Thomas Zimmermann wrote:
> Dma-buf locking semantics require the caller of pin and unpin to hold
> the buffer's reservation lock. Fix DRM to adhere to the specs. This
> enables to fix the locking in DRM's console emulation. Similar changes
> for vmap and mmap have been posted at [1][2]
> 
> Most DRM drivers and memory managers acquire the buffer object's
> reservation lock within their GEM pin and unpin callbacks. This
> violates dma-buf locking semantics. We get away with it because PRIME
> does not provide pin/unpin, but attach/detach, for which the locking
> semantics is correct.
> 
> Patches 1 to 8 rework DRM GEM code in various implementations to
> acquire the reservation lock when entering the pin and unpin callbacks.
> This prepares them for the next patch. Drivers that are not affected
> by these patches either don't acquire the reservation lock (amdgpu)
> or don't need preparation (loongson).
> 
> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
> internally it still gets the reservation lock.
> 
> With the updated GEM callbacks, the rest of the patchset fixes the
> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
> GEM buffer object inplace while updating its content. This required
> a implicit pinning and apparently amdgpu didn't do this at all.
> 
> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
> The former function map a GEM buffer into the kernel's address space
> with regular vmap operations, but keeps holding the reservation lock.
> The _vunmap_local() helper undoes the vmap and releases the lock. The
> updated GEM callbacks make this possible. Between the two calls, the
> fbdev emulation can update the buffer content without have the buffer
> moved or evicted. Update fbdev-generic to use vmap_local helpers,
> which fix amdgpu. The idea of adding a "local vmap" has previously been
> attempted at [3] in a different form.
> 
> Patch 11 adds implicit pinning to the DRM client's regular vmap
> helper so that long-term vmap'ed buffers won't be evicted. This only
> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
> there are no practical changes.
> 
> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
> operations in gem-vram and qxl. These pin operations are not supposed
> to be part of vmap code, but were required to keep the buffers in place
> for fbdev emulation. With the conversion o ffbdev-generic to to
> vmap_local helpers, that code can finally be removed.

Isn't it a common behaviour for all DRM drivers to implicitly pin BO
while it's vmapped? I was sure it should be common /o\

Why would you want to kmap BO that isn't pinned?

Shouldn't TTM's vmap() be changed to do the pinning?

I missed that TTM doesn't pin BO on vmap() and now surprised to see it.
It should be a rather serious problem requiring backporting of the
fixes, but I don't see the fixes tags on the patches (?)

-- 
Best regards,
Dmitry


