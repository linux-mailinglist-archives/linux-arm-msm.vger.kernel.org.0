Return-Path: <linux-arm-msm+bounces-106351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBpeLpKK/GleRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B54E8784
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08AEB3027713
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 12:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D472835F19A;
	Thu,  7 May 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P3JDXcbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0B33E345;
	Thu,  7 May 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158006; cv=none; b=tXJ9XNF28skFfLyeGyfW1gwb09aUD7gCN5ZN+S6ODfLSdNV7tCNA238I1jGFTGdM8D58+eYwBPYuxvOyvU+W8rpbPWobrrEe3jfcDeALUjRXVSEdTFXkM2i5W8khY9/379f3IW24u+ddP++q8FK1sO0AP23KCQWTPtOMEGKSOGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158006; c=relaxed/simple;
	bh=cnZR5W9FGizEToKXwLmQBP3mXWODE6QQC3LUbnT2NB4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQ4HkQ/sv28Ba3Nq1xX57jLQB1QN9bzhYv6v/AtJqSv1uwdpcbTCmvc9WGBiPyuWu6uxnwTBJNZlipWzRvBFGcv1H5aQzCTDZLWcu7Qhs2VPOdEzJiwRCc5wetu43UBXD22Ii0TZZHYUpbZBfczXRsvaeIo6HMbg9uePNrRbgck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P3JDXcbm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778158003;
	bh=cnZR5W9FGizEToKXwLmQBP3mXWODE6QQC3LUbnT2NB4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P3JDXcbmffUPrjf53yyyKHDM8ZwYE8VVRM9AO9P417tn50mcZq/T4XpEFLDz/6L1c
	 o1cjbQGiGudEFelzd8awsYxSzXg5XC60ULejTVd+5QUWKERxwmzVZU/XGMo6QD4zOv
	 eT6l9HqOwKYfZsNa4rrLxvsqICkctWKRObkJI7jmWcd/l1yJB1VqHOoTfwcGcAmCXR
	 ig9BvA5XeDfekjJaNq/ZVztMRON/nH0Uf1ousDGyXz1QtqJrzjhP+r3yzn01tzop0c
	 MOc2ySNBSGDDwbwV9QfuprQKsbuFT7aUxlzXM/xATHXZ8pFOhVGzJC8ZeQleYXpyz8
	 Io4t+NH/yBvUg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4B1F17E138B;
	Thu,  7 May 2026 14:46:42 +0200 (CEST)
Date: Thu, 7 May 2026 14:46:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and
 drm_gem_object_release()
Message-ID: <20260507144639.68bd699f@fedora>
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
	<20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
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
X-Rspamd-Queue-Id: 324B54E8784
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106351-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 06 May 2026 14:16:27 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

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

Actually, this thing is still racy, because obj->lru is dereferenced
without the lru->lock held in drm_gem_object_release(). At this point
I'm wondering if we should expose a drm_gem_lru_remove() taking the LRU
lock as an argument as suggested by Steve, and delegate the
responsibility to call drm_gem_lru_remove() to the driver. Either that,
or we make it so the LRU lock is attached to the drm_device instead of
the GEM (both MSM and panthor assume a device-wide lock for LRU
manipulation).

Rob, what's your take on this matter?

