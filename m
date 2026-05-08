Return-Path: <linux-arm-msm+bounces-106694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLsXH5Lr/WkPkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D235D4F773F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068423035268
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9399427FB37;
	Fri,  8 May 2026 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tJYrt3j4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDD91607A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248177; cv=none; b=PvZev5lDegYiNOFZQCt3wTV21Zrs2txzJE3wQ2VIXlDxo2ZFFXdPHd7MXLNuL/lyJZ9Rizo28/zAk+yZVhFWdpWZJX3dbWWo9S5+O8yG1SHM5ooveFa8v89d72BE62g6Bb/Rycm5DAQCO3z8L/lbhUOHotk4oit/JEpQTYSh4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248177; c=relaxed/simple;
	bh=KWYJnVlBnj7V7qkaHdFDGEGcW0rUpKIbmySK/TzA54M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4A95JtPniKg++yuccXPM+nAEcxw8NkzgjUSL3d64WSItXTUPK36gPtRC0q1seKTkRyy20tCxeCYKJ910TnZdMEwRP9uP5P+11Fnx+aLwaGChZFnL2zzweb94j1tyjxkQgT15YGyipX/xu0RVArPLIgMj8QcqTfAKBTjzam0LcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tJYrt3j4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFFF3358A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 06:49:29 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E09443F836
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778248175; bh=KWYJnVlBnj7V7qkaHdFDGEGcW0rUpKIbmySK/TzA54M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJYrt3j4jaTPuqRiLKJdCbLM8tHvfF5KTsS5ITsqlOrFHPLgycIKPwgscAGsJRrVm
	 20yLZsKX1sjki1B1tly2ryMH9sfMzpbBYVkMnwo+rg3JsaF0ia3Rv+RN5GhhbDIfxR
	 aVQuUIoQNcBjn5gRhDzNfgOTy7FxERglipHwuzLM=
Date: Fri, 8 May 2026 14:49:16 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/gem: Fix a race between drm_gem_lru_scan()
 and drm_gem_object_release()
Message-ID: <af3p3GsJAskjVMWQ@e142607>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
 <20260508-panthor-shrinker-fixes-v2-2-39cdb7d577c9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508-panthor-shrinker-fixes-v2-2-39cdb7d577c9@collabora.com>
X-Rspamd-Queue-Id: D235D4F773F
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
	TAGGED_FROM(0.00)[bounces-106694-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,gitlab.freedesktop.org:url,collabora.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:40:48PM +0200, Boris Brezillon wrote:
> The following race can currently happen:
> 
> | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_object_release` |
> | -                                            | -                                    |
> | move obj1 with refcount==0 to `still_in_lru` |                                      |
> | move obj2 with refcount!=0 to `still_in_lru` |                                      |
> | mutex_unlock                                 |                                      |
> | shrink obj2                                  |                                      |
> |                                              | lru = obj1->lru; // `still_in_lru`   |
> | mutex_lock                                   |                                      |
> | move obj1 back to the original lru           |                                      |
> | mutex_unlock                                 |                                      |
> | return                                       |                                      |
> |                                              | dereference `still_in_lru`           |
> 
> Move the drm_gem_lru_move_tail_locked() after the
> kref_get_unless_zero() check so that we don't end up with a
> vanishing LRU when we hit drm_gem_object_release(). We also need to
> remove the skipped object from its LRU, otherwise we'll keep hitting
> it on subsequent loop iterations until it's actually removed from the
> list in the drm_gem_release().
> 
> Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index fca42949eb2b..0e087c770883 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1573,11 +1573,31 @@ drm_gem_lru_remove(struct drm_gem_object *obj)
>  {
>  	struct drm_gem_lru *lru = obj->lru;
>  
> +	/*
> +	 * We do the lru != NULL check without the lru->lock held, which
> +	 * means we might end up with a stale lru value by the time the
> +	 * lock is acquired.
> +	 *
> +	 * This is deemed safe because:
> +	 * 1. the LRU is assumed to outlive any GEM object it was attached
> +	 *    (LRUs are usually bound to a drm_device). So even if obj->lru
> +	 *    has become NULL, it still point to a valid object that can
> +	 *    safely be dereferenced to get the lock.
> +	 *
> +	 * 2. all LRUs a GEM object might be attached to must share the same
> +	 *    lock (lock that's usually part of the driver-specific device
> +	 *    object), so taking the lock on the 'old' LRU is equivalent
> +	 *    to taking it on the new one (if any)

I like the description, but I think it's worth merging the later comment around
the second check here as that is basically the whole "belt and braces" mechanism
for ensuring correctness.

Best regards,
Liviu

> +	 */
>  	if (!lru)
>  		return;
>  
>  	mutex_lock(lru->lock);
> -	drm_gem_lru_remove_locked(obj);
> +	/* Check a second time with the lock held to make sure we're not racing
> +	 * with another drm_gem_lru_remove[_locked]() call.
> +	 */
> +	if (obj->lru)
> +		drm_gem_lru_remove_locked(obj);
>  	mutex_unlock(lru->lock);
>  }
>  EXPORT_SYMBOL(drm_gem_lru_remove);
> @@ -1660,15 +1680,17 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>  		if (!obj)
>  			break;
>  
> -		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> -
>  		/*
>  		 * If it's in the process of being freed, gem_object->free()
> -		 * may be blocked on lock waiting to remove it.  So just
> -		 * skip it.
> +		 * may be blocked on lock waiting to remove it.  So just remove
> +		 * it from its current LRU and skip it.
>  		 */
> -		if (!kref_get_unless_zero(&obj->refcount))
> +		if (!kref_get_unless_zero(&obj->refcount)) {
> +			drm_gem_lru_remove_locked(obj);
>  			continue;
> +		}
> +
> +		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
>  
>  		/*
>  		 * Now that we own a reference, we can drop the lock for the
> 
> -- 
> 2.54.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

