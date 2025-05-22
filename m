Return-Path: <linux-arm-msm+bounces-59060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B4AC0EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961F43B8519
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EB028C025;
	Thu, 22 May 2025 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4SlP8Sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E91F94C;
	Thu, 22 May 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925252; cv=none; b=ghkcoz+nwOL0IvQ53lnixWc22BpLJLT6AWcB+UqUUDuiw2sFCrOPFnE0WCwFnbMRmZVHLCLykSOykCcK1uH44GHX5rY7K7nBnytWO/Ffg9AjERDpZK2fgMM0+gUgi69lMb5Icy+hjDQwZOSmhvJpviHhMrFK49Mqc1Q0Fhv4StY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925252; c=relaxed/simple;
	bh=da58pHvg72EmigTHs/pFbH4ThA8rIC4bUzgcApMp+0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CT1922fdiRVyPgTzoshXfNyyMx8ghafDpsf60LeLuvI6DVhGFiOeJYG8kYJrwKjTSYmIMFHVMI6XCZRIUSWDTEOo3iDLYJlgwkFZd34XqDjRhJNOM2IPGs2qQrlH3yw+vBGdyvgPFLnVt2vnj0FdEo6GPtNSawrc6MFVfQMQfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4SlP8Sd; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3dc8265b9b5so15198505ab.1;
        Thu, 22 May 2025 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747925249; x=1748530049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPbDH3f6x3vtoaDskORYKv70NDHQV/hQjQjyBt3PCHg=;
        b=d4SlP8SdQVszpLwNeheGZk7kyjz2OITKpGyOWxEd4Un4YZ3ict7/hEgYRcFtbgkr1T
         nGpIKP30SplqUiGSJ6q18r2/4QhICWVrMSs+dMAA/yvK0yW4NO4QQhJqWHo+ZsNHAhgq
         PbhLEpZBURrSVZ63/IOlOuUAQJ5QOKd8UXhUIAA3xBG1GVbnZFjOtw8tVYHmwwZ/hFam
         MnzbNjmUWRmQjGxmo9h1pTdmCLzGblvmP3f7vV1B+aAlcwocuanWIFd8cVRa81fw3GC7
         3Vg9XCSMPXjsqK/jx2UmKqKEfBK6uYI/FsKzThk4FYv5+y4PEgMrvFFko54lA6lJizx1
         3H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925249; x=1748530049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPbDH3f6x3vtoaDskORYKv70NDHQV/hQjQjyBt3PCHg=;
        b=s+HYqPack7zPxUKaajmtLCdT05jbN+KRrH9oRqD2IJ1Z6OXuxhlXE9mVGFOwmvzVtr
         tSi6qkyMJsihRZexo8DQ8S6PMd/k2HhpxGv5crsxoH0SqeGPyk/z7GDFq7H7sifGOify
         1SafX3vSC5JsPk8adhEychytgvpAQq9SV16YKcI8VR9UifCWKcK6vidDxL5cRi66L2nO
         P49OLgYYkiQBL4LkZdSebz8jwH7I2WNdrdcU1QqPdPqxdU63YAvW8UsIKQUVFaexNuuP
         og/w/Tn/XvIgBAQJVjsczA9C1jUUaDij1FtpZAcjWuO/FSctjRKnn+bmD93xFzI0qPHM
         CWWA==
X-Forwarded-Encrypted: i=1; AJvYcCUkFfQYnCc33nPrvrDAOMCXaSvVdCJ4JLvBMmMz/yXSPdAM50mRHzIkZRgedaPrqverdi274jxflF8UjoN4@vger.kernel.org, AJvYcCVNU9djgW9RVh9wLQmp4LExQG0e5r7GfhI+PIaQpBr8dFCT9q1ubatJbMH39kyI3UKBwjtyQ8zpZxYKGU/c@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgFI60LFC+E6GCxdeU4876Fr+PUSRL/xcZZPDdsvO3R5VZl0D
	OSnU45PGcDnynIQ9wunbdxivYkt9i0xyXRTbdtZxtZ+Wum9+fYg71OO5qaiAE7p/PMIqgPtV5n3
	cb7rvtcGO9OpSbpIdOP1TieOfanuV0HZMiQ==
X-Gm-Gg: ASbGnctL4ea39nCNfopzcl547S2DANyca0IuLGZF+hrdjTKhPP85kHSv7SV/nA1Wz5H
	w4VVAmn1AcJGtdbK+UASvwDptGd7kVF+mzSRzsUDznkbDUXQHoYFnuYxm/uGINQFyYdeR4+M0PB
	7/BiJx8pezG96DS6CEDVbNwhH33H8vwZ8OEslMuP4lR4sXH8k1UFlfQTl71TQD78k=
