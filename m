Return-Path: <linux-arm-msm+bounces-106135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOF3AtJh+2kuaQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:44:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B744DD7F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B09113032DBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266FD3ED5A1;
	Wed,  6 May 2026 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nTulg/TG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD5B47CC80;
	Wed,  6 May 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082044; cv=none; b=j6mVolfHCm5yXbCgigjVJZKxC6IQuag014mm9tXohp2a12YJF4dWBjX57OKjeOAT+beWmZDPZRsYCYtPnfaaT3QVXpsXztY8aD0lXC2SmiXEutmESbEVp7+moEFyFeIb+X2WTFesmakrpwY+emEXSETtZE40Ax/DoLNYmkSf2sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082044; c=relaxed/simple;
	bh=dOuepOxYrvpC0eOxRlco60j01LRxjiAn+sxvV1US3cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZI/mGSkpjv3zcZz0q/IJpA478kOkOB9+CFmipPCyEw74pNbUZj7b/PZ4C3u1Dgxrw+HUI2pV7Ly8qyHWk3oqHQP+BSOeOIRyAEpNjmRm/GwWzQJjz3T8FBVCamuJ5ncBdg0vvQ/YNRN6FVsETbrXs2blrLXa57V2gRh4QQUxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nTulg/TG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7146302F;
	Wed,  6 May 2026 08:40:27 -0700 (PDT)
Received: from [10.57.69.49] (unknown [10.57.69.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F63E3F7B4;
	Wed,  6 May 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778082033; bh=dOuepOxYrvpC0eOxRlco60j01LRxjiAn+sxvV1US3cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nTulg/TGSqDYhnUd1XNCVDDgbDaLvlULG7zZKlbySv2F/KJYCp6CdpgdIUkCCUhTx
	 R/t2roT6VmnjoOLMzGDJzQ+kiexzat/4pZZkltZPljC3hlwMasZ6b+8FveS4oFvVGZ
	 BIl9nKaIifMIzdLKtb5qNSQY8m95YO2voLATZqm8=
Message-ID: <c6b19d8e-f060-40cb-babc-d58947e71e3e@arm.com>
Date: Wed, 6 May 2026 16:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/gem: Stop exposing the racy/unsafe
 drm_gem_lru_remove() helper
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
 <20260506-panthor-shrinker-fixes-v1-3-e7721526de96@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-3-e7721526de96@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A1B744DD7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106135-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 06/05/2026 13:16, Boris Brezillon wrote:
> The only place where it's safe to call drm_gem_lru_remove() is when
> we know the drm_gem_object::lru field can't be concurrently updated,
> which we know is the case when the drm_gem_object is destroyed.
> 
> Rather than trying to make that safe, let's kill the function and inline
> its content in drm_gem_object_release().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 49 +++++++++++++++++------------------------------
>  include/drm/drm_gem.h     |  1 -
>  2 files changed, 18 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 97cf63de0112..b6df4f62f7b5 100644
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
> @@ -1124,7 +1133,15 @@ drm_gem_object_release(struct drm_gem_object *obj)
>  	drm_gem_private_object_fini(obj);
>  
>  	drm_gem_free_mmap_offset(obj);
> -	drm_gem_lru_remove(obj);
> +
> +	/* If the object refcount drops to zero, it means no one can change
> +	 * the LRU it's inserted into, so it's safe to dereference
> +	 * drm_gem_object::lru without the drm_gem_lru::lock held.
> +	 */
> +	if (obj->lru) {
> +		guard(mutex)(obj->lru->lock);
> +		drm_gem_lru_remove_locked(obj);
> +	}
>  }
>  EXPORT_SYMBOL(drm_gem_object_release);
>  
> @@ -1552,36 +1569,6 @@ drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
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
> -	if (!lru)
> -		return;
> -
> -	mutex_lock(lru->lock);
> -	drm_gem_lru_remove_locked(obj);
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


