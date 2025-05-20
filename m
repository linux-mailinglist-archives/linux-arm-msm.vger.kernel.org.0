Return-Path: <linux-arm-msm+bounces-58738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67881ABDF6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E98087B2885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6074125DB14;
	Tue, 20 May 2025 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOImeZz+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2E1C8633;
	Tue, 20 May 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755940; cv=none; b=VXtdNecHss6IEZ9yRWqscAn542bxI53fFu7hX18qmDTtuT4PR6ZJ+lBZ5of9RnbDAtqK2ZCI6KN8ys8/qfv6JNVSkTziyEG0GpMFSAk0KSfA8HN2kITMTxRrYPHj8bahWHd6FW2V3l6fSyGHbLy2s2u+cPYdhYNoQQDui6vdxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755940; c=relaxed/simple;
	bh=wows1Q0bxVR0sQrJ4WXZ2s1Ec0QfVAASVDuDNELIE+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyp14l2cIKjSWiRKDRcvVcMHMBquIX0l9JoyeiBKlQGiGiH0QfoRLFasMqWbTkxh8HYTgBUCST9y0l4waf5bImleL16mOXbRY/Z1pTLu7VNSA/QC/DDh7MoZZQRWQTXwefjQT+XNdndp77O3IDVUIlHLEmFR7RCuGtaA0P9B2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOImeZz+; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso51686615ab.2;
        Tue, 20 May 2025 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747755938; x=1748360738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp84fGNOuFO7OjTxwwcVzPOPzNM836aZSD99K/DTOaI=;
        b=hOImeZz+pQMiGs9ibB1hORmPZE80/8A8X742QxaAmJYfGf7DfrXTj9Djg3Iiy2rKeE
         gxvZfHvfBVPaM8b/s9o5gMyuTpXSA9NmEaWO+tk21vlsQSXxSV/ndXQCAkia2R3dE3g1
         ACFSlqeO+/n2qTrJsTo99wCANmSwrArqzye+7sJi6S4G4gf114hlcRHz6cXfNbfg7w00
         OHUoENINIJLsMWEMz9POKygXEMTFtSJO4EQBKE+EnVV4XBDHS1nHr88P2414vw0wyttC
         S0ezX2oZ0SmhmOorssffSWWksp2LnBKQRnH6ULoeywR1AzeB6e0zIBagieTHVehZ+Gbj
         PFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755938; x=1748360738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp84fGNOuFO7OjTxwwcVzPOPzNM836aZSD99K/DTOaI=;
        b=f4yUcM0Y7dNMDNBZvVw7uqzcymxYuUqFmiN5O1WGfCBOPjj0K2DBir25UrdPrWzx/C
         KHKXHGtymvCLpcIrImmF+gfi8aVW0JPX1lAnLD5VyLolejrkWNguwJsJMLZW3dX4V5DH
         wrRA2eCFVhXQe23NZ2d6UIRl8Hl5N2GoMGwyhyqy6Ez9MzLghNjLHVRAfyEBOhahQMC+
         dTnShmsxgtRxPeF0SKcIE1uJ82/OkY2NDtlXhA74+zdABjcBQtzA6hyfLPNzbW/7A875
         qIRRryuN8WDiH1ec/qmXNCCbCnDK7OwYM0NYsRp+hBQOykxF9GhWyqefsxTqQo8h9ffX
         WRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFaD/fY0B6rZikm7wrFs1+UOCl7Bma1ha1w0D6wE6aBvzFeU5QgbQJIrWdRoKkNpbD0OUkagPfLJsNWRJd@vger.kernel.org, AJvYcCUzNtxF6bgdNpXk9chtM6F/1aJv4GvWQNoaiq39VhAXzz8aUcq5AA/gnke+RTB3yrFR2IDpRMgFJH9b7u5v@vger.kernel.org
