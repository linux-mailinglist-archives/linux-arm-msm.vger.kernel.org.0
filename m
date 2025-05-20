Return-Path: <linux-arm-msm+bounces-58739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D414EABDF98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD35D17A30B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF91926A1D0;
	Tue, 20 May 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSlxBEzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764A2698AF;
	Tue, 20 May 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756187; cv=none; b=n1C55x/xytBIDq33FeAfqVMfEDeRFRYNj1EPCmNTHPee9KdqCYDUItjSb+1WQNDh1Bm+ashLXIkDAHO6I9jgPzs/r2q7XZ9SwRtJR+MtV4choTrIevvJEyiHBVPDJF9OGZqQwpsVrKy9YMUovZctPaDxf0tfQCW7xhPA4L+2kYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756187; c=relaxed/simple;
	bh=ThTfQqMrAs4ZQpPhlGrpY2Kxwn6p2cq77iDNGME5dEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OydwmEfOQ5ehTLEYQ2oo+owOuZd4EX3FZEVr8HXKuzCvDNcXHie0L73f8wxe0jq1i6w+yGIWbXDSY/2bopdiOFuOuU0OEp2sRXSmpEuTdePscK/+tDnmzwTo08SDSbp0mo0jJmYxyNFu1ZlBMSpD92rOoAJIPaU3Pi3wdGw22mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSlxBEzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E9DC4CEF1;
	Tue, 20 May 2025 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756187;
	bh=ThTfQqMrAs4ZQpPhlGrpY2Kxwn6p2cq77iDNGME5dEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSlxBEzZI+QEDeMiGnjbY3b/GQ7sDX0iUf2gZvHnwIwJFErgWUpYBnCJ/ADxz764U
	 8usa3GJpuvpAUQoTCC57B8Dfgy3O3nWXO8BQUZFBruohK30b9mpP4MkV9GNkLpV/s7
	 l0MYY7SY+DUCqt8oLl3I1O7ahUEEPoVKYUk2sNf2dx5QgfFwKoQZ4g8EhJCXKpeDEW
	 +0eRD1VmnS/5CCi/IiiX1RHpvTurH7ozqxGL9o3LYfUIZcX+q6Lk0SidLjuSsqSGa0
	 NS9EIhNuJHijVRy1eTmJ8HSzLswavb2ZZpv0IIg1PM+kuKJDwefs2uw7Ywt8bpGqyb
	 0bCP1S1RUi1Ug==
Date: Tue, 20 May 2025 17:49:42 +0200
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
Message-ID: <aCyklmgRUq1wGb5S@cassiopeiae>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux>
 <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
 <aCyeAb0vnQqPVbiz@cassiopeiae>
 <CAF6AEGvegfkAeMA9-3PZN3wectQwt7=YVHoDxoK2fJcjOLbH2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvegfkAeMA9-3PZN3wectQwt7=YVHoDxoK2fJcjOLbH2g@mail.gmail.com>

On Tue, May 20, 2025 at 08:45:24AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 8:21 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, May 20, 2025 at 07:57:36AM -0700, Rob Clark wrote:
> > > On Tue, May 20, 2025 at 12:23 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > > >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > > >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > > >
> > > > > -     drm_gem_gpuva_assert_lock_held(obj);
> > > > > +     if (kref_read(&obj->refcount) > 0)
> > > > > +             drm_gem_gpuva_assert_lock_held(obj);
> > > >
> > > > Again, this is broken. What if the reference count drops to zero right after
> > > > the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is called?
> > >
> > > No, it is not.  If you find yourself having this race condition, then
> > > you already have bigger problems.  There are only two valid cases when
> > > drm_gpuvm_bo_destroy() is called.  Either:
> > >
> > > 1) You somehow hold a reference to the GEM object, in which case the
> > > refcount will be a positive integer.  Maybe you race but on either
> > > side of the race you have a value that is greater than zero.
> > > 2) Or, you are calling this in the GEM object destructor path, in
> > > which case no one else should have a reference to the object, so it
> > > isn't possible to race
> >
> > What about:
> >
> > 3) You destroy the VM_BO, because the VM is destroyed, but someone else (e.g.
> >    another VM) holds a reference of this BO, which is dropped concurrently?
> 
> I mean, that is already broken, so I'm not sure what your point is?

No, it's not. In upstream GPUVM the last thing drm_gpuvm_bo_destroy() does is
calling drm_gem_object_put(), because a struct drm_gpuvm_bo holds a reference to
the GEM object.

The above is only racy with your patch that disables this reference count and
leaves this trap for the caller.

> 
> This patch is specifically about the case were VMAs are torn down in
> gem->free_object().
> 
> BR,
> -R
> 
> > Please don't tell me "but MSM doesn't do that". This is generic infrastructure,
> > it is perfectly valid for drivers to do that.
> >
> > > If the refcount drops to zero after the check, you are about to blow
> > > up regardless.
> >
> > Exactly, that's why the whole approach of removing the reference count a VM_BO
> > has on the BO, i.e. the proposed DRM_GPUVM_VA_WEAK_REF is broken.
> >
> > As mentioned, make it DRM_GPUVM_MSM_LEGACY_QUIRK and get an approval from Dave /
> > Sima for it.
> >
> > You can't make DRM_GPUVM_VA_WEAK_REF work as a generic thing without breaking
> > the whole design and lifetimes of GPUVM.
> >
> > We'd just end up with tons of traps for drivers with lots of WARN_ON() paths and
> > footguns like the one above if a driver works slightly different than MSM.

