Return-Path: <linux-arm-msm+bounces-106701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJBpFpf7/WnYlQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7C4F8478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA59830A4D86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 15:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6063624B3;
	Fri,  8 May 2026 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bDraT/pH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAB53D1705
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252473; cv=none; b=k8Yj0gKPdEfCdr6XFXi6gJuL9auKWO3XW0KmLuN8EHmIaFuKJQRQW9C4PPeYKoL+4amiTL8Xu9Md/Ho5yAGjAW7QEb8c2FX2tZ7o2RnBNgVdkLzGLVvIUcr7DZ25kbcCFnYofuJAbMJneM+bfcsSuovrbHGs9NXEIFptnDc2WS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252473; c=relaxed/simple;
	bh=tBSLp4TFWnzxz3eHgUik+or3IqdAn5knLKmt0L5xo5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bng+/1nmqms1K2x6NYSIyzPDmBcaeW9GIl1sfYuMlS01f1zXBPVed8FIPmlekjGiwhrlHWuy7SZYe9zvDvwDLQZlXuza0gGS4rb16onxec16pI+0sf3+0pBdmUL3+qW1WOLFYqB4opDJgDX+91B4WIOaT3RFVNi8GWMAr+ZVdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bDraT/pH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2FB83595
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:01:04 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8D293F763
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778252470; bh=tBSLp4TFWnzxz3eHgUik+or3IqdAn5knLKmt0L5xo5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDraT/pHkcbZ0bQVqGw+Hjq3KZWAsaUEojhtX2G17fhz7e6+9mAma/JC0Ld0LRNrY
	 xxtEyBsSreyFqr6YjZgXrSfLbCEAmtqfdVPKebQfTo6fnHCfrMYqp9LTO7pXECXFjv
	 1spBYz6HnJmzGgYidmu5mcvxGGYfSQ4nD9UknUe0=
Date: Fri, 8 May 2026 16:00:51 +0100
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
Subject: Re: [PATCH v2 3/4] drm/gem: Stop exposing the racy/unsafe
 drm_gem_lru_remove() helper
Message-ID: <af36o8diwtmA4z8K@e142607>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
 <20260508-panthor-shrinker-fixes-v2-3-39cdb7d577c9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508-panthor-shrinker-fixes-v2-3-39cdb7d577c9@collabora.com>
X-Rspamd-Queue-Id: CBF7C4F8478
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106701-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,arm.com:email,arm.com:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:40:49PM +0200, Boris Brezillon wrote:
> The only place where it's safe to call drm_gem_lru_remove() is when
> we know the drm_gem_object::lru field can't be concurrently updated,
> which we know is the case when the drm_gem_object is destroyed.
> 
> Rather than trying to make that safe, let's kill the function and inline
> its content in drm_gem_object_release().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gem.c | 90 ++++++++++++++++++++---------------------------
>  include/drm/drm_gem.h     |  1 -
>  2 files changed, 39 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0e087c770883..c85a39b8b163 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1108,6 +1108,15 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
>  	idr_destroy(&file_private->object_idr);
>  }
>  
> +static void
> +drm_gem_lru_remove_locked(struct drm_gem_object *obj)
> +{
> +	obj->lru->count -= obj->size >> PAGE_SHIFT;
> +	WARN_ON(obj->lru->count < 0);
> +	list_del(&obj->lru_node);
> +	obj->lru = NULL;
> +}
> +
>  /**
>   * drm_gem_object_release - release GEM buffer object resources
>   * @obj: GEM buffer object
> @@ -1118,13 +1127,42 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
>  void
>  drm_gem_object_release(struct drm_gem_object *obj)
>  {
> +	struct drm_gem_lru *lru;
> +
>  	if (obj->filp)
>  		fput(obj->filp);
>  
>  	drm_gem_private_object_fini(obj);
>  
>  	drm_gem_free_mmap_offset(obj);
> -	drm_gem_lru_remove(obj);
> +
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
> +	 */
> +	lru = obj->lru;
> +	if (lru) {
> +		guard(mutex)(lru->lock);
> +
> +		/* Check a second time with the lock held to make sure we're
> +		 * not racing with the drm_gem_lru_remove_locked() call in
> +		 * drm_gem_lru_scan().
> +		 */
> +		if (obj->lru)
> +			drm_gem_lru_remove_locked(obj);
> +	}
>  }
>  EXPORT_SYMBOL(drm_gem_object_release);
>  
> @@ -1552,56 +1590,6 @@ drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
>  }
>  EXPORT_SYMBOL(drm_gem_lru_init);
>  
> -static void
> -drm_gem_lru_remove_locked(struct drm_gem_object *obj)
> -{
> -	obj->lru->count -= obj->size >> PAGE_SHIFT;
> -	WARN_ON(obj->lru->count < 0);
> -	list_del(&obj->lru_node);
> -	obj->lru = NULL;
> -}
> -
> -/**
> - * drm_gem_lru_remove - remove object from whatever LRU it is in
> - *
> - * If the object is currently in any LRU, remove it.
> - *
> - * @obj: The GEM object to remove from current LRU
> - */
> -void
> -drm_gem_lru_remove(struct drm_gem_object *obj)
> -{
> -	struct drm_gem_lru *lru = obj->lru;
> -
> -	/*
> -	 * We do the lru != NULL check without the lru->lock held, which
> -	 * means we might end up with a stale lru value by the time the
> -	 * lock is acquired.
> -	 *
> -	 * This is deemed safe because:
> -	 * 1. the LRU is assumed to outlive any GEM object it was attached
> -	 *    (LRUs are usually bound to a drm_device). So even if obj->lru
> -	 *    has become NULL, it still point to a valid object that can
> -	 *    safely be dereferenced to get the lock.
> -	 *
> -	 * 2. all LRUs a GEM object might be attached to must share the same
> -	 *    lock (lock that's usually part of the driver-specific device
> -	 *    object), so taking the lock on the 'old' LRU is equivalent
> -	 *    to taking it on the new one (if any)
> -	 */
> -	if (!lru)
> -		return;
> -
> -	mutex_lock(lru->lock);
> -	/* Check a second time with the lock held to make sure we're not racing
> -	 * with another drm_gem_lru_remove[_locked]() call.
> -	 */
> -	if (obj->lru)
> -		drm_gem_lru_remove_locked(obj);
> -	mutex_unlock(lru->lock);
> -}
> -EXPORT_SYMBOL(drm_gem_lru_remove);
> -
>  /**
>   * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
>   *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..d527df98d142 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -611,7 +611,6 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  			    u32 handle, u64 *offset);
>  
>  void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
> -void drm_gem_lru_remove(struct drm_gem_object *obj);
>  void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
>  void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
>  unsigned long
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

