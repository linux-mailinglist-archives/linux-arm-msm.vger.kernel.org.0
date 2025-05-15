Return-Path: <linux-arm-msm+bounces-58115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7047AB8DDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FD73AC576
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7191125A2DA;
	Thu, 15 May 2025 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt92vZcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422F259CBE;
	Thu, 15 May 2025 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330463; cv=none; b=Z5jBHi+FNYBC/0b6+DgSXUHhc4dubUsnZgywC5ld/BvnuVTKwwOaEd5UTzctcQ1eXPoIHIcST0u8rIkPewWSnPhWxwIOR6PGBoIP0NsaQdTSM97xgIiodrIr/X805NRv/IpBTwpoM6AvaYdaU3caxZSxD6rFSdmCBRyyzkuG8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330463; c=relaxed/simple;
	bh=1rYqW+oT2EB+8Mj8UgMcXgu50r6mqg0ahSQdN67crks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Enus+BPdkXNbHPK7VfjE0bT8tyE+T+BEI6oxbH1Z7BDs4zeg4HaTIaxcGLa0Lg5h0FnyXJfXOXV3woqU7i6wXl+IFbrbUt1Laz8FQQE2MeY0KtntR0lH2BfxHkKmQnX7caGfrP0UuyGNwnCvlRUeIafMzqZjbM8LBKz5pIfwhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt92vZcI; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so5950305ab.3;
        Thu, 15 May 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747330461; x=1747935261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBvq9UI2sATIO55B70P6yA+6iJUThTyZYQiqWABHx6U=;
        b=dt92vZcI8uM9QIyTUV/9MKsx/RLy6WzRrA4nqqflMsQ797qibiXLl4oRfN5nBHNTyj
         RI4aAfiS9BYMGhAS0MvUe56H6tIhY2ZLY4klUjTtYi/3WNbu1SmUf3T6md7kmZ1yQqjY
         d7heWeaYzUUPqXSnCl3whzYzFQHVBYHHYkOs2wHb3Oe/V01FkUpx4S8cLPN20jud7y8d
         gNUXGBmXFIBC/3LpMgy6o3YVR8nNAD/ZwrNof79Hv1LT3GUK+nh71ZTpz3euOHutECTc
         U62G37VO0Mv9s1FNmkPRvXOBuQAcf9/g2AJ5EcLufhvwkpklK4Jm+ZQXm45/9D893y+0
         gS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330461; x=1747935261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBvq9UI2sATIO55B70P6yA+6iJUThTyZYQiqWABHx6U=;
        b=iex19q2tFgBaCdufVim2JbBNjAhVErPgvkIMpvBgVOx/WHYmmgyaDMt9OjeW6jJ3BR
         Z4SaJnfolWi7nKaGqaS2QJQ1zrtwUyX/AtLqZ7tNxlWhLJfbubeGxCrZS+awgKyFjsnv
         CztjcRauH4wXgJfJs/hg0TsW+h6tnMJ12wA/XQbLhB19a5kQqexFJv622s5GBD0Sm+Qe
         7ubdTYqggLZUFfwrXEm11wDcF5IVKvnHuYHJCoIl2WJ3QrXXsDAGd18dE8+xjWstlYd+
         92sD0yq7/qsbBwVmqOwBjdvIt7KbTMbfyBxyTyjII4cHW/yL+trCae6kszPYRR48FokD
         Cwww==
X-Forwarded-Encrypted: i=1; AJvYcCUkBSlQSMx4EEAX1BdKNKomCBTuqODcyxHGTQj0zp5tt12HaSeEfSGF+6w3SLYJhRc3LAK/0qF9Lqe6G1hj@vger.kernel.org, AJvYcCXaSJSw+PQNd/hY9kl7xQZU2X5e0d4miv2o4INA3nm3nhpGBUcgj9NsBzgphXyau4fGnXO/VWbD9/8Szqal@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlOyeqYD/iRbCbt4hoJmxHZjueC6v8fouF4iSgivIlDoRlzZI
	yWQHjtqVNvYxgasjn2yzSdsugAXxuZo5x98MfN6GkEopbxwlrOronryhXUGgt03qKU9eF/clZZk
	BXpvpqzMItGr9untMaN4uhSaKoQ/angE=
