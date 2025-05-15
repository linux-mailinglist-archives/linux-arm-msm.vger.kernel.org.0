Return-Path: <linux-arm-msm+bounces-58141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940AAB9091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FED13B46A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE60227056D;
	Thu, 15 May 2025 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYYFh8dN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274931F153C;
	Thu, 15 May 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339849; cv=none; b=dZwQoxIB2hVUaMeV2PesO2GMqKQ2wAYaRs8jI4MLGzwTnLQQcPWOf/RoDrfCNK8EWTkQk4elG+y1lBOoZ/wSzW8kzw1JmGmgHQJgwRcHToSlrgdlIAL0FrpzKSU1qX+Y7njQYMc9NMF3kAPxHxSwLWTZWHsDylIV28W/STGnw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339849; c=relaxed/simple;
	bh=4tMRLG1iTysE+h6YDnFBw48xymEqEUEbwTXY6WodhfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2nmO+qKiU2IHSsnx1DGCdKZ2dUZEf9+Npw0MyuObk9z6HW6OkP2lc3kuEYWG1kctBZ/+n10/96FdmQjRC/pnLyPy/2/CVtcnjSApQd2bqYA1zKBnVtIv7dz/hgCS0PcX22ynq0W0cDkGCA8PIjSh4GbRMSgVPtGG2jvYXqTML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYYFh8dN; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8644aa73dfcso40980139f.0;
        Thu, 15 May 2025 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339847; x=1747944647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fSgK7ssf2dm8Q7yOhdTUyMWZzsPLlNnfjUB0IW4r/o=;
        b=cYYFh8dNQ76jCzr9xEYGV+RvzatqS75TalDwRZt57HG5Xk626xSBsVfEiqPfDkfp7q
         fefzn9V00D423FK161prtWVf6rlH0p4aKyV9zH1O0hFm4Il8FikdTv/sQfP43d4WRnSb
         UJeWTzOLwfGK0h0rX5FNbfHSe8UsLvLF8vU8YSJImb3VgoqG2M9jr+WgqPBhIDma7R62
         w3Jaqh89jWeL+x3xUKWFDUQQZ2/hBpwHuQE/+emjBkkAI7aN/NsYLc22D0j7trNWuzpG
         ii4Cs85yDSpYRDmSMXp1PB9hjoWaUCy1kko8Pcq4isK/8iGaMHrULtqL0QfYkusUmtbM
         R4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339847; x=1747944647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fSgK7ssf2dm8Q7yOhdTUyMWZzsPLlNnfjUB0IW4r/o=;
        b=aCcctUenJln+DQYymJoUHJOz5hXddnKn/pNS0Y8xPaD1FBATv+n0T7T7aAYmVxg1Sr
         1ldk7MBVryb0q05mGBndAY6MKCD+piA16470eScVStl7oWq6OHL0umschnzdcgVvSM0q
         S9X9r40Q1Mda1DSUo8rqQMHhUOQAuQKUJFk1v6uAYc+myD9SvOi+wZsRMkr/t48mAoGs
         N1HzfDSEmh4jtU4gJSAqhCGghmT+q3xIBVYF4kiJ60ZJnZCI/Bmf+WkpHbk6c2t1s6ZY
         /2sMKSq8mceMNMvaWho3K88bZhFXByVCuUb8B4rgpBZeUbr6o36hYST+FSCH8YFzcrAO
         ui+A==
X-Forwarded-Encrypted: i=1; AJvYcCWf5mAmUrYGd2YNuVlBnk3mBA/h6t6g+rcMzvA8ogwYBE3pRJOC7i0BkpE3O5C8WRcBlBtWvAwDkKgnNInM@vger.kernel.org, AJvYcCXLowdQ/yWvxIXZLBvgssuWgCipf7US/D5DjwiutWyuKiCAFo/sXe/mzLZfaafmwHFRsymv2N/pY7HnF2he@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tBqFoHAYVM8K8LNzf0Q2T5J6Yuynfdg8wnRz2kM58Ln7Rran
	ZL1eg7EmwBcDdIshjB22Djy1wn0oVl9XQcBn1i+z0CGjsFL44ITaWpYnZvfM4MQF8yjdefIXmsV
	4rq9nT56zHYkxOcSekXJOgWW0bbOuQI4=
X-Gm-Gg: ASbGncu8iT/ZgCMCWLRwbodBYY3n7MvvT8Ypfcy5EJbAGAUFHHdTrGrZKyygBSTp1jH
	Gzz1nZ97aervrAT7ZoWZbddNcb27Y7Vq6ldoY04iXs9qU9NBe/Uhciv9Lq9TyKZwiYbi6gdPl1e
	IGst1lni2+YOpjRPitxc7igcZvg0gu3DuOENd3YwSYxSHbh7ljCGfWX9fNlPUbNbDmiWBZu4J4Q
	A==
X-Google-Smtp-Source: AGHT+IElYN1Rh6xvHEcxS29AOpeVEBIl+G958Hitti5xJMV3ss/DOnUlfOXj5cBcRSPr0KcHm1EawDhax9vJdzWBanE=
X-Received: by 2002:a05:6602:2744:b0:861:c238:bf03 with SMTP id
 ca18e2360f4ac-86a231ce6cbmr170432639f.8.1747339847033; Thu, 15 May 2025
 13:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux> <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
 <aCYIiJpMe1ljGxqz@pollux> <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>
 <aCYpjJPvSOf2RzbU@pollux>
