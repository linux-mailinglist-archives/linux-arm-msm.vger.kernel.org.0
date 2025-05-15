Return-Path: <linux-arm-msm+bounces-58041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1AAB81A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 10:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498CF1BC2F0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5A2289352;
	Thu, 15 May 2025 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtnPOeib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB71FCFFC;
	Thu, 15 May 2025 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299273; cv=none; b=D7l9udZxg7F+mj+9NsFvRzwAG7tgQJ9haxITfPF0NuCnahxPnZQqrEsaSW920g43Uc5KFmODEcX+yYbgy3CNafjI1wN0YT3ZNYS2/DrxNfgH+4Eoo1tin2U594ORCZ8sf+5gcCD5ArlAYN7MCHDvghbLyQIMew+4RAgj3TLSFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299273; c=relaxed/simple;
	bh=h+VsUgSmErOy2grzt87OXyIDJW5HdE1chW0emZWQhC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADvv3CRrhPdhLtUkrzyZ0V4mdGf7W3IJajT0svI6onqXm5IFM9G6Hmq44Ksi08wpQNXMFLTLfC5xTprseDJHSB8swS2M127Zgdlc5dhkRwmtRHVuFG490aduINyIA8PIWQFDODS9jxJAEvpAX+eqTIUeObXAMWD+ex0YhChvM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtnPOeib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993EAC4CEE7;
	Thu, 15 May 2025 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299273;
	bh=h+VsUgSmErOy2grzt87OXyIDJW5HdE1chW0emZWQhC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtnPOeib6y06l+qlV9LfdW2QLTo13UdK1gBQz/g7xaT68XnvnR/KQyA3UswXqZN8C
	 ZlBBZ5bPPyfll8IolsEuRy+E1tPBs/yBVsyDt4ijeB7GbCNnlyiW9/RGbD4rkNO1oh
	 qNGp5nNKLC8yR+SPyCK9gzj8pwno6kweYcBc0Ne+Yf0kwetrO3J2aMZo3WfYo3uT22
	 qNa/cvg9R5mpyzD4uEoAl0AkmODpatVQyXOCCNswt6HsXjQK1+cf4Cuwz6RxIMO/7z
	 yiXh0Mgui0krxVSfYz++H+cEscRoZkf3g34tv2BzauqzgXCf5XZhBdU9w/23w+ehlN
	 dxGHp+tDs2SbA==
Date: Thu, 15 May 2025 10:54:27 +0200
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
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCWrwz2IF6VBUi4e@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514175527.42488-2-robdclark@gmail.com>

Hi Rob,

Can you please CC me on patches for GPUVM?

On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> msm_gem_free_object()") for justification.

Please write a proper commit message that explains the problem and the solution.
Please don't just refer to another commit and leave it to the reviewer of the
patch to figure this out.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)


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
> +
>  	list_del(&vm_bo->list.entry.gem);

This seems wrong.

A VM_BO object keeps a reference of the underlying GEM object, so this should
never happen.

This function calls drm_gem_object_put() before it returns.

>  
>  	if (ops && ops->vm_bo_free)
> @@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
>  	if (unlikely(!obj))
>  		return;
>  
> -	drm_gem_gpuva_assert_lock_held(obj);
> +	if (kref_read(&obj->refcount) > 0)
> +		drm_gem_gpuva_assert_lock_held(obj);
>  	list_del_init(&va->gem.entry);
>  
>  	va->vm_bo = NULL;
> -- 
> 2.49.0
> 

