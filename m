Return-Path: <linux-arm-msm+bounces-58816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4AABE742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 00:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488C93AB5D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF3825F979;
	Tue, 20 May 2025 22:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCrUKpsi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CB25F7B4;
	Tue, 20 May 2025 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780307; cv=none; b=dRV8Fg57x2GnHPWEmEIUWH1J3WH63dzr3al/K40asOppmsR2hjRZntSRDAdDYAwPhQBRjDYxvtGVioyCPsoynur9pno5aG+4hU7hvwlHAosKESEfGpTMW2ou+s5D5Uqmko3J9zmT11L3zGtkladw5P4p4Xp/XCQN1jVQ3VtXyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780307; c=relaxed/simple;
	bh=4M2YWpO1US5cekurRighr1N0tBMWxvV+4CgHP8/lknk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIgxnl2WtuG3CW9Bt2sMhBEPUlHgTK+zlmka52e/aoXCdvU0E/gJ3SiMuNP1pRUiqiEMdNd3NFMLMgRCdBa0ZiY82zBaIO+z+ZEO1Oo4BZe8NuIXiMhjnEX2qheOQ/XDwlRsEShTqkvm1MCYQLPw+tqwjtm93Eog3YTmlkwJzpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCrUKpsi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so5618208a12.1;
        Tue, 20 May 2025 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747780304; x=1748385104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfViJTkocBFZaKtNJGCb8qOEo9ZbscCCsSMtkpHUjAw=;
        b=mCrUKpsi5cE+GC8z72L99cKzA8DsQoIfdzVKRextIyj4UG2fn9fTkydowjpocRtxMY
         l6wnt1P/6lZ+Gdlrhrav4ag9YOk8qm6/VZxZneXf9rX6wVkyrW37QSiPZfyAlUhBsQbl
         vPxykVXrGdbZhkMzW7+D4QJGVHoUVqQBzlTeQ+Iul8q4Zbg68Yd+WsDCXtH+0yf3kHXR
         2ahJG1d2F6pLfmj5k59h4d13oTjts7i9SsVCoQi37XkgwYEe6iDDFWkHRWPXyw3fWs3B
         /K24g29yuf8F+0kc75+w8zrn0qNcynqmC6EPKwEPNRmHgoLf0TOmIGyPKwyjloPVMO7N
         X5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780304; x=1748385104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfViJTkocBFZaKtNJGCb8qOEo9ZbscCCsSMtkpHUjAw=;
        b=eg8AzZfhg40W5zbQzM3rHsYAATQ7KlUQuCSDRQcaKyTZFS11/tLX2jZWsCMa7RdXQS
         1J1w3Y6xC/mKwIv8AGrFnSZ1sBxdaE+RhRZlAGrAJKSRE/105Sjcxf0wShKP5MZwTnEo
         pnte1EJaHnVaMgZ2Ao7fGU1lPLeqR7wXCZkYlJQP8h3BOMHEVKMWCf3BX8MnEeGYCefP
         zWGsyYTvXzmEItUVNDtYvYc1KINkpJ3ALmFs80TYUdG5tT9Yg6TKXmYapbe3ULPlLhGj
         re+6nV1HkBd+ekiA7ijbHOK1lprQCBEiLxDeJODWhcJs4kYquiy7NJMLvevhdJvFNZPB
         +dlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe9w7+hZRAI8yLhyMJa86iFO+wdl0TA77S0Xb1FEvIKK3zLCSeZ8RRwInCUkcPlYdJ8yETV/sCeoTukjHa@vger.kernel.org, AJvYcCXaXNGwuc30ULketBpaUoByiTDUcaK3Lbf6k7AEGnrJdeSS0tpUTOtU9/WqWQ1dtLf+JBTVKHgHsc6bFUrX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GnA8BzX8Hs2i4EZvKlO/LnkQWHnz9osV3TGy6s5Zx78bkIWW
	zZ4j5iKehw1/LmQNWysLmaDDkGBw1ycwYRUsQ3BCBOa0QvBaBIwU4icECtGmcV2hBIjZ1+fitsu
	5B8HtTPleuzOif7ddRBnLXg+UusP3sBg=
X-Gm-Gg: ASbGncukDq1h+egy8J/lJoNwsjQ6ZH8j175m5II6E4TWJWSV0VjW8/kpMR3awuHoqQ2
	UdEMMOKYhhiUuzjXd0B66OkYQiiBCi8gubR6XwWCdHIg5eDs/keh6dG2svDygQ+T50o4UkSyntW
	KvoIHiuc5RTP0abRjmaN8QIRie14ysXSwkJLIa3AyiHQ==
