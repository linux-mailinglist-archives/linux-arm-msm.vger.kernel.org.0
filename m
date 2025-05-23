Return-Path: <linux-arm-msm+bounces-59174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D590AC1D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4B79E7EFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 06:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C248C1B0414;
	Fri, 23 May 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBNzSzm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A142F41;
	Fri, 23 May 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983545; cv=none; b=hpnBHIKIGTWP4+nypGodxdow+jZS1oYR4xrJ5QLLbKw+HEQ3aX4ETfsSDeiLCfKLySSda2dG4ri7rgR//M5fxgwAPJ3EOeS8YXn79wu591Ufcdhf79ue71HcTpZ5w44S9HCoeM0NBeztFxYX/adHJHQxX2YaTtqt2arWuLybwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983545; c=relaxed/simple;
	bh=oQB6Ln9MA/kBU//SsjcArG0iT9q+cUOskiIh8YOOv1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDKBZvSSc3JT70xEHgVFDYHcsD4n0JqpAGB6YMTd1ekT0VajHU0hTRq2vfz5r6uOdclJYoWUaViDJyJMQx5oXABGq9v5Pk2cBFQOvjypfhL9aakHaZk8iTtfW3aXWZPcsNoW5vhdysvj35zHfynrRZSjDYoRL31iiUcCo+2pPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBNzSzm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0292C4CEE9;
	Fri, 23 May 2025 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747983545;
	bh=oQB6Ln9MA/kBU//SsjcArG0iT9q+cUOskiIh8YOOv1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBNzSzm79lnwPHi4IveJs23sYMPLVjmZaelESuluDDtMVYGZi3YXSkKk3xSNSkhZf
	 mHpunarmtrSaa4/8QJZ1Ka8CcpOJlmiwvkBGeo5i9HhpQ7YplJ+V+OKKMW8byhCCaj
	 WRs9o77RPoMywOVEfAuZaJc38ia2UDymCfYv4nyC99vMKVWbfHdExG7Gr9KiNTebY2
	 Gak1QoFa+VeyYhkrMp7QiYIwDsp/7VXcASN/rf1afmfO+LFv6hT5WhSaD5BwzAT/7y
	 zvltuKTTpctBZ5Q5G/BGtu/BOPclpwBJsDyzfuudSR5Ga2Gg4DYN5QsB+pMsibBSIM
	 AyEj5ujgcDYaQ==
Date: Fri, 23 May 2025 08:58:58 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
	phasta@kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aDAcsvVaRQopkc6U@pollux>
References: <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
 <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
 <aC9Iih1KN6xb9LrK@cassiopeiae>
 <CAF6AEGvp6BCN14_n+Ot5KQrPbnDprKXcHT0s0ZLC2-JDV7D3TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvp6BCN14_n+Ot5KQrPbnDprKXcHT0s0ZLC2-JDV7D3TQ@mail.gmail.com>

On Thu, May 22, 2025 at 07:31:28PM -0700, Rob Clark wrote:
> On Thu, May 22, 2025 at 8:53 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Thu, May 22, 2025 at 07:47:17AM -0700, Rob Clark wrote:
> > > On Thu, May 22, 2025 at 4:00 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > Ok, but what about the other way around? What's the performance impact if the
> > > > limit is chosen rather small, but we're running on a very powerful machine?
> > > >
> > > > Since you already have the implementation for hardware you have access to, can
> > > > you please check if and how performance degrades when you use a very small
> > > > threshold?
> > >
> > > I mean, considering that some drivers (asahi, at least), _only_
> > > implement synchronous VM_BIND, I guess blocking in extreme cases isn't
> > > so bad.
> >
> > Which is not even upstream yet and eventually will support async VM_BIND too,
> > AFAIK.
> 
> the uapi is upstream

And will be extended once they have the corresponding async implementation in
the driver.

