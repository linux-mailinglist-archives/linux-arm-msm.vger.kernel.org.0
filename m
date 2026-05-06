Return-Path: <linux-arm-msm+bounces-106123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMieDhdV+2n+ZQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:49:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027E4DC95B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0406304ABE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 14:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8589C44DB76;
	Wed,  6 May 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IUsp6/vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02769426EB1;
	Wed,  6 May 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078046; cv=none; b=LHjsw4Flj3RejmabW3wCroQQyHa1f/z2/lnvPdo9mbjDmcBXK7z8gDFXI16OErpw09UP9SMG90DqT/t/jC+e5/qki9aKXi7d1SyCgMkFCPZ19MpdqMrgNHg8U6R4BsNgN8oaaUObKYuE0X3r7aurqgL3MhwNeyt8xuihcXDrQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078046; c=relaxed/simple;
	bh=hgvN1jV6xsRIZYoJS/nwWzGkDdd5X1ml/V1oqoZcQcs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORbEx67c7olsFHN7SHCAaVKqnhuPIoBNPPiUHs8FhNIBTJHqvSNqigiaIo8rcyhf5G1s5qVy6bOV6lZtuqsqK6azb5gNHS5/M/+4XJXaD+lkbKR+7nO1aszM/m/oyvJS/EBC+U6wXo4tZIgxwmzZHjuB+XFYxdl1l/zbghWU3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IUsp6/vZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778078043;
	bh=hgvN1jV6xsRIZYoJS/nwWzGkDdd5X1ml/V1oqoZcQcs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IUsp6/vZTnL428w38dQ33J4n60kD/ExAAsffIhADT5i8y64f55SvhQtXraAGvm21A
	 ntW/h7Sd5brHtRWAR5EC/b6lIsBiQPrLv0AN82sr0IeoW3KoPBrpiScSzopTUchpIN
	 +q2j7tZr8KShGYv6Lii9IUW0Uue/VAA+noI7oZklTezHeG6s2/+BLOowpKDQZoyRtZ
	 HIkTbEDGszR9FA8hzXAoX4KidtHXHCmxhzly1PMLwTW7CoaJmLh0BHcY5x36uUhcwS
	 eYtTqP+tZ5ZRtZG2FAHSU7P+PvjXDDpOkosvB3SoTcEUdB1zjArla4/xa+rNloDyjt
	 TaWtC581dNciQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4697917E0610;
	Wed,  6 May 2026 16:34:02 +0200 (CEST)
Date: Wed, 6 May 2026 16:33:56 +0200
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
Message-ID: <20260506163356.3287ce42@fedora>
In-Reply-To: <CACSVV01sJqXCK8Lx5+bSPqzbNv7ALAbcA3P2RiJEOPOX_4Jmxw@mail.gmail.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
	<20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
	<CACSVV01sJqXCK8Lx5+bSPqzbNv7ALAbcA3P2RiJEOPOX_4Jmxw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 2027E4DC95B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]

On Wed, 6 May 2026 06:21:42 -0700
Rob Clark <rob.clark@oss.qualcomm.com> wrote:

> On Wed, May 6, 2026 at 5:16=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > The following race can currently happen:
> >
> > | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_o=
bject_release` |
> > | -                                            | -                     =
               |
> > | move obj1 with refcount=3D=3D0 to `still_in_lru` |                   =
                   |
> > | move obj2 with refcount!=3D0 to `still_in_lru` |                     =
                 |
> > | mutex_unlock                                 |                       =
               |
> > | shrink obj2                                  |                       =
               |
> > |                                              | lru =3D obj1->lru; // =
`still_in_lru`   |
> > | mutex_lock                                   |                       =
               |
> > | move obj1 back to the original lru           |                       =
               |
> > | mutex_unlock                                 |                       =
               |
> > | return                                       |                       =
               |
> > |                                              | dereference `still_in_=
lru`           |
> >
> > Move the drm_gem_lru_move_tail_locked() after the
> > kref_get_unless_zero() check so that we don't end up with a
> > vanishing LRU when we hit drm_gem_object_release(). We also need to
> > remove the skipped object from its LRU, otherwise we'll keep hitting
> > it on subsequent loop iterations until it's actually removed from the
> > list in the drm_gem_release().
> >
> > Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> > Reported-by: Chia-I Wu <olvaffe@gmail.com>
> > Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index fca42949eb2b..97cf63de0112 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
> >                 if (!obj)
> >                         break;
> >
> > -               drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> > -
> >                 /*
> >                  * If it's in the process of being freed, gem_object->f=
ree()
> > -                * may be blocked on lock waiting to remove it.  So just
> > -                * skip it.
> > +                * may be blocked on lock waiting to remove it.  So jus=
t remove
> > +                * it from its current LRU and skip it.
> >                  */
> > -               if (!kref_get_unless_zero(&obj->refcount))
> > +               if (!kref_get_unless_zero(&obj->refcount)) {
> > +                       if (obj->lru)
> > +                               drm_gem_lru_remove_locked(obj); =20
>=20
> if we are iterating a LRU.. and lru->lock is held, shouldn't obj->lru
> always be non-null?

Right, the !=3D NULL check is not needed here.