X-Google-Smtp-Source: AGHT+IHy1qy9Y9Iw/2PjuoPWfqMC/gE8vuaoRZoeD3b3kOntxxhSfTFnxCi25EtDFYsyoHHlawo3lUz4LJtHhfQlWCs=
X-Received: by 2002:a17:907:7d86:b0:ad5:6258:996f with SMTP id
 a640c23a62f3a-ad56258a94fmr1093719966b.19.1747780303506; Tue, 20 May 2025
 15:31:43 -0700 (PDT)
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
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com> <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
In-Reply-To: <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 08:31:31 +1000
X-Gm-Features: AX0GCFsKkEmiEjqukzoqKCLeCFvPEzUImMvmitaMXLQCSIsFSJxiY59ID8GzQYM
Message-ID: <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Rob Clark <robdclark@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 at 07:53, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel=
.org> wrote:
> > > >
> > > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@k=
ernel.org> wrote:
> > > > > > Anyways, I don't agree with that. Even if you can tweak your dr=
iver to not run
> > > > > > into trouble with this, we can't introduce a mode that violates=
 GOUVM's internal
> > > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON()=
.
> > > > > >
> > > > > > I still don't see a real technical reason why msm can't be rewo=
rked to follow
> > > > > > those lifetime rules.
> > > > >
> > > > > The basic issue is that (a) it would be really awkward to have tw=
o
> > > > > side-by-side VM/VMA management/tracking systems.  But in legacy m=
ode,
> > > > > we have the opposite direction of reference holding.  (But at the=
 same
> > > > > time, don't need/use most of the features of gpuvm.)
> > > >
> > > > Ok, let's try to move this forward; I see three options (in order o=
f descending
> > > > preference):
> > > >
> > > >   1) Rework the legacy code to properly work with GPUVM.
> > > >   2) Don't use GPUVM for the legacy mode.
> > > >   .
> > > >   .
> > > >   .
> > > >   3) Get an ACK from Dave / Sima to implement those workarounds for=
 MSM in
> > > >      GPUVM.
> > > >
> > > > If you go for 3), the code introduced by those two patches should b=
e guarded
> > > > with a flag that makes it very clear that this is a workaround spec=
ifically
> > > > for MSM legacy mode and does not give any guarantees in terms of co=
rrectness
> > > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> > >
> > > I'm not even sure how #2 would work, other than just copy/pasta all o=
f
> > > drm_gpuvm into msm, which doesn't really seem great.
> > >
> > > As for #1, even if I could get it to work, it would still be a lot
> > > more mmu map/unmap (like on every pageflip, vs the current state that
> > > the vma is kept around until the object is freed).  For the
> > > non-VM_BIND world, there are advantages to the BO holding the ref to
> > > the VMA, rather than the other way around.  Even at just a modest
> > > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unma=
p
> > > costs a tlbinv).  So from that standpoint, #3 is the superior option.
> > >
> >
> > Before we get to #3, I'll need a bit more info here on why you have to
> > map/unmap the VMA on every pageflip.
>
> Previously we'd keep the VMA hanging around until the GEM obj is
> freed.  But that can't work if the VMA (via the VM_BO) is holding a
> reference to the GEM obj.
>
> I was kinda thinking about keeping the VMA around until the handle is
> closed.. but that doesn't cover the dma-buf case (ie. when you
> re-import the dma-buf fd each frame.. I know android does this, unsure
> about other wsi's).
>
> > But actually I think 2 is the best option, I think in nouveau this is
> > where we ended up, we didn't modify the old submission paths at all
> > and kept the old bo/vm lifetimes.
> >
> > We just added completely new bind/exec ioctls and you can only use one
> > method once you've opened an fd.
>
> hmm, but that means tracking VMAs against a single BO differently..
> which.. at least seems ugly..

I don't think it is if you already have the code to do that, and just
add gpuvm support in parallel.

You also have to figure out that the world is moving towards Vulkan
for everything so any optimisations you've made for particular legacy
paths will need to be dealt with in the future picture anyways.

But I'd rather not hack gpuvm into being something it isn't, if there
is a meaningful commonality in legacy bo/vm bindings across drivers,
we could create something new, but the ref counting and handling is
pretty fundamental to gpuvm architecture.

There should only be two paths, legacy and gpuvm, and you shouldn't
ever be mixing them on a particular exec path, since you should only
have a vm per userspace fd, and can pick which way to use it the first
time someone calls it.

Dave.
Dave.

