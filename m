Return-Path: <linux-arm-msm+bounces-106109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MAlMrcx+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:19:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F084DA17F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEA623083961
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006F44D020;
	Wed,  6 May 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LjHrHRS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476D44B674;
	Wed,  6 May 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069803; cv=none; b=HP6cz7JYZ+1CZBEC49djTQbOlTQkIbPRcZXhaFds1Bk17F65ikOCRpnY6gWiQ7m3hHfiWJlzU4/pD0JjdDmw2ns/z0KHCILwTwPtuUDmgXl53I+0fWYL/MpNGZePKot9XfYWvYh2dR7FvH8+4g0tURfSdefuRgBGTJC6tW1a5Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069803; c=relaxed/simple;
	bh=WOtqjv3FDzYb3+bj/irlhWg2OHoRy/G/0OVw3EpOZOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSoQUE6vni1p4KsdxSs/7wOhcWYmpDx9lX8vwVURVQHXuTxdczfdrTwkQsOPzsUJT9uCi1XBlyOcVgqqd24mB0erImXMcvFDC0LYPjeeZbHkjB6t4dTQ3xNsLd9L87Ezqf6qYPCgJWcGwJ3T0bHga6IpAZSzSdHXmhy9XztwzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LjHrHRS0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778069800;
	bh=WOtqjv3FDzYb3+bj/irlhWg2OHoRy/G/0OVw3EpOZOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LjHrHRS0urOjbm8y0X0K21zx9YomzGIGQgtQysgaUuExqQanzt93OBDCZQ5RGmo0D
	 sQBxW+649Kwan1TI2gKcGAGd3OPR8oTpexAtRwIbUybuZ5jE4epfbdgayiApSclD/e
	 9sJIi694TdfsTiZN9EyGVuTODpSC0jGCkec5S3qzcbhdO/lrnMNTZXfujS/z5bakdv
	 PEJ211H/bJZaAdHEI+8RGtTsSYEAVIlR0XDexrmnerYNyPQTv0A+3BeAau9xSMMPMN
	 uVt30Zt1yWTrI5Tnaoubv6EDBAln6ZA0ISSU7+i3fAp9o2JjiNA9ku5rBtsIq4dG3i
	 YAzx3KLt4/Ekg==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 929CB17E1562;
	Wed,  6 May 2026 14:16:39 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 06 May 2026 14:16:28 +0200
Subject: [PATCH 3/3] drm/gem: Stop exposing the racy/unsafe
 drm_gem_lru_remove() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-shrinker-fixes-v1-3-e7721526de96@collabora.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778069796; l=3269;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=WOtqjv3FDzYb3+bj/irlhWg2OHoRy/G/0OVw3EpOZOY=;
 b=UeuoKbZtO0sViuF9+YSdaQdvfa4dctHnpv4/OJEcfdfHbK3bU5SITMtB3cxZlrM8SbP+/junN
 DztOTEFUK0jAPlEEFeD+7lb0troRRmqAofaEAwHgiOIYyo1HNJCXHOD
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 67F084DA17F
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-106109-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The only place where it's safe to call drm_gem_lru_remove() is when
we know the drm_gem_object::lru field can't be concurrently updated,
which we know is the case when the drm_gem_object is destroyed.

Rather than trying to make that safe, let's kill the function and inline
its content in drm_gem_object_release().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 49 +++++++++++++++++------------------------------
 include/drm/drm_gem.h     |  1 -
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 97cf63de0112..b6df4f62f7b5 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1108,6 +1108,15 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
 	idr_destroy(&file_private->object_idr);
 }
 
+static void
+drm_gem_lru_remove_locked(struct drm_gem_object *obj)
+{
+	obj->lru->count -= obj->size >> PAGE_SHIFT;
+	WARN_ON(obj->lru->count < 0);
+	list_del(&obj->lru_node);
+	obj->lru = NULL;
+}
+
 /**
  * drm_gem_object_release - release GEM buffer object resources
  * @obj: GEM buffer object
@@ -1124,7 +1133,15 @@ drm_gem_object_release(struct drm_gem_object *obj)
 	drm_gem_private_object_fini(obj);
 
 	drm_gem_free_mmap_offset(obj);
-	drm_gem_lru_remove(obj);
+
+	/* If the object refcount drops to zero, it means no one can change
+	 * the LRU it's inserted into, so it's safe to dereference
+	 * drm_gem_object::lru without the drm_gem_lru::lock held.
+	 */
+	if (obj->lru) {
+		guard(mutex)(obj->lru->lock);
+		drm_gem_lru_remove_locked(obj);
+	}
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
@@ -1552,36 +1569,6 @@ drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
 }
 EXPORT_SYMBOL(drm_gem_lru_init);
 
-static void
-drm_gem_lru_remove_locked(struct drm_gem_object *obj)
-{
-	obj->lru->count -= obj->size >> PAGE_SHIFT;
-	WARN_ON(obj->lru->count < 0);
-	list_del(&obj->lru_node);
-	obj->lru = NULL;
-}
-
-/**
- * drm_gem_lru_remove - remove object from whatever LRU it is in
- *
- * If the object is currently in any LRU, remove it.
- *
- * @obj: The GEM object to remove from current LRU
- */
-void
-drm_gem_lru_remove(struct drm_gem_object *obj)
-{
-	struct drm_gem_lru *lru = obj->lru;
-
-	if (!lru)
-		return;
-
-	mutex_lock(lru->lock);
-	drm_gem_lru_remove_locked(obj);
-	mutex_unlock(lru->lock);
-}
-EXPORT_SYMBOL(drm_gem_lru_remove);
-
 /**
  * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
  *
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 86f5846154f7..d527df98d142 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -611,7 +611,6 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
 void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
-void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 unsigned long

-- 
2.54.0


