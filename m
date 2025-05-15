Return-Path: <linux-arm-msm+bounces-58127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971DAB8F79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7EDA17EF8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BB828AAE1;
	Thu, 15 May 2025 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+bgmgrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAD28B414;
	Thu, 15 May 2025 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335393; cv=none; b=uTl3XK4U27zKzxUX+3iutWByT9TtQLdKXvAY7zRqhUohZme4EQjmGff3AA+aYtBjt/aVbgKyiOSOnycaD2gB1zz9VjrBF87W9o2G+a6nZqCCDiLQ6AA96o8DjX1WBj39V+Mx43nQtzHitWPNpE5Xc+yNPN7YhZmrNZRusP3m364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335393; c=relaxed/simple;
	bh=0oMo3ObWhyjpLagy7Im7orZnu51xGp0zGqFOXr+BZHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg/tO6Ir/LXOm1JlZJKY6tLa/JHxJyj+hnG24QCFj64QGMaX9T/tmuZdDs7cGbwvL2FSWv20keYexJjZLKY7J5FyJtu8h1ayXfcN4U6a766pJ552oEVFjcbgxEjFrpkSDUnQlNY9ev7TGiQ6pSPL+Ia4Y144/Z46VDLC9wb6388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+bgmgrr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D099C4CEE7;
	Thu, 15 May 2025 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747335392;
	bh=0oMo3ObWhyjpLagy7Im7orZnu51xGp0zGqFOXr+BZHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+bgmgrrOYecNejZjRwiv/OI1ZxGUPNzJxqa6j1WWwoWgFA7KKa+TFHCaFef/ltwi
	 Ugn1RM2M1Isa2kgTMFIG22v0VNKj3LSiC9drfrFaDv6ieWx0wKo8uMwNlnTl1XvU/1
	 imAmTHWXmU8kT02BcY4Q2ER79/ib+FJQFU+jcev21fCBTKANtX1l2R78SbO406sF7n
	 RVrCx+JbwnacJCUSgEAFA8JQHtwpzzz+1k4cpQfny1yWORlC/gtl2GTbsG6hmvBsMB
	 GHSWslcfLua56msJsaaTpYRylU8ll9beO3lUZ/Gm8BpGPu+11gPoi59FtnHSSMxurk
	 5MXkgzTk6mLwg==
Date: Thu, 15 May 2025 20:56:26 +0200
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
Message-ID: <aCY42rgJC4sQ4tp4@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>

On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 10:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > (Cc: Boris)
> >
> > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > > For some context, other drivers have the concept of a "synchronous"
> > > VM_BIND ioctl which completes immediately, and drivers implement it by
> > > waiting for the whole thing to finish before returning.
> >
> > Nouveau implements sync by issuing a normal async VM_BIND and subsequently
> > waits for the out-fence synchronously.
> 
> As Connor mentioned, we'd prefer it to be async rather than blocking,
> in normal cases, otherwise with drm native context for using native
> UMD in guest VM, you'd be blocking the single host/VMM virglrender
> thread.
> 
> The key is we want to keep it async in the normal cases, and not have
> weird edge case CTS tests blow up from being _too_ async ;-)

I really wonder why they don't blow up in Nouveau, which also support full
asynchronous VM_BIND. Mind sharing which tests blow up? :)

> > > But this
> > > doesn't work for native context, where everything has to be
> > > asynchronous, so we're trying a new approach where we instead submit
> > > an asynchronous bind for "normal" (non-sparse/driver internal)
> > > allocations and only attach its out-fence to the in-fence of
> > > subsequent submits to other queues.
> >
> > This is what nouveau does and I think other drivers like Xe and panthor do this
> > as well.
> 
> No one has added native context support for these drivers yet

Huh? What exactly do you mean with "native context" then?

> > > Once you do this then you need a
> > > limit like this to prevent memory usage from pending page table
> > > updates from getting out of control. Other drivers haven't needed this
> > > yet, but they will when they get native context support.
> >
> > What are the cases where you did run into this, i.e. which application in
> > userspace hit this? Was it the CTS, some game, something else?
> 
> CTS tests that do weird things with massive # of small bind/unbind.  I
> wouldn't expect to hit the blocking case in the real world.

As mentioned above, can you please share them? I'd like to play around a bit. :)

- Danilo

