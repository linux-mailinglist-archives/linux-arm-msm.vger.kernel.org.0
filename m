Return-Path: <linux-arm-msm+bounces-108222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN7FLFQpC2pAEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:59:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 301EC56F663
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EA113006F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C578D264A97;
	Mon, 18 May 2026 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mt2HnBar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B32701C4;
	Mon, 18 May 2026 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115954; cv=none; b=LbALjfipfExvX+niskyR/OJWxpdIuvOerJDfLf1f5NwOPalHa8cX6St+f5L3odVzMJZyBT5vPpq0oHuuRlI8Wn08tzk2g3eURsdRFb6IfNJ99ZliBwDCZXVgJC8Bab8wZO9tBlqQkhGNCdq8oDGqB5iWVYspNtnjRqKyOI0ofGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115954; c=relaxed/simple;
	bh=K+iL/pi8OSQkkMq+iTjqo5yjay+NlemXowI/8kFxv6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mc08mg2vudD97rf3iBFJpI4pbZZF9RFBxhLnUE97SrdNcgjmYBEg5UVRgcz6Ph8+BsxMz4EYf60uAgvhB/YDJLuN1eZTru8fvJ0EqpUPO9bRPAgmaUZnaiikygPtcsh+ynem6uetFD20RWVNt+XMbFMeAYuTP1q0c8hqJ3i75Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mt2HnBar; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779115951;
	bh=K+iL/pi8OSQkkMq+iTjqo5yjay+NlemXowI/8kFxv6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mt2HnBarAn5ms+dVTfb+WDhkcY90oxDoZacMgykZNJLsaaCTUAvWmBjRKHQSqT289
	 6bcrK6UbWWc+yKkDpR1eNkuV+1q0WRRTU32/iNsv/VzucCFHz90bAu+nnyHSmGYyY+
	 11wOGVLAiI9QNCRLBba3+F//ZWGtM50/ew9Vquhfd8YEB9K+eMihv7xQGqShUzHMof
	 s2RU7R9wWEpTSJ/aTXHjQsrFYMsaQdSHxBAX3LbvolklkT7L/la9oS/UemdHg1S3ST
	 V6OkImu9QTf36HL/67Cb718DihD47ZS60yplOuT4KZevX6nnpx+QiVaGlz+Xp1RAuS
	 wCkdLPJdlAD5A==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D82017E0566;
	Mon, 18 May 2026 16:52:30 +0200 (CEST)
Date: Mon, 18 May 2026 16:52:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Mark Brown
 <broonie@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <20260518165225.145175b1@fedora>
In-Reply-To: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
References: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108222-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arm.com:email,collabora.com:email,collabora.com:dkim,gitlab.freedesktop.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 301EC56F663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Mark for the silent conflict resolution needed to reconcile
drm-misc-fixes and drm-next/drm-misc-next.

On Mon, 18 May 2026 13:41:45 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Recently, a few races have been discovered in the GEM LRU logic, all
> of them caused by the fact the LRU lock is accessed through
> gem->lru->lock, and that very same lock also protects changes to
> gem->lru, leading to situations where gem->lru needs to first be
> accessed without the lock held, to then get the lru to access the lock
> through and finally take the lock and do the expected operation.
> 
> Currently, the only driver making use of this API (MSM) declares a
> device-wide lock, and the user we're about to add (panthor) will
> do the same. There's no evidence that we will ever have a driver
> that wants different pools of LRUs protected by different locks under
> the same drm_device. So we're better off moving this lock to drm_device
> and always locking it through obj->dev->gem_lru_mutex, or directly
> through dev->gem_lru_mutex.
> 
> If anyone ever needs more fine-grained locking, this can be revisited
> to pass some drm_gem_lru_pool object representing the pool of LRUs
> under a specific lock, but for now, the per-device lock seems to be
> enough.
> 
> Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-next.

Note for the linux-next maintainers: below is the conflict
resolution currently stored in drm-tip.

Note for the drm-misc maintainers: we'll need a backmerge of the
next -rc into drm-misc-next so we can resolve the conflict there.

