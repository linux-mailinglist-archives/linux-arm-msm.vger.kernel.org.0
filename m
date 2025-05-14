Return-Path: <linux-arm-msm+bounces-57887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05BAB7236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A32A864500
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA86E27E1C0;
	Wed, 14 May 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmffRXhA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435EB1F30BB;
	Wed, 14 May 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242203; cv=none; b=ISphiweoaGmSX5HyNuY08VVY2R9hsGe6XukILswtZmLQRiKYrpHIjrWHCmmHKmdb43swwhJJM4C5mVtQtxSAEkuyz/TMfebn4kK8F/quqfVhaStmPqizqKfzbh877JQ8cOX04DWCh5QKNW2irhJMjPCXM24Q9wd/HRwiRf4iVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242203; c=relaxed/simple;
	bh=HQTYjppayVSe6RMF1/nDWeCVEk0At2uUwSWtYOLEAf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4QMM2Kb3Gh0hYrpX5/ssY3jwnWAaGZdSP3bpzvHwqeNafcwSacJg8fX9g7y/8zRlzwaVWwS6zecOWx9KAPtRxpjyHyd3fHmXD74RX/HnFdmF/LaMGiCGOHhzQYqu8u/sBTKuRVOAVCNvr8KJX5wnQ4SPTJRSMKcmz2KJB8WI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmffRXhA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7411f65811cso128425b3a.1;
        Wed, 14 May 2025 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747242201; x=1747847001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzY7l39Nyf4cERK4w5Xc1S0qyexBdUxlhblg/1kA2ys=;
        b=NmffRXhAEkGmTe0/BJ4h7/0mWl5rDMwxjgyncfSYcly8T3GgwBhihI909DcpP4HWRQ
         TqroLSB28H7hL8WlTU+wikjPfOOod+nmp73wsZmAk/GKPs9vRren0mpCT24b9eiqoDOa
         nS8AQjgYrtrKIATadTV8R0CTvB7T4wWLB19B4n+5Rt3VMFAOmI+ZtkslUmfAWs27M/XF
         Wc19+9sRWgN/L5dTonmtLYP57+vV5zHN0PKF6DZGxEm+IYhtFwVa8I7Vi7bcWQ4QdpxT
         aeC3sSEGrogwsUzqIvPherfxpU2VCgjbTTsbILBNlnSTbS19uT5C6LFTc8W/VQt0qYM4
         R+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242201; x=1747847001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzY7l39Nyf4cERK4w5Xc1S0qyexBdUxlhblg/1kA2ys=;
        b=LiZUsrzb13jSh7imTbrogZP7vx4vb/Og1mfLRz0Nnfvrob4KvaBZEy/WGq+8REMPKo
         v8FtdHejPwoeCHv0LzWYYHlc6314jN6UMrkwrICviUh9LXipRsZDehfsegM+qOqymLn4
         Kj2hTU3R4i62S/OT9xJ0gMl6CuFpl8XrxMDeSDGH/fxNK06OUT6Yw1jzi4JKB0XGnk02
         vyzzktqcURPV9gIfMerRxyxu9E32dY8ljsgiZxLxP81pvXZLQg1WguWNavEIMKAAD5b1
         Ts8+UufW1UxK3FwtpJHpOFzAYm3gciw/dI4fEv14RCs0LeKuzBDDHYUhsANPIc5XlBfa
         vncw==
X-Forwarded-Encrypted: i=1; AJvYcCXV36UQBHvwJU/NdIGWGeEANkiEvBEmzaC7py5LrCHu3lDy8ocE50huFWbNtySvpWUXp88m2Hny6KJ7BBeX@vger.kernel.org, AJvYcCXdC+OIeubR8PWZ4SKu3p7uSvoDxx0UBBI99jKiwowBRieuCMJIdTtz6JoEO9Oe3gRTBj9MauwbCmUFTQ5m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzip0lWIi6B/PTs/g8zYYMNqNPrd4ST+i2ifC5RKB7AvQaeUOXR
	A8lSEtk3AuCU2Ol9TsZ5NVwKLlwdED8Nb99aW5mUvERatL0p9Bib
