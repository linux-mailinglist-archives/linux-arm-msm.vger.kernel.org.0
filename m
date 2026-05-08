Return-Path: <linux-arm-msm+bounces-106643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PpcEB6+/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2A34F5307
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15071301A51E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621E93D3D1C;
	Fri,  8 May 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="moiQufS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03473D349C;
	Fri,  8 May 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236877; cv=none; b=EDG4wZ0CgDIi5BDqMbdB+Zdvir1ldJOsG1wglYGAL4rzSN+OBIQMM64gOW96s1yqXbwDiuQpJ5w4Ev01uJATmh9STwrrRJkccvJBEQVVfVz1Ad8HCwEPH+Q5SbSir3G0nHyIvxPWHErUreYP8gf9bLiQhkAWJw4NCllk7DuCGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236877; c=relaxed/simple;
	bh=0SZ027itVmKWLKnDx2ABO2cRND/xTdZFsyJoY99ik1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3Ni3xwZ1rIcmf7vkKYs50CzoVm5i0CfLeAcnDfnJLnDy+UcKs9tfGhbA9mwQk/PAfbh8b9Dy/gn+eIxBUsVZDLMQAfi1CRjuqX/5MoZ1Ua0ZN0QCz+YV6a0gURki2u5OSPDA1fdfndrsHVRKtoxkth4Ts2yXt+o9RoqgZ0woec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=moiQufS+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778236874;
	bh=0SZ027itVmKWLKnDx2ABO2cRND/xTdZFsyJoY99ik1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=moiQufS+pP62dMZQMxsjJd+oVLV+35b9sbpN7yApjREtAf99HbU/baope+GzT0tL4
	 gE+dzy67JkURm3GGqH/lDE4LkOU9jflsmpOIceshq6HyU4Eq1A+jIIe5pK/IvgAAlO
	 f+/JqeGFs6RyDuXIFfWbwP6RNZr4mcvKlGePeOZbioVS05rBwmU6XPk3vsCsw/hVAT
	 eHLix+rRF3Bv1ZPd+wpzh0wF8RI8DYavpoEjA1fNSM0Vs3oVfnrAYszo6nWSpYwAGt
	 vEC8MvJN7gnzS7QYivGb2b7pz/61STNo+0Z5zcfVHpc3WRx8XkKX6oGYzyUSXVt5x/
	 oEhY1zEi3RsEA==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69D6617E14DD;
	Fri,  8 May 2026 12:41:13 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 08 May 2026 12:40:48 +0200
Subject: [PATCH v2 2/4] drm/gem: Fix a race between drm_gem_lru_scan() and
 drm_gem_object_release()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-panthor-shrinker-fixes-v2-2-39cdb7d577c9@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236871; l=3930;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=0SZ027itVmKWLKnDx2ABO2cRND/xTdZFsyJoY99ik1Y=;
 b=WJffySdN1YIdiEbDmRDkc7kl5DHu70qjBa5OH8jQMMSnX3dqQ46JdxMyQwb1tZUbblBv61mm6
 ue0lG6MYqNKCN/HyHsB/lsjZ2HHKuLxFDn2Rws7yxASZFsnVlTVS6/a
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 0F2A34F5307
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
	TAGGED_FROM(0.00)[bounces-106643-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The following race can currently happen:

| Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_object_release` |
| -                                            | -                                    |
| move obj1 with refcount==0 to `still_in_lru` |                                      |
| move obj2 with refcount!=0 to `still_in_lru` |                                      |
| mutex_unlock                                 |                                      |
| shrink obj2                                  |                                      |
|                                              | lru = obj1->lru; // `still_in_lru`   |
| mutex_lock                                   |                                      |
| move obj1 back to the original lru           |                                      |
| mutex_unlock                                 |                                      |
| return                                       |                                      |
|                                              | dereference `still_in_lru`           |

Move the drm_gem_lru_move_tail_locked() after the
kref_get_unless_zero() check so that we don't end up with a
vanishing LRU when we hit drm_gem_object_release(). We also need to
remove the skipped object from its LRU, otherwise we'll keep hitting
it on subsequent loop iterations until it's actually removed from the
list in the drm_gem_release().

Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
Reported-by: Chia-I Wu <olvaffe@gmail.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index fca42949eb2b..0e087c770883 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1573,11 +1573,31 @@ drm_gem_lru_remove(struct drm_gem_object *obj)
 {
 	struct drm_gem_lru *lru = obj->lru;
 
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
 	if (!lru)
 		return;
 
 	mutex_lock(lru->lock);
-	drm_gem_lru_remove_locked(obj);
+	/* Check a second time with the lock held to make sure we're not racing
+	 * with another drm_gem_lru_remove[_locked]() call.
+	 */
+	if (obj->lru)
+		drm_gem_lru_remove_locked(obj);
 	mutex_unlock(lru->lock);
 }
 EXPORT_SYMBOL(drm_gem_lru_remove);
@@ -1660,15 +1680,17 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		if (!obj)
 			break;
 
-		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
-
 		/*
 		 * If it's in the process of being freed, gem_object->free()
-		 * may be blocked on lock waiting to remove it.  So just
-		 * skip it.
+		 * may be blocked on lock waiting to remove it.  So just remove
+		 * it from its current LRU and skip it.
 		 */
-		if (!kref_get_unless_zero(&obj->refcount))
+		if (!kref_get_unless_zero(&obj->refcount)) {
+			drm_gem_lru_remove_locked(obj);
 			continue;
+		}
+
+		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
 
 		/*
 		 * Now that we own a reference, we can drop the lock for the

-- 
2.54.0


