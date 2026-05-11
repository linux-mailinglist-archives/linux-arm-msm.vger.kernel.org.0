Return-Path: <linux-arm-msm+bounces-106975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGY0BAkNAmoSngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81361513136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B644C3232B6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFCD43DA53;
	Mon, 11 May 2026 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GMhGbuqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5C3BF675;
	Mon, 11 May 2026 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517151; cv=none; b=W2BhC6OHM4vzcOc2e2+VeWaaY+kDjImeKyX7ng8ggQ8816HlrVvTOodecxD85I3+KQ8GJnJqFNddPwK8FNn9KKpWwEKi8MTva9j7r6/9OaKFQc0vn8TlFfrk/0oYujp2PQXKoElxEqOmuxl83k9Gmzv75DIxo4CFJdHiERlNW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517151; c=relaxed/simple;
	bh=cl29oM23banEFV70xoAD/nxliPAhOjBIv1fAGvHj1ck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkPpH3f23rW8VJPDBwFGTw/O1HOZAc+UnH34YRpMWO8OCE32RiOoRuD9Xypj2bku8iJqYbxrzl0UfBOOkt5gIQGrZE36OE/lcuqfsWJKB2JQJZksTzYdiz865CxgB5lpnAJ5zC2sdVXSo4IFTjbdRq9Z+ekOZePevSyabxzP92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GMhGbuqy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778517146;
	bh=cl29oM23banEFV70xoAD/nxliPAhOjBIv1fAGvHj1ck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GMhGbuqyfvohtNgwiwjSNmb8BwTWD9w7ZHHD9VvSzZeG5Vf/lzHto2LGWC7UfJK01
	 JMDAvznwkTTiyKRJ+uSCAiuy0tpnvURlJZpEjbO4Hy03Huf5PLTKdqMrgMICKxPH7/
	 w+evAkwx/y0xhTnyKGRAxZtSyou1qU6vq2b9hnuSa0c6SRj/fdQzj/Zu6EcFzmN9gV
	 BpObP8vYNTEVs7Gn5oEJAPBpQhj3Szz551Qgf7XyDabJ/crnCNjo1tE15LzumeN8SA
	 b5pHVFG44ZlqTj7wFXUNPpy10mNJWbremRFy8czhHTzfEzlO8A4lhlpjk7b243iZFt
	 wdpdI89941Xpg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D52C317E0417;
	Mon, 11 May 2026 18:32:25 +0200 (CEST)
Date: Mon, 11 May 2026 18:32:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>, Steven Price
 <steven.price@arm.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of
 drm_device
Message-ID: <20260511183221.0442cae4@fedora>
In-Reply-To: <agIDYZlOpZB5eZke@e142607>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
	<20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
	<CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com>
	<20260511174429.35afcdee@fedora>
	<CACSVV02HQ-ci8mHg4os7e-yaf51hdHyQ6cFa9tGOpc9=keL28Q@mail.gmail.com>
	<agIDYZlOpZB5eZke@e142607>
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
X-Rspamd-Queue-Id: 81361513136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106975-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,collabora.com:email,collabora.com:dkim]
X-Rspamd-Action: no action

On Mon, 11 May 2026 17:27:13 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, May 11, 2026 at 09:16:49AM -0700, Rob Clark wrote:
> > On Mon, May 11, 2026 at 8:44=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote: =20
> > >
> > > On Mon, 11 May 2026 06:18:44 -0700
> > > Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > =20
> > > > On Fri, May 8, 2026 at 3:41=E2=80=AFAM Boris Brezillon
> > > > <boris.brezillon@collabora.com> wrote: =20
> > > > >
> > > > > Recently, a few races have been discovered in the GEM LRU logic, =
all
> > > > > of them caused by the fact the LRU lock is accessed through
> > > > > gem->lru->lock, and that lock itself also protects changes to
> > > > > gem->lru, leading to situations where gem->lru needs to first be
> > > > > accessed without the lock held, to then get the lru to access the=
 lock
> > > > > through and finally take the lock and do the expected operation.
> > > > >
> > > > > Currently, the two drivers making use of this API declare device-=
wide
> > > > > locks, and there's no clue that we will ever have a driver that w=
ants
> > > > > different pools of LRUs protected by different locks under the sa=
me
> > > > > drm_device. So we're better off moving this lock to drm_device and
> > > > > always locking it through obj->dev->gem_lru_mutex, or directly th=
rough
> > > > > dev->gem_lru_mutex.
> > > > >
> > > > > If anyone ever needs more fine-grained locking, this can be revis=
ited
> > > > > to pass some drm_gem_lru_pool object represent the pool of LRUs u=
nder
> > > > > a specific lock, but for now, the per-device lock seems to be eno=
ugh.
> > > > >
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
> > > >
> > > > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com> =20
> > >
> > > If every one is happy with patch 4, I'm tempted to drop patch 1 and 3,
> > > since they are irrelevant if the locking is fixed the way it is in th=
is
> > > patch. Question is, do we care about patch 2 being backported to stab=
le
> > > kernels then? =20
> >=20
> > Or backport patch 4?  It's a bit bigger, but mostly mechanical.. with
> > only issue being backporting across addition of panthor shrinker, I
> > guess? =20
>=20
> I'm agreeing with Rob here, but it makes a mess of the backport. Maybe sp=
lit
> patch 4 into the drm_gem.c and msm changes and make another one for panth=
or,
> as that is still in linux-next?

We can't really do that if we want to keep things bisectable, but I can
prepare a version against drm-misc-fixes which wouldn't contain any of
the panthor changes, and then ask drm-misc maintainers to backmerge the
next -rc into drm-misc-next and fix things up in panthor as part of the
backmerge.

