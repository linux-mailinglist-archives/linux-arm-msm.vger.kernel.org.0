Return-Path: <linux-arm-msm+bounces-33751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5949978C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 00:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37D6DB2122B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 22:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41D218FDBA;
	Wed,  9 Oct 2024 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="PaZNmLte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC16C18F2FC;
	Wed,  9 Oct 2024 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728514577; cv=pass; b=a+XTYV5Jz83pjc04Gt7iECW2+zta1NxGwkJ3OA7oqHJlJT50ZXm/MRhEsHmaXG+lpdoYd7Hr53cmjWJYZ83fpKBqksBWPHAugqBouwaepEIP8Qw0U5Awmp/5F6vZClO+9Lh8h6lcMcGurkqhQEQbEBpCGtHU7wx074P3KEMv3xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728514577; c=relaxed/simple;
	bh=yE1rZIo3E/Toun7wX6Ecdmc7ChH4P6ILG24RQmUa1Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJQarrybK/xpTrwqrYohuI02rM2vRn6EU8RYHkTTAYUpO6XhFrkJzPP14JYCsODiDzz64KoNs0718NAQmlZyF9C/bzn2isL653xjy8YYdueqyfESa9UADY0QweDpHq4xnIOaIkePSh1DwiTdKrNkio4Uf++kNDy3AzQ252kxt8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=PaZNmLte; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728514538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUesha8SHdPAHVhLiLtDRW0TXqjdgzPdfC43e61M2zCsijYK1t+QpGpL21h0/v8+8SuOROFbCXxn3pOCgklnQ0MeScjlawZjy9Fn+X6BZ4AjgU4s29eeF6U8jbS1UbEyLxN0UY4KegtVW7yPObA0SVAX4w6cRxTSn+Zrfrkzsfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728514538; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PXssO+biKbwIasNE4HQSRnAyDM7ExSQeChAR/lUmpCg=; 
	b=PmUDo7mI0ODegC9/XZUOVmLGvF+E2k1Opl+LV/N6wp57CzAhQLUFtaaPV9U/rXYsubp3TAZJFR+e2MGBNgHNWHmJXok4SxeRruN+bf/9VSVIAiP7zbTanyVjwYNZmq8ULuhTbnMTu2g1JReZRTzotAXVECOwSmtEyxWvjQXHXcs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728514538;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=PXssO+biKbwIasNE4HQSRnAyDM7ExSQeChAR/lUmpCg=;
	b=PaZNmLte5+j7AkQ6NY+3YPYW/Nit+VMaoxKBrNYt5kyzgy5EaVKV5YmscQYhvK8H
	izAbDE05dZyjyqk2uvP4frC7RhJy3jFmTi7mXDGji1WHVvfik3+iulnCZKkwd4BIEEP
	J5GnekpeTAUy6wLAm2XVSQUkBaLmijCQt7AJc8TU=
Received: by mx.zohomail.com with SMTPS id 172851453633836.10559158604838;
	Wed, 9 Oct 2024 15:55:36 -0700 (PDT)
Date: Wed, 9 Oct 2024 23:55:31 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, 
	Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/2] drm/drm_file: Add display of driver's internal
 memory size
Message-ID: <p72rfjerzsg4wsp6rgfcoo5fmlu77jmzdynosflj2hlos63pql@mnetv3t66wsc>
References: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
 <20241002234531.3113431-2-adrian.larumbe@collabora.com>
 <6657b080-f41e-4c95-8895-e474f1ca5d57@ursulin.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6657b080-f41e-4c95-8895-e474f1ca5d57@ursulin.net>

Hi Tvrtko,

