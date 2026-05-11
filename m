Return-Path: <linux-arm-msm+bounces-106849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K9LFmGHAWpscgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:38:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5345095D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1786B30066B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D249F39021F;
	Mon, 11 May 2026 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ke4uKszn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD538D69B;
	Mon, 11 May 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485057; cv=none; b=Gt3MTW+SSDgCI7+eM40euUiinmhj8uolY0IxNKSP+xhtqASmzk/6f09ww9WscLKjjtOmtBeo/tvFBxyKfo7sXjnsUStvrjcJ3CYPahsFTwZAMihuoUR6t1GMfmy3UFtMq6gdPOAUvfskqvI8/crpbpTGWYAhUfl8GxqzhVlNx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485057; c=relaxed/simple;
	bh=C14kz/02oec9SNCi8GLvHJivWlWp0VJrMbzcbFdwRhY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVDJcJRpDS5T0dPHPMss+DLA++qP9e65PSua5Lw24k0249b1z9AU77WGhag6mYZiIPN5UHzIGSZv9zYwRiQIwvgo+F0BFSxwMG3UDo2XETGRUWd8AuirCxO7Ckk2rhmkZfEK59eB4poztSX59tCdzmnmx5reZGNr4LHnOACsI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ke4uKszn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778485052;
	bh=C14kz/02oec9SNCi8GLvHJivWlWp0VJrMbzcbFdwRhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ke4uKszngzVBBHO6yV/odNkDDflAYyUxjShe5dFFBecC5piPAWj8hMJPf7/s5rT+R
	 FAbJXJ+rS2TGlHTINWYMUnqW7ADGCuXgK2M6DdS8b8ph6HwHvlZUoRwo6YTwH/+yLQ
	 XEn27J1NvCxWGrcSmvHyxeNxbBmr/5eZf3BR3GqDQoiC3Iw/QU4dNUvs0NVRYzymej
	 P3dmVIrxDlm8PDK3H54suTizImviZCcR8gGThnAghxjh6fZAXnCOHu6CWLgC6XcevQ
	 d6F3Qtl/g7lu390EuUffxUXBYLUZyf/7jLs6Z7P0ozJpKVvkmP0pofTaZvvdTPy7yS
	 ejNv50N6xicOg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF1D617E040C;
	Mon, 11 May 2026 09:37:31 +0200 (CEST)
Date: Mon, 11 May 2026 09:37:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Daniel J Blueman <daniel@quora.org>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix shrinker deadlock
Message-ID: <20260511093325.74e2777f@fedora>
In-Reply-To: <CACSVV02t99r2JpT9EUar_YRs+zgpzjNYgNvvB9BGLLnpssY4BA@mail.gmail.com>
References: <20260508065722.18785-1-daniel@quora.org>
	<CACSVV02t99r2JpT9EUar_YRs+zgpzjNYgNvvB9BGLLnpssY4BA@mail.gmail.com>
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
X-Rspamd-Queue-Id: EB5345095D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106849-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[quora.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,collabora.com:dkim]
X-Rspamd-Action: no action

Hi,

On Sat, 9 May 2026 08:34:15 -0700
Rob Clark <rob.clark@oss.qualcomm.com> wrote:

> On Thu, May 7, 2026 at 11:57=E2=80=AFPM Daniel J Blueman <daniel@quora.or=
g> wrote:
> >
> > With PROVE_LOCKING on an Snapdragon X1 and VM reclaim pressure, we see:
> >
> > """
> > kswapd0/121 is trying to acquire lock:
> > ffff800080ed3800 (reservation_ww_class_acquire){+.+.}-{0:0}, at:
> >   msm_gem_shrinker_scan (drivers/gpu/drm/msm/msm_gem_shrinker.c:189)
> >
> > but task is already holding lock:
> > ffffbf4ddb44ca40 (fs_reclaim){+.+.}-{0:0}, at:
> >   balance_pgdat (mm/vmscan.c:7236 (discriminator 2))
> >
> > which lock already depends on the new lock.
> >
> > the existing dependency chain (in reverse order) is:
> > =20
> > -> #2 (fs_reclaim){+.+.}-{0:0}: =20
> > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:58=
25)
> > fs_reclaim_acquire (mm/page_alloc.c:4325 mm/page_alloc.c:4339)
> > dma_resv_lockdep (drivers/dma-buf/dma-resv.c:798)
> > do_one_initcall (init/main.c:1392)
> > kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:14=
70
> >   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:1703
> >   (discriminator 1))
> > kernel_init (init/main.c:1593)
> > ret_from_fork (arch/arm64/kernel/entry.S:858)
> > =20
> > -> #1 (reservation_ww_class_mutex){+.+.}-{4:4}: =20
> > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:58=
25)
> > dma_resv_lockdep (./include/linux/ww_mutex.h:164 (discriminator 1)
> >   drivers/dma-buf/dma-resv.c:791 (discriminator 1))
> > do_one_initcall (init/main.c:1392)
> > kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:14=
70
> >   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:1703
> >   (discriminator 1))
> > kernel_init (init/main.c:1593)
> > ret_from_fork (arch/arm64/kernel/entry.S:858)
> > =20
> > -> #0 (reservation_ww_class_acquire){+.+.}-{0:0}: =20
> > check_prev_add (kernel/locking/lockdep.c:3165)
> > __lock_acquire (kernel/locking/lockdep.c:3284
> >   kernel/locking/lockdep.c:3908 kernel/locking/lockdep.c:5237)
> > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:58=
25)
> > drm_gem_lru_scan (./include/linux/ww_mutex.h:163 (discriminator 1)
> >   drivers/gpu/drm/drm_gem.c:1681 (discriminator 1)) =20
>=20
> Your line #s don't quite match mine, but AFAICT this is from the
> ww_acquire_init()
>=20
> What I'm unsure about is if this could cause live-lock against another
> operation which requires obtaining both obj and vm locks in a
> potentially different order (which would also be using a
> ww_acquire_ctx ticket to backoff in case of conflicting locking
> order).  It wouldn't deadlock because we don't sleep forever if we do
> sleep, but...
>=20
> Possibly we should also be using trylock to also acquire the vm lock,
> but lockdep would still complain as it doesn't know the ticket will be
> only used w/ trylock (unless we did something hacky by using a
> different ww_class?)

FWIW, we started using a ticket in the initial version of the Panthor
shrinker, and ditched it at some point because of these unsolvable lock
ordering issues. It also seems to me that trylock-all-the-way is the
right solution, and if we trylock and back off + immediately move to
the next BO if any lock is already held, the ticket approach is not as
useful, because we're not going to use the retry mechanism provided by
ww_mutex anyway.

It's true that it does the bookkeeping, which simplifies the rollback
procedure, but if you look at the other locks taken in the shrinker
path, they are static (one per-component involved in reclaim) for most
of them, meaning the rollback is pretty straightforward. The only
exception is the VM lock (one per vm_bo in case of shared BOs). In
panthor, we just decided to open-code this rollback logic (see
panthor_gem_try_evict_no_resv_wait() [1]) instead of teaching ww_mutex
about non-blocking locks when a ticket is provided. Not saying this is
the best option, but it works...

Regards,

Boris

[1]https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/driv=
ers/gpu/drm/panthor/panthor_gem.c?ref_type=3Dheads#L1425

