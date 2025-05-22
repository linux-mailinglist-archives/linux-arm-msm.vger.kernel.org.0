Return-Path: <linux-arm-msm+bounces-59068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66EAC1060
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4EBC7A639D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA15E299AA0;
	Thu, 22 May 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH12sr3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC928DB74;
	Thu, 22 May 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929232; cv=none; b=axzDTQVxUZwV+OF62ea5YTD7IXC9aVb54O697B2re3U7D8vaJmTHvVA0mQTybCA/68h+CElEjQP2g4NeaJiRZmTrypeLV4M2v9wDhE9YT51nU05Bb1ReTQKZZc8l2rY7oUhzjq2pfjCoy1v496LXeIoUiOA3DB7BfGNVeggrkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929232; c=relaxed/simple;
	bh=j71Wtt6NGq/5NYiuM9Hwj8gMHucqRDMzopuT74X4AM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBumC2YZxCEolMLd9efES7to2bUqWF4NHOkcfRDVwLK7ZWRuCPKpG6Q4OVmIxN4PzQlqR+lMfpUJ0mODLx5t8NbYtBRWrkLTyXm4BTFBq+VNnBoi+A6PIG2GTyMhAXkKOJwqINVSyHeWPeApZKz/hZO5OamJX7DZFnWCS7VgcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH12sr3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FBEC4CEE4;
	Thu, 22 May 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929232;
	bh=j71Wtt6NGq/5NYiuM9Hwj8gMHucqRDMzopuT74X4AM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oH12sr3IaektTamfX3zPxeOpJwWe63tAxuGU5406UZJvL69MldB6nQlktq0/nN88K
	 o9u2Swa4KI78b9LP2vEK6/LQ2748tCqV206mkbapEF4lM3cL/0nVoK1X9VKL//B0XE
	 uTaJ3j8mgQu3nFOpnyL7VG/rUKsqrcYMtzxbYR9M6b4baHMQHfz0wYYGW5STWnep1X
	 b3sNd9pk9AevMQ5gTCfjRhde8n7aP6T+jsZvg67TLTWQvpyHVlXiFcKUB2pDALjUcE
	 Aa9Z+ZiOKxnZSketlExbSaiv4VoKs5dGNPNJhXztMxl8Innh+KiiNV60QJarei3Wv2
	 Lqdm2Rn+NbwDg==
Date: Thu, 22 May 2025 17:53:46 +0200
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
Message-ID: <aC9Iih1KN6xb9LrK@cassiopeiae>
References: <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
 <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>

On Thu, May 22, 2025 at 07:47:17AM -0700, Rob Clark wrote:
> On Thu, May 22, 2025 at 4:00 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > > On Tue, May 20, 2025 at 9:54 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > > On Tue, May 20, 2025 at 12:06 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > > > But let's assume we agree that we want to avoid that userspace can ever OOM itself
> > > > > > through async VM_BIND, then the proposed solution seems wrong:
> > > > > >
> > > > > > Do we really want the driver developer to set an arbitrary boundary of a number
> > > > > > of jobs that can be submitted before *async* VM_BIND blocks and becomes
> > > > > > semi-sync?
> > > > > >
> > > > > > How do we choose this number of jobs? A very small number to be safe, which
> > > > > > scales badly on powerful machines? A large number that scales well on powerful
> > > > > > machines, but OOMs on weaker ones?
> > > > >
> > > > > The way I am using it in msm, the credit amount and limit are in units
> > > > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > > > > 1024 pages, once there are jobs queued up exceeding that limit, they
> > > > > start blocking.
> > > > >
> > > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in flight.
> > > >
> > > > That doesn't make a difference for my question. How do you know 1024 pages is a
> > > > good value? How do we scale for different machines with different capabilities?
> > > >
> > > > If you have a powerful machine with lots of memory, we might throttle userspace
> > > > for no reason, no?
> > > >
> > > > If the machine has very limited resources, it might already be too much?
> > >
> > > It may be a bit arbitrary, but then again I'm not sure that userspace
> > > is in any better position to pick an appropriate limit.
> > >
> > > 4MB of in-flight pages isn't going to be too much for anything that is
> > > capable enough to run vk, but still allows for a lot of in-flight
> > > maps.
> >
> > Ok, but what about the other way around? What's the performance impact if the
> > limit is chosen rather small, but we're running on a very powerful machine?
> >
> > Since you already have the implementation for hardware you have access to, can
> > you please check if and how performance degrades when you use a very small
> > threshold?
> 
> I mean, considering that some drivers (asahi, at least), _only_
> implement synchronous VM_BIND, I guess blocking in extreme cases isn't
> so bad.

Which is not even upstream yet and eventually will support async VM_BIND too,
AFAIK.

> But I think you are overthinking this.  4MB of pagetables is
> enough to map ~8GB of buffers.
> 
> Perhaps drivers would want to set their limit based on the amount of
> memory the GPU could map, which might land them on a # larger than
> 1024, but still not an order of magnitude more.

Nouveau currently supports an address space width of 128TiB.

In general, we have to cover the range of some small laptop or handheld devices
to huge datacenter machines.

> I don't really have a good setup for testing games that use this, atm,
> fex-emu isn't working for me atm.  But I think Connor has a setup with
> proton working?

I just want to be sure that an arbitrary small limit doing the job for a small
device to not fail VK CTS can't regress the performance on large machines.

So, kindly try to prove that we're not prone to extreme performance regression
with a static value as you propose.

> > Also, I think we should probably put this throttle mechanism in a separate
> > component, that just wraps a counter of bytes or rather pages that can be
> > increased and decreased through an API and the increase just blocks at a certain
> > threshold.
> 
> Maybe?  I don't see why we need to explicitly define the units for the
> credit.  This wasn't done for the existing credit mechanism.. which,
> seems like if you used some extra fences could also have been
> implemented externally.

If you are referring to the credit mechanism in the scheduler for ring buffers,
that's a different case. Drivers know the size of their ring buffers exactly and
the scheduler has the responsibility of when to submit tasks to the ring buffer.
So the scheduler kind of owns the resource.

However, the throttle mechanism you propose is independent from the scheduler,
it depends on the available system memory, a resource the scheduler doesn't own.

I'm fine to make the unit credits as well, but in this case we really care about
the consumption of system memory, so we could just use an applicable unit.

> > This component can then be called by a driver from the job submit IOCTL and the
> > corresponding place where the pre-allocated memory is actually used / freed.
> >
> > Depending on the driver, this might not necessarily be in the scheduler's
> > run_job() callback.
> >
> > We could call the component something like drm_throttle or drm_submit_throttle.
> 
> Maybe?  This still has the same complaint I had about just
> implementing this in msm.. it would have to reach in and use the
> scheduler's job_scheduled wait-queue.  Which, to me at least, seems
> like more of an internal detail about how the scheduler works.

Why? The component should use its own waitqueue. Subsequently, from your code
that releases the pre-allocated memory, you can decrement the counter through
the drm_throttle API, which automatically kicks its the waitqueue.

For instance from your VM_BIND IOCTL you can call

	drm_throttle_inc(value)

which blocks if the increment goes above the threshold. And when you release the
pre-allocated memory you call

	drm_throttle_dec(value)

which wakes the waitqueue and unblocks the drm_throttle_inc() call from your
VM_BIND IOCTL.

Another advantage is that, if necessary, we can make drm_throttle
(automatically) scale for the machines resources, which otherwise we'd need to
pollute the scheduler with.

