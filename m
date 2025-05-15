Return-Path: <linux-arm-msm+bounces-58072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B8AB8AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B7BA213A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED6820B812;
	Thu, 15 May 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1LkOWgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD21E5B71;
	Thu, 15 May 2025 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323021; cv=none; b=LFDv7yr06hePEeM3/zkMnp9en1OGahXJPBzmSwIVVgOWmqoQU34Eng7E5bFsD2Gj506XRlF2OSJwtxwHg3zKPVvfgER4IoZgW2GQywEf0My/nomPBugLoGkIkmqvh/lEPHBSGprUJaBsXaNcSePhaGeLFkqTjxUPMCP7PRl7wFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323021; c=relaxed/simple;
	bh=qQ/l3B45Y1pQHKzCCV+/Vez9fgS3wx9SjoH1DVsKDmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhV8hCgFn66eQEdXlgt6R09x7kygXeFEpRutQt9L18SXb6rm7zcSST4HdqG43xT/8dGVRog958rDW3/icpKAMiA9X+2p1/9nV6CnE3SBA3YVYvwuwpcNHXIKSC5Ulk+qaFw1waPYw3L+n6NLSpEKZnuYGoaHtJAMxx86TlxYoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1LkOWgo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA01C4CEE7;
	Thu, 15 May 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747323021;
	bh=qQ/l3B45Y1pQHKzCCV+/Vez9fgS3wx9SjoH1DVsKDmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1LkOWgoK7FMQBfDQr2kI6NJ6OOK0E6KHymJOp9uXEyQNFNOolr0wSgurlIW6NR3e
	 JskGu5uX4CZd9ODGAcni+zGK4XYlGod1wbGQLA2L9Z/4qLVN1Sl7f4lBva+BSuAfWn
	 KQuKw/hZDtUjLXlrCTmFOf7TeBGfzUOqToZf6wVOPLh9EdAz2oFycJwYL3zqDJEipj
	 NDG1Fwiag9r4fJN+wtHAR3Pzq7FXHCOi5V+iI4zdFQaDINe9haDo/9ZYnV/AHS4AMF
	 tvZGw2GR548ruBQ8S/3SUs+56sfGkgCgvb4+AxhBp/Ls4Fopbe6UTuHt30y4ZgY2NM
	 E/N2RaKR6rgYQ==
Date: Thu, 15 May 2025 17:30:16 +0200
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
Message-ID: <aCYIiJpMe1ljGxqz@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
 <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>

On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:

Thanks for the detailed explanation!

> On Thu, May 15, 2025 at 2:00 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Eases migration for drivers where VAs don't hold hard references to
> > > their associated BO, avoiding reference loops.
> > >
> > > In particular, msm uses soft references to optimistically keep around
> > > mappings until the BO is distroyed.  Which obviously won't work if the
> > > VA (the mapping) is holding a reference to the BO.
> >
> > Ick! This is all complicated enough. Allow drivers to bypass the proper
> > reference counting for GEM objects in the context of VM_BO structures seems like
> > an insane footgun.
> >
> > I don't understand why MSM would need weak references here. Why does msm need
> > that, but nouveau, Xe, panthor, PowerVR do not?
> 
> Most of those drivers were designed (and had their UABI designed) with
> gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> about nouveau, but I guess it just got lucky that it's UABI semantics
> fit having the VMA hold a reference to the BO.
> 
> Unfortunately, msm pre-dates sparse.. and in the beginning there was
> only a single global VM, multiple VMs was something retrofitted ~6yrs
> (?) back.  For existing msm, the VMA(s) are implicitly torn down when
> the GEM obj is freed.  This won't work with the VMA(s) holding hard
> references to the BO.

Ok, that makes sense to me, but why can't this be changed? I don't see how the
uAPI would be affected, this is just an implementation detail, no?

> When userspace opts-in to "VM_BIND" mode, which it has to do before
> the VM is created, then we don't set this flag, the VMA holds a hard
> reference to the BO as it does with other drivers.  But consider this
> use-case, which is perfectly valid for old (existing) userspace:
> 
> 1) Userspace creates a BO
> 2) Submits rendering referencing the BO
> 3) Immediately closes the BO handle, without waiting for the submit to complete
> 
> In this case, the submit holds a reference to the BO which holds a
> reference to the VMA. 

Can't you just instead create the VMAs, which hold a reference to the VM_BO,
which holds a reference to the BO, then drop the drop the original BO reference
and finally, when everything is completed, remove all VMAs of the VM_BO?

This should do exactly the same *and* be conformant with GPUVM design.

> Everything is torn down gracefully when the
> submit completes.  But if the VMA held a hard reference to the BO then
> you'd have a reference loop.
> 
> So there really is no other way to use gpuvm _and_ maintain backwards
> compatibility with the semantics of the pre-VM_BIND UAPI without this
> flag.

Again, how is this important for maintaining backwards compatibility with the
uAPI? This all seems like a driver internal implementation detail to me.

So, is there a technical reason, or is it more that it would be more effort on
the driver end to rework things accordingly?

> Fortunately DRM_GPUVM_VA_WEAK_REF is minimally intrusive.  Otherwise I
> probably would have had to fork my own copy of gpuvm.
> 
> BR,
> -R