In-Reply-To: <aCYpjJPvSOf2RzbU@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 13:10:34 -0700
X-Gm-Features: AX0GCFs_RUOGNUoophfLe_ZVT4ojoR2aoDzR_PRqcC6i1DAbUuDOdWeHDIPx-Z0
Message-ID: <CAF6AEGuUH6nZCvb3Qayh7Z9ydOmPhTn6rqMifPyagLknbjerng@mail.gmail.com>
Subject: Re: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:34:07AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 8:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:
> > >
> > > Thanks for the detailed explanation!
> > >
> > > > On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Eases migration for drivers where VAs don't hold hard reference=
s to
> > > > > > their associated BO, avoiding reference loops.
> > > > > >
> > > > > > In particular, msm uses soft references to optimistically keep =
around
> > > > > > mappings until the BO is distroyed.  Which obviously won't work=
 if the
> > > > > > VA (the mapping) is holding a reference to the BO.
> > > > >
> > > > > Ick! This is all complicated enough. Allow drivers to bypass the =
proper
> > > > > reference counting for GEM objects in the context of VM_BO struct=
ures seems like
> > > > > an insane footgun.
> > > > >
> > > > > I don't understand why MSM would need weak references here. Why d=
oes msm need
> > > > > that, but nouveau, Xe, panthor, PowerVR do not?
> > > >
> > > > Most of those drivers were designed (and had their UABI designed) w=
ith
> > > > gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> > > > about nouveau, but I guess it just got lucky that it's UABI semanti=
cs
> > > > fit having the VMA hold a reference to the BO.
> > > >
> > > > Unfortunately, msm pre-dates sparse.. and in the beginning there wa=
s
> > > > only a single global VM, multiple VMs was something retrofitted ~6y=
rs
> > > > (?) back.  For existing msm, the VMA(s) are implicitly torn down wh=
en
> > > > the GEM obj is freed.  This won't work with the VMA(s) holding hard
> > > > references to the BO.
> > >
> > > Ok, that makes sense to me, but why can't this be changed? I don't se=
e how the
> > > uAPI would be affected, this is just an implementation detail, no?
> >
> > It's about the behaviour of the API, there is no explicit VMA
> > creation/destruction in the uAPI.
>
> But that shouldn't matter? Userspace gives you a BO, the driver creates V=
MAs
> itself, which can have a reference on the VM_BO, which references the ori=
ginal
> BO. At this point you can drop the original reference of the BO and just =
destroy
> all corresponding VMAs once the driver fulfilled the request from userspa=
ce?

Having the submit hold a reference to the VM_BO, and then this funny
looking bit of code in gem_close() gets us part way there:

   vm_bo =3D drm_gpuvm_bo_find(ctx->vm, obj);
   if (vm_bo) {
      drm_gpuvm_bo_put(vm_bo);
      drm_gpuvm_bo_put(vm_bo);
  }

But we still leak BO's used in other VMs.. scanout, and various other
fw and other internal BOs... those would all have to be tracked down
and to find _someplace_ to break the VM_BO  circular reference loop.

> > > > When userspace opts-in to "VM_BIND" mode, which it has to do before
> > > > the VM is created, then we don't set this flag, the VMA holds a har=
d
> > > > reference to the BO as it does with other drivers.  But consider th=
is
> > > > use-case, which is perfectly valid for old (existing) userspace:
> > > >
> > > > 1) Userspace creates a BO
> > > > 2) Submits rendering referencing the BO
> > > > 3) Immediately closes the BO handle, without waiting for the submit=
 to complete
> > > >
> > > > In this case, the submit holds a reference to the BO which holds a
> > > > reference to the VMA.
> > >
> > > Can't you just instead create the VMAs, which hold a reference to the=
 VM_BO,
> > > which holds a reference to the BO, then drop the drop the original BO=
 reference
> > > and finally, when everything is completed, remove all VMAs of the VM_=
BO?
> >
> > Perhaps the submit could hold a ref to the VM_BO instead of the BO to
> > cover that particular case.
> >
> > But for the legacy world, the VMA is implicitly torn down when the BO
> > is freed.  Which will never happen if the VM_BO holds a reference to
> > the BO.
>
> Sure, I get that; what I do not get is why it can't be changed, e.g. in t=
he way
> described above.
>
> > > This should do exactly the same *and* be conformant with GPUVM design=
.
> > >
> > > > Everything is torn down gracefully when the
> > > > submit completes.  But if the VMA held a hard reference to the BO t=
hen
> > > > you'd have a reference loop.
> > > >
> > > > So there really is no other way to use gpuvm _and_ maintain backwar=
ds
> > > > compatibility with the semantics of the pre-VM_BIND UAPI without th=
is
> > > > flag.
> > >
> > > Again, how is this important for maintaining backwards compatibility =
with the
> > > uAPI? This all seems like a driver internal implementation detail to =
me.
> > >
> > > So, is there a technical reason, or is it more that it would be more =
effort on
> > > the driver end to rework things accordingly?
> >
> > If there were a way to work without WEAK_REF, it seems like it would
> > be harder and much less of a drop in change.
>
> So, you're saying there is no technical blocker to rework it?

Not clear.. it would certainly make conversion to gpuvm a much bigger
flag-day, because without WEAK_REF the way gpuvm works is exactly
backwards from how the thing it is replacing works.

BR,
-R

