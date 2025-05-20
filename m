Return-Path: <linux-arm-msm+bounces-58817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35490ABE7B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 00:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F254B7A7A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88B256C88;
	Tue, 20 May 2025 22:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MujjToa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846582566FE;
	Tue, 20 May 2025 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781790; cv=none; b=hY+RY0c99tn52pXTynujuCHCvTLmITRWpsX/4jvU3eZK65jRhP0++zBgm53VZ2v+l4/Rqdsr1rQJe3LM/6wrQNAWWD333W+HPGIGdQdl2qaynBl97HK8sfU8hocEdA/F/shmnD+wUOcoNltdbHpbWChSjMJB7kCzMnNswkHdmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781790; c=relaxed/simple;
	bh=E5CCP2G2mbNbJvzbh7UCw14ea4N2zT5ir18+mCDw/ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nc+sCi+iAryjKMKZMvNWQ7r9GdOm+plE2UtCrJBhfSuJs+gFONeKMngW2kSS0RGJWgaPCil06sPJoexqHunglGzCgQdUgPjfomOjX8u7ypfV9OT6Wx4G1/Bnx3SCZhH5X4XKAt/IdZwpLu3LXnHI9n4IkAwFFyDkkXs7H0GxsyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MujjToa2; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8647a81e683so153656239f.1;
        Tue, 20 May 2025 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747781787; x=1748386587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfbTmppHxOLXCmtZNJSatt4EkTAJlAlHVYpSJyOZFfg=;
        b=MujjToa2TN+ReWgbfZkI1j4Uk88iFp9axdih/7hu13T9l1NwLtP+wH/KY207MKPydr
         vwpJav64j1QZIhIeK2PMnaUk654TwRan3yQcOics0IRM7DA2x/nUXtmTxvcVmLBRIIiK
         HvfgP8r2hPSw0F2VpIIbwu14gOy1hDinM7dU/oCRHxqAPVgfoJZiwhLbRe8UzDTLYLkF
         g1+IgyFU2icuAahyKEzmbsDjPEEoYofGuTb6tDRZFb3NADnUrHjb3u5qhSN49rtY3nBH
         ybCl99PVb9z9HD+XN4z4qv4jnW/p+RowXWapVWK1IawARYSGmob7+FMsHn87DMM4cXaw
         PLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781787; x=1748386587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfbTmppHxOLXCmtZNJSatt4EkTAJlAlHVYpSJyOZFfg=;
        b=RP/hOyRFF823JRA2ol3Iu6J+8ZejlS3FUrptUcjNdxLGtM76AB43aOdVXU0a4wW10d
         fpPL4teAg063ynI0LjWweqipvdkiLa5jHezEE9hse18sfFrWipdd8Mar7z+XiOW7fEX0
         kB+ftY6JeJOoICJKSYyTa9NDJ28sdM/aObMSTQlohmIj3k5isQRbgjZZFuTKRF817tbz
         RMrU03cXq/x0QuJQkG1LhrwW+r6Ae61sEtGaJbzNAthVZNxedjpgJdQ749Z8Z/p+ez5q
         HRCKw2Svu99LCpDlMBC5MXhzEAzZXi9sq6QFcRbbMjGUG//n9FIY7ZcQdCWSUlKV2Rf7
         HQng==
X-Forwarded-Encrypted: i=1; AJvYcCURw+BQ5cHn96XwTqzoW8AjnIKfNKvOf1o7T9Fv+0ZTFbZR15nt9ByHVS11WycJ4R+c6ex3CiYxX9RBNVgx@vger.kernel.org, AJvYcCWQwXpUaJSeT7iI2irjT0tVjJ/ov5hqA3fXLCqZjijj9EjYd4q6nbGM/aCB2BApmp1IlDq2Or57/lwb5Ru8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBvUPQ1lwm394lF0y0+HSQ1EY30xAQvcxZIUra8OtSuoCgq6i
	bF4UV30VjVqXNfbwLblt/KyT8F9JIvhsLk/bX45pElR2mhqoK01UXHVFjoMcxVho78IK9KU6Lx4
	xDrzaW4kGr3inI42dGHK4x9X0gJIp9og=
X-Gm-Gg: ASbGnctseIEWnBpt3g+aTq5i4upO+vwirKAiPRRgrqtYjF9yP8yiMBDBO1VYTyd+Jo/
	uwyX7N1tRrvUB8hZy+5Dcv7gQLXyoFWh4tYW3JdpsgnMDWgqy127yxjkfcs3nkAWScF7c0k5BfR
	maZ1tYCLN6OFK0/dZ3RRj7rprJwJqc75Kd4q89pf/GzhiGmqnhizd55fnHti7AHK3Vx7xyZcL6d
	3c=
X-Google-Smtp-Source: AGHT+IGOPI/jkR0SE4Ah18tEgrGyD13jj9I35eWxSMfqfHBJtXz1Ptp5VDoU4Ml5gVYvLQqXk4RTcbwN8ZBaSDzk14Q=
X-Received: by 2002:a05:6602:3e82:b0:867:6c90:4867 with SMTP id
 ca18e2360f4ac-86a23256cadmr2998450939f.14.1747781787455; Tue, 20 May 2025
 15:56:27 -0700 (PDT)
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
Date: Tue, 20 May 2025 15:56:15 -0700
X-Gm-Features: AX0GCFsoUmkG3s3L14GoLEL15C4sCyP3V1E3Uragg5_xADxJ_pxuus52D_2x7-E
Message-ID: <CAF6AEGvr6-9af9ZyccYF-g56j5-4sHocH+9JPk=cKfgdMTAjLg@mail.gmail.com>
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

fwiw, the case I'm more worried about is the kms vm for scanout, that
won't be using vk

BR,
-R

> But I'd rather not hack gpuvm into being something it isn't, if there
> is a meaningful commonality in legacy bo/vm bindings across drivers,
> we could create something new, but the ref counting and handling is
> pretty fundamental to gpuvm architecture.
>
> There should only be two paths, legacy and gpuvm, and you shouldn't
> ever be mixing them on a particular exec path, since you should only
> have a vm per userspace fd, and can pick which way to use it the first
> time someone calls it.
>
> Dave.
> Dave.

