Return-Path: <linux-arm-msm+bounces-58814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF444ABE685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238291BA5711
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D6925EFA3;
	Tue, 20 May 2025 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLabc7cR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47E25EF9F;
	Tue, 20 May 2025 21:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777984; cv=none; b=bhk6kU1Sq565+/AkrPyBtV7qgbiKywr8EsL5bQov/B3KIR0v8ZLWE/mX4Q0fePdwXEwgg+sRdnq3SYG5Ir4R/5BObfA27oxKkHTqiqVCYSn4e+JFtp8/2pQ3BZmhCiUX7yoD0mcwRlhwELdhh5toQEWDIrtFexmBE8si1kvft2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777984; c=relaxed/simple;
	bh=T2R0P/Zwkq+zDzFpGK8KBsQEbaNh3WrWD5w+PmTJzFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i00Yl8rqkxJxxivZPNeiqR7hyzcyJzS50mLHzWPR700PF/KLK1VLBfpRJZ9/CKUaC7lfSjw1vfZfObIYUmtORbiqlNulKYvBw+9fZqRJOK7JYHupxNyCH0EFb9xsYpg44/QOe+7DFX+92Q276fsYN+a2+W4XN+M0MvwOQagcBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLabc7cR; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85d9a87660fso723875339f.1;
        Tue, 20 May 2025 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747777980; x=1748382780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuVlqzP6iXct0lFrcIZTm1GBh35JJKL+f7ymQBJygW4=;
        b=HLabc7cRVxfO928ukExc+Ez491DBeCY+dit2nYscu7CKLdIrv/i45za1O5OPdnXu3A
         jZm1MdDAuP1l7VoHw1INKohiHT8CZvV1rLQIZmDHOlpEHf7ve47yABCFv4TjRhyVYjHR
         sFGyYUW++me20i0aujYnxluGJvq2yKc4xd6kE2grubaP8pivU+QeuP6odwnTaIFJ6H4r
         sTMtPHshD+65YZsnWBEtSYt2ldXY3TQ23qLAHfRBtpo3CfqkcrCUMGcDAOWGLc1kFtaT
         8kJlzjlXJG537AbyZRwWMZcIwESG5wJafgRUcfHLGdoO3xF/CvVwHMIHM12Q4g/ibL78
         Oi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777980; x=1748382780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuVlqzP6iXct0lFrcIZTm1GBh35JJKL+f7ymQBJygW4=;
        b=u0abTS4zs+VGP96Y/tZ9yCylXJzICKDdiAdmqZywRHiUtopXNgEmFEAvQXUFCJJ8Ur
         seGb8pfXAHGqlRbbYQl/nmhnAREaMoFvxAvKlNbPysHvmMGPxyiK/Usdyffj2acK4zZh
         RFpKINX0KvOCQwwV75w7dBEcB6J88R4sg5Ou3qnQvURYHy6qSdKuad8KCrn8QwK48LVK
         hbz9R6tSL2jZgRUF2bzpEIeTQ7zNavvpVa8vEU+FzfaL66RUgbOokzeV+iFu4C9cPlM0
         sdpftIx+7wQzm2QqjP86OEc0Knt7qVU5bwwuGEnLst6FFmMMVCbPVTyPYhXXmwBl1aO9
         89Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWK5y7JloRaTMg03EqeSzQEv9Ycb2a/vy5q7UTdlZaG7jrowyO4WEUOazv1tck3yIdsmnS7Lu6RYyYdt6Qq@vger.kernel.org, AJvYcCXGd2KGB8lokVMdyg1YANJDeloOzRkl9a1qKqu1mEQ6yAjRK1Eww1FUya0w7n6JMSUho37U6zYyWf5gfgUm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+64wSuUYlSeIaU0n721h8O2o6REk5+XNGG0HAwNOxw4aXqM7U
	p2nC/9diToPKCOzfMLZcocuHqRI/lasLkMbuLRQmJNhHjqLwcnPQtcw9cftMUu2l5++WNCeTT7x
	v3pwQHZtGA4yfJSvV0pKYW8avybr9Bt0=
