Return-Path: <linux-arm-msm+bounces-58741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0EABDFA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EFE41896347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64167261571;
	Tue, 20 May 2025 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9c8keaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F225178C;
	Tue, 20 May 2025 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756509; cv=none; b=dl+mNsrzVFBgCVA/qOTUlXj0LXeCJqNMFVOL6KLvp6z+xWAuadwxixECgVrkGu05bGQmwa0Q0onR0DwXW1rHkdDIfINHoc+o27ARRajiDAm5EoJa/kuaV0gO92wDvImZNAqxEaO+/gnaKNoN3G9dEG63di5DQYs9hpP3Pl/peao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756509; c=relaxed/simple;
	bh=FYxaZIFYiSlSkrrsjnZzOBg9yth/DKqMvh6hwwlrvac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThOElcdWW6532OIviAohr3zDFL8ZyHUBo2Kpp9UUX9SwNSpeuYtz9CxNLkGGTUvEhK7FEK2YnteTaydCxFvygHayIaOWl6lhngem189KmnKtDQPOkYJ7FR6D+TiNGwVhzQfQW1Dpf/SR7l5u74O7JHFF4oEeIKuoQw+SW0F8bAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9c8keaC; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso48540465ab.0;
        Tue, 20 May 2025 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747756507; x=1748361307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsfE5Ws7A5y4XkBVdsDW8KUKRVAk9/PTVUELtxrBWGA=;
        b=G9c8keaC7+amk3Kpblrqk7hVEtgAfEgC9B+dvOZiCa2ATMhoKYPjKRF5cH5eMIo7I2
         E7gNmzp5SW/MKL8gzvyYE3x2+N1GJhlPYw/UaiiX6IHFHfq7HQEaTeHdvKtKqhSRdT6/
         XJx6y4uZLHrQebqXHewEB2YHAIzXi6+i09LSbzTM/gljDwNWRDuIt3O7vXFGvMQAaXuH
         PuDvSQv8MDXqlCinl8IiyyfHZaowE1CUKhHutEBDaIiYtNLoFf3SOgt10TQ0p6pUoDKD
         /I43ObHxmk4Yx4o3SN6PaAVJj6Q96w0jx6AEbkxUgce65EUn3OvKfIKybNr8cWUWWRz4
         1g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756507; x=1748361307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsfE5Ws7A5y4XkBVdsDW8KUKRVAk9/PTVUELtxrBWGA=;
        b=YRJ459K6XngIa7m8xUCgMaIDGl6scR9/Cya6TsfjaM5JAqiiwaWoyfgME1aS3UZc7g
         eeNEmd5JbJq5AfuChuwDSIdufJcrLAYCWk2EOxGGAFpAFAnJn6IMIQeG/n1Hy78gJDTX
         rooUnyiI8h6gYkg/B9ggTyvuotxeErkJ1Oj1stCRlrOYmT9sL3q+qCxqDMfRk6kU4iZn
         OiCNhn7u0dyLaSD/gJxKYPr9cGn0BJk5+udVD9l2RMzqPjaX2CALCgMzJc/c1zJOpIv1
         9k0IpQllt0Mq7dv89F0f6Oi0Qf/wrnvwjoHy8J/qGgJOgSYujzknB2MdmSHQTy6kQTRV
         lsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX98JQjijjCtIg/jqa5VVyzKXsWA+F2kLqpKwvYp5DMqHxb1a7rocnbayRcC7BkyVr4OZaSJw8c/bpPnaG@vger.kernel.org, AJvYcCVmXkKMRHIGNiMP3uQDJTX08co0lt20bivVTM2pKroP7pozmemBHA0JtLRcycaIPTHTz0kF8f75UX/mL1Yu@vger.kernel.org
X-Gm-Message-State: AOJu0YwUzCIrBFxlwntuU+1AtNHijN95R3HaWGs60cfPljd9CPFxF8qP
	YFbReRRXvII8IDhpJaZh8bXwJS8vHTpU0VtcedMas29uPapczahoJSSAAtaSWYvvyMTo90frb/I
	PZmZ32aRtt25AQKvwB8ApNsAzIX/11iop1Q==
X-Gm-Gg: ASbGnct1wlRSiTf3hBrSTol3A2wavxYbpIrnLbxZ+ww8ekHepzOaCnw4JMQWFqPUA37
	IRoCILZMsrzeVRnYU6SlW5i0v3qophvp6Taz62Qo/Tf6Xi3V5Kmyw0Gj1QU2iA0IAHFHe0ISF6F
	KhC628ku+1wPPDQDB5qyS1wfB6T9MepJShYsveU7ups+I6O5k84mXI260U3u3K/Ac=
