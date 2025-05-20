Return-Path: <linux-arm-msm+bounces-58618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD569ABD0A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160B71B670C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6DB25DAF9;
	Tue, 20 May 2025 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duhG9Y/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C90625D21A;
	Tue, 20 May 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726853; cv=none; b=XeNS7L8z821IDPYvt5fIS7IE+nhoWUcAnwYKE/6MPXXZ5tDfJAfwMVQ5kM9C1h4iZ5NRlF8Wgdgby38+++1gyh/SGLDopa482xXs+bTVImZ4Tzmay1bk76OR2Lk6HxFaggAHbkv2OJLghnpK6m+/pjDmoM9pIj3Rs1hBKgnPGec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726853; c=relaxed/simple;
	bh=du74CvAlwH4+uIAs8YMtDE8dudviPCVlSuJEObPE4mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fa3dsMEtQEugRRTeX3kOL4rw2NSRSD86V8YdAyHVJtwrCZmAfOnmIISTY/RyTjSLU+gcbRH8e15J7FdEhuxxRZvKn0dKaHDl4Mgd3uR4+7aEu1PVKEaKvdewYTNjkjSWuBdibCcRIfFxBmF+PPLVK5QOOCK+oAO7cItFT22lLmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duhG9Y/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C58C4CEE9;
	Tue, 20 May 2025 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726852;
	bh=du74CvAlwH4+uIAs8YMtDE8dudviPCVlSuJEObPE4mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duhG9Y/rUhQTeP5uq0AvsyPyA05wrS1p6pnd3HTUHErD22cXzXEUD74P0Muc5lzgr
	 pSi6kcm8M6ZmvksEV66bQsu0jMdZLz88XzZ4re6wYkRztJZ2tfnLCI/yzgS5PdteQk
	 xD5zp7EmiwEvIDrXYf/2uUJKV3DkyrUgY64DEYlDme4ovUJrNHVKHZ33zpDTYLBq06
	 16nJ6VpllazGgcoTYBQhc056TzooRD1c3BJ8dph1i8z8VNFhPnQ8/ZW8X24loc2W5y
	 quMPl+RljKtPnzw9Oih2EBowcIPHlu306jTqXVths11vKrLunhSStzKPx8X6gSBMve
	 /dwEblfQ0YSaw==
Date: Tue, 20 May 2025 09:40:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCwx_9KIc9QBd7_0@pollux>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-3-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519175348.11924-3-robdclark@gmail.com>

On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Eases migration for drivers where VAs don't hold hard references to
> their associated BO, avoiding reference loops.
> 
> In particular, msm uses soft references to optimistically keep around
> mappings until the BO is distroyed.  Which obviously won't work if the
> VA (the mapping) is holding a reference to the BO.
> 
> By making this a per-VM flag, we can use normal hard-references for
> mappings in a "VM_BIND" managed VM, but soft references in other cases,
> such as kernel-internal VMs (for display scanout, etc).
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
>  include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
>  2 files changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 1e89a98caad4..892b62130ff8 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>  	LIST_HEAD(extobjs);
>  	int ret = 0;
>  
> +	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);

No, here and below, please don't scatter WARN_ON() calls in various code paths
for this hack.

This won't ever be a valid and supported mode, please keep the diff as small as
possible.

<snip>

> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..652e0fb66413 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
>  	 */
>  	DRM_GPUVM_RESV_PROTECTED = BIT(0),
>  
> +	/**
> +	 * @DRM_GPUVM_VA_WEAK_REF:
> +	 *
> +	 * Flag indicating that the &drm_gpuva (or more correctly, the
> +	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
> +	 * This mode is intended to ease migration to drm_gpuvm for drivers
> +	 * where the GEM object holds a referece to the VA, rather than the
> +	 * other way around.
> +	 *
> +	 * In this mode, drm_gpuvm does not track evicted or external objects.
> +	 * It is intended for legacy mode, where the needed objects are attached
> +	 * to the command submission ioctl, therefore this tracking is unneeded.
> +	 */
> +	DRM_GPUVM_VA_WEAK_REF = BIT(1),

As mentioned in v4, I do *not* agree with making this a valid and supported
mode. If at all, it should be an exception for MSM, i.e.
DRM_GPUVM_MSM_LEGACY_QUIRK with an explicit approval from Dave / Sima [1].

It invalidates the whole design and makes a lot of functions fundamentally
invalid to call, which is well demonstrated by all the WARN_ON() calls this
patch attempts to add.

> +
>  	/**
>  	 * @DRM_GPUVM_USERBITS: user defined bits
>  	 */
> -	DRM_GPUVM_USERBITS = BIT(1),
> +	DRM_GPUVM_USERBITS = BIT(2),
>  };

[1] https://lore.kernel.org/dri-devel/aCb-72KH-NrzvGXy@pollux/

