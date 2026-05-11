Return-Path: <linux-arm-msm+bounces-106966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCXxNJv/AWppnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:11:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6C511D72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AFBC3028D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D7175A79;
	Mon, 11 May 2026 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TrS8d6pH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA88A1A275;
	Mon, 11 May 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514279; cv=none; b=Q9VxZAGXMxVYGn+ZRiEo6Bh7YjCVninQFjrQR5fubbSIyMOY2uNf+M225fKR6EmnmY5tKSS4Q3wYitr4q0KKUgR/AgKuFEJSdl599XAIEcXZNb4c8zRaFheRJ/n6e0MC+oE1st7oULsrBj/EjaGFqVmA97IQrum6SyhF66rm/XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514279; c=relaxed/simple;
	bh=BClQxIrtlJf+uCt+8eJy+vplQxwI6Of0OhdL/r5XqzU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0ik3v0rNP9XbHey7mosRfgyAJZNxawwLaCUA7i1HCAKX7jJX14KONDNkOgx7ze92Z/pxuRuWhukgFFt5Yd3HWsL7nVo2mZ+WFYXlIcagDN0v9ljAPY+qnOl8+UcYFfPaUaiMjKV1WLXeEpyxdoSZGwImaUgp9K8Q6nMv+FdU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TrS8d6pH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778514275;
	bh=BClQxIrtlJf+uCt+8eJy+vplQxwI6Of0OhdL/r5XqzU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TrS8d6pHgxpSLEgsPlarE4gNM42EVGOv7vtZLRXVrIada9O3gxDC1tkqeoBXPtazN
	 ZGRAksNZzqICJIH8tGS7QuvXIVnOQ6vSjgU3Z4EKTO7tUlTXVNZ6aagzoe7PplZbS7
	 v+HrXnoMTAIFZBmuL7hyGzsBE87sZ6ANY0tDJ/W3nsx5wDYNC/VZXw16nj1qtjQ8Sk
	 rQ7HWmr1Q5TIq+21pRNyRCNMgD6mCPMBqZcdB58B8CH+TuXeWoqfKfAHSl9HmFemvG
	 BkmKxynFDbCdEnV+27KrAeeKlWQsN4eBzhj+pfrCcVM71u93La85AKnLoj1jWiisfZ
	 V68JclhfmeR9A==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3216717E0615;
	Mon, 11 May 2026 17:44:35 +0200 (CEST)
Date: Mon, 11 May 2026 17:44:29 +0200
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
Subject: Re: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of
 drm_device
Message-ID: <20260511174429.35afcdee@fedora>
In-Reply-To: <CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
	<20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
	<CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 04D6C511D72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106966-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 06:18:44 -0700
Rob Clark <rob.clark@oss.qualcomm.com> wrote:

> On Fri, May 8, 2026 at 3:41=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Recently, a few races have been discovered in the GEM LRU logic, all
> > of them caused by the fact the LRU lock is accessed through
> > gem->lru->lock, and that lock itself also protects changes to
> > gem->lru, leading to situations where gem->lru needs to first be
> > accessed without the lock held, to then get the lru to access the lock
> > through and finally take the lock and do the expected operation.
> >
> > Currently, the two drivers making use of this API declare device-wide
> > locks, and there's no clue that we will ever have a driver that wants
> > different pools of LRUs protected by different locks under the same
> > drm_device. So we're better off moving this lock to drm_device and
> > always locking it through obj->dev->gem_lru_mutex, or directly through
> > dev->gem_lru_mutex.
> >
> > If anyone ever needs more fine-grained locking, this can be revisited
> > to pass some drm_gem_lru_pool object represent the pool of LRUs under
> > a specific lock, but for now, the per-device lock seems to be enough.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
>=20
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

If every one is happy with patch 4, I'm tempted to drop patch 1 and 3,
since they are irrelevant if the locking is fixed the way it is in this
patch. Question is, do we care about patch 2 being backported to stable
kernels then?