X-Google-Smtp-Source: AGHT+IEarmDYe4t8X7TSNIy1n4puTKWpnIYwdtvdbi84YGnpxT6zLK1A0SzYuTIp9sqHj9wsknEjHcHutbq3FYUqlv4=
X-Received: by 2002:a05:6e02:2501:b0:3dc:8423:543e with SMTP id
 e9e14a558f8ab-3dc842356c2mr71268665ab.17.1747925249377; Thu, 22 May 2025
 07:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux> <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux> <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux> <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux> <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
In-Reply-To: <aC8Dzgufa9E2MD6t@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 07:47:17 -0700
X-Gm-Features: AX0GCFtxJW9BGpIGgy7w8A5mMXB_NlWAv7wuxAT1kInixMl7peXcsXdNONmduSE
Message-ID: <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 4:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > > But let's assume we agree that we want to avoid that userspace ca=
n ever OOM itself
> > > > > through async VM_BIND, then the proposed solution seems wrong:
> > > > >
> > > > > Do we really want the driver developer to set an arbitrary bounda=
ry of a number
> > > > > of jobs that can be submitted before *async* VM_BIND blocks and b=
ecomes
> > > > > semi-sync?
> > > > >
> > > > > How do we choose this number of jobs? A very small number to be s=
afe, which
> > > > > scales badly on powerful machines? A large number that scales wel=
l on powerful
> > > > > machines, but OOMs on weaker ones?
> > > >
> > > > The way I am using it in msm, the credit amount and limit are in un=
its
> > > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit t=
o
> > > > 1024 pages, once there are jobs queued up exceeding that limit, the=
y
> > > > start blocking.
> > > >
> > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in=
 flight.
> > >
> > > That doesn't make a difference for my question. How do you know 1024 =
pages is a
> > > good value? How do we scale for different machines with different cap=
abilities?
> > >
> > > If you have a powerful machine with lots of memory, we might throttle=
 userspace
> > > for no reason, no?
> > >
> > > If the machine has very limited resources, it might already be too mu=
ch?
> >
> > It may be a bit arbitrary, but then again I'm not sure that userspace
> > is in any better position to pick an appropriate limit.
> >
> > 4MB of in-flight pages isn't going to be too much for anything that is
> > capable enough to run vk, but still allows for a lot of in-flight
> > maps.
>
> Ok, but what about the other way around? What's the performance impact if=
 the
> limit is chosen rather small, but we're running on a very powerful machin=
e?
>
> Since you already have the implementation for hardware you have access to=
, can
> you please check if and how performance degrades when you use a very smal=
l
> threshold?

I mean, considering that some drivers (asahi, at least), _only_
implement synchronous VM_BIND, I guess blocking in extreme cases isn't
so bad.  But I think you are overthinking this.  4MB of pagetables is
enough to map ~8GB of buffers.

Perhaps drivers would want to set their limit based on the amount of
memory the GPU could map, which might land them on a # larger than
1024, but still not an order of magnitude more.

I don't really have a good setup for testing games that use this, atm,
fex-emu isn't working for me atm.  But I think Connor has a setup with
proton working?

But, flip it around.  It is pretty simple to create a test program
that submits a flood of 4k (or whatever your min page size is)
VM_BINDs, and see how prealloc memory usage blows up.  This is really
the thing this patch is trying to protect against.

> Also, I think we should probably put this throttle mechanism in a separat=
e
> component, that just wraps a counter of bytes or rather pages that can be
> increased and decreased through an API and the increase just blocks at a =
certain
> threshold.

Maybe?  I don't see why we need to explicitly define the units for the
credit.  This wasn't done for the existing credit mechanism.. which,
seems like if you used some extra fences could also have been
implemented externally.

> This component can then be called by a driver from the job submit IOCTL a=
nd the
> corresponding place where the pre-allocated memory is actually used / fre=
ed.
>
> Depending on the driver, this might not necessarily be in the scheduler's
> run_job() callback.
>
> We could call the component something like drm_throttle or drm_submit_thr=
ottle.

Maybe?  This still has the same complaint I had about just
implementing this in msm.. it would have to reach in and use the
scheduler's job_scheduled wait-queue.  Which, to me at least, seems
like more of an internal detail about how the scheduler works.

BR,
-R

