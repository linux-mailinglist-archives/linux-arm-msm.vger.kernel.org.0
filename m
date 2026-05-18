Return-Path: <linux-arm-msm+bounces-108179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NeNCrb7CmqB+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:44:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F65056BD83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D2C23051E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A55B34678E;
	Mon, 18 May 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YIdGWLYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693A10F2;
	Mon, 18 May 2026 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104527; cv=none; b=ZyoQtgC+FFMnBnfp0ZK5TAa52Br5bGrR6/ACeB/2q+FB6PPQzL8WIbslFJiw3DVkQr7wZljDIKeM+nl/amrpNvkdH7l6PotR0h5znoJPea0yBv/ZsnBlR7E/YPbnbTcGWvKkcgcsC4kSNhugBaWEp0xdXxMf0uQGcpoSxPGr0Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104527; c=relaxed/simple;
	bh=cr2oqzXS3gHluswCA1BHs35iMm5stHWXnuCk3LvTPBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QQPn3xhx+3Sb81iLNvcfY2Ws+o8u+/mrwiwy5IazWbuLxRJhhnK36Ol26+zj1qv4V3heztLq2H4t7nILl5UZu3d/cf+fXEUgyopEb/cPPTJR9rokqjob8MfsLMdfYAmn4v2KrmkjBvEfiqMGiC5PaVu/6toOn7/eY4Ye4kvnfhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YIdGWLYh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779104523;
	bh=cr2oqzXS3gHluswCA1BHs35iMm5stHWXnuCk3LvTPBE=;
	h=From:Date:Subject:To:Cc:From;
	b=YIdGWLYhq5fXT7dSBSMG0E84Eypd0jSOC4FQ+fThxwyOHev2P58aCGiKeduvnjk3+
	 sswQV0zRKGqhbE4/qJoV6v/I81b1VekNrQbFPM9fPGadLcFjD0HMnoVg9I4uX5Mtr2
	 31E7GklCR9eJoM/Wacqexz0OIEynybzB34Cqj0k6xfUgedIIVfPYegY3oIXTDPyZsN
	 IVt5/3tiSyFZTX1z81hXCm6CcMm+Mc8VRV/m+XLhrBH+wIoGXdlY4iCryXmlzItHCo
	 aQEIpKuBig3UOuxPPpJROYhlQU+B4oOS6SQFru3/z89pTt3SmVP92INKqxq9sPd4u7
	 +kdEIbmCryMmA==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C846B17E01C2;
	Mon, 18 May 2026 13:42:02 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 18 May 2026 13:41:45 +0200
Subject: [PATCH v4] drm/gem: Make the GEM LRU lock part of drm_device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQwW7DIAwG4FeJOM8TOAGSnvYeUw8BzILWhhbSa
 FPVd5/bXqpp1Y4/1v8h+ywqlURVbJqzKLSmmvLMoXtphJ/G+YMgBc4CJRqppYHDOC9TLlCnkuZ
 PKhDTF1XQvVex0z76TgkuHwrdBtx933KeUl1y+b79s6rr67/kqkACWYtKowk0mDefd7vR5TK++
 rwXV3bFR6p/SiFT7eCDs0Fb64e/qPaBUviUakFB66I0BvXQWfWbuty3L3Q88TWX+wmEGysBz/d
 p2TQk0fFOGAP2XLj8AP5+MOSGAQAA
X-Change-ID: 20260506-panthor-shrinker-fixes-58c1f45cfc41
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779104522; l=20662;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=cr2oqzXS3gHluswCA1BHs35iMm5stHWXnuCk3LvTPBE=;
 b=MDmHaAzeYkr7P/ulr9wTUZFgRK8qtSyxkVezoGIx/aGDcz2D2tMI5n9IuXSbByQZrM3MeoBfa
 PudMipkd6fcDY/PAcnsk7xwoimaqA4GX8IzrNHbXAGX5A9S/R0Sv6om
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 8F65056BD83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108179-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

Recently, a few races have been discovered in the GEM LRU logic, all
of them caused by the fact the LRU lock is accessed through
gem->lru->lock, and that very same lock also protects changes to
gem->lru, leading to situations where gem->lru needs to first be
accessed without the lock held, to then get the lru to access the lock
through and finally take the lock and do the expected operation.

Currently, the only driver making use of this API (MSM) declares a
device-wide lock, and the user we're about to add (panthor) will
do the same. There's no evidence that we will ever have a driver
that wants different pools of LRUs protected by different locks under
the same drm_device. So we're better off moving this lock to drm_device
and always locking it through obj->dev->gem_lru_mutex, or directly
through dev->gem_lru_mutex.

If anyone ever needs more fine-grained locking, this can be revisited
to pass some drm_gem_lru_pool object representing the pool of LRUs
under a specific lock, but for now, the per-device lock seems to be
enough.

Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
Reported-by: Chia-I Wu <olvaffe@gmail.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
As reported by Chia-I [1], a race exists between drm_gem_lru_remove()
and drm_gem_lru_scan(), causing a UAF on a stack-allocated object.

This new version only keeps the last patch of the series that
addresses the problem more generically by moving the LRU lock to the
drm_device object.

[1]https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
---
Changes in v4:
- Fix kernel docs
- Drop unused var in msm_gem_purge()
- Link to v3: https://lore.kernel.org/r/20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com

Changes in v3:
- Only keep patch 4 and flag it for backport
- Rebase on drm-misc-fixes
- Link to v2: https://lore.kernel.org/r/20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com

Changes in v2:
- Collect R-b
- Drop a useless obj->lru != NULL check in drm_gem_lru_scan()
- Fix another race introduced in patch 2
- Document why the lru != NULL check done without the lru lock held
  in drm_gem_lru_remove() is safe