> > > But I think you are overthinking this.  4MB of pagetables is
> > > enough to map ~8GB of buffers.
> > >
> > > Perhaps drivers would want to set their limit based on the amount of
> > > memory the GPU could map, which might land them on a # larger than
> > > 1024, but still not an order of magnitude more.
> >
> > Nouveau currently supports an address space width of 128TiB.
> >
> > In general, we have to cover the range of some small laptop or handheld devices
> > to huge datacenter machines.
> 
> sure.. and?  It is still up to the user of sched to set their own
> limits, I'm not proposing that sched takes charge of that policy
> 
> Maybe msm doesn't have to scale up quite as much (yet).. but it has to
> scale quite a bit further down (like watches).  In the end it is the
> same.  And also not really the point here.
> 
> > > I don't really have a good setup for testing games that use this, atm,
> > > fex-emu isn't working for me atm.  But I think Connor has a setup with
> > > proton working?
> >
> > I just want to be sure that an arbitrary small limit doing the job for a small
> > device to not fail VK CTS can't regress the performance on large machines.
> 
> why are we debating the limit I set outside of sched.. even that might
> be subject to some tuning for devices that have more memory, but that
> really outside the scope of this patch

We are not debating the number you set in MSM, we're talking about whether a
statically set number will be sufficient.

Also, do we really want it to be our quality standard that we introduce some
throttling mechanism as generic infrastructure for driver and don't even add a
comment guiding drivers how to choose a proper limit and what are the potential
pitfalls in choosing the limit?

When working on a driver, do you want to run into APIs that don't give you
proper guidance on how to use them correctly?

I think it would not be very nice to tell drivers, "Look, here's a throttling API
for when VK CTS (unknown test) ruins your day. We also can't give any advise on
the limit that should be set depending on the scale of the machine, since we
never looked into it.".

> > So, kindly try to prove that we're not prone to extreme performance regression
> > with a static value as you propose.
> >
> > > > Also, I think we should probably put this throttle mechanism in a separate
> > > > component, that just wraps a counter of bytes or rather pages that can be
> > > > increased and decreased through an API and the increase just blocks at a certain
> > > > threshold.
> > >
> > > Maybe?  I don't see why we need to explicitly define the units for the
> > > credit.  This wasn't done for the existing credit mechanism.. which,
> > > seems like if you used some extra fences could also have been
> > > implemented externally.
> >
> > If you are referring to the credit mechanism in the scheduler for ring buffers,
> > that's a different case. Drivers know the size of their ring buffers exactly and
> > the scheduler has the responsibility of when to submit tasks to the ring buffer.
> > So the scheduler kind of owns the resource.
> >
> > However, the throttle mechanism you propose is independent from the scheduler,
> > it depends on the available system memory, a resource the scheduler doesn't own.
> 
> it is a distinction that is perhaps a matter of opinion.  I don't see
> such a big difference, it is all just a matter of managing physical
> resource usage in different stages of a scheduled job's lifetime.

Yes, but the ring buffer as a resource is owned by the scheduler, and hence
having the scheduler care about flow control makes sense.

Here you want to flow control the uAPI (i.e. VM_BIND ioctl) -- let's do this in
a seaparate component please.

> > > Maybe?  This still has the same complaint I had about just
> > > implementing this in msm.. it would have to reach in and use the
> > > scheduler's job_scheduled wait-queue.  Which, to me at least, seems
> > > like more of an internal detail about how the scheduler works.
> >
> > Why? The component should use its own waitqueue. Subsequently, from your code
> > that releases the pre-allocated memory, you can decrement the counter through
> > the drm_throttle API, which automatically kicks its the waitqueue.
> >
> > For instance from your VM_BIND IOCTL you can call
> >
> >         drm_throttle_inc(value)
> >
> > which blocks if the increment goes above the threshold. And when you release the
> > pre-allocated memory you call
> >
> >         drm_throttle_dec(value)
> >
> > which wakes the waitqueue and unblocks the drm_throttle_inc() call from your
> > VM_BIND IOCTL.
> 
> ok, sure, we could introduce another waitqueue, but with my proposal
> that is not needed.  And like I said, the existing throttling could
> also be implemented externally to the scheduler..  so I'm not seeing
> any fundamental difference.

Yes, but you also implicitly force drivers to actually release the pre-allocated
memory before the scheduler's internal waitqueue is woken. Having such implicit
rules isn't nice.

Also, with that drivers would need to do so in run_job(), i.e. in the fence
signalling critical path, which some drivers may not be able to do.

And, it also adds complexity to the scheduler, which we're trying to reduce.

All this goes away with making this a separate component -- please do that
instead.