X-Gm-Gg: ASbGncuO1HNqI/YZbLpYAxSAmXc53Uc166yaRcN6bQCgw76GfOOi5FQNkL4u8eWnTQw
	t5xL8fO8pe5K+lbCe9pUAB+qhMTtB3Gc+Tt1vFEDV3Efy+MSJNqKnLKUeoIlrZzVwe1v8NlwvAZ
	7J6LxAZ7+aI0YWaYzRXlTfDqQ3jyqbtwYLooafJT4i16lEhsgiJwKaRdHI5iR2xKgeQRojdcEC7
	5EAl2RsRykeY4Tmu2B4s5IM72jP2PvOX8BKwPEUyg9ero0YISQIF2pfsWQHz64QPyGJj3OV8pQM
	Tl2G+k0JuQiby17yaZ8Rbs6Y1/voT3e96kjgEa7yQ/CrsL1iRDlEZ/JN+MQdR+Tl4YWkT08JqIy
	3RwZ7NBpLKFKrRLNiey+v20sGCg==
X-Google-Smtp-Source: AGHT+IGqdByNX1/PVGLieoBHyvCaoUrIY4UetAMzQyT8J4UNF9vYT1h+KT+vU7nL97fTzkxNSXDxPg==
X-Received: by 2002:a05:6a00:ac8c:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74289263315mr5321735b3a.5.1747242201464;
        Wed, 14 May 2025 10:03:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377279c3sm9637453b3a.43.2025.05.14.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:03:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 03/40] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Wed, 14 May 2025 09:59:02 -0700
Message-ID: <20250514170118.40555-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df..9e3db9a864f8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1460,12 +1460,14 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @nr_to_scan: The number of pages to try to reclaim
  * @remaining: The number of pages left to reclaim, should be initialized by caller
  * @shrink: Callback to try to shrink/reclaim the object.
+ * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
 drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj))
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket)
 {
 	struct drm_gem_lru still_in_lru;
 	struct drm_gem_object *obj;
@@ -1498,17 +1500,20 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 */
 		mutex_unlock(lru->lock);
 
+		if (ticket)
+			ww_acquire_init(ticket, &reservation_ww_class);
+
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!dma_resv_trylock(obj->resv)) {
+		if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
 			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
 		}
 
-		if (shrink(obj)) {
+		if (shrink(obj, ticket)) {
 			freed += obj->size >> PAGE_SHIFT;
 
 			/*
@@ -1522,6 +1527,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 		dma_resv_unlock(obj->resv);
 
+		if (ticket)
+			ww_acquire_fini(ticket);
+
 tail:
 		drm_gem_object_put(obj);
 		mutex_lock(lru->lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 07ca4ddfe4e3..de185fc34084 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -44,7 +44,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 }
 
 static bool
-purge(struct drm_gem_object *obj)
+purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -58,7 +58,7 @@ purge(struct drm_gem_object *obj)
 }
 
 static bool
-evict(struct drm_gem_object *obj)
+evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;
@@ -79,21 +79,21 @@ wait_for_idle(struct drm_gem_object *obj)
 }
 
 static bool
-active_purge(struct drm_gem_object *obj)
+active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return purge(obj);
+	return purge(obj, ticket);
 }
 
 static bool
-active_evict(struct drm_gem_object *obj)
+active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return evict(obj);
+	return evict(obj, ticket);
 }
 
 static unsigned long
@@ -102,7 +102,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
-		bool (*shrink)(struct drm_gem_object *obj);
+		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
 		bool cond;
 		unsigned long freed;
 		unsigned long remaining;
@@ -122,8 +122,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 			continue;
 		stages[i].freed =
 			drm_gem_lru_scan(stages[i].lru, nr,
-					&stages[i].remaining,
-					 stages[i].shrink);
+					 &stages[i].remaining,
+					 stages[i].shrink,
+					 NULL);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
@@ -164,7 +165,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct drm_gem_object *obj)
+vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
@@ -192,7 +193,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		unmapped += drm_gem_lru_scan(lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
-					     vmap_shrink);
+					     vmap_shrink,
+					     NULL);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index fdae947682cd..0e2c476df731 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -555,10 +555,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
-unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
-			       unsigned int nr_to_scan,
-			       unsigned long *remaining,
-			       bool (*shrink)(struct drm_gem_object *obj));
+unsigned long
+drm_gem_lru_scan(struct drm_gem_lru *lru,
+		 unsigned int nr_to_scan,
+		 unsigned long *remaining,
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket);
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
-- 
2.49.0


