Return-Path: <linux-arm-msm+bounces-58044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12540AB81F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEAF218826C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E995A28C858;
	Thu, 15 May 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OND4TY4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14092882A5;
	Thu, 15 May 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299966; cv=none; b=HxLKo2SxXpcKwCvAN3mxQQyAqj07fjLvpJC4fRTWlz9Q4hN6BISV1AgBvuUHlPvi+vRzpUE7CeJ5dsyJGx/jJd8uuaVe+7+AJbQ+m+a1Ju5zBw+HYxFd1soXwLwrjb917RA2+6Ytr8nddQcF7D/u9cpDI+O3uqZfsCF+SDzik50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299966; c=relaxed/simple;
	bh=KVY2YR7khCYNOCGLba4NVihio2a5hTYB8gCPwnroNdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBu/mCRpHC3G1sSH07AEhJDEfTUAe1T2WVvSndKVAkG84nW/wv/oUdBM7wz0VBVLcTFVb5v34xjP0p5FLm6KgWbmdtGWT4EpxPVNG1hNRn+6vo2z7lk/DHb5r+NYXcZRJjCC7A4Sd1DtVUTaDkJZHGnk7dtf5xVLOL8fdgliSZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OND4TY4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A383EC4CEE7;
	Thu, 15 May 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299966;
	bh=KVY2YR7khCYNOCGLba4NVihio2a5hTYB8gCPwnroNdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OND4TY4xJq4Hnv4qPFKzx89EsiDAYuzN/vQh+XCTq1XkESWagGO7QkZWuyq6aH06x
	 0nfBBBBAQoV9ELVRL60bJoCLtuj+W5tucWLqRMarMn8pXSkc08c4f0LSmKU5wwqwQM
	 6KrtbXvA6YxpgjnOtDcqP50HnMkk3MFBdDfIg8WZTFxZmYjtUyz93jDpTjaFH5SCRW
	 XmkZgcIHjdCD6K3RffNQSUED2duOj/IuG5bxjFKswmvsNIXwsEEY/t5JtwKoRjURb1
	 1C9xR5VrKixOOnwk91no+2nJ+/e4MlX10zDAQZGEifuttyKzsUTjNP/0GyxbiRkv2W
	 NgMEwTOey4Slw==
Date: Thu, 15 May 2025 11:06:00 +0200
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
Message-ID: <aCWueFzx2QzF7LVg@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCWrwz2IF6VBUi4e@pollux>

On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> Hi Rob,
> 
> Can you please CC me on patches for GPUVM?
> 
> On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > msm_gem_free_object()") for justification.
> 
> Please write a proper commit message that explains the problem and the solution.
> Please don't just refer to another commit and leave it to the reviewer of the
> patch to figure this out.
> 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> 
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index f9eb56f24bef..1e89a98caad4 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> >  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> >  
> > -	drm_gem_gpuva_assert_lock_held(obj);
> > +	if (kref_read(&obj->refcount) > 0)
> > +		drm_gem_gpuva_assert_lock_held(obj);
> > +
> >  	list_del(&vm_bo->list.entry.gem);
> 
> This seems wrong.
> 
> A VM_BO object keeps a reference of the underlying GEM object, so this should
> never happen.
> 
> This function calls drm_gem_object_put() before it returns.

I noticed your subsequent patch that allows VM_BO structures to have weak
references to GEM objects.

However, even with that this seems wrong. If the reference count of the GEM
object is zero when drm_gpuvm_bo_destroy() is called it means that the GEM
object is dead. However, until drm_gpuvm_bo_destroy() is called the GEM object
potentially remains to be on the extobj and eviced list, which means that other
code paths might fetch it from those lists and consider it to be a valid GEM
object.

