Return-Path: <linux-arm-msm+bounces-58756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28BABE1C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC8A17B3A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFED2750FD;
	Tue, 20 May 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ude66uDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FD35893;
	Tue, 20 May 2025 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761789; cv=none; b=KH6/CsSvU6hxUddStORZpTplrTQq/xVfs3jYeEw4prSPF0mHVd1jMgBPQxy5i1Iys440tpeD5s5ARXuNFWprazWDRN38ts1EQcup8/khFgdPLcsHgoiJrdj1sSfc/ap3yEjyTPip+8Lwwb9F0kKyiJ7QjlSuHgiiSY2scOwrkwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761789; c=relaxed/simple;
	bh=8eZED5w9zKxVp6d7OJ00CYNhKuARUjjMVJwyR3aUQqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU+JtjL080+CKip9WdyAIkUyPJaGkdbP76u6ghC4CSJQbrqCX7OYMMDSOSKUnBoUStGdnsQUasiTzVPg73VVT7iiqpdxIYZNs6BCig7jYplqZ7ObPaYnqkU560GZgbWk9TjOmprKxsg5nvyvtOoDEGF0C2zI6KLobEQP9hyEJaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ude66uDn; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da6fb115a6so45435235ab.1;
        Tue, 20 May 2025 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747761786; x=1748366586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/1eH7FjHnXuwS8GNeCtTiHpwIYDozegXN0D5gLrtdM=;
        b=Ude66uDnhmOWvwnkB2+5tUu+ZlhzpL6v1ko6WZGdCAlXuuJZk4MM3ocZUnrXBhAaXS
         GGUb4bPXC2OVhfbQuQ6W4XsZnorew8nO0fPODMVPTY+bylGVpXSccqGZ3PVy4RTdC5bZ
         bBvlLAmetMHHqttvn9UWZPu+mlzQFyS6cVeArEKdJYwOTfVJn4SbGx1B1BwH3mv+xoUC
         MnbOzu7GbB1AgXEjmxkaVBiLHUaX/X6ual9/48HRsiVjFHm7/EDh+xQCdF4PJQ20+JQK
         8tGpChH3BzVOrCBgwHrzhpi+tLCvMvWlssUY2Jb3xaPbJP69M4xMmbR5IiU9d3osc8ug
         5Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761786; x=1748366586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/1eH7FjHnXuwS8GNeCtTiHpwIYDozegXN0D5gLrtdM=;
        b=Bffb24zm0I95ye4i2amj47eoSPTwO/dGuehpixvzaY89sEfGeii23YHGdb/42MFTpL
         2bAOjsi34qYtT752Icl7/JelAT0BQv2usehhlxZ+A28AhNBDS4iFloRJu9feeDuVZpvP
         v6Q2FcCsEOpbdPeYC0RRCTo36cvjZgtHnL421UpGM3cNANCxhAaxX9Y6OFol1/Tx6V6L
         IPFI6dXPSzsbLvW8DVzI1Pvq3zQeHfA4ROqHlHToN8aPkLmUWbRIDSJY3doAtHtRCo/2
         5kfShGghLcB56AHH7FRkyO8xHklII67eRSuzDVfLpz8/WzHbryk2qXBnp3Xn9WnjfMKP
         lzKA==
X-Forwarded-Encrypted: i=1; AJvYcCXjCWyE5bxPLm8BhqAdO2QxQ2SZVlvp3t5nNNbwJlYDSvLL9SKyeR2fMgesWSivEB9OUaXvi4paqr6An6zm@vger.kernel.org, AJvYcCXxXV2X64SsLFh3nUqYXwhGjbxeG7FK52wIFceDiPFpRCAHH7NKsAsST3GNd4igmeyKYyVoTgabBEj705wq@vger.kernel.org
X-Gm-Message-State: AOJu0YzlH6QN9XvHM8dqDTThj/xxtTdY9hbUNpryro4j8cMLNuQVyYJx
	R+GRl8ekkDGd6KZAfJFCPOlHzuy6ExEfE1Pdtuf2y+BhkUR7wnhTHO3ezNTWsV2T+OKM5eMmPkN
	rDzznuUItdyW6MwEBI5jLGtcSplISwr4=
X-Gm-Gg: ASbGncugW8A+zz8JEfTEEg5p9vb2gnlwYWBUZOrLFKIGBkQm0/3Lc/moKih6OzZRK7I
	Y77vUWti3pWLEZhflHIOvtnsaYLh+EuDWCwHiXc7Lkj9O+GChzYro/5CT/P1+Z/Pn9uel0aHiHn
	6CyFvjQt0yRVjPeyWZ9OgXuiU0U3+KQORcMaIgKNFIN/o8oYlHm6olhBlRk500Wim/s2JKdRD+p
	A==
X-Google-Smtp-Source: AGHT+IHpQA08tYTT02U2iTROdpr5ReReyZy/jVFOO0KEV8Wa4oUzzDHXqMwq9idWIskV4i26glWc97QtN/cPQ9E+S6o=
X-Received: by 2002:a05:6e02:23c8:b0:3dc:76ad:e3a8 with SMTP id
 e9e14a558f8ab-3dc76ade94dmr62670085ab.11.1747761786345; Tue, 20 May 2025
 10:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-5-robdclark@gmail.com> <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux> <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux> <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux> <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
