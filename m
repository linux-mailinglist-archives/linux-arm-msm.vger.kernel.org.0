Return-Path: <linux-arm-msm+bounces-58119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12DAB8E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5989B3ADA40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C9C244679;
	Thu, 15 May 2025 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apcIm3/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0854F8F6E;
	Thu, 15 May 2025 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331474; cv=none; b=aOz42G4Ky6kXwtqou2siM+3kKohvSXBICwoIDTuuJpHf8BX1EjDdaW7dQkXllh/I85pKtRRHMYYoiL5oCi7X1uTV++msiW5eX/SwCioMumeJ5CFRYwDkGxtCjgJVMJ/yUS5fq2uf+IdMuYPbUSI5YbXJjjXGEOuvQsiwaPMWz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331474; c=relaxed/simple;
	bh=WEmiD2qPElaxQs4rm++MltavxTtaRvw54uPnnWldrlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDc/UkwXk5xBiAAnNDkXwMW60O8qVXdN26/vZSWGnozNdwok+PXfgr92t5F/VXlBRRi7pOh62MSS1Xpy7aney61alQOBkY075IhM2x9alAKLDmY6X2rWomOrfMfRx6NgrqOPKOrid8emqltyUNTfDvqGUaxnrhivk4pgafwTYSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apcIm3/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25D4C4CEE7;
	Thu, 15 May 2025 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747331473;
	bh=WEmiD2qPElaxQs4rm++MltavxTtaRvw54uPnnWldrlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apcIm3/Zgw3JdtyllNBhGKu/wxHkUS097f/pylBkpClWGFpBkHX0am9I48La/S2l8
	 vIZGLk2Ow45XRldoeH4aKarsjlvMb7nV6qunZjojO46CHxFaQ5UtaVtqi11KhLAh8n
	 B00ODfyjHk95ExSCHivXJ+uPgJY20gzIEkYbmRhFvNhuTq/h6oXH++2fEYUGHM3p9p
	 BB5S+GlgpFFbK2XbWkkmIft79BqxRwIALRC5yoMvUdYjhb/RwAwwBFMRDKgpuSlKVl
	 dB+myCtZwjXi9bPbL1TiYmMvC7sbVObNV149QlShIoJlXYhh1ErPKVOc9ODvVeDm64
	 UesnVHiAd3Scw==
Date: Thu, 15 May 2025 19:51:08 +0200
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
Subject: Re: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCYpjJPvSOf2RzbU@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
 <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
 <aCYIiJpMe1ljGxqz@pollux>
 <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>

On Thu, May 15, 2025 at 10:34:07AM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 8:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:
> >
> > Thanks for the detailed explanation!
> >
> > > On Thu, May 15, 2025 at 2:00 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >
> > > > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Eases migration for drivers where VAs don't hold hard references to
> > > > > their associated BO, avoiding reference loops.
> > > > >
> > > > > In particular, msm uses soft references to optimistically keep around
> > > > > mappings until the BO is distroyed.  Which obviously won't work if the
> > > > > VA (the mapping) is holding a reference to the BO.
> > > >
> > > > Ick! This is all complicated enough. Allow drivers to bypass the proper
> > > > reference counting for GEM objects in the context of VM_BO structures seems like
> > > > an insane footgun.
> > > >
> > > > I don't understand why MSM would need weak references here. Why does msm need
> > > > that, but nouveau, Xe, panthor, PowerVR do not?
> > >
> > > Most of those drivers were designed (and had their UABI designed) with
> > > gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> > > about nouveau, but I guess it just got lucky that it's UABI semantics
> > > fit having the VMA hold a reference to the BO.
> > >
> > > Unfortunately, msm pre-dates sparse.. and in the beginning there was
> > > only a single global VM, multiple VMs was something retrofitted ~6yrs
> > > (?) back.  For existing msm, the VMA(s) are implicitly torn down when
> > > the GEM obj is freed.  This won't work with the VMA(s) holding hard
> > > references to the BO.
> >
> > Ok, that makes sense to me, but why can't this be changed? I don't see how the
> > uAPI would be affected, this is just an implementation detail, no?
> 
> It's about the behaviour of the API, there is no explicit VMA
> creation/destruction in the uAPI.

But that shouldn't matter? Userspace gives you a BO, the driver creates VMAs
itself, which can have a reference on the VM_BO, which references the original
BO. At this point you can drop the original reference of the BO and just destroy
all corresponding VMAs once the driver fulfilled the request from userspace?

> > > When userspace opts-in to "VM_BIND" mode, which it has to do before
> > > the VM is created, then we don't set this flag, the VMA holds a hard
> > > reference to the BO as it does with other drivers.  But consider this
> > > use-case, which is perfectly valid for old (existing) userspace:
> > >
> > > 1) Userspace creates a BO
> > > 2) Submits rendering referencing the BO
> > > 3) Immediately closes the BO handle, without waiting for the submit to complete
> > >
> > > In this case, the submit holds a reference to the BO which holds a
> > > reference to the VMA.
> >
> > Can't you just instead create the VMAs, which hold a reference to the VM_BO,
> > which holds a reference to the BO, then drop the drop the original BO reference
> > and finally, when everything is completed, remove all VMAs of the VM_BO?
> 
> Perhaps the submit could hold a ref to the VM_BO instead of the BO to
> cover that particular case.
> 
> But for the legacy world, the VMA is implicitly torn down when the BO
> is freed.  Which will never happen if the VM_BO holds a reference to
> the BO.

Sure, I get that; what I do not get is why it can't be changed, e.g. in the way
described above.

> > This should do exactly the same *and* be conformant with GPUVM design.
> >
> > > Everything is torn down gracefully when the
> > > submit completes.  But if the VMA held a hard reference to the BO then
> > > you'd have a reference loop.
> > >
> > > So there really is no other way to use gpuvm _and_ maintain backwards
> > > compatibility with the semantics of the pre-VM_BIND UAPI without this
> > > flag.
> >
> > Again, how is this important for maintaining backwards compatibility with the
> > uAPI? This all seems like a driver internal implementation detail to me.
> >
> > So, is there a technical reason, or is it more that it would be more effort on
> > the driver end to rework things accordingly?
> 
> If there were a way to work without WEAK_REF, it seems like it would
> be harder and much less of a drop in change.

So, you're saying there is no technical blocker to rework it?

