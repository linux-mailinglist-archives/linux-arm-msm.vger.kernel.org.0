Return-Path: <linux-arm-msm+bounces-106604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLgTB7Wh/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3674F3D50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17AF630067B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53FB351C1E;
	Fri,  8 May 2026 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Jlxx5/sW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8F37F8DF;
	Fri,  8 May 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229682; cv=none; b=jboKSFhDApiDA/0+HaoHfJ6wyvPHDYCZpryy+r0Jr8uZPqZbGEGdAmQcp/zXiosXeJq+kXVFfxRwjtq3ouo/HOi0fMNPHe0PRcm/hiLcrpXSHeHAWbrUOBLjRxW11RQY+ngiHesCeqOGxDZfLTp0eqvr41igOT0Wm3iJIyMCTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229682; c=relaxed/simple;
	bh=unS38kn2nv0Yp6RKSpwQQ0vaEE/LDNJiqYgOWGcwZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKLW5jcwidyTqErqtDgQBlSqBFWJ1VGlURAhYqszEv+uACRXm6dcjndoT014kr+hv/AqGocPftvErjgVWz/HywgrltHT1rkfj50OPeaqVLtM1loRybmN3LMeyCRD9N6UjUEZRpCs78hLrpjk9LOjfs+IVXC3eUqwuzv0K3qcozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Jlxx5/sW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778229671;
	bh=unS38kn2nv0Yp6RKSpwQQ0vaEE/LDNJiqYgOWGcwZzM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jlxx5/sWBA8oF05dB6TTJTcZWJBPoAhR2XlvLw9NuNtn3gWpgOz+CBsalDlBGZ06F
	 ix+z9s6DwQloOd49/Jtj3QR9KJXqiS0SWtWUUz/+kJWe0J2Dd3lnGyr2ZSyYwKEakL
	 H/eskDob0INuU4+6/X5LDzxKQPdiOtdG/wNfiguCK/Ws/Rc0yWVmg7VRGpxUvob+n7
	 c5HWbBcsEKXeg7aL+Lfk69irz8Ti6cwYvmTo2S4QsYBL2na7ZGAJjuS1B7V0vhOP1C
	 n1F387xy9izDXYYGbo3uO+PEVrIi7UnUSEm6SCT3Jx4+FZKAnByIWwqtfGsbmNSbuU
	 ZX/sJliX4uuzQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6A5B17E0E08;
	Fri,  8 May 2026 10:41:10 +0200 (CEST)
Date: Fri, 8 May 2026 10:41:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Chia-I Wu
 <olvaffe@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and
 drm_gem_object_release()
Message-ID: <20260508104107.055223e5@fedora>
In-Reply-To: <CACSVV01zGLN8FV3Fpw1BnW+zSokE7n2XJ2dBmDw8-n=MXBmDnw@mail.gmail.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
	<20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
	<20260507144639.68bd699f@fedora>
	<CACSVV01zGLN8FV3Fpw1BnW+zSokE7n2XJ2dBmDw8-n=MXBmDnw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6E3674F3D50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106604-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,collabora.com:email,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 7 May 2026 14:38:23 -0700
Rob Clark <rob.clark@oss.qualcomm.com> wrote:

> On Thu, May 7, 2026 at 5:46=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 06 May 2026 14:16:27 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > =20
> > > The following race can currently happen:
> > >
> > > | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem=
_object_release` |
> > > | -                                            | -                   =
                 |
> > > | move obj1 with refcount=3D=3D0 to `still_in_lru` |                 =
                     |
> > > | move obj2 with refcount!=3D0 to `still_in_lru` |                   =
                   |
> > > | mutex_unlock                                 |                     =
                 |
> > > | shrink obj2                                  |                     =
                 |
> > > |                                              | lru =3D obj1->lru; /=
/ `still_in_lru`   |
> > > | mutex_lock                                   |                     =
                 |
> > > | move obj1 back to the original lru           |                     =
                 |
> > > | mutex_unlock                                 |                     =
                 |
> > > | return                                       |                     =
                 |
> > > |                                              | dereference `still_i=
n_lru`           |
> > >
> > > Move the drm_gem_lru_move_tail_locked() after the
> > > kref_get_unless_zero() check so that we don't end up with a
> > > vanishing LRU when we hit drm_gem_object_release(). We also need to
> > > remove the skipped object from its LRU, otherwise we'll keep hitting
> > > it on subsequent loop iterations until it's actually removed from the
> > > list in the drm_gem_release().
> > >
> > > Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> > > Reported-by: Chia-I Wu <olvaffe@gmail.com>
> > > Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > index fca42949eb2b..97cf63de0112 100644
> > > --- a/drivers/gpu/drm/drm_gem.c
> > > +++ b/drivers/gpu/drm/drm_gem.c
> > > @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
> > >               if (!obj)
> > >                       break;
> > >
> > > -             drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> > > -
> > >               /*
> > >                * If it's in the process of being freed, gem_object->f=
ree()
> > > -              * may be blocked on lock waiting to remove it.  So just
> > > -              * skip it.
> > > +              * may be blocked on lock waiting to remove it.  So jus=
t remove
> > > +              * it from its current LRU and skip it.
> > >                */
> > > -             if (!kref_get_unless_zero(&obj->refcount))
> > > +             if (!kref_get_unless_zero(&obj->refcount)) {
> > > +                     if (obj->lru)
> > > +                             drm_gem_lru_remove_locked(obj);
> > > + =20
> >
> > Actually, this thing is still racy, because obj->lru is dereferenced
> > without the lru->lock held in drm_gem_object_release(). At this point
> > I'm wondering if we should expose a drm_gem_lru_remove() taking the LRU
> > lock as an argument as suggested by Steve, and delegate the
> > responsibility to call drm_gem_lru_remove() to the driver. Either that,
> > or we make it so the LRU lock is attached to the drm_device instead of
> > the GEM (both MSM and panthor assume a device-wide lock for LRU
> > manipulation).
> >
> > Rob, what's your take on this matter? =20
>=20
> I don't think there is a race, because of the kref_get_unless_zero().
> Other than lru_scan, there shouldn't be cases where someone is moving
> an obj between LRUs racing with drm_gem_object_release(), because that
> means they don't own a reference on the obj they are manipulating.

Yeah, but the race I'm talking about is drm_gem_object_release()
vs drm_gem_lru_scan(), so at this point refcount is zero, and this
patch only moves the needle, but doesn't fix the problem entirely:


| Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_objec=
t_release` |
| -                                            | -                         =
           |
|                                              | drm_gem_lru_remove()      =
           |
|                                              |    lru =3D obj->lru       =
             |
|                                              |    if (!lru) return;      =
           |
| lock(still_in_lru.lock)                      |                           =
           |
|    if (refcount =3D=3D 0)                        |                       =
               |
|       drm_gem_lru_remove_locked(obj)         |                           =
           |
|         obj->lru =3D NULL                      |                         =
             |
|    .....                                     |                           =
           |
| unlock(still_in_lru.lock)                    |                           =
           |
|                                              |    lock(lru->lock)        =
           |
|                                              |       drm_gem_lru_remove_l=
ocked(obj) |
|                                              |         obj->lru=3D=3DNULL=
 =3D> NULL deref |
|                                              |    unlock(lru->lock)      =
           |

We can of course add an extra

	if (!obj->lru) return;

in drm_gem_lru_remove_locked() to cover for this race, and add a
READ_ONCE in drm_gem_lru_remove() to make sure the compiler doesn't
do crazy things like dereferencing obj->lru twice instead of having
the LRU pointer stored in a register. That still assumes that the lru
we assigned to our local variable is valid even after the
drm_gem_lru_remove_locked(obj) call, which is true at least for MSM and
and panthor because they have their LRUs attached to the drm_device,
which outlives any GEMs attached to it. But it's not something the API
enforce or document as a requirement.

>=20
> That said, I can't really think of a sensible thing to do with more
> than a single LRU lock per device.  And it does make things easier to
> reason about.

Okay, I'll give it a try then.

