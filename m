Return-Path: <linux-arm-msm+bounces-106644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL1lGf+9/WkAigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895E4F52CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF4B83025D9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE33D34BF;
	Fri,  8 May 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cy0cRK7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF83D3CFB;
	Fri,  8 May 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236878; cv=none; b=KWrNacdSfvu+Kvz4QfFYmy8zq/w3QApRB5aJA4HefaH4apecqhkdz/x9cwqqjGAxo6w4tR6Cdnv5NEO92D1GxvNlO/+xZZh2LEApHDAUnPpwAFo367krPZ4egljgcMsypszQ4TA8R92Paw5SczdVKCuRmNusnDCyiEH42NRXSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236878; c=relaxed/simple;
	bh=hQnI7G5tnzx0UqTxLwoGWdFSLtG2RIqZJo8XhGgWE3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohqkrAgv+S4Hg0N2ndEjNeW/N2aDdOEXqdCbutE9OLQRzJqKb5+KdwpDLYQuw4jmxpkBtvdFmsbs999sHyYjfYfI3+CmAAyJV6eTgIbglj9cd4iys8W4GOq6rqZNkZ55YzZDVjqJ12TPGgkZlfKCzNY3kbBMhXZiSPmk6c+uXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cy0cRK7l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778236875;
	bh=hQnI7G5tnzx0UqTxLwoGWdFSLtG2RIqZJo8XhGgWE3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cy0cRK7lmQO97SFZj3t1I0RcJnZJErPviKcnClJP3sXabvXzMc30zYYjQYQzajMsx
	 ldTct1+hMGyrgtDz0Cdrhg2fuF/yKquMtlVIOSWv73Q6fFOaQSEmMUl8ovgkO8Cb3/
	 wzsXIZDHacTtBGy/+CIXRqlywMT7yFZN2lXp5f9m90Z4+wlDvJaCg92ERoC8Ny3Y71
	 1+n2HM7/Jcdmez8Ut5W3GhtmnKCuS8RmS1YaLFBDQSeSpbEcQk2HQVf+vEv0mu7dGf
	 deddqx7NnLIasdeI399xxXpVwQfpgWQZQhmlSKGvDekm18n73K4yOzLwqd3mY68JQy
	 rkK2ZofcyxjxQ==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C16117E1502;
	Fri,  8 May 2026 12:41:14 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 08 May 2026 12:40:49 +0200
Subject: [PATCH v2 3/4] drm/gem: Stop exposing the racy/unsafe
 drm_gem_lru_remove() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-panthor-shrinker-fixes-v2-3-39cdb7d577c9@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236871; l=4996;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=hQnI7G5tnzx0UqTxLwoGWdFSLtG2RIqZJo8XhGgWE3A=;
 b=5v335GdSDcWVQpzkJt3Y7m7Fp8dFuO9rkqc/hK8ocl671AImHIk3W5mqYh+6MK1R3NelbtDO3
 6zXi5Gt+JYbD9sQ6JZT3nZaW9mMXNwRL9Wzfd4SIjz20Nk5YvWs6pNr
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 0895E4F52CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106644-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The only place where it's safe to call drm_gem_lru_remove() is when
we know the drm_gem_object::lru field can't be concurrently updated,
which we know is the case when the drm_gem_object is destroyed.

Rather than trying to make that safe, let's kill the function and inline
its content in drm_gem_object_release().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 90 ++++++++++++++++++++---------------------------
 include/drm/drm_gem.h     |  1 -
 2 files changed, 39 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 0e087c770883..c85a39b8b163 100644
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
@@ -1118,13 +1127,42 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
 void
 drm_gem_object_release(struct drm_gem_object *obj)
 {
+	struct drm_gem_lru *lru;
+
 	if (obj->filp)
 		fput(obj->filp);
 
 	drm_gem_private_object_fini(obj);
 
 	drm_gem_free_mmap_offset(obj);
-	drm_gem_lru_remove(obj);
+
+	/*
+	 * We do the lru != NULL check without the lru->lock held, which
+	 * means we might end up with a stale lru value by the time the
+	 * lock is acquired.
+	 *
+	 * This is deemed safe because:
+	 * 1. the LRU is assumed to outlive any GEM object it was attached
+	 *    (LRUs are usually bound to a drm_device). So even if obj->lru
+	 *    has become NULL, it still point to a valid object that can
+	 *    safely be dereferenced to get the lock.
+	 *
+	 * 2. all LRUs a GEM object might be attached to must share the same
+	 *    lock (lock that's usually part of the driver-specific device
+	 *    object), so taking the lock on the 'old' LRU is equivalent
+	 *    to taking it on the new one (if any)
+	 */
+	lru = obj->lru;
+	if (lru) {
+		guard(mutex)(lru->lock);
+
+		/* Check a second time with the lock held to make sure we're
+		 * not racing with the drm_gem_lru_remove_locked() call in
+		 * drm_gem_lru_scan().
+		 */
+		if (obj->lru)
+			drm_gem_lru_remove_locked(obj);
+	}
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
@@ -1552,56 +1590,6 @@ drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
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
-	if (!lru)
-		return;
-
-	mutex_lock(lru->lock);
-	/* Check a second time with the lock held to make sure we're not racing
-	 * with another drm_gem_lru_remove[_locked]() call.
-	 */
-	if (obj->lru)
-		drm_gem_lru_remove_locked(obj);
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