On 04.10.2024 14:41, Tvrtko Ursulin wrote:
> 
> Hi Adrian,
> 
> On 03/10/2024 00:45, Adrián Larumbe wrote:
> > Some drivers must allocate a considerable amount of memory for bookkeeping
> > structures and GPU's MCU-kernel shared communication regions. These are
> > often created as a result of the invocation of the driver's ioctl()
> > interface functions, so it is sensible to consider them as being owned by
> > the render context associated with an open drm file.
> > 
> > However, at the moment drm_show_memory_stats only traverses the UM-exposed
> > drm objects for which a handle exists. Private driver objects and memory
> > regions, though connected to a render context, are unaccounted for in their
> > fdinfo numbers.
> > 
> > Add a new drm_memory_stats 'internal' memory category.
> > 
> > Because deciding what constitutes an 'internal' object and where to find
> > these are driver-dependent, calculation of this size must be done through a
> > driver-provided function pointer, which becomes the third argument of
> > drm_show_memory_stats. Drivers which have no interest in exposing the size
> > of internal memory objects can keep passing NULL for unaltered behaviour.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/drm_file.c              | 6 +++++-
> >   drivers/gpu/drm/msm/msm_drv.c           | 2 +-
> >   drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
> >   drivers/gpu/drm/v3d/v3d_drv.c           | 2 +-
> >   include/drm/drm_file.h                  | 7 ++++++-
> >   5 files changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index ad1dc638c83b..937471339c9a 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -856,6 +856,7 @@ void drm_print_memory_stats(struct drm_printer *p,
> >   	print_size(p, "total", region, stats->private + stats->shared);
> >   	print_size(p, "shared", region, stats->shared);
> >   	print_size(p, "active", region, stats->active);
> > +	print_size(p, "internal", region, stats->internal);
> >   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> >   		print_size(p, "resident", region, stats->resident);
> > @@ -873,7 +874,7 @@ EXPORT_SYMBOL(drm_print_memory_stats);
> >    * Helper to iterate over GEM objects with a handle allocated in the specified
> >    * file.
> >    */
> > -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> > +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
> >   {
> >   	struct drm_gem_object *obj;
> >   	struct drm_memory_stats status = {};
> > @@ -919,6 +920,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> >   	}
> >   	spin_unlock(&file->table_lock);
> > +	if (func)
> > +		func(&status, file);
> > +
> >   	drm_print_memory_stats(p, &status, supported_status, "memory");
> >   }
> >   EXPORT_SYMBOL(drm_show_memory_stats);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index edbc1ab0fbc8..2b3feb79afc4 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >   	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
> > -	drm_show_memory_stats(p, file);
> > +	drm_show_memory_stats(p, file, NULL);
> >   }
> >   static const struct file_operations fops = {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 04d615df5259..aaa8602bf00d 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -609,7 +609,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >   	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> > -	drm_show_memory_stats(p, file);
> > +	drm_show_memory_stats(p, file, NULL);
> >   }
> >   static const struct file_operations panfrost_drm_driver_fops = {
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> > index fb35c5c3f1a7..314e77c67972 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > @@ -195,7 +195,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >   			   v3d_queue_to_string(queue), jobs_completed);
> >   	}
> > -	drm_show_memory_stats(p, file);
> > +	drm_show_memory_stats(p, file, NULL);
> >   }
> >   static const struct file_operations v3d_drm_fops = {
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 8c0030c77308..661d00d5350e 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -469,6 +469,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
> >    * @resident: Total size of GEM objects backing pages
> >    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
> >    * @active: Total size of GEM objects active on one or more engines
> > + * @internal: Total size of GEM objects that aren't exposed to user space
> >    *
> >    * Used by drm_print_memory_stats()
> >    */
> > @@ -478,16 +479,20 @@ struct drm_memory_stats {
> >   	u64 resident;
> >   	u64 purgeable;
> >   	u64 active;
> > +	u64 internal;
> 
> So equally as in the last round of discussion back in June, internal in my
> mind still does not fit alongside the categories.
> 
> Reason is that in some drivers, at least such as i915, "internal" can be:
> 
> a) Backed by either system memory or device memory - so this does not provice
> that visibility;
> 
> b) They can also be resident or not, active or not, etc - so from that angle
> it also does not fit.
> 
> Do you lose anything if you add the internal objects into their respective
> regions and under the existing categories? Like do you have an use case in
> mind which needs to be able to distinguish between userspace and internal, or
> the problem simply is internal are unaccounted for?

The main use case we have in mind is exposing the size of driver buffer
allocations that are triggered in respone to an ioctl(), and so linked to an
open file. I gave a summary of what these could be in the patch description, but
in Panthor's case all these allocations are done with drm shmem functions
because it makes it easier to retrieve the sgtable that gives us their system
memory layout so that we can more easily map them onto the MMU's address space
for a Pantor VM. These BO's, though managed by the drm shmem API, are never
added to the open file list of user-exposed drm objects but we would still like
to tell UM how much memory they take up.

In the case of Panthor, they all add into the resident tally because all these
internal BO's are immediately pinned so that they can also be accessed by the
HW, but it doesn't have to be so for other drivers which might also keep track
of similar allocations.

I think maybe naming that tag as 'internal' is a bit of a misnomer and I could
pick one that more accurately represents its meaning? Something like 'file-internal'
or else 'file-private'.

Regarding a), I don't think where the allocations happen (system or device memory)
is relevant in this case, just that the allocations are tied to an open file, but
not exposed to UM through a DRM buffer object handle.

Regards,
Adrian

> Regards,
> 
> Tvrtko
> 
> >   };
> >   enum drm_gem_object_status;
> > +typedef void (*internal_bos)(struct drm_memory_stats *status,
> > +			     struct drm_file *file);
> > +
> >   void drm_print_memory_stats(struct drm_printer *p,
> >   			    const struct drm_memory_stats *stats,
> >   			    enum drm_gem_object_status supported_status,
> >   			    const char *region);
> > -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
> > +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
> >   void drm_show_fdinfo(struct seq_file *m, struct file *f);
> >   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);

