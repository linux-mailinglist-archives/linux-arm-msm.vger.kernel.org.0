Return-Path: <linux-arm-msm+bounces-58614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 588D1ABD05A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F881896986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DF525CC46;
	Tue, 20 May 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utsHWFdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D41C84C0;
	Tue, 20 May 2025 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725793; cv=none; b=iSejR4/3BU2p5kmhRKbpLebMwEtMyPZifTb0l3uJV3WmOS785HAs1Vh90K7oiUWFYu3t/cYyAZAgbIRtumHhBUFBQxMpQrKj8pfmtbVNbhgATGammUfvIJHG9V+k1CufnUg8Q6XbELOM2t054t1GxH3GXMsVJQXnk2J4RCh+Cbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725793; c=relaxed/simple;
	bh=axV148epcCnH8V4IUGh3tEhgUD1SmtDSAbyYQaGyLUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faHdx/6g9jMk4eiCl4ILbh87YmblOGEkHZEDoJaXS4JzhRV5dpEE+GHoBbE9Nui4RSbBqeK5SrxvapyoI+9SkYkqCgFWvQh5O9jYf8vx54Gu3omyyN5qSqfUTYgcIAxe5T//i1N8eY3Q9Bt7eBxeNJZMBym4JB87iqp2AceylqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utsHWFdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFF2C4CEE9;
	Tue, 20 May 2025 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725792;
	bh=axV148epcCnH8V4IUGh3tEhgUD1SmtDSAbyYQaGyLUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utsHWFdp+aNZIybpy2w2/kulETWFThZUUGtwqTkkH59zikOi3fzIgH20T0ExBzDS/
	 vbe5Wq5brUWmJCyNOtMSIH8TkgPKhDRaaU1h/IivjV8dTKTv/Mg1thBbqJ/qr2s2Uk
	 I07KmNQokCcfH2NFUAc5Qu2Y4lRhMjNIe4SdDid1tgbmDxWMRZkvsbpdsVicBS4TY/
	 G2Rq8A3zbns2w7FQkSiIH6g07DY7ESqpATWYJOWfD6hXH8uZBgaerRvq1TyxYvOk/T
	 iupLImO3zK8kHdu66CVFNOI1hTVGN4kTB8CICzhVdgqXOzfKX0XxntGQ/LTwTtjOQN
	 NlSai1pVNunDw==
Date: Tue, 20 May 2025 09:23:07 +0200
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
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCwt20O7SH1zQLlV@pollux>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519175348.11924-2-robdclark@gmail.com>

On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> msm_gem_free_object()") for justification.

I asked for a proper commit message in v4.

Only referring to a driver commit and let the people figure out how the driver
works and what it does in order to motivate a change in the generic
infrastructure is simply unreasonable.

> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..1e89a98caad4 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
>  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
>  
> -	drm_gem_gpuva_assert_lock_held(obj);
> +	if (kref_read(&obj->refcount) > 0)
> +		drm_gem_gpuva_assert_lock_held(obj);

Again, this is broken. What if the reference count drops to zero right after
the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is called?

Putting conditionals on a refcount is always suspicious.

If you still really want this, please guard it with

	if (unlikely(gpuvm->flags & DRM_GPUVM_MSM_LEGACY_QUIRK))

and get an explicit waiver from Dave / Sima.

