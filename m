Return-Path: <linux-arm-msm+bounces-106646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDB/I2G+/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:43:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C14F5354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31182302BD07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C08F3D525B;
	Fri,  8 May 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gdWMcJXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26C3D3D1D;
	Fri,  8 May 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236881; cv=none; b=ZdOCE2UJN5fhHlthU2QK1Gznl3LIIoIhzWyWPKXeEo4kTFp4tNLNzCTc9H4sz8NKRvUW6Q3pSnQvp1mHV9jKNPtdU3h+3zPBeqDAWTj+bbMO4SqfZe5+KU8Mp4S+jntnF3sQSlucKTDX7cO5+T2CptVOe+nDM/lqtdCV7WnmJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236881; c=relaxed/simple;
	bh=yFgR2hISu97FtZxkMWezkPJa03YxIP5P51pDzQLo/UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjYeVcg/XzgSSKI+P1fXW+3icMMCfSiKZg7jQjVii+/Cb5Hug2ekFRQEd79gii636h1Vcws9zO66um/Rocno4BcLvIrA8gkbap83BfpRp+olw0UwSS3JLWqSZ+BlXNr/Y2QI2vnvv38TPyj5lX0+G0O9oluMhSHxHhXbq8ZYInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gdWMcJXz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778236875;
	bh=yFgR2hISu97FtZxkMWezkPJa03YxIP5P51pDzQLo/UA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gdWMcJXzKo8U4bYX2WaVKKhiMACYDuExrDRDehbQeiD2XbcDoK2ez/XGTjcwmV91y
	 jTZuEsbtpMsYCfsW+MoW7CVoHgX3MUHJzMtiEJUavhPy74aYYJv7kiJN2iBLHRYSkv
	 xaOENT0PeCUX03KMv02YxkYcQjN+ete2+riNpXH6lSoEOyYBg0j50Y28EbB1fH5ol1
	 r9StEBSzWOGJxD4vdMdNHuaDCOeftO1cYwJR3ztzPm1qBxk+lrBlQ3KWUijaI+u7U2
	 7jxgS7WeVh5IAimqR/BO1NjurGyIuyjczzjhY/uSiPOs5hAc4iDwU5upsfHEvFQWkW
	 dv+Orew3KChxg==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BA9B17E150A;
	Fri,  8 May 2026 12:41:15 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 08 May 2026 12:40:50 +0200
Subject: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of drm_device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
In-Reply-To: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236871; l=25597;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=yFgR2hISu97FtZxkMWezkPJa03YxIP5P51pDzQLo/UA=;
 b=55j0S9OYo5m0Iw2FYPr8mSh05HTfQZ5CXAJvl7KBL+OwfS3TVCJExnfJXBjtaz61tCmzFEw2l
 rY8Yxxkhu04A84DVk5o5lqVJ9UaT5bzPS622wb5pUFOsJEhbUB15GVH
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 8E1C14F5354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106646-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

Recently, a few races have been discovered in the GEM LRU logic, all
of them caused by the fact the LRU lock is accessed through
gem->lru->lock, and that lock itself also protects changes to
gem->lru, leading to situations where gem->lru needs to first be
accessed without the lock held, to then get the lru to access the lock
through and finally take the lock and do the expected operation.

Currently, the two drivers making use of this API declare device-wide
locks, and there's no clue that we will ever have a driver that wants
different pools of LRUs protected by different locks under the same
drm_device. So we're better off moving this lock to drm_device and
always locking it through obj->dev->gem_lru_mutex, or directly through
dev->gem_lru_mutex.

If anyone ever needs more fine-grained locking, this can be revisited
to pass some drm_gem_lru_pool object represent the pool of LRUs under
a specific lock, but for now, the per-device lock seems to be enough.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_drv.c                |  2 ++
 drivers/gpu/drm/drm_gem.c                | 49 ++++++++------------------------
 drivers/gpu/drm/msm/msm_drv.c            | 11 ++++---
 drivers/gpu/drm/msm/msm_drv.h            |  7 -----
 drivers/gpu/drm/msm/msm_gem.c            | 32 ++++++++++-----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c   |  4 +--
 drivers/gpu/drm/msm/msm_gem_submit.c     |  6 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c        | 12 ++++----
 drivers/gpu/drm/msm/msm_ringbuffer.c     |  6 ++--
 drivers/gpu/drm/panthor/panthor_device.h |  3 --
 drivers/gpu/drm/panthor/panthor_gem.c    | 21 ++++++--------
 drivers/gpu/drm/panthor/panthor_mmu.c    | 29 ++++++++++---------
 include/drm/drm_device.h                 |  7 +++++
 include/drm/drm_gem.h                    | 20 ++++++-------
 14 files changed, 88 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 985c283cf59f..675675480da4 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -697,6 +697,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
