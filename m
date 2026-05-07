Return-Path: <linux-arm-msm+bounces-106348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDleEkCB/Gl6QwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:10:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C24E804C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E6703005AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 12:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C833A641C;
	Thu,  7 May 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H0sxO4IP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A540DFA9;
	Thu,  7 May 2026 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155838; cv=none; b=cdidSMRlsUx+CIaJHzg666v7oLvmVs9+MP9HCu/Tt/m4xZn3OIMV4/ZHKWiLk78eyyfF29rAV4BOfUg4m0DqD30nD9GzCp6tq8PzQPaI1AyoZzcfrgbFA/Zifo8pUkOoS8bjpfsph1nAdSLwDvbMfB0iFxTEg91lDWaJJl9XBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155838; c=relaxed/simple;
	bh=VzeTl1zd/0YqxA7PQbXWH87HGQtycpS00hXPs1oynRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9JPa/dGTddh+yGOHj74FQjKwCTV+f5CYrrMd9fX8VRsQu43KFAT3BQ4SRL5XWg2RknTIqgkZR/XIjQrFp043jWHMfxMAEGB0Yk4/V1Xuu9HUZBwDSjYoQkZpteQR7za461pc5REMnfQIA6ixaFdKAbLHUMVbWMBCfLKLh/W23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H0sxO4IP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778155833;
	bh=VzeTl1zd/0YqxA7PQbXWH87HGQtycpS00hXPs1oynRM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H0sxO4IPU3e5uKOI2s/JrND6tYmrn5NV3IMqpmvH5O901Q0IkfumPjlbtzff1CDOX
	 voD2ZfQsTZRnOUI7oaOzvU6ZsvmK6FW+taKt+9lLYQ5oA9ZBOo3Nk1BqOmYWVIw5VL
	 KiGlS1gL5bgcnJGP7XKn9kKxgaEGVGspTehjuZN7DOK7ArgY+LTa9MBcZ4YAXpFRWO
	 SDweQi6GfFt1OaVXFh7tLTNhQFKqM9BIy0R51fEoJ3y2Qw0cPFp4gPe57Abfn41WT3
	 aPRj+MLoc+R4dWVydatbAdknxakTRdLxWLxUVkSlbewnZOv0jGDoFUZ2I2GhSYTpxI
	 qjq3Y7fXXuAXA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB9AF17E125C;
	Thu,  7 May 2026 14:10:32 +0200 (CEST)
Date: Thu, 7 May 2026 14:10:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org
Cc: Steven Price <steven.price@arm.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy
 drm_gem_lru_remove() helper
Message-ID: <20260507141027.166ab00d@fedora>
In-Reply-To: <afxi9ab1O9J_7J1Y@e142607>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
	<20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
	<afxi9ab1O9J_7J1Y@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E67C24E804C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106348-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,arm.com:email]
X-Rspamd-Action: no action

On Thu, 7 May 2026 11:01:25 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Wed, May 06, 2026 at 02:16:26PM +0200, Boris Brezillon wrote:
> > drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
> > variable that's then dereferenced to acquire the LRU lock. Because this
> > assignment in done without the LRU lock held, it can race with
> > drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
> > a stack-allcated LRU that goes away when leaving the function. By
> > the time we dereference this local lru variable, the object might already
> > be gone.
> > 
> > It feels like drm_gem_lru_move_tail() was never meant to be used this
> > way, because there's no easy way we can avoid this race unless we defer
> > the locking to the caller. Let's add an explicit LRU for unreclaimable
> > BOs instead, and have all BOs added to this LRU at creation time.  
> 
> I would argue that drm_gem_lru_scan() is broken by design. If you're going
> to release the LRU lock in the middle of a loop you can expect that someone
> will get hold of your stack-allocated LRU and end up picking the pieces.

I think it's fine as long as you always use the drm_gem_lru helpers to
manipulate the lru field, which is true of a lot of kernel constructs.

> This patch is fine in itself by trying to avoid stepping into the fight,
> but I think we should also add a warning in drm_gem_lru_scan() for future
> users to be aware of the dangers.

Warning the user about what? There's nothing they can do about it, and
I don't even think it's unsafe per-se, unless someone goes off and
stores the drm_gem_object::lru value somewhere else while their shrink()
callback is called, and accesses it later, outside the shrinker path.
Given drm_gem_lru is not refcounted, there's no way one could safely
hold on the LRU they saw in the shrink() callback anyway, so I don't
think that's fair to blame the drm_gem_lru API for this kind of misuse.

