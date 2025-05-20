Return-Path: <linux-arm-msm+bounces-58804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E80ABE5FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79E994C8122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FC62586CF;
	Tue, 20 May 2025 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/uBeVmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F032528FD;
	Tue, 20 May 2025 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776328; cv=none; b=gYg+TnrWY2S6iqcAkiiKZDWTJ6tCiY4Kf2XMHVTwX1Q0DRyF97c/2bYceCoYxIO5gV0//SfR5hvdAT63AOVtjbc3ULWfK62Hy01D8fzyik2E7D8Uoht5eEGJLzGSFrqofRM24a2zB9gRCT+wVWU2Z0bEge0bRX7m5ZTzg0WJzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776328; c=relaxed/simple;
	bh=dg94g59K8WbJ2pSnKAEqgNe5XTuLFJMFdFvqxrKayfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWggH83bpCqbed8jJnat+GMJA5nHT8H57jx4Yn4SpmMYlNGlxKiaTnUX1WYl16IjYGHp0uJm8/JtCxXWG1S4idFtpP4rbf73oVwiGHLx1agJUlROY2owiZBS8TIsUToErWG9NS2uQGfhMQGcWJJzhceFMYxWoFfx6faRDbwX6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/uBeVmw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acacb8743a7so1014377666b.1;
        Tue, 20 May 2025 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747776325; x=1748381125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjei6tpJPSQ0e9U9wsr0Ul9qD6v36GQZR4JG0Hi36U4=;
        b=N/uBeVmwinEcVOC3oxFxlDEmnNCpmNw7PEQTdAOIDxEwsM5Kfal2YXbDPrFQP8Gnc0
         fjEkmBa+8qpRg3OZVPlZhQ/kvrFsSqeWga//yOLntljeW0hoXltDkJ7pIDe63Kfv1Xym
         FwKYx7vQY/jmp4RpgL8TZQ9hkmqSUCZ0rbwqjJRf3Bb6u74b1Z7eavOF80rJcUveiKlB
         ryUACwq0B9BLewHICkg/wiOrJ4Z+w9FZK0a/r8W2tfN8Sqp6Lj6Nxplx8Jp9rXEIx4W8
         ogmSl42xOr7sjkWPUvikuSltoy+rxoVrtaFkf3XHz4PH6qdiX5yj0czSKz53Ja7nnmg5
         kokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776325; x=1748381125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjei6tpJPSQ0e9U9wsr0Ul9qD6v36GQZR4JG0Hi36U4=;
        b=F6Vs9zVKank1Me1nwS2SbaiW0lsd760FNTTnZYxlEh2b97zA4zexQwlOqeV/Al8TAQ
         sh0QT9ywUdMm6Il2ADof+fh9r75WAMY/X/VKagH4MMhZWiTfAZNQm1fHGBhdWNDZcuJb
         2jr4hR7f50zaL/w7EkfV0kQCEaQBf9B/droBhyUg1lQIDGlHdzIFNDAKqY7u7LHCvRER
         5Xma+6hUqqjh/675YwTAPdUmUcrti5wQbq1Cti6AWEASYBueL6G/Rmur4rIR9++JpWHm
         Ylrblt3Xp908c5VH9wY9+VBMbit37veKmvwVbua9aalPgbn+hJ+4FciLpFjZOIGbifkB
         PkVg==
X-Forwarded-Encrypted: i=1; AJvYcCV90H9fbK8IM1EexCwyu1Z4eoVGE7XQHHT3yIrzv6wyfrN87C00hRTy7ID9ie4MpqMTn+GQCK2dDqq4Zc/5@vger.kernel.org, AJvYcCXLmEkJsgw6+WV8Z+CHlgZwWLCNpoUY7bBq/h2blfRM/PGrBcPOAnmZyOHcVY+jjhKFlc3njMxTtuKI1Ea2@vger.kernel.org
X-Gm-Message-State: AOJu0YxsJhWwTeUc1rGaXQE5Sc7hXu94GPUUxfqxrAAi5Y0FccxZsINK
	V5xyhtPd88UlJMGv07gTn+9LHIkLs7kp31kcsRn3bQwYHzVwwTWX+rmLpoGEdh+I5Eb2GhQZHp+
	25do0nL7zG0l+vwK23QJhIRWpbv1HnOE=
X-Gm-Gg: ASbGnctbv2x8dMPXPexd/ANo0vf0ebyIpPda6EWMxAJLqRPBjXxs0hsMDg0nRG3zvnU
	UTH9wuJUJtxll8DEhcDX/+NzkxZT/dxenD3GDPhXRceLRxRstCEbxdMZfr98SZa3vlMb7GIPrmO
	cIIk9nfN/zH3mXqADaQ5x+PIsck1xiIEU=
X-Google-Smtp-Source: AGHT+IHeiaUdgEFO2So4GMMibHxdFP3yxkv+J8hkFxYuUz58iYp5XzJt7h08dQw7tqbTQ4mjFmNIXYkCfPjkMRBsMMs=
X-Received: by 2002:a17:907:9603:b0:ad2:2e9d:7517 with SMTP id
 a640c23a62f3a-ad52f32194emr1593154366b.8.1747776324656; Tue, 20 May 2025
 14:25:24 -0700 (PDT)
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
In-Reply-To: <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 07:25:13 +1000
X-Gm-Features: AX0GCFs9mt-wQ318QgIa3qoAgEMylqDYXoQTma-NV3k90LdxrvoZJdBGinnYee0
Message-ID: <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
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

On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kerne=
l.org> wrote:
> > > > Anyways, I don't agree with that. Even if you can tweak your driver=
 to not run
> > > > into trouble with this, we can't introduce a mode that violates GOU=
VM's internal
> > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > > >
> > > > I still don't see a real technical reason why msm can't be reworked=
 to follow
> > > > those lifetime rules.
> > >
> > > The basic issue is that (a) it would be really awkward to have two
> > > side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> > > we have the opposite direction of reference holding.  (But at the sam=
e
> > > time, don't need/use most of the features of gpuvm.)
> >
> > Ok, let's try to move this forward; I see three options (in order of de=
scending
> > preference):
> >
> >   1) Rework the legacy code to properly work with GPUVM.
> >   2) Don't use GPUVM for the legacy mode.
> >   .
> >   .
> >   .
> >   3) Get an ACK from Dave / Sima to implement those workarounds for MSM=
 in
> >      GPUVM.
> >
> > If you go for 3), the code introduced by those two patches should be gu=
arded
> > with a flag that makes it very clear that this is a workaround specific=
ally
> > for MSM legacy mode and does not give any guarantees in terms of correc=
tness
> > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
>
> I'm not even sure how #2 would work, other than just copy/pasta all of
> drm_gpuvm into msm, which doesn't really seem great.
>
> As for #1, even if I could get it to work, it would still be a lot
> more mmu map/unmap (like on every pageflip, vs the current state that
> the vma is kept around until the object is freed).  For the
> non-VM_BIND world, there are advantages to the BO holding the ref to
> the VMA, rather than the other way around.  Even at just a modest
> single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
> costs a tlbinv).  So from that standpoint, #3 is the superior option.
>

Before we get to #3, I'll need a bit more info here on why you have to
map/unmap the VMA on every pageflip.

But actually I think 2 is the best option, I think in nouveau this is
where we ended up, we didn't modify the old submission paths at all
and kept the old bo/vm lifetimes.

We just added completely new bind/exec ioctls and you can only use one
method once you've opened an fd.

Dave.

