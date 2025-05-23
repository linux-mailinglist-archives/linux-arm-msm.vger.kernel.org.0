Return-Path: <linux-arm-msm+bounces-59165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28511AC1A40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 04:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E7E7BA121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 02:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872952770B;
	Fri, 23 May 2025 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYUFyamI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0C625;
	Fri, 23 May 2025 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747968724; cv=none; b=NrABINn2P6E/dBjGxzvshiVWv00Sk/Np48KKXHDpHsG42jNdN+oH/NIamM1VbSG3DRk9WWC+PG0wQh5yvu5xQcw+oZnH9I9fKV2L09iokd8LHKpEFHTRMMYnkKMVZiewmiWhlUvgAAMmPUYiWmKtrfCjfWc9xKklu3nvqNpWY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747968724; c=relaxed/simple;
	bh=85tposCp5qIjog1xev8yR53k0au9MVEHGTMIGzRIr7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAJ+cE8nQsr0vHQV6yX9f3N0tum3W0+YEF17Cwiy1Sx27XmwwoIOnvlLuklw/kjcf9A9MC9XKGUGJFR+nbjQrfW7tH41rJUpuSWaAsbwsxIfVZvIQR1q8QLuWaSyF5PwjBAzBuiMiy63P0jZ0cWRobecvRp4AbH0ZKLeneqo7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYUFyamI; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85dac9728cdso282571939f.0;
        Thu, 22 May 2025 19:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747968722; x=1748573522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTSB0zI8EV3WEUJwB1OwJBkD3PikZdbJJrajz68TKpU=;
        b=iYUFyamII8RerW7DT3bq75XcbVu/Yd8caUQIrFXWUB0FdSIO4vUHsC9d6DqyJjUE3F
         qwmwcKvUADWEuD7zPGJx6kuiTn+dLeMVMR09MM0ueVP7qN7mMI73iOZOtnBmPA+EfHh+
         Y9R82XnbwvA6X8viEPsv6mhO0aN+uj7UR0BrGph+b6hI0xiKc/HqwHCZ3a3R3EG0wk5N
         gvEP6nhpJCEWXLLHJghIuNuYTxFgW5Wd+ejFEN1VhrXweN2zhXGrDAx1zmnfhZw5aXzL
         qQCCpwqslmVuW9krwUImtr4ogJUZEaHDOg5vzEeTOtZeTOgT0ASdmMtQz9IVcDdlYXzD
         tbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747968722; x=1748573522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTSB0zI8EV3WEUJwB1OwJBkD3PikZdbJJrajz68TKpU=;
        b=VoyHl2Q9GKuMc6HwQrJ8MgbvgqVmSOhYzComga3KvsKsUBTOY1aYS2TM0C1VPQ+RtD
         AZnDEsfhGbz2hyCOqHn5bZu19udBU0kMspOT2fDLLCKg4mrPq1oLyN1e58S3FKQ1h5bz
         hM5BZZyc4cl6wPQvjHnnZDMmQBSJKFkxBvWX8yBW3ij/qiyZduywRFEDSMPee6UbFx6+
         ff6oUPSxrdg0bSfSCZDvwS0tVJli+mLi50c7oDy+yDBjeuZYYhOjenkOB/IrXehRf3bt
         mBGE8KtFiMTZt3FrFWepN6w4Hypi4tPjyIeb1F0tZQglIy+EVmAYzLF4zfWClXHcNSn3
         zsng==
X-Forwarded-Encrypted: i=1; AJvYcCUBmECB5ZJdZY3xYQoHjBGFwRFQ1I4+uU8IRCn8CyGtRo2vtZxZloJHl1pCfx0+pr0X8mgPKpRejciOm1jx@vger.kernel.org, AJvYcCWcgHcSZ0zDAE87jp926jUhOOk3v80D0o3ZlHPzlOFdFt5m/f60wtGQib0eqbnVc711X+7maYiIAE7rX/m1@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhU7UUV1cG0wROqVmRruTrTCujRYEf/sXV9MzXu3uxAR4Xh1z
	iAg3x6g3PJ6urI6H2BN9PEA75v9TJ4iVyiX851wJybBe3tIKcrDuwqgNkCwCYJmtnZaQhRdomHs
	ng6wY8/ahQRjeRAc85QqCrvSE4xg6EIs=
X-Gm-Gg: ASbGncuUIwf3aSp0sOlTZHrJq7GJtMqtSgZUajS5SBgZc6MGNtrokBBemN/yrsTKDFm
	Ja0BCNq0yqCysWDPY5Neb8Sj1EFiKG7X3jPgFPhEV9DoLIdE7GIyxycvEFJeDOr88sQrhaSTtdI
	90fggM/CXFrgnYEP8bjvWC8PhbFz+2M4zAWKANYptATiXpDlbfNH+cNCBXvUgJ3F69
X-Google-Smtp-Source: AGHT+IGekz0rAdSPy6Esyn61QabmWg59bnZX7oGPMZFq1CRW47PXVM8Ji2t7L5VbUHV5PXKnuAfwbKUUuHc/BlAt9Z0=
X-Received: by 2002:a05:6602:6cc6:b0:861:7237:9021 with SMTP id
 ca18e2360f4ac-86caf0c1576mr176258739f.3.1747968721680; Thu, 22 May 2025
 19:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux> <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux> <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux> <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
 <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com> <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
