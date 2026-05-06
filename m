Return-Path: <linux-arm-msm+bounces-106143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNlPBUVs+2miawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:28:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC544DE1CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E203009CD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC2D3ED107;
	Wed,  6 May 2026 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SnK+kHR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C553F0ABC;
	Wed,  6 May 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084716; cv=none; b=njkHYgA8NPXWg0D8MzaFkvOhfg7mI+8LC1zc9llJ5HjhzUQZ23D3bEvcOqMAIkQsXq1236+CczrPIIndbxDawgXJdiHyhuB5NNdWP9MGzHHiljyDTPFemRWUMFgIeBiEuAyVa2C67dgOOrQN6LcWv67SPPkEYiTd4YL6l2Q/Ssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084716; c=relaxed/simple;
	bh=aEwby3hiBqgi8nQZsciVDDvsXj0kYmX+laF5UjXUEVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scZkxghvq8LX4Hr1kdj3TFEo3Z7GhM63Gg8McVu2EDL3+SOTA9zokVrgUBHVyB0z4gscbbCjG8GteuzfqLr1d6zeM5+SsEE9gPc1MeO+lkJiDXKt1GhHn+iEp41tgBHwQJSaI2frTHtCXndW3zU9UxVwcKrTiXvaJEXVZIWIOik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SnK+kHR9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778084713;
	bh=aEwby3hiBqgi8nQZsciVDDvsXj0kYmX+laF5UjXUEVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SnK+kHR945GSMVWTHitLyP5YzUUC+Qab+3fG5NC2Z26bG+xuOvlr/PRHlKxMgnDlz
	 HKQR4cJav6qPwr3wgPZoWIThhRtZHykxEkCLGsEc+Mzk0Pfx3LBkOrXYB4IKMyq1uD
	 j6wYINvzl+ZG7dxF5bkuyEgKbhilySGoH71+pYiXf+5RHd9235Uovays0WXmBLUCJS
	 /x2AUxprmTwu1L7zr/QkGZRMhjvJj1CUxWY3xBmXQ6Cym812zep4LdrEHgT7Q4kHe4
	 jHyWzzlrBXwgHWsEr8Em6dn9D69o38CNxcQDQSTGWlFMN1PKooi0s4My9NgdtT09yx
	 yQ3PeyNbJTGcg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40B6217E124B;
	Wed,  6 May 2026 18:25:12 +0200 (CEST)
Date: Wed, 6 May 2026 18:25:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy
 drm_gem_lru_remove() helper
Message-ID: <20260506182506.204a1ed2@fedora>
In-Reply-To: <23c69bee-868d-4142-a96e-36de61f23f4f@arm.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
	<20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
	<23c69bee-868d-4142-a96e-36de61f23f4f@arm.com>
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
X-Rspamd-Queue-Id: 6DC544DE1CA
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-106143-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email]

On Wed, 6 May 2026 16:40:22 +0100
Steven Price <steven.price@arm.com> wrote:

> On 06/05/2026 13:16, Boris Brezillon wrote:
> > drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
> > variable that's then dereferenced to acquire the LRU lock. Because this
> > assignment in done without the LRU lock held, it can race with  
> s/in/is/     ^^
> > drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
> > a stack-allcated LRU that goes away when leaving the function. By
> > the time we dereference this local lru variable, the object might already
> > be gone.
> > 
> > It feels like drm_gem_lru_move_tail() was never meant to be used this
> > way, because there's no easy way we can avoid this race unless we defer
> > the locking to the caller. Let's add an explicit LRU for unreclaimable
> > BOs instead, and have all BOs added to this LRU at creation time.
> > 
> > Fixes: fb42964e2a76 ("drm/panthor: Add a GEM shrinker")
> > Reported-by: Chia-I Wu <olvaffe@gmail.com>
> > Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>  
> 
> With minor typos fixed
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Although an alternative would be to expose drm_gem_lru_remove_locked()
> in some form (maybe a wrapper which requires passing in the lock?)

I considered that too, but I thought it was less invasive to just have
a default LRU to start in at creation time, and end in there's nothing
left to reclaim. It's also what MSM does, so I figured I'd do that too.

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 10 ++++++++++
> >  drivers/gpu/drm/panthor/panthor_gem.c    |  5 ++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 4e4607bca7cc..45b71546f83c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -190,6 +190,16 @@ struct panthor_device {
> >  		/** @reclaim.lock: Lock protecting all LRUs */
> >  		struct mutex lock;
> >  
> > +		/**
> > +		 * @reclaim.unreclaimable: unreclaimable BOs
> > +		 *
> > +		 * Either the BO is unreclaimable because it has no pages allocated,
> > +		 * or it's unreclaimable because pages are pinned.
> > +		 *
> > +		 * All BOs start in that list at creation time.  
> s/that/this/                        ^^^^
> 
> Thanks,
> Steve
> 
> > +		 */
> > +		struct drm_gem_lru unreclaimable;
> > +
> >  		/**
> >  		 * @reclaim.unused: BOs with unused pages
> >  		 *
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 13295d7a593d..8e31740126e7 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -204,7 +204,7 @@ void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
> >  		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
> >  		break;
> >  	case PANTHOR_GEM_UNRECLAIMABLE:
> > -		drm_gem_lru_remove(&bo->base);
> > +		drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
> >  		break;
> >  	default:
> >  		drm_WARN(&ptdev->base, true, "invalid GEM reclaim state (%d)\n", new_state);
> > @@ -994,6 +994,7 @@ static struct panthor_gem_object *
> >  panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
> >  		   struct panthor_vm *exclusive_vm, u32 usage_flags)
> >  {
> > +	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
> >  	struct panthor_gem_object *bo;
> >  	int ret;
> >  
> > @@ -1026,6 +1027,7 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
> >  	}
> >  
> >  	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> > +	drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
> >  	return bo;
> >  
> >  err_put:
> > @@ -1551,6 +1553,7 @@ int panthor_gem_shrinker_init(struct panthor_device *ptdev)
> >  		return ret;
> >  
> >  	INIT_LIST_HEAD(&ptdev->reclaim.vms);
> > +	drm_gem_lru_init(&ptdev->reclaim.unreclaimable, &ptdev->reclaim.lock);
> >  	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
> >  	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
> >  	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
> >   
> 


