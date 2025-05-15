Return-Path: <linux-arm-msm+bounces-58070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC4AB8A18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9E716BEFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20D1202F8E;
	Thu, 15 May 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLEbGLzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555491EBFE0;
	Thu, 15 May 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321172; cv=none; b=GXlRqYEZb1U109dsyDWl53wqZDSEDmEOpgPTFDlmxi5WgAa3Vlp11PFfQrnNvfbfchPa8h1/yHCYBTcha2busACxET6B5uZm39/5bDiyuNbMloThURPjRK2tAK0Nbd2O0XLdgYg2WqlrWLA9rUNyqYMfkVd8nJ8wfpkKnnRC1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321172; c=relaxed/simple;
	bh=1cA/de0F4Fjgv1twEN08mSu0o6HttvhnpHDMV6dacT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkZFr5yuRrgn4U/042mF+VRA8GCKkgA8PeMsO6NG4KBBOm8lTDfTYu2iKNcNF5m0RO3NQx9gxCRZClglnfHdCSBbL79cLxp/pdkDCIzfSH7oCAOjbz63PohvTBdgtnisXJopmrLsSDcN+bL4d1WcEX9IO138mn5TWs+/djqHMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLEbGLzH; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso2921745ab.1;
        Thu, 15 May 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747321169; x=1747925969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai3JE2gRuo1DcIeGYlU0Q0agCFDCnQ/jtzqrbDxw6yY=;
        b=KLEbGLzHLO3Pb4pHMasAulYXlHHMuGAQHTXmOT5Xj0Lrk8zYCyQeWqW7YBpk69g3gh
         utonsla6E0+7XwvNIPied260QdDiEtJEMU1kYgWnpqlSMcaYLKCn7oOE2Qbqis6U7AVn
         HyM/OsAnME3BIs2/PhoEgHDvJLnnHs4OLZwKJSoehaU5rhoisKQ4WC2PQTpZEjB0maKx
         Q+c0Ub+QUrCQlm1YGLrDUd20+GXBA1yfCyqpHVqXe0h4MjbZMmdvSFZx3GQZJ96Wo03E
         7qC7dbYk5emHLNFUb6cv/RVIOB+YSD0QVjchv/+b0l1KnBqGQNfy/FthmXHgI8P9WrAC
         gLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321169; x=1747925969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ai3JE2gRuo1DcIeGYlU0Q0agCFDCnQ/jtzqrbDxw6yY=;
        b=tEBm0VggJCHUoRAptmpK/dFQV9vYZUq57O4/tPsul7/goz0YJwjdQhMZUzgp6ZIBg6
         oX5FFbJlbEAq0JazbQJC8K03rJkMwHeqDqs3uck33X0zvjyRBXWSQ8NPpHAIOy7RmMPp
         1NHgMpLNND3B5GK0Cx3h3eKyCCzWhjsnLvgCGWUUbgXQ2EihvvuSjj8twyYMs4qvnFiQ
         p09MTPoJOMJgZZcnbh9ReE5XZt378+aYBXNwRoPw5BSpplhfxcHWKobtwcCnisfPAgik
         7gA+bOb73GVLmgmMGvTX2dms0BWQdzfmX8vgUcoarLlC1NI9rHcjHQ8W05Y7oX3p1aak
         Jkkg==
X-Forwarded-Encrypted: i=1; AJvYcCU9W6JeyDqlr3UiM5ZKwgwtvYJW00DwkHF1j5yQlC+rzt8fXIlT6JFhSTuCbYF8gbYWJila8078bRvN7D2Z@vger.kernel.org, AJvYcCXiWRPZ0eXmcvPmhy+nOWa7bRLbggAtYi366Mx4w7i3fHz6PyT5bpPlWqDUQ7Xu2Bg7OhsgSlrR4yxBsncJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCAjSyheds7PLshULQM4VRXn73x6ILxwLxK4NuYKuRqCKxkLC
	eKXrMPAjY1Ab8IxOu9zo64ghflYTt0YZCzHMSNYNEPpsbz29qZHP1ZubkRsjfgDSt+C5OgDZ0yj
	7ircyXPsk3+7b1WXJOhvnKXhxPC8=
X-Gm-Gg: ASbGncsCTKFvp8LFb3angUyx1DKJm6jTHjIoMTZEb2dm/5AMZU/3xvTPJhoN2Mlt33Q
	N63QiAJ+41a5ughJLa46td0jgxy8Liqtqq1YFUHrmLEdb+JLNAPFP4MJTCQpx4y/fXsGW+d4e5t
	ZV/BPKFy1HF/F0OiZ1Pgy4BtTSI2ZAv4lcrq/Yi3xbH+Qe4MywuCBdUXCm8R5EDUVXnQk7bYKd
X-Google-Smtp-Source: AGHT+IFhwb1aHVDWQT2DotxPddMrIXAsyc7GtSwGLdaPnNhe4mmVsOhHkzr0eOCiBxROadLks/dyF/DiJSTcnVlhE4c=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6c9a:f35d with SMTP id
 e9e14a558f8ab-3db6f7ad066mr76962555ab.10.1747321169233; Thu, 15 May 2025
 07:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
In-Reply-To: <aCWtINcOUWciwx8L@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 07:59:16 -0700
X-Gm-Features: AX0GCFvg3Gk9PZrr9NChGdOFWYav5BAv3wwqizYexi8V7IxD4FVYadqwmvbUzQM
Message-ID: <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
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

On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Eases migration for drivers where VAs don't hold hard references to
> > their associated BO, avoiding reference loops.
> >
> > In particular, msm uses soft references to optimistically keep around
> > mappings until the BO is distroyed.  Which obviously won't work if the
> > VA (the mapping) is holding a reference to the BO.
>
> Ick! This is all complicated enough. Allow drivers to bypass the proper
> reference counting for GEM objects in the context of VM_BO structures see=
ms like
> an insane footgun.
>
> I don't understand why MSM would need weak references here. Why does msm =
need
> that, but nouveau, Xe, panthor, PowerVR do not?

Most of those drivers were designed (and had their UABI designed) with
gpuvm, or at least sparse, in mind from the get go.  I'm not sure
about nouveau, but I guess it just got lucky that it's UABI semantics
fit having the VMA hold a reference to the BO.

Unfortunately, msm pre-dates sparse.. and in the beginning there was
only a single global VM, multiple VMs was something retrofitted ~6yrs
(?) back.  For existing msm, the VMA(s) are implicitly torn down when
the GEM obj is freed.  This won't work with the VMA(s) holding hard
references to the BO.

When userspace opts-in to "VM_BIND" mode, which it has to do before
the VM is created, then we don't set this flag, the VMA holds a hard
reference to the BO as it does with other drivers.  But consider this
use-case, which is perfectly valid for old (existing) userspace:

1) Userspace creates a BO
2) Submits rendering referencing the BO
3) Immediately closes the BO handle, without waiting for the submit to comp=
lete

In this case, the submit holds a reference to the BO which holds a
reference to the VMA.  Everything is torn down gracefully when the
submit completes.  But if the VMA held a hard reference to the BO then
you'd have a reference loop.

So there really is no other way to use gpuvm _and_ maintain backwards
compatibility with the semantics of the pre-VM_BIND UAPI without this
flag.

Fortunately DRM_GPUVM_VA_WEAK_REF is minimally intrusive.  Otherwise I
probably would have had to fork my own copy of gpuvm.

BR,
-R