In-Reply-To: <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 19:51:50 -0700
X-Gm-Features: AX0GCFv84KCQV61BbxGSWUJ9Yyr5yOTqzENnybuQuOJ009enSSfsiTbWai8yKfg
Message-ID: <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:31=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Wed, 21 May 2025 at 07:53, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > > Anyways, I don't agree with that. Even if you can tweak your =
driver to not run
> > > > > > > into trouble with this, we can't introduce a mode that violat=
es GOUVM's internal
> > > > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON=
().
> > > > > > >
> > > > > > > I still don't see a real technical reason why msm can't be re=
worked to follow
> > > > > > > those lifetime rules.
> > > > > >
> > > > > > The basic issue is that (a) it would be really awkward to have =
two
> > > > > > side-by-side VM/VMA management/tracking systems.  But in legacy=
 mode,
> > > > > > we have the opposite direction of reference holding.  (But at t=
he same
> > > > > > time, don't need/use most of the features of gpuvm.)
> > > > >
> > > > > Ok, let's try to move this forward; I see three options (in order=
 of descending
> > > > > preference):
> > > > >
> > > > >   1) Rework the legacy code to properly work with GPUVM.
> > > > >   2) Don't use GPUVM for the legacy mode.
> > > > >   .
> > > > >   .
> > > > >   .
> > > > >   3) Get an ACK from Dave / Sima to implement those workarounds f=
or MSM in
> > > > >      GPUVM.
> > > > >
> > > > > If you go for 3), the code introduced by those two patches should=
 be guarded
> > > > > with a flag that makes it very clear that this is a workaround sp=
ecifically
> > > > > for MSM legacy mode and does not give any guarantees in terms of =
correctness
> > > > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> > > >
> > > > I'm not even sure how #2 would work, other than just copy/pasta all=
 of
> > > > drm_gpuvm into msm, which doesn't really seem great.
> > > >
> > > > As for #1, even if I could get it to work, it would still be a lot
> > > > more mmu map/unmap (like on every pageflip, vs the current state th=
at
> > > > the vma is kept around until the object is freed).  For the
> > > > non-VM_BIND world, there are advantages to the BO holding the ref t=
o
> > > > the VMA, rather than the other way around.  Even at just a modest
> > > > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the un=
map
> > > > costs a tlbinv).  So from that standpoint, #3 is the superior optio=
n.
> > > >
> > >
> > > Before we get to #3, I'll need a bit more info here on why you have t=
o
> > > map/unmap the VMA on every pageflip.
> >
> > Previously we'd keep the VMA hanging around until the GEM obj is
> > freed.  But that can't work if the VMA (via the VM_BO) is holding a
> > reference to the GEM obj.
> >
> > I was kinda thinking about keeping the VMA around until the handle is
> > closed.. but that doesn't cover the dma-buf case (ie. when you
> > re-import the dma-buf fd each frame.. I know android does this, unsure
> > about other wsi's).
> >
> > > But actually I think 2 is the best option, I think in nouveau this is
> > > where we ended up, we didn't modify the old submission paths at all
> > > and kept the old bo/vm lifetimes.
> > >
> > > We just added completely new bind/exec ioctls and you can only use on=
e
> > > method once you've opened an fd.
> >
> > hmm, but that means tracking VMAs against a single BO differently..
> > which.. at least seems ugly..
>
> I don't think it is if you already have the code to do that, and just
> add gpuvm support in parallel.
>
> You also have to figure out that the world is moving towards Vulkan
> for everything so any optimisations you've made for particular legacy
> paths will need to be dealt with in the future picture anyways.
>
> But I'd rather not hack gpuvm into being something it isn't, if there
> is a meaningful commonality in legacy bo/vm bindings across drivers,
> we could create something new, but the ref counting and handling is
> pretty fundamental to gpuvm architecture.
>
> There should only be two paths, legacy and gpuvm, and you shouldn't
> ever be mixing them on a particular exec path, since you should only
> have a vm per userspace fd, and can pick which way to use it the first
> time someone calls it.

It's not as much about the exec path, as it is about making all the
non-exec paths (like shrinker/residency) have to deal with two
completely different things..

But I think I have figured out something workable.  I add an extra
refcnt per BO for the vma, incremented by userspace holding a gem
handle, userspace holding a dma-buf fd, or (ofc) actual pin for
scanout.  When the refcount is above zero I defer teardown in the
kms->vm until it drops to zero.  It isn't _exactly_ the same as lazy
VMA teardown when the BO is freed, but it is effectively the same
thing.  And whenever the vma_ref is greater than zero, the BO has
something else holding a ref so the ref loop doesn't matter.  If there
is no userspace process holding a reference to the BO via handle or
dma-buf fd, then it isn't going to be used again in a swapchain, so
the difference btwn tearing down the VMA when the vma_ref drops to
zero vs when the BO is freed doesn't amount to anything.

It's a bit weird adding some extra mechanism specifically for the
scanout vm, and maybe a bit uglier (depending on eye-of-beholder) than
making gpuvm work in either way (since the latter was a pretty
straightforward patch), but less ugly than having to parallel
mechanisms.  So if you _really_ don't like the WEAK_REF flag, I have a
workable alternative that addresses the performance problems.

BR,
-R

