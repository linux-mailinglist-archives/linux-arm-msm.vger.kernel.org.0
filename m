Return-Path: <linux-arm-msm+bounces-59037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F98AC0A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 13:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2903B9FAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B31623371B;
	Thu, 22 May 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcCEbIaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D31A23A6;
	Thu, 22 May 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747911637; cv=none; b=IJPmV9M3nOw5D7LwoPB8sTVJSkRYI2UMM+DvqeRuNvEoV5MKjHYj6KwFmjhxjPVuhtR8v4Vmj5zxFtJdDmU4PWodMGy5/s00g9ywl5afJ0Bw8nvCAjy1+lTzLesrDJhVNDB78YQAWODLBYNQFZQc0qm6aagAGmwcKpDlXACg2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747911637; c=relaxed/simple;
	bh=PYI7vpOuR2UMtKq8PUt1Q1ak0/7zynD9AcO4jhKTgjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg2iIjDnZw0ZAfxD0CcWidoiAj7eptDB8QogJgkFLObPZXN/h7aFgPmzBNJasZ1Pw1LznQ53GZaL+RlaAs9rKW8dW0uN9d5f/QTEtuevC3mP9tpup3Cjq9c9GfJMOMdToA3I61W8Db2o4eQEyfc0CCV+Yo9Own8kZDS7BX15Ic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcCEbIaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5519CC4CEE4;
	Thu, 22 May 2025 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747911636;
	bh=PYI7vpOuR2UMtKq8PUt1Q1ak0/7zynD9AcO4jhKTgjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcCEbIaQ91oyzISl3Wzab95PTIBy/iA/lM1T3q6iTGKzrT3syzSCSxiXzvYcdJ/mn
	 cmxUq6w7K423sd+23FxVPceaEcuw0wYwsxJXWLVaeMC6+icHJNc28GWR9Hqlvsuj+9
	 KN/MFsSqmOr+PKDVb7VJ5JkqKxV/sZKUPn+mT+Ulki+sUdmYNM15TlOe6HvP7/h33x
	 PFW6ethFKy00GvxfQRDyZaqxLsPc4ZLuK2xDD8E9A590gG3P1IRIo02yLZkvFgtuzE
	 rru4hr+bepkKB7Hv1BYwg/kPim4hNpIdm9gcHV3A9kmvjWQvfnYHdZ4/CwJ6ncPxF7
	 LsCCDpMHrsgkg==
Date: Thu, 22 May 2025 13:00:30 +0200
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
Message-ID: <aC8Dzgufa9E2MD6t@pollux>
References: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>

On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 9:54 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > On Tue, May 20, 2025 at 12:06 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > But let's assume we agree that we want to avoid that userspace can ever OOM itself
> > > > through async VM_BIND, then the proposed solution seems wrong:
> > > >
> > > > Do we really want the driver developer to set an arbitrary boundary of a number
> > > > of jobs that can be submitted before *async* VM_BIND blocks and becomes
> > > > semi-sync?
> > > >
> > > > How do we choose this number of jobs? A very small number to be safe, which
> > > > scales badly on powerful machines? A large number that scales well on powerful
> > > > machines, but OOMs on weaker ones?
> > >
> > > The way I am using it in msm, the credit amount and limit are in units
> > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > > 1024 pages, once there are jobs queued up exceeding that limit, they
> > > start blocking.
> > >
> > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in flight.
> >
> > That doesn't make a difference for my question. How do you know 1024 pages is a
> > good value? How do we scale for different machines with different capabilities?
> >
> > If you have a powerful machine with lots of memory, we might throttle userspace
> > for no reason, no?
> >
> > If the machine has very limited resources, it might already be too much?
> 
> It may be a bit arbitrary, but then again I'm not sure that userspace
> is in any better position to pick an appropriate limit.
> 
> 4MB of in-flight pages isn't going to be too much for anything that is
> capable enough to run vk, but still allows for a lot of in-flight
> maps.

Ok, but what about the other way around? What's the performance impact if the
limit is chosen rather small, but we're running on a very powerful machine?

Since you already have the implementation for hardware you have access to, can
you please check if and how performance degrades when you use a very small
threshold?

Also, I think we should probably put this throttle mechanism in a separate
component, that just wraps a counter of bytes or rather pages that can be
increased and decreased through an API and the increase just blocks at a certain
threshold.

This component can then be called by a driver from the job submit IOCTL and the
corresponding place where the pre-allocated memory is actually used / freed.

Depending on the driver, this might not necessarily be in the scheduler's
run_job() callback.

We could call the component something like drm_throttle or drm_submit_throttle.