+	mutex_destroy(&dev->gem_lru_mutex);
 }
 
 static int drm_dev_init(struct drm_device *dev,
@@ -738,6 +739,7 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->vblank_event_list);
 
 	spin_lock_init(&dev->event_lock);
+	mutex_init(&dev->gem_lru_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c85a39b8b163..a0e6668e93f2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1127,8 +1127,6 @@ drm_gem_lru_remove_locked(struct drm_gem_object *obj)
 void
 drm_gem_object_release(struct drm_gem_object *obj)
 {
-	struct drm_gem_lru *lru;
-
 	if (obj->filp)
 		fput(obj->filp);
 
@@ -1136,30 +1134,7 @@ drm_gem_object_release(struct drm_gem_object *obj)
 
 	drm_gem_free_mmap_offset(obj);
 
-	/*
-	 * We do the lru != NULL check without the lru->lock held, which
-	 * means we might end up with a stale lru value by the time the
-	 * lock is acquired.
-	 *
-	 * This is deemed safe because:
-	 * 1. the LRU is assumed to outlive any GEM object it was attached
-	 *    (LRUs are usually bound to a drm_device). So even if obj->lru
-	 *    has become NULL, it still point to a valid object that can
-	 *    safely be dereferenced to get the lock.
-	 *
-	 * 2. all LRUs a GEM object might be attached to must share the same
-	 *    lock (lock that's usually part of the driver-specific device
-	 *    object), so taking the lock on the 'old' LRU is equivalent
-	 *    to taking it on the new one (if any)
-	 */
-	lru = obj->lru;
-	if (lru) {
-		guard(mutex)(lru->lock);
-
-		/* Check a second time with the lock held to make sure we're
-		 * not racing with the drm_gem_lru_remove_locked() call in
-		 * drm_gem_lru_scan().
-		 */
+	scoped_guard(mutex, &obj->dev->gem_lru_mutex) {
 		if (obj->lru)
 			drm_gem_lru_remove_locked(obj);
 	}
@@ -1582,9 +1557,8 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
  * @lock: The lock protecting the LRU
  */
 void
-drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
+drm_gem_lru_init(struct drm_gem_lru *lru)
 {
-	lru->lock = lock;
 	lru->count = 0;
 	INIT_LIST_HEAD(&lru->list);
 }
@@ -1601,7 +1575,7 @@ EXPORT_SYMBOL(drm_gem_lru_init);
 void
 drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
 {
-	lockdep_assert_held_once(lru->lock);
+	lockdep_assert_held_once(&obj->dev->gem_lru_mutex);
 
 	if (obj->lru)
 		drm_gem_lru_remove_locked(obj);
@@ -1625,9 +1599,9 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
 void
 drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj)
 {
-	mutex_lock(lru->lock);
+	mutex_lock(&obj->dev->gem_lru_mutex);
 	drm_gem_lru_move_tail_locked(lru, obj);
-	mutex_unlock(lru->lock);
+	mutex_unlock(&obj->dev->gem_lru_mutex);
 }
 EXPORT_SYMBOL(drm_gem_lru_move_tail);
 
@@ -1648,7 +1622,8 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
-drm_gem_lru_scan(struct drm_gem_lru *lru,
+drm_gem_lru_scan(struct drm_device *dev,
+		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
 		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
@@ -1658,9 +1633,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 	struct drm_gem_object *obj;
 	unsigned freed = 0;
 
-	drm_gem_lru_init(&still_in_lru, lru->lock);
+	drm_gem_lru_init(&still_in_lru);
 
-	mutex_lock(lru->lock);
+	mutex_lock(&dev->gem_lru_mutex);
 
 	while (freed < nr_to_scan) {
 		obj = list_first_entry_or_null(&lru->list, typeof(*obj), lru_node);
@@ -1685,7 +1660,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 * rest of the loop body, to reduce contention with other
 		 * code paths that need the LRU lock
 		 */
-		mutex_unlock(lru->lock);
+		mutex_unlock(&dev->gem_lru_mutex);
 
 		if (ticket)
 			ww_acquire_init(ticket, &reservation_ww_class);
@@ -1729,7 +1704,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 tail:
 		drm_gem_object_put(obj);
-		mutex_lock(lru->lock);
+		mutex_lock(&dev->gem_lru_mutex);
 	}
 
 	/*
@@ -1741,7 +1716,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 	list_splice_tail(&still_in_lru.list, &lru->list);
 	lru->count += still_in_lru.count;
 
-	mutex_unlock(lru->lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	return freed;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 195f40e331e5..cc2bcd14b1c2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -128,11 +128,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	/*
 	 * Initialize the LRUs:
 	 */
-	mutex_init(&priv->lru.lock);
-	drm_gem_lru_init(&priv->lru.unbacked, &priv->lru.lock);
-	drm_gem_lru_init(&priv->lru.pinned,   &priv->lru.lock);
-	drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
-	drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
+	drm_gem_lru_init(&priv->lru.unbacked);
+	drm_gem_lru_init(&priv->lru.pinned);
+	drm_gem_lru_init(&priv->lru.willneed);
+	drm_gem_lru_init(&priv->lru.dontneed);
 
 	/* Initialize stall-on-fault */
 	spin_lock_init(&priv->fault_stall_lock);
@@ -140,7 +139,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
 	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&priv->lru.lock);
+	might_lock(&ddev->gem_lru_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
 	if (priv->kms_init) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 76ac61df0b35..c3fb3205f683 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -150,13 +150,6 @@ struct msm_drm_private {
 		 * DONTNEED state (ie. can be purged)
 		 */
 		struct drm_gem_lru dontneed;
-
-		/**
-		 * lock:
-		 *
-		 * Protects manipulation of all of the LRUs.
-		 */
-		struct mutex lock;
 	} lru;
 
 	struct notifier_block vmap_notifier;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2cb3ab04f125..070f5fc4bc17 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -177,11 +177,11 @@ static void update_lru_locked(struct drm_gem_object *obj)
 
 static void update_lru(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->dev;
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	update_lru_locked(obj);
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 }
 
 static struct page **get_pages(struct drm_gem_object *obj)
@@ -292,11 +292,11 @@ void msm_gem_pin_obj_locked(struct drm_gem_object *obj)
 
 static void pin_obj_locked(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->dev;
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	msm_gem_pin_obj_locked(obj);
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 }
 
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
@@ -487,16 +487,16 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(obj);
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
 	update_lru_locked(obj);
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 }
 
 /* Special unpin path for use in fence-signaling path, avoiding the need
@@ -507,10 +507,10 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	GEM_WARN_ON(!mutex_is_locked(&priv->lru.lock));
+	GEM_WARN_ON(!mutex_is_locked(&dev->gem_lru_mutex));
 
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
@@ -797,12 +797,12 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj)
  */
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_lock(obj);
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
@@ -814,7 +814,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	 */
 	update_lru_locked(obj);
 
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	msm_gem_unlock(obj);
 
@@ -839,10 +839,10 @@ void msm_gem_purge(struct drm_gem_object *obj)
 
 	put_pages(obj);
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	/* A one-way transition: */
 	msm_obj->madv = __MSM_MADV_PURGED;
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	drm_gem_free_mmap_offset(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 31fa51a44f86..c07af9602fee 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -186,7 +186,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		if (!stages[i].cond)
 			continue;
 		stages[i].freed =
-			drm_gem_lru_scan(stages[i].lru, nr,
+			drm_gem_lru_scan(priv->dev, stages[i].lru, nr,
 					 &stages[i].remaining,
 					 stages[i].shrink,
 					 &ticket);
@@ -255,7 +255,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	unsigned long remaining = 0;
 
 	for (idx = 0; lrus[idx] && unmapped < vmap_shrink_limit; idx++) {
-		unmapped += drm_gem_lru_scan(lrus[idx],
+		unmapped += drm_gem_lru_scan(priv->dev, lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
 					     vmap_shrink,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 26ea8a28be47..3c6bc90c3d48 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -352,7 +352,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit)
 
 static int submit_pin_objects(struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = submit->dev->dev_private;
+	struct drm_device *dev = submit->dev;
 	int i, ret = 0;
 
 	for (i = 0; i < submit->nr_bos; i++) {
@@ -381,11 +381,11 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	 * get_pages() which could trigger reclaim.. and if we held the LRU lock
 	 * could trigger deadlock with the shrinker).
 	 */
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	for (i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
 	}
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	submit->bos_pinned = true;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 271691ae32c3..3ed05ab0eeef 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -702,7 +702,7 @@ static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *_job)
 {
 	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
-	struct msm_drm_private *priv = job->vm->drm->dev_private;
+	struct drm_device *dev = job->vm->drm;
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
 	int ret = vm->unusable ? -EINVAL : 0;
@@ -745,13 +745,13 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	if (ret)
 		msm_gem_vm_unusable(job->vm);
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 
 	job_foreach_bo (obj, job) {
 		msm_gem_unpin_active(obj);
 	}
 
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
 	return NULL;
@@ -1304,7 +1304,7 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 			return PTR_ERR(pages);
 	}
 
-	struct msm_drm_private *priv = job->vm->drm->dev_private;
+	struct drm_device *dev = job->vm->drm;
 
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
@@ -1313,10 +1313,10 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 	 * get_pages() which could trigger reclaim.. and if we held the LRU lock
 	 * could trigger deadlock with the shrinker).
 	 */
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 	job_foreach_bo (obj, job)
 		msm_gem_pin_obj_locked(obj);
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	job->bos_pinned = true;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index a7dafa7ab4b1..0d14c31bd4e4 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -16,13 +16,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_gem_submit *submit = to_msm_submit(job);
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
-	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct drm_device *dev = gpu->dev;
 	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
 
-	mutex_lock(&priv->lru.lock);
+	mutex_lock(&dev->gem_lru_mutex);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
@@ -32,7 +32,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	submit->bos_pinned = false;
 
-	mutex_unlock(&priv->lru.lock);
+	mutex_unlock(&dev->gem_lru_mutex);
 
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index dcdce75b683b..cc5720312fa9 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -187,9 +187,6 @@ struct panthor_device {
 		/** @reclaim.shrinker: Shrinker instance */
 		struct shrinker *shrinker;
 
-		/** @reclaim.lock: Lock protecting all LRUs */
-		struct mutex lock;
-
 		/**
 		 * @reclaim.unreclaimable: unreclaimable BOs
 		 *
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8e31740126e7..450516d55faa 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1497,13 +1497,13 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
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
@@ -1517,7 +1517,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
-	freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
+	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_mapped_shared,
 				  sc->nr_to_scan - freed, &remaining,
 				  panthor_gem_try_evict, NULL);
 
@@ -1546,22 +1546,17 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 int panthor_gem_shrinker_init(struct panthor_device *ptdev)
 {
 	struct shrinker *shrinker;
-	int ret;
-
-	ret = drmm_mutex_init(&ptdev->base, &ptdev->reclaim.lock);
-	if (ret)
-		return ret;
 
 	INIT_LIST_HEAD(&ptdev->reclaim.vms);
-	drm_gem_lru_init(&ptdev->reclaim.unreclaimable, &ptdev->reclaim.lock);
-	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
-	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
-	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
+	drm_gem_lru_init(&ptdev->reclaim.unreclaimable);
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
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bc78fb77cc27..768a8dae83c5 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -375,6 +375,13 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/**
+	 * @gem_lru_mutex:
+	 *
+	 * Lock protecting movement of GEM objects between LRUs.
+	 */
+	struct mutex gem_lru_mutex;
 };
 
 void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d527df98d142..dd1a9cd559be 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -245,17 +245,11 @@ struct drm_gem_object_funcs {
  * for lockless &shrinker.count_objects, and provides
  * &drm_gem_lru_scan for driver's &shrinker.scan_objects
  * implementation.
+ *
+ * Any access to this kind of object must be done with
+ * drm_device::gem_lru_mutex held.
  */
 struct drm_gem_lru {
-	/**
-	 * @lock:
-	 *
-	 * Lock protecting movement of GEM objects between LRUs.  All
-	 * LRUs that the object can move between should be protected
-	 * by the same lock.
-	 */
-	struct mutex *lock;
-
 	/**
 	 * @count:
 	 *
@@ -453,6 +447,9 @@ struct drm_gem_object {
 	 * @lru:
 	 *
 	 * The current LRU list that the GEM object is on.
+	 *
+	 * Access to this field must be done with drm_device::gem_lru_mutex
+	 * held.
 	 */
 	struct drm_gem_lru *lru;
 };
@@ -610,11 +607,12 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
+void drm_gem_lru_init(struct drm_gem_lru *lru);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 unsigned long
-drm_gem_lru_scan(struct drm_gem_lru *lru,
+drm_gem_lru_scan(struct drm_device *dev,
+		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
 		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),

-- 
2.54.0