X-Google-Smtp-Source: AGHT+IFhLr1++r1gjYcEo/FgI0W3OZZ8mTrCTZfvNmuvRbd7YcTCPIl0/iL0jILe3yB2gSChaKoPV9tO234fgVqUVIQ=
X-Received: by 2002:a05:6e02:1745:b0:3d9:36a8:3d98 with SMTP id
 e9e14a558f8ab-3db84296deemr208995435ab.2.1747756505533; Tue, 20 May 2025
 08:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <20250519175348.11924-3-robdclark@gmail.com>
 <aCwx_9KIc9QBd7_0@pollux>
In-Reply-To: <aCwx_9KIc9QBd7_0@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 08:54:53 -0700
X-Gm-Features: AX0GCFstOcmcGHOhFOrI3CrX7srdksd9YcxyBYxwwonSJJrqAmG4Xy5DWrOKG6Y
Message-ID: <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:40=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Eases migration for drivers where VAs don't hold hard references to
> > their associated BO, avoiding reference loops.
> >
> > In particular, msm uses soft references to optimistically keep around
> > mappings until the BO is distroyed.  Which obviously won't work if the
> > VA (the mapping) is holding a reference to the BO.
> >
> > By making this a per-VM flag, we can use normal hard-references for
> > mappings in a "VM_BIND" managed VM, but soft references in other cases,
> > such as kernel-internal VMs (for display scanout, etc).
> >
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
> >  include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
> >  2 files changed, 49 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 1e89a98caad4..892b62130ff8 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpu=
vm,
> >       LIST_HEAD(extobjs);
> >       int ret =3D 0;
> >
> > +     WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
>
> No, here and below, please don't scatter WARN_ON() calls in various code =
paths
> for this hack.

I do prefer WARN_ON()s to make it clear what is or is not proper
usage, but if you really don't want them I can remove them.

> This won't ever be a valid and supported mode, please keep the diff as sm=
all as
> possible.
>
> <snip>
>
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 2a9629377633..652e0fb66413 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
> >        */
> >       DRM_GPUVM_RESV_PROTECTED =3D BIT(0),
> >
> > +     /**
> > +      * @DRM_GPUVM_VA_WEAK_REF:
> > +      *
> > +      * Flag indicating that the &drm_gpuva (or more correctly, the
> > +      * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_obj=
ect.
> > +      * This mode is intended to ease migration to drm_gpuvm for drive=
rs
> > +      * where the GEM object holds a referece to the VA, rather than t=
he
> > +      * other way around.
> > +      *
> > +      * In this mode, drm_gpuvm does not track evicted or external obj=
ects.
> > +      * It is intended for legacy mode, where the needed objects are a=
ttached
> > +      * to the command submission ioctl, therefore this tracking is un=
needed.
> > +      */
> > +     DRM_GPUVM_VA_WEAK_REF =3D BIT(1),
>
> As mentioned in v4, I do *not* agree with making this a valid and support=
ed
> mode. If at all, it should be an exception for MSM, i.e.
> DRM_GPUVM_MSM_LEGACY_QUIRK with an explicit approval from Dave / Sima [1]=
.

I can rename it if you really insist, but "legacy" implies it is
something that will go away.

Unfortunately there is too much map/unmap cost for things like
pageflip, so the VM related to scanout will continue to use this mode
forever, even if all of the userspace related VMs are not using this
flag.  If I could opportunistically keep around a mapping while using
gpuvm as it is "intended", I would.  But I don't see how that can work
when the VMA/VM_BO holds a reference to the GEM object.

> It invalidates the whole design and makes a lot of functions fundamentall=
y
> invalid to call, which is well demonstrated by all the WARN_ON() calls th=
is
> patch attempts to add.

I think of it more as adding a different mode of operation.  One
where, perhaps some functions of gpuvm are not available, but that is
fine because they are also unneeded in that mode of operation.  Hence
the WARN_ON()s to make that clear.

BR,
-R

> > +
> >       /**
> >        * @DRM_GPUVM_USERBITS: user defined bits
> >        */
> > -     DRM_GPUVM_USERBITS =3D BIT(1),
> > +     DRM_GPUVM_USERBITS =3D BIT(2),
> >  };
>
> [1] https://lore.kernel.org/dri-devel/aCb-72KH-NrzvGXy@pollux/