In-Reply-To: <aCyzyAPbQ1SYbo4q@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 10:22:54 -0700
X-Gm-Features: AX0GCFssom0OIu9t5oGBdb8b5O6J5LNG6iWic-G7BUb-iO0A4ra9weO2FuUipaU
Message-ID: <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
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

On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > On Thu, May 15, 2025 at 12:56:38PM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > >
> > > > > > > (Cc: Boris)
> > > > > > >
> > > > > > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote=
:
> > > > > > > > For some context, other drivers have the concept of a "sync=
hronous"
> > > > > > > > VM_BIND ioctl which completes immediately, and drivers impl=
ement it by
> > > > > > > > waiting for the whole thing to finish before returning.
> > > > > > >
> > > > > > > Nouveau implements sync by issuing a normal async VM_BIND and=
 subsequently
> > > > > > > waits for the out-fence synchronously.
> > > > > >
> > > > > > As Connor mentioned, we'd prefer it to be async rather than blo=
cking,
> > > > > > in normal cases, otherwise with drm native context for using na=
tive
> > > > > > UMD in guest VM, you'd be blocking the single host/VMM virglren=
der
> > > > > > thread.
> > > > > >
> > > > > > The key is we want to keep it async in the normal cases, and no=
t have
> > > > > > weird edge case CTS tests blow up from being _too_ async ;-)
> > > > >
> > > > > I really wonder why they don't blow up in Nouveau, which also sup=
port full
> > > > > asynchronous VM_BIND. Mind sharing which tests blow up? :)
> > > >
> > > > Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.=
buffer_size_2_24,
> > >
> > > The test above is part of the smoke testing I do for nouveau, but I h=
aven't seen
> > > such issues yet for nouveau.
> >
> > nouveau is probably not using async binds for everything?  Or maybe
> > I'm just pointing to the wrong test.
>
> Let me double check later on.
>
> > > > but I might be mixing that up, I'd have to back out this patch and =
see
> > > > where things blow up, which would take many hours.
> > >
> > > Well, you said that you never had this issue with "real" workloads, b=
ut only
> > > with VK CTS, so I really think we should know what we are trying to f=
ix here.
> > >
> > > We can't just add new generic infrastructure without reasonable and *=
well
> > > understood* justification.
> >
> > What is not well understood about this?  We need to pre-allocate
> > memory that we likely don't need for pagetables.
> >
> > In the worst case, a large # of async PAGE_SIZE binds, you end up
> > needing to pre-allocate 3 pgtable pages (4 lvl pgtable) per one page
> > of mapping.  Queue up enough of those and you can explode your memory
> > usage.
>
> Well, the general principle how this can OOM is well understood, sure. Wh=
at's
> not well understood is how we run in this case. I think we should also
> understand what test causes the issue and why other drivers are not affec=
ted
> (yet).
>
> > > > There definitely was one where I was seeing >5k VM_BIND jobs pile u=
p,
> > > > so absolutely throttling like this is needed.
> > >
> > > I still don't understand why the kernel must throttle this? If usersp=
ace uses
> > > async VM_BIND, it obviously can't spam the kernel infinitely without =
running
> > > into an OOM case.
> >
> > It is a valid question about whether the kernel or userspace should be
> > the one to do the throttling.
> >
> > I went for doing it in the kernel because the kernel has better
> > knowledge of how much it needs to pre-allocate.
> >
> > (There is also the side point, that this pre-allocated memory is not
> > charged to the calling process from a PoV of memory accounting.  So
> > with that in mind it seems like a good idea for the kernel to throttle
> > memory usage.)
>
> That's a very valid point, maybe we should investigate in the direction o=
f
> addressing this, rather than trying to work around it in the scheduler, w=
here we
> can only set an arbitrary credit limit.

Perhaps.. but that seems like a bigger can of worms

> > > But let's assume we agree that we want to avoid that userspace can ev=
er OOM itself
> > > through async VM_BIND, then the proposed solution seems wrong:
> > >
> > > Do we really want the driver developer to set an arbitrary boundary o=
f a number
> > > of jobs that can be submitted before *async* VM_BIND blocks and becom=
es
> > > semi-sync?
> > >
> > > How do we choose this number of jobs? A very small number to be safe,=
 which
> > > scales badly on powerful machines? A large number that scales well on=
 powerful
> > > machines, but OOMs on weaker ones?
> >
> > The way I am using it in msm, the credit amount and limit are in units
> > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > 1024 pages, once there are jobs queued up exceeding that limit, they
> > start blocking.
> >
> > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in fli=
ght.
>
> That doesn't make a difference for my question. How do you know 1024 page=
s is a
> good value? How do we scale for different machines with different capabil=
ities?
>
> If you have a powerful machine with lots of memory, we might throttle use=
rspace
> for no reason, no?
>
> If the machine has very limited resources, it might already be too much?

It may be a bit arbitrary, but then again I'm not sure that userspace
is in any better position to pick an appropriate limit.

4MB of in-flight pages isn't going to be too much for anything that is
capable enough to run vk, but still allows for a lot of in-flight
maps.  As I mentioned before, I don't expect anyone to hit this case
normally, unless they are just trying to poke the driver in weird
ways.  Having the kernel guard against that doesn't seem unreasonable.

BR,
-R