- Add a patch to sanitize the GEM LRU locking: lock is now part of
  drm_device, meaning we don't have this chicken/egg problem where
  the lock that needs to acquired is under gem->lru->lock, and
  gem->lru is also supposed to be accessed with the lru->lock held
- Fix typos in commit messages and comments
- Link to v1: https://lore.kernel.org/r/20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com
---
 drivers/gpu/drm/drm_drv.c              |  2 ++
 drivers/gpu/drm/drm_gem.c              | 36 +++++++++++++++-------------------
 drivers/gpu/drm/msm/msm_drv.c          | 11 +++++------
 drivers/gpu/drm/msm/msm_drv.h          |  7 -------
 drivers/gpu/drm/msm/msm_gem.c          | 33 +++++++++++++++----------------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  4 ++--
 drivers/gpu/drm/msm/msm_gem_submit.c   |  6 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c      | 12 ++++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c   |  6 +++---
 include/drm/drm_device.h               |  7 +++++++
 include/drm/drm_gem.h                  | 20 +++++++++----------
 11 files changed, 69 insertions(+), 75 deletions(-)

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
index d6424267260b..b95b015d2983 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1541,12 +1541,10 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
  * drm_gem_lru_init - initialize a LRU
  *
  * @lru: The LRU to initialize
- * @lock: The lock protecting the LRU
  */
 void
-drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
+drm_gem_lru_init(struct drm_gem_lru *lru)
 {
-	lru->lock = lock;
 	lru->count = 0;
 	INIT_LIST_HEAD(&lru->list);
 }
@@ -1571,14 +1569,10 @@ drm_gem_lru_remove_locked(struct drm_gem_object *obj)
 void
 drm_gem_lru_remove(struct drm_gem_object *obj)
 {
-	struct drm_gem_lru *lru = obj->lru;
-
-	if (!lru)
-		return;
-
-	mutex_lock(lru->lock);
-	drm_gem_lru_remove_locked(obj);
-	mutex_unlock(lru->lock);
+	mutex_lock(&obj->dev->gem_lru_mutex);
+	if (obj->lru)
+		drm_gem_lru_remove_locked(obj);
+	mutex_unlock(&obj->dev->gem_lru_mutex);
 }
 EXPORT_SYMBOL(drm_gem_lru_remove);
 
@@ -1593,7 +1587,7 @@ EXPORT_SYMBOL(drm_gem_lru_remove);
 void
 drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
 {
-	lockdep_assert_held_once(lru->lock);
+	lockdep_assert_held_once(&obj->dev->gem_lru_mutex);
 
 	if (obj->lru)
 		drm_gem_lru_remove_locked(obj);
@@ -1617,9 +1611,9 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
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
 
@@ -1633,6 +1627,7 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * of the shrink callback to check for this (ie. dma_resv_test_signaled())
  * or if necessary block until the buffer becomes idle.
  *
+ * @dev: DRM device the LRU belongs to
  * @lru: The LRU to scan
  * @nr_to_scan: The number of pages to try to reclaim
  * @remaining: The number of pages left to reclaim, should be initialized by caller
@@ -1640,7 +1635,8 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
-drm_gem_lru_scan(struct drm_gem_lru *lru,
+drm_gem_lru_scan(struct drm_device *dev,
+		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
 		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
@@ -1650,9 +1646,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 	struct drm_gem_object *obj;
 	unsigned freed = 0;
 
-	drm_gem_lru_init(&still_in_lru, lru->lock);
+	drm_gem_lru_init(&still_in_lru);
 
-	mutex_lock(lru->lock);
+	mutex_lock(&dev->gem_lru_mutex);
 
 	while (freed < nr_to_scan) {
 		obj = list_first_entry_or_null(&lru->list, typeof(*obj), lru_node);
@@ -1675,7 +1671,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 * rest of the loop body, to reduce contention with other
 		 * code paths that need the LRU lock
 		 */
-		mutex_unlock(lru->lock);
+		mutex_unlock(&dev->gem_lru_mutex);
 
 		if (ticket)
 			ww_acquire_init(ticket, &reservation_ww_class);
@@ -1709,7 +1705,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 tail:
 		drm_gem_object_put(obj);
-		mutex_lock(lru->lock);
+		mutex_lock(&dev->gem_lru_mutex);
 	}
 
 	/*
@@ -1721,7 +1717,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
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
index 6d847d593f1a..617b3c4b42c0 100644
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
index 2cb3ab04f125..efd3d3c9a449 100644
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
 
@@ -824,7 +824,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 void msm_gem_purge(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
-	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(obj);
@@ -839,10 +838,10 @@ void msm_gem_purge(struct drm_gem_object *obj)
 
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
index 1a952b171ed7..c4cfe036066b 100644
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
@@ -1305,7 +1305,7 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 			return PTR_ERR(pages);
 	}
 
-	struct msm_drm_private *priv = job->vm->drm->dev_private;
+	struct drm_device *dev = job->vm->drm;
 
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
@@ -1314,10 +1314,10 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
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
index 30ddb5351e98..2d6b930b766e 100644
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
index 86f5846154f7..8a704f6a65c1 100644
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
@@ -610,12 +607,13 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
+void drm_gem_lru_init(struct drm_gem_lru *lru);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 unsigned long
-drm_gem_lru_scan(struct drm_gem_lru *lru,
+drm_gem_lru_scan(struct drm_device *dev,
+		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
 		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),

---
base-commit: e02b5262fd288cc235f14e12233ea54e78c04611
change-id: 20260506-panthor-shrinker-fixes-58c1f45cfc41

Best regards,
-- 
Boris Brezillon <boris.brezillon@collabora.com>