X-Gm-Gg: ASbGncsXfkGk9nwVprETyh2Zk+q/Xf3H9+sX++d/oFc7oNiixkkVfB7DEMBSWSixISd
	nhIlGepjpyBarx4k3276y3JN5Xxe9mhlC2magPpVDTHZx20RuICXlEk5a9mp7PbtYGGdv4zIVW6
	i3lWfyI8suFiMPDXvQWul6NYeRSSCoeCyAij+yNnimMub+5TLVJ6HCWd2MoitSzJM=
X-Google-Smtp-Source: AGHT+IFo7dA4rLp6ykvkJGelKTIBK/jYm2mycq9pSqylADODrZL4vePtqwPyU+VeHrif1+6q3HNeRs0zSX7JtstjEZM=
X-Received: by 2002:a05:6e02:1a27:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3db842b9d5amr9264885ab.7.1747330460697; Thu, 15 May 2025
 10:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux> <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
 <aCYIiJpMe1ljGxqz@pollux>
In-Reply-To: <aCYIiJpMe1ljGxqz@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:34:07 -0700
X-Gm-Features: AX0GCFuIl_V8-qE_5cvk8OrrV6aLtTAWInICihd0L8AvsvwbHBJVwOGaN3l2YtI
Message-ID: <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>
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

On Thu, May 15, 2025 at 8:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:
>
> Thanks for the detailed explanation!
>
> > On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Eases migration for drivers where VAs don't hold hard references to
> > > > their associated BO, avoiding reference loops.
> > > >
> > > > In particular, msm uses soft references to optimistically keep arou=
nd
> > > > mappings until the BO is distroyed.  Which obviously won't work if =
the
> > > > VA (the mapping) is holding a reference to the BO.
> > >
> > > Ick! This is all complicated enough. Allow drivers to bypass the prop=
er
> > > reference counting for GEM objects in the context of VM_BO structures=
 seems like
> > > an insane footgun.
> > >
> > > I don't understand why MSM would need weak references here. Why does =
msm need
> > > that, but nouveau, Xe, panthor, PowerVR do not?
> >
> > Most of those drivers were designed (and had their UABI designed) with
> > gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> > about nouveau, but I guess it just got lucky that it's UABI semantics
> > fit having the VMA hold a reference to the BO.
> >
> > Unfortunately, msm pre-dates sparse.. and in the beginning there was
> > only a single global VM, multiple VMs was something retrofitted ~6yrs
> > (?) back.  For existing msm, the VMA(s) are implicitly torn down when
> > the GEM obj is freed.  This won't work with the VMA(s) holding hard
> > references to the BO.
>
> Ok, that makes sense to me, but why can't this be changed? I don't see ho=
w the
> uAPI would be affected, this is just an implementation detail, no?

It's about the behaviour of the API, there is no explicit VMA
creation/destruction in the uAPI.

> > When userspace opts-in to "VM_BIND" mode, which it has to do before
> > the VM is created, then we don't set this flag, the VMA holds a hard
> > reference to the BO as it does with other drivers.  But consider this
> > use-case, which is perfectly valid for old (existing) userspace:
> >
> > 1) Userspace creates a BO
> > 2) Submits rendering referencing the BO
> > 3) Immediately closes the BO handle, without waiting for the submit to =
complete
> >
> > In this case, the submit holds a reference to the BO which holds a
> > reference to the VMA.
>
> Can't you just instead create the VMAs, which hold a reference to the VM_=
BO,
> which holds a reference to the BO, then drop the drop the original BO ref=
erence
> and finally, when everything is completed, remove all VMAs of the VM_BO?

Perhaps the submit could hold a ref to the VM_BO instead of the BO to
cover that particular case.

But for the legacy world, the VMA is implicitly torn down when the BO
is freed.  Which will never happen if the VM_BO holds a reference to
the BO.

> This should do exactly the same *and* be conformant with GPUVM design.
>
> > Everything is torn down gracefully when the
> > submit completes.  But if the VMA held a hard reference to the BO then
> > you'd have a reference loop.
> >
> > So there really is no other way to use gpuvm _and_ maintain backwards
> > compatibility with the semantics of the pre-VM_BIND UAPI without this
> > flag.
>
> Again, how is this important for maintaining backwards compatibility with=
 the
> uAPI? This all seems like a driver internal implementation detail to me.
>
> So, is there a technical reason, or is it more that it would be more effo=
rt on
> the driver end to rework things accordingly?

If there were a way to work without WEAK_REF, it seems like it would
be harder and much less of a drop in change.

BR,
-R

> > Fortunately DRM_GPUVM_VA_WEAK_REF is minimally intrusive.  Otherwise I
> > probably would have had to fork my own copy of gpuvm.
> >
> > BR,
> > -R