--->8---
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4e4607bca7cc..a412a50eec76 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -187,9 +187,6 @@ struct panthor_device {
 		/** @reclaim.shrinker: Shrinker instance */
 		struct shrinker *shrinker;
 
-		/** @reclaim.lock: Lock protecting all LRUs */
-		struct mutex lock;
-
 		/**
 		 * @reclaim.unused: BOs with unused pages
 		 *
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13295d7a593d..abe0c5bb1bca 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1495,13 +1495,13 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!can_swap())
 		goto out;
 
-	freed += drm_gem_lru_scan(&ptdev->reclaim.unused,
+	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.unused,
 				  sc->nr_to_scan - freed, &remaining,
 				  panthor_gem_try_evict_no_resv_wait, NULL);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
-	freed += drm_gem_lru_scan(&ptdev->reclaim.mmapped,
+	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.mmapped,
 				  sc->nr_to_scan - freed, &remaining,
 				  panthor_gem_try_evict_no_resv_wait, NULL);
 	if (freed >= sc->nr_to_scan)
@@ -1515,7 +1515,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
-	freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
+	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_mapped_shared,
 				  sc->nr_to_scan - freed, &remaining,
 				  panthor_gem_try_evict, NULL);
 
@@ -1544,21 +1544,16 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 int panthor_gem_shrinker_init(struct panthor_device *ptdev)
 {
 	struct shrinker *shrinker;
-	int ret;
-
-	ret = drmm_mutex_init(&ptdev->base, &ptdev->reclaim.lock);
-	if (ret)
-		return ret;
 
 	INIT_LIST_HEAD(&ptdev->reclaim.vms);
-	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
-	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
-	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
+	drm_gem_lru_init(&ptdev->reclaim.unused);
+	drm_gem_lru_init(&ptdev->reclaim.mmapped);
+	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared);
 	ptdev->reclaim.gpu_mapped_count = 0;
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
 	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&ptdev->reclaim.lock);
+	might_lock(&ptdev->base.gem_lru_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
 	shrinker = shrinker_alloc(0, "drm-panthor-gem");
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 452d0b6d4668..9d4500850561 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -715,10 +715,10 @@ int panthor_vm_active(struct panthor_vm *vm)
 	 * never became active in the first place will be reclaimed last, but
 	 * that's an acceptable trade-off.
 	 */
-	mutex_lock(&ptdev->reclaim.lock);
+	mutex_lock(&ptdev->base.gem_lru_mutex);
 	if (vm->reclaim.lru.count)
 		list_move_tail(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
-	mutex_unlock(&ptdev->reclaim.lock);
+	mutex_unlock(&ptdev->base.gem_lru_mutex);
 
 	/* Make sure we don't race with lock/unlock_region() calls
 	 * happening around VM bind operations.
@@ -1962,9 +1962,9 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 	struct panthor_vm *vm = container_of(gpuvm, struct panthor_vm, base);
 	struct panthor_device *ptdev = vm->ptdev;
 
-	mutex_lock(&ptdev->reclaim.lock);
+	mutex_lock(&ptdev->base.gem_lru_mutex);
 	list_del_init(&vm->reclaim.lru_node);
-	mutex_unlock(&ptdev->reclaim.lock);
+	mutex_unlock(&ptdev->base.gem_lru_mutex);
 
 	mutex_lock(&vm->heaps.lock);
 	if (drm_WARN_ON(&ptdev->base, vm->heaps.pool))
@@ -2360,11 +2360,11 @@ void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
 		drm_WARN_ON(&ptdev->base, vm);
 		vm = container_of(vm_bo->vm, struct panthor_vm, base);
 
-		mutex_lock(&ptdev->reclaim.lock);
+		mutex_lock(&ptdev->base.gem_lru_mutex);
 		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
 		if (list_empty(&vm->reclaim.lru_node))
 			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
-		mutex_unlock(&ptdev->reclaim.lock);
+		mutex_unlock(&ptdev->base.gem_lru_mutex);
 	}
 }
 
@@ -2774,7 +2774,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 	vm->kernel_auto_va.start = auto_kernel_va_start;
 	vm->kernel_auto_va.end = vm->kernel_auto_va.start + auto_kernel_va_size - 1;
 
-	drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
+	drm_gem_lru_init(&vm->reclaim.lru);
 	INIT_LIST_HEAD(&vm->reclaim.lru_node);
 	INIT_LIST_HEAD(&vm->node);
 	INIT_LIST_HEAD(&vm->as.lru_node);
@@ -3140,7 +3140,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 	LIST_HEAD(remaining_vms);
 	LIST_HEAD(vms);
 
-	mutex_lock(&ptdev->reclaim.lock);
+	mutex_lock(&ptdev->base.gem_lru_mutex);
 	list_splice_init(&ptdev->reclaim.vms, &vms);
 
 	while (freed < nr_to_scan) {
@@ -3156,12 +3156,13 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			continue;
 		}
 
-		mutex_unlock(&ptdev->reclaim.lock);
+		mutex_unlock(&ptdev->base.gem_lru_mutex);
 
-		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
+		freed += drm_gem_lru_scan(&ptdev->base, &vm->reclaim.lru,
+					  nr_to_scan - freed,
 					  remaining, shrink, NULL);
 
-		mutex_lock(&ptdev->reclaim.lock);
+		mutex_lock(&ptdev->base.gem_lru_mutex);
 
 		/* If the VM is still in the temporary list, remove it so we
 		 * can proceed with the next VM.
@@ -3177,11 +3178,11 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
 		}
 
-		mutex_unlock(&ptdev->reclaim.lock);
+		mutex_unlock(&ptdev->base.gem_lru_mutex);
 
 		panthor_vm_put(vm);
 
-		mutex_lock(&ptdev->reclaim.lock);
+		mutex_lock(&ptdev->base.gem_lru_mutex);
 	}
 
 	/* Re-insert VMs with remaining data to reclaim at the beginning of
@@ -3192,7 +3193,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 	 */
 	list_splice_tail(&vms, &remaining_vms);
 	list_splice(&remaining_vms, &ptdev->reclaim.vms);
-	mutex_unlock(&ptdev->reclaim.lock);
+	mutex_unlock(&ptdev->base.gem_lru_mutex);
 
 	return freed;
 }

