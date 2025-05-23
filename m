Return-Path: <linux-arm-msm+bounces-59164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A7AC1A13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 04:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FCCC4A2ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 02:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE172DCBFE;
	Fri, 23 May 2025 02:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTvqlR0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D232DCBE7;
	Fri, 23 May 2025 02:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967503; cv=none; b=WiUbwJBs0wBc8FoeLntESx/hv/1wzsZzn2TyO6hhXYjasm5xb2wqf6J9nm7OnoWq0kSW/ROC042hQha0vuLEkzJ6ffVo+DylTHa32LY4fNkkO8v0JOGxOlVhAOJzH/2K14jAL8LNgPYOdHa0N1OWSIr805W32dXz1QvzyC1ii0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967503; c=relaxed/simple;
	bh=9XFXmzgUB9cpxpVLkTmsmFEI6oIghNlCBWAFtcvFzWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOtGf5NbY46VbC3nlqs/qVQr+7PrGs70tlO7j4KkHtucfCBOacliVrRDcsywGnkzQ2JxCA5gH1L/f9RSQ/l4vsuGy6AoKQZw5U1P0c1MObqdMJoSgFi0YHquXmp/93POxMHd8SIFZl+FNs56MBxT4bprzOVVrkSGASxCGOxl9B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTvqlR0y; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso749668639f.3;
        Thu, 22 May 2025 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747967500; x=1748572300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v50Axd90kyfqH9mwJmj3TPd2cL5HaAzM6IzM1l9YKSU=;
        b=JTvqlR0y9NkkDrSdYBJjFf5Sjo/sTFjCsBoe3uKMK1xVl7a8zBFalxoPQSQ99Ln53d
         00C3FVHzVfGN0npuasWV1/Smc1M+eatk1FDthXmbsav5Z6qHc1x5+rQjB25/PSOrj07Q
         yoIuKEFPN1T1qBClokAv5a7BTBZ9351C2h4R2vh9zbAgDVGuemR5gXXbIhX0bcf33zgx
         G6503K1hqC+pwS3efQ7ay/yCg4xMkFxZlxl39wrJsxK/Lyo8kyS8k5gYAC1KOX+EHFQq
         SdzkG/CRAUqcYWHoiUOFLkt97iIW8FUFi1F+zDoDCX7BmDfHsK2m93v+EuliDpHYf8GI
         nung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747967500; x=1748572300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v50Axd90kyfqH9mwJmj3TPd2cL5HaAzM6IzM1l9YKSU=;
        b=o4stKvZ1kCGqQxTYrBI6Gjgm2icm8gTUWs+P/dE0m7/+05Hkzscb9gmxcSPJoOtSlY
         +dpvIgmjNcjsBaMJVeobTrMtZz+RwjOVWoogTiqMNuCkDHwEC6+a8W5FbO2lukjmf2DK
         ThW7c8Rcz4GhKTYH39YqDtkGXdOYHOzx3o2sC8mKNsLmkEKCoO22LN3Wx0k1581G6+xW
         BElxs7/82PwNx7+psvde7grKSzQ9LfpT5blPAO2MW2kGwPZvPUqu1ZRz2f1zzKfRWx1z
         OLOo0TXiWPaUbMe/0OzOP3THUw6OCazfmE+1p21vv0d4mNFIKx5gp8D4RD51rxLUWTm/
         +gDw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8E4PmKvEwbFZnfPtqbZ2xBESLBfxRp9Y3aRPXmiEEgvA0O36Kws7YxCnj3n5TZXScXIzsOdjk0rUGqwL@vger.kernel.org, AJvYcCWRh6qNj8DeE1XyhWs4kxzk2QGeDAMwufnLimOkepKngLLzSTzT9pqTPyXHWC85Opi3YaO0VBuINQaKRgSo@vger.kernel.org
X-Gm-Message-State: AOJu0YxyODb6mlVVxYU2H1Zvepw1i+7BVD1iAyVQ/o7H/bAS4h8b9ecJ
	v9viMs0m8qVkPEWLhLgUsuGvuY0deKb+2qyXA5vcG6V89Z5qyUi0MhX7fgJBnoHHxprwajMcNkF
	zTzfdb/iAUSCen1pFSbbeSnbqIxBS+Io=
