Return-Path: <linux-arm-msm+bounces-106446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJcfDGml/GmwSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:44:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 806214EA6D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ABC9302E339
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC65B3FBEDF;
	Thu,  7 May 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m8hElKPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B856F3FCB2E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164875; cv=none; b=qkClXczQ9yreOc4PTzRl13WyJYq4tp7F/F+TlxSRbkjZDy4zKsUuYogav3+ezhau0XRdgfj8S4YIQtGN8Rm+b7+yRmO9ozUa9J64omlW1+k7JEs/yMlFEn5QA0aewlzqVxqvZUBjmHvWsGgzibnDZdtZpwDUvN8i66cA/Djc3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164875; c=relaxed/simple;
	bh=8kVPsXdniYZDTNOnHTAwlUonJF1lf9qwfcC7sIAE9/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soBxN8rz2LCPcLwDGGWfZrzWYU/kHD2Rw3oGmMYPJFMFEwfJ+ZINGvX3CsRTNFrGWBTdg5kQJtw20T07yUnOdN+1/QE99VxTQ1+0iVoslgzWw8vXMNaQuPmn7nMScfCA4Awt8xFUAV20fa2f8h/OvJv3khXsNudX4hJxOuGEzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m8hElKPX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9694B354B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 07:41:05 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B938A3F763
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778164870; bh=8kVPsXdniYZDTNOnHTAwlUonJF1lf9qwfcC7sIAE9/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8hElKPX5yT/BBnMBjo00FEEDXPmEbNcCLeSFVclhnhFHvt+AhccLj6/BdjliC97q
	 gW87NuGy1l1CO/3y74owdtIS3FU+oaDrZlUvrj5ilfYJ5ectP3e2235V3LYPSYMZgc
	 g3APz9ItXpiqJxR9XI10Cg/txWtnPPjytu09hpxQ=
Date: Thu, 7 May 2026 15:40:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy drm_gem_lru_remove()
 helper
Message-ID: <afykcyiURGZh0xdr@e142607>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
 <afxi9ab1O9J_7J1Y@e142607>
 <20260507141027.166ab00d@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507141027.166ab00d@fedora>
X-Rspamd-Queue-Id: 806214EA6D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106446-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 02:10:27PM +0200, Boris Brezillon wrote:
> On Thu, 7 May 2026 11:01:25 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Wed, May 06, 2026 at 02:16:26PM +0200, Boris Brezillon wrote:
> > > drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
> > > variable that's then dereferenced to acquire the LRU lock. Because this
> > > assignment in done without the LRU lock held, it can race with
> > > drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
> > > a stack-allcated LRU that goes away when leaving the function. By
> > > the time we dereference this local lru variable, the object might already
> > > be gone.
> > > 
> > > It feels like drm_gem_lru_move_tail() was never meant to be used this
> > > way, because there's no easy way we can avoid this race unless we defer
> > > the locking to the caller. Let's add an explicit LRU for unreclaimable
> > > BOs instead, and have all BOs added to this LRU at creation time.  
> > 
> > I would argue that drm_gem_lru_scan() is broken by design. If you're going
> > to release the LRU lock in the middle of a loop you can expect that someone
> > will get hold of your stack-allocated LRU and end up picking the pieces.
> 
> I think it's fine as long as you always use the drm_gem_lru helpers to
> manipulate the lru field, which is true of a lot of kernel constructs.

I think drm_gem_lru_scan() should never set an object's lru field to still_in_lru.
It should set it to NULL when the object's node is removed from its lru and add
it into still_in_lru without making the drm_gem_object->lru to point back to it.
At the very end when we splice back the still_in_lru list back into lru's list we
can then update obj->lru.

> 
> > This patch is fine in itself by trying to avoid stepping into the fight,
> > but I think we should also add a warning in drm_gem_lru_scan() for future
> > users to be aware of the dangers.
> 
> Warning the user about what? There's nothing they can do about it, and
> I don't even think it's unsafe per-se, unless someone goes off and
> stores the drm_gem_object::lru value somewhere else while their shrink()
> callback is called, and accesses it later, outside the shrinker path.
> Given drm_gem_lru is not refcounted, there's no way one could safely
> hold on the LRU they saw in the shrink() callback anyway, so I don't
> think that's fair to blame the drm_gem_lru API for this kind of misuse.

Yeah, that would be the warning: don't store the object's lru as you might
get a temporary one that will become invalid after the shrinker has run.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