X-Gm-Gg: ASbGncvjAFnKNvz4zz40qOzEwPNaefLdwFg66SUHErefmJwO+PSBPd14UISqS9Ko40Q
	zXKke2ZGvgC9i2dpU227SPcZegHYkgXnifp+yheWe/Xe2sZvjTPNPyLHYzrKK7sb9x/7o981sXd
	OB7gairS6jECkrOD9kefI3rOcNe8BVRK89GK6Y3OmtEZuSglga+DU3uTGfA5suVZ4=
X-Google-Smtp-Source: AGHT+IEuaiBFFGIGy14K80S5naidJLdvAnnIZZeIPE2EBWmxHD5C+BwZzinOlUVBMCvjFMXYVRc6JoejfzwzLAukeFM=
X-Received: by 2002:a05:6602:3f0c:b0:869:fc1b:2194 with SMTP id
 ca18e2360f4ac-86a24be4576mr2729545839f.6.1747777980380; Tue, 20 May 2025
 14:53:00 -0700 (PDT)
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
In-Reply-To: <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 14:52:48 -0700
X-Gm-Features: AX0GCFv1xHSFd5_UP6XbLk2fb4sCVfGSRx4kCq5rhPD3j4LYF5oO5OtYJJS5kN8
Message-ID: <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
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

On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > > Anyways, I don't agree with that. Even if you can tweak your driv=
er to not run
> > > > > into trouble with this, we can't introduce a mode that violates G=
OUVM's internal
> > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > > > >
> > > > > I still don't see a real technical reason why msm can't be rework=
ed to follow
> > > > > those lifetime rules.
> > > >
> > > > The basic issue is that (a) it would be really awkward to have two
> > > > side-by-side VM/VMA management/tracking systems.  But in legacy mod=
e,
> > > > we have the opposite direction of reference holding.  (But at the s=
ame
> > > > time, don't need/use most of the features of gpuvm.)
> > >
> > > Ok, let's try to move this forward; I see three options (in order of =
descending
> > > preference):
> > >
> > >   1) Rework the legacy code to properly work with GPUVM.
> > >   2) Don't use GPUVM for the legacy mode.
> > >   .
> > >   .
> > >   .
> > >   3) Get an ACK from Dave / Sima to implement those workarounds for M=
SM in
> > >      GPUVM.
> > >
> > > If you go for 3), the code introduced by those two patches should be =
guarded
> > > with a flag that makes it very clear that this is a workaround specif=
ically
> > > for MSM legacy mode and does not give any guarantees in terms of corr=
ectness
> > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> >
> > I'm not even sure how #2 would work, other than just copy/pasta all of
> > drm_gpuvm into msm, which doesn't really seem great.
> >
> > As for #1, even if I could get it to work, it would still be a lot
> > more mmu map/unmap (like on every pageflip, vs the current state that
> > the vma is kept around until the object is freed).  For the
> > non-VM_BIND world, there are advantages to the BO holding the ref to
> > the VMA, rather than the other way around.  Even at just a modest
> > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
> > costs a tlbinv).  So from that standpoint, #3 is the superior option.
> >
>
> Before we get to #3, I'll need a bit more info here on why you have to
> map/unmap the VMA on every pageflip.

Previously we'd keep the VMA hanging around until the GEM obj is
freed.  But that can't work if the VMA (via the VM_BO) is holding a
reference to the GEM obj.

I was kinda thinking about keeping the VMA around until the handle is
closed.. but that doesn't cover the dma-buf case (ie. when you
re-import the dma-buf fd each frame.. I know android does this, unsure
about other wsi's).

> But actually I think 2 is the best option, I think in nouveau this is
> where we ended up, we didn't modify the old submission paths at all
> and kept the old bo/vm lifetimes.
>
> We just added completely new bind/exec ioctls and you can only use one
> method once you've opened an fd.

hmm, but that means tracking VMAs against a single BO differently..
which.. at least seems ugly..

BR,
-R