X-Gm-Gg: ASbGncvrTZETcM923sjUnYj+i+mdbgcpiQQm3MQT/qjKrkyjSmRNv943m/sXXceN1cv
	yibgdewakIqZrhwYzMAKvY+bp9T/hCntlYmdCJD768PospXE1BFKyLMbnjIWHwvgXCdGbFoJUBC
	ys+rvydsCLVWwCXEoFs6JA/5Ek6w4KSexQyX8JKHOdd6nUoOGjOfC+AnmktbDGFrCv
X-Google-Smtp-Source: AGHT+IEaJK0kE9SEAYYnpJd6uzCGrAqsmkLSUrMUnq8m5hUhwbfMok+9DiOmcNxk+puC6/eGlHTtg9rkqjOTtXuzEd4=
X-Received: by 2002:a05:6602:6a87:b0:86a:24fe:c51f with SMTP id
 ca18e2360f4ac-86caf092e03mr197060839f.7.1747967500384; Thu, 22 May 2025
 19:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCYkk4Y7feltfp79@pollux> <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux> <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux> <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux> <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux> <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
 <aC9Iih1KN6xb9LrK@cassiopeiae>
In-Reply-To: <aC9Iih1KN6xb9LrK@cassiopeiae>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 19:31:28 -0700
X-Gm-Features: AX0GCFun40Rc8pO0Ej4MXUSPpbpJxcZFCAbQh8QNhOuG0dSQLURQ6RgXeZ6gFMg
Message-ID: <CAF6AEGvp6BCN14_n+Ot5KQrPbnDprKXcHT0s0ZLC2-JDV7D3TQ@mail.gmail.com>
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

On Thu, May 22, 2025 at 8:53=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 22, 2025 at 07:47:17AM -0700, Rob Clark wrote:
> > On Thu, May 22, 2025 at 4:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > > > On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > > > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > > But let's assume we agree that we want to avoid that userspac=
e can ever OOM itself
> > > > > > > through async VM_BIND, then the proposed solution seems wrong=
:
> > > > > > >
> > > > > > > Do we really want the driver developer to set an arbitrary bo=
undary of a number
> > > > > > > of jobs that can be submitted before *async* VM_BIND blocks a=
nd becomes
> > > > > > > semi-sync?
> > > > > > >
> > > > > > > How do we choose this number of jobs? A very small number to =
be safe, which
> > > > > > > scales badly on powerful machines? A large number that scales=
 well on powerful
> > > > > > > machines, but OOMs on weaker ones?
> > > > > >
> > > > > > The way I am using it in msm, the credit amount and limit are i=
n units
> > > > > > of pre-allocated pages in-flight.  I set the enqueue_credit_lim=
it to
> > > > > > 1024 pages, once there are jobs queued up exceeding that limit,=
 they
> > > > > > start blocking.
> > > > > >
> > > > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd page=
s in flight.
> > > > >
> > > > > That doesn't make a difference for my question. How do you know 1=
024 pages is a
> > > > > good value? How do we scale for different machines with different=
 capabilities?
> > > > >
> > > > > If you have a powerful machine with lots of memory, we might thro=
ttle userspace
> > > > > for no reason, no?
> > > > >
> > > > > If the machine has very limited resources, it might already be to=
o much?
> > > >
> > > > It may be a bit arbitrary, but then again I'm not sure that userspa=
ce
> > > > is in any better position to pick an appropriate limit.
> > > >
> > > > 4MB of in-flight pages isn't going to be too much for anything that=
 is
> > > > capable enough to run vk, but still allows for a lot of in-flight
> > > > maps.
> > >
> > > Ok, but what about the other way around? What's the performance impac=
t if the
> > > limit is chosen rather small, but we're running on a very powerful ma=
chine?
> > >
> > > Since you already have the implementation for hardware you have acces=
s to, can
> > > you please check if and how performance degrades when you use a very =
small
> > > threshold?
> >
> > I mean, considering that some drivers (asahi, at least), _only_
> > implement synchronous VM_BIND, I guess blocking in extreme cases isn't
> > so bad.
>
> Which is not even upstream yet and eventually will support async VM_BIND =
too,
> AFAIK.

the uapi is upstream

