Return-Path: <linux-arm-msm+bounces-106134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOidC8Ri+2kuaQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:48:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB34DD8E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27AB130D4C94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E1B3F7A8F;
	Wed,  6 May 2026 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pTtyE1gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0C4494A0F;
	Wed,  6 May 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082035; cv=none; b=BNH6ENyC17KoEkuWJlghWcAI0oTTKq9a09eDQi25piueplQRQIg+o1+XtTfdyomUQBje6Gc1KR6ZOtlzGMLPGWlowLs+nCASuNlqrQ171gkfWQvx/ym3OxRj7fNa/GZDEdET7nMM7JdUfl23DSf1mYL6CtFTdDOvzAi83oNsU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082035; c=relaxed/simple;
	bh=bHXOtIzqT8aOSc77byfk93z12RxtohGmdl0a/NUjWzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W35rHheS0ocyknXPrP+OIldwFTuDJDLGpIhX7a0oDjLpkXIG5eL2qTP/aQjnJj9R/i2bWsWzcniu837NgvtIG0ow2CfZMpBTQiNIjsPl3FsoNlpcBFjV5PxOKRodJj0LSNk3pUgursEwTZchhlh/UU6mikXEQrQUEMf9XsjYC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pTtyE1gt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D24B71A00;
	Wed,  6 May 2026 08:40:23 -0700 (PDT)
Received: from [10.57.69.49] (unknown [10.57.69.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 993E63F7B4;
	Wed,  6 May 2026 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778082029; bh=bHXOtIzqT8aOSc77byfk93z12RxtohGmdl0a/NUjWzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pTtyE1gtb59IOTxDCirzd886wiUYkHfrrdpGH1jR/zeOy1suieCwDv4WiMz5r9wPj
	 Z9chez35XI2F+KicGm33sPSBp6scUbZOQONyEH/cUBN55N8Qsr50yWkZoqEZGfJHZN
	 CDZR8sD/883aBHX6Ei0tlT6ZnKZ6D928YZis8a/s=
Message-ID: <23c69bee-868d-4142-a96e-36de61f23f4f@arm.com>
Date: Wed, 6 May 2026 16:40:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy drm_gem_lru_remove()
 helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8DBB34DD8E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,collabora.com:email,arm.com:email,arm.com:dkim,arm.com:mid]

On 06/05/2026 13:16, Boris Brezillon wrote:
> drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
> variable that's then dereferenced to acquire the LRU lock. Because this
> assignment in done without the LRU lock held, it can race with
s/in/is/     ^^
> drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
> a stack-allcated LRU that goes away when leaving the function. By
> the time we dereference this local lru variable, the object might already
> be gone.
> 
> It feels like drm_gem_lru_move_tail() was never meant to be used this
> way, because there's no easy way we can avoid this race unless we defer
> the locking to the caller. Let's add an explicit LRU for unreclaimable
> BOs instead, and have all BOs added to this LRU at creation time.
> 
> Fixes: fb42964e2a76 ("drm/panthor: Add a GEM shrinker")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

With minor typos fixed

Reviewed-by: Steven Price <steven.price@arm.com>

Although an alternative would be to expose drm_gem_lru_remove_locked()
in some form (maybe a wrapper which requires passing in the lock?)

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
s/that/this/                        ^^^^

Thanks,
Steve

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


