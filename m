Return-Path: <linux-arm-msm+bounces-106333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBm9GFRn/GnPPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:20:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E079C4E6ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6425930173BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06CA3E6DF3;
	Thu,  7 May 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iBnAcFu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428E83D9DA4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149160; cv=none; b=I2T+AKY3xOieFFArGzPZXkYTkY0ZxkRcfYstKQG3/pFcL4NvqYYRsuwhFywowLiL57qqanKpjcT4mhw4F81SHm+XmHmMk09Catu7KHmeAcVcBZm1duEQAW1Xw7IwoETTDv0+TGktidNPFFuwnRVe1Q7tHxKnzZuIaOSRGrXOqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149160; c=relaxed/simple;
	bh=TG08dbsdevsuUuKiOfCppaUESy80nCb00HkxvqnrU2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyyEAF+tF05JVpa7LVM6Bb8ejbTM4QhOSwF8XgShuRqyMEWiJifhgh0RuSs3TbgOr4hcnWA4Ir+f6Ndjn3qeSZ6PC+ztcBJ8VLOYxS/snN7t4eUrsff+tJ8VXcFwa+HGUxXkVnqJyyIRfV64Foe/0ZIwllqD4gh7go1k0nGZTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iBnAcFu3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35467315F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:19:13 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A3863F836
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778149158; bh=TG08dbsdevsuUuKiOfCppaUESy80nCb00HkxvqnrU2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBnAcFu37UChXB39xVb+wUAErH59B0BvPzIc7ziaoWyPze0GTU1qFpJL0bH26/s1L
	 IFb5ymEob7OvgAgP5wzamyw70f8KdEmEm6XsZe8V6+2dAdro87aO+kt4QH2VkjQV19
	 ePRoXU05cLR9LkWIt9IniUREZzRd+CILYwdIEHDQ=
Date: Thu, 7 May 2026 11:18:55 +0100
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
Subject: Re: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and
 drm_gem_object_release()
Message-ID: <afxnD-YhUsLdLmWN@e142607>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
X-Rspamd-Queue-Id: E079C4E6ADA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106333-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,arm.com:email,arm.com:dkim]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 02:16:27PM +0200, Boris Brezillon wrote:
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
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index fca42949eb2b..97cf63de0112 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
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
> +			if (obj->lru)
> +				drm_gem_lru_remove_locked(obj);
> +
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