> > But I think you are overthinking this.  4MB of pagetables is
> > enough to map ~8GB of buffers.
> >
> > Perhaps drivers would want to set their limit based on the amount of
> > memory the GPU could map, which might land them on a # larger than
> > 1024, but still not an order of magnitude more.
>
> Nouveau currently supports an address space width of 128TiB.
>
> In general, we have to cover the range of some small laptop or handheld d=
evices
> to huge datacenter machines.

sure.. and?  It is still up to the user of sched to set their own
limits, I'm not proposing that sched takes charge of that policy

Maybe msm doesn't have to scale up quite as much (yet).. but it has to
scale quite a bit further down (like watches).  In the end it is the
same.  And also not really the point here.

> > I don't really have a good setup for testing games that use this, atm,
> > fex-emu isn't working for me atm.  But I think Connor has a setup with
> > proton working?
>
> I just want to be sure that an arbitrary small limit doing the job for a =
small
> device to not fail VK CTS can't regress the performance on large machines=
.

why are we debating the limit I set outside of sched.. even that might
be subject to some tuning for devices that have more memory, but that
really outside the scope of this patch

> So, kindly try to prove that we're not prone to extreme performance regre=
ssion
> with a static value as you propose.
>
> > > Also, I think we should probably put this throttle mechanism in a sep=
arate
> > > component, that just wraps a counter of bytes or rather pages that ca=
n be
> > > increased and decreased through an API and the increase just blocks a=
t a certain
> > > threshold.
> >
> > Maybe?  I don't see why we need to explicitly define the units for the
> > credit.  This wasn't done for the existing credit mechanism.. which,
> > seems like if you used some extra fences could also have been
> > implemented externally.
>
> If you are referring to the credit mechanism in the scheduler for ring bu=
ffers,
> that's a different case. Drivers know the size of their ring buffers exac=
tly and
> the scheduler has the responsibility of when to submit tasks to the ring =
buffer.
> So the scheduler kind of owns the resource.
>
> However, the throttle mechanism you propose is independent from the sched=
uler,
> it depends on the available system memory, a resource the scheduler doesn=
't own.

it is a distinction that is perhaps a matter of opinion.  I don't see
such a big difference, it is all just a matter of managing physical
resource usage in different stages of a scheduled job's lifetime.

> I'm fine to make the unit credits as well, but in this case we really car=
e about
> the consumption of system memory, so we could just use an applicable unit=
.
>
> > > This component can then be called by a driver from the job submit IOC=
TL and the
> > > corresponding place where the pre-allocated memory is actually used /=
 freed.
> > >
> > > Depending on the driver, this might not necessarily be in the schedul=
er's
> > > run_job() callback.
> > >
> > > We could call the component something like drm_throttle or drm_submit=
_throttle.
> >
> > Maybe?  This still has the same complaint I had about just
> > implementing this in msm.. it would have to reach in and use the
> > scheduler's job_scheduled wait-queue.  Which, to me at least, seems
> > like more of an internal detail about how the scheduler works.
>
> Why? The component should use its own waitqueue. Subsequently, from your =
code
> that releases the pre-allocated memory, you can decrement the counter thr=
ough
> the drm_throttle API, which automatically kicks its the waitqueue.
>
> For instance from your VM_BIND IOCTL you can call
>
>         drm_throttle_inc(value)
>
> which blocks if the increment goes above the threshold. And when you rele=
ase the
> pre-allocated memory you call
>
>         drm_throttle_dec(value)
>
> which wakes the waitqueue and unblocks the drm_throttle_inc() call from y=
our
> VM_BIND IOCTL.

ok, sure, we could introduce another waitqueue, but with my proposal
that is not needed.  And like I said, the existing throttling could
also be implemented externally to the scheduler..  so I'm not seeing
any fundamental difference.

> Another advantage is that, if necessary, we can make drm_throttle
> (automatically) scale for the machines resources, which otherwise we'd ne=
ed to
> pollute the scheduler with.

How is this different from drivers being more sophisticated about
picking the limit we configure the scheduler with?

Sure, maybe just setting a hard coded limit of 1024 might not be the
final solution.. maybe we should take into consideration the size of
the device.  But this is also entirely outside of the scheduler and I
fail to understand why we are discussing this here?

BR,
-R

