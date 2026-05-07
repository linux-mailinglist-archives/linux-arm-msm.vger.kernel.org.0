Return-Path: <linux-arm-msm+bounces-106330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBKNGndk/GkqPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:07:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3A4E67C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C003003ECF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDF137189A;
	Thu,  7 May 2026 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k+yDVUKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58673C0619
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148121; cv=none; b=Y09lAuAooAX4hFPlENE/OWIHT8gnpnpXWMUj8jmbIouesNCq5fbmxubKT+S2Sm31PndYYAAxgwaqAICF2x3DEyyWGqF4IlwRQUB+/a3CtJKrqfFS6mtqcidy/H1PgFYxC6oofbMab0zazYwLNgvvZvHK/o0/AaJExNUeQSeaJFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148121; c=relaxed/simple;
	bh=V6SSn9JDAt3Sb2yowSSRXctJvfC9kF3/lLVSaXdPYEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZc8RsmbiUEfRgMXt2k6FFAh9gYbaNenfnaZVj0eovlsjjApRupA0K98REn3sxB5fb+ZJUIOKktFII58dKiBsvULfT12Kr41YapmWEh2rC1CXiAhjPFD8YVGH2zc3P7abv0QGXRkOWHuwo6b9cWO2x4CbJN+7A+3Z9hayyMH+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k+yDVUKK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435E8315F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:01:47 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36B873F763
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778148112; bh=V6SSn9JDAt3Sb2yowSSRXctJvfC9kF3/lLVSaXdPYEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+yDVUKKa9GURIuIGM1ZmvBRSUDaewPqvPiRHEcI/ZLy3Bn9xzzIS/EOlSJCwM+jU
	 ZioCGQQ01HZQq0EdyOHny4Nc5CwG2riBkmKslbdK9aBoJNxskpWkKg6ik3ZXOZbBQz
	 qIIEQiG8GnPryGxBHdh9k14F9iKvjRTwo+xRi5zE=
Date: Thu, 7 May 2026 11:01:25 +0100
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
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy drm_gem_lru_remove()
 helper
Message-ID: <afxi9ab1O9J_7J1Y@e142607>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
X-Rspamd-Queue-Id: C3B3A4E67C5
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
	TAGGED_FROM(0.00)[bounces-106330-lists,linux-arm-msm=lfdr.de];
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

On Wed, May 06, 2026 at 02:16:26PM +0200, Boris Brezillon wrote:
> drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
> variable that's then dereferenced to acquire the LRU lock. Because this
> assignment in done without the LRU lock held, it can race with
> drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
> a stack-allcated LRU that goes away when leaving the function. By
> the time we dereference this local lru variable, the object might already
> be gone.
> 
> It feels like drm_gem_lru_move_tail() was never meant to be used this
> way, because there's no easy way we can avoid this race unless we defer
> the locking to the caller. Let's add an explicit LRU for unreclaimable
> BOs instead, and have all BOs added to this LRU at creation time.

I would argue that drm_gem_lru_scan() is broken by design. If you're going
to release the LRU lock in the middle of a loop you can expect that someone
will get hold of your stack-allocated LRU and end up picking the pieces.
This patch is fine in itself by trying to avoid stepping into the fight,
but I think we should also add a warning in drm_gem_lru_scan() for future
users to be aware of the dangers.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> Fixes: fb42964e2a76 ("drm/panthor: Add a GEM shrinker")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 10 ++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.c    |  5 ++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4e4607bca7cc..45b71546f83c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -190,6 +190,16 @@ struct panthor_device {
>  		/** @reclaim.lock: Lock protecting all LRUs */
>  		struct mutex lock;
>  
> +		/**
> +		 * @reclaim.unreclaimable: unreclaimable BOs
> +		 *
> +		 * Either the BO is unreclaimable because it has no pages allocated,
> +		 * or it's unreclaimable because pages are pinned.
> +		 *
> +		 * All BOs start in that list at creation time.
> +		 */
> +		struct drm_gem_lru unreclaimable;
> +
>  		/**
>  		 * @reclaim.unused: BOs with unused pages
>  		 *
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 13295d7a593d..8e31740126e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -204,7 +204,7 @@ void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
>  		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
>  		break;
>  	case PANTHOR_GEM_UNRECLAIMABLE:
> -		drm_gem_lru_remove(&bo->base);
> +		drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
>  		break;
>  	default:
>  		drm_WARN(&ptdev->base, true, "invalid GEM reclaim state (%d)\n", new_state);
> @@ -994,6 +994,7 @@ static struct panthor_gem_object *
>  panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
>  		   struct panthor_vm *exclusive_vm, u32 usage_flags)
>  {
> +	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
>  	struct panthor_gem_object *bo;
>  	int ret;
>  
> @@ -1026,6 +1027,7 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
>  	}
>  
>  	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> +	drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
>  	return bo;
>  
>  err_put:
> @@ -1551,6 +1553,7 @@ int panthor_gem_shrinker_init(struct panthor_device *ptdev)
>  		return ret;
>  
>  	INIT_LIST_HEAD(&ptdev->reclaim.vms);
> +	drm_gem_lru_init(&ptdev->reclaim.unreclaimable, &ptdev->reclaim.lock);
>  	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
>  	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
>  	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
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