X-Gm-Message-State: AOJu0YzMN0ByWdrmOWDiHXhyfr9IXOdOtH/hQ6hLMpExdv4HQCuB006X
	/wfmVmi84o3l2tkFyvmw9LqH79NTzVHfKgtg2Gqeas+U2NqfG9q9f4aB2sbEkp1BLPiGTJCpMhj
	Eq2wswHwq8Sbcww6lTUMnuxDfP4DNf0I=
X-Gm-Gg: ASbGncte88bVRy6BDlOrMqrjUEpG43rThbWm6dDx+gZvHypl7z8AjNVZEk+CGGeQosr
	GUBUa+mVkWaz7OZ8qsJCjcEOEmmm2vqvrEqaBFd9hMitK+DfsxR5WmXDPpJiRO2SZCL92vIBwpj
	j0Qjr39PZHncdewGSEpHOeIg5rEUfBpYQWspIIsp7DugbY/YKmrxHcTQMd2a6yWKM=
X-Google-Smtp-Source: AGHT+IGN4Ae7MiwjqshqSOwa9RnPofm6UHtNufRI9UB2oE3FTsd5H9lYro9NuySAd/VoEiz241eDHysLB6CB02f8MRY=
X-Received: by 2002:a05:6e02:349c:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3db842ba729mr175051425ab.9.1747755937061; Tue, 20 May 2025
 08:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux> <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
 <aCyeAb0vnQqPVbiz@cassiopeiae>
In-Reply-To: <aCyeAb0vnQqPVbiz@cassiopeiae>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 08:45:24 -0700
X-Gm-Features: AX0GCFulaFKe4klpF3pskjrtIWjPk_gcNZG-3xTib3dA0tMpi1eMCo98W3HAy0U
Message-ID: <CAF6AEGvegfkAeMA9-3PZN3wectQwt7=YVHoDxoK2fJcjOLbH2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:21=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 07:57:36AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 12:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > > On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuv=
m.c
> > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > >
> > > > -     drm_gem_gpuva_assert_lock_held(obj);
> > > > +     if (kref_read(&obj->refcount) > 0)
> > > > +             drm_gem_gpuva_assert_lock_held(obj);
> > >
> > > Again, this is broken. What if the reference count drops to zero righ=
t after
> > > the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is=
 called?
> >
> > No, it is not.  If you find yourself having this race condition, then
> > you already have bigger problems.  There are only two valid cases when
> > drm_gpuvm_bo_destroy() is called.  Either:
> >
> > 1) You somehow hold a reference to the GEM object, in which case the
> > refcount will be a positive integer.  Maybe you race but on either
> > side of the race you have a value that is greater than zero.
> > 2) Or, you are calling this in the GEM object destructor path, in
> > which case no one else should have a reference to the object, so it
> > isn't possible to race
>
> What about:
>
> 3) You destroy the VM_BO, because the VM is destroyed, but someone else (=
e.g.
>    another VM) holds a reference of this BO, which is dropped concurrentl=
y?

I mean, that is already broken, so I'm not sure what your point is?

This patch is specifically about the case were VMAs are torn down in
gem->free_object().

BR,
-R

> Please don't tell me "but MSM doesn't do that". This is generic infrastru=
cture,
> it is perfectly valid for drivers to do that.
>
> > If the refcount drops to zero after the check, you are about to blow
> > up regardless.
>
> Exactly, that's why the whole approach of removing the reference count a =
VM_BO
> has on the BO, i.e. the proposed DRM_GPUVM_VA_WEAK_REF is broken.
>
> As mentioned, make it DRM_GPUVM_MSM_LEGACY_QUIRK and get an approval from=
 Dave /
> Sima for it.
>
> You can't make DRM_GPUVM_VA_WEAK_REF work as a generic thing without brea=
king
> the whole design and lifetimes of GPUVM.
>
> We'd just end up with tons of traps for drivers with lots of WARN_ON() pa=
ths and
> footguns like the one above if a driver works slightly different than MSM=
.

