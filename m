Return-Path: <linux-arm-msm+bounces-58514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DDDABC634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7921E1B65079
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037F828936F;
	Mon, 19 May 2025 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoOx/r3R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8C928934B;
	Mon, 19 May 2025 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677262; cv=none; b=sRHgxKYrdJQjkuz+anYDH1Pha1nC+RVsCx9N+/PeUFpqDflB1dwTvhAmKsmMZ6zSJBJhGpqGxiAj3WRx3rBTkfex8udxuAuUVTadMMb3f6o1id7F4D8xY4KtWvw5ewVSKZCa78vGwyywCRwwzp+Nx6gM0xgfmJwHlYBrOaYWBTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677262; c=relaxed/simple;
	bh=IQEfu4AJlW5xRHYh0xrmnsJ1MIa2LYZtEiLXSVMB8hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1/MW308GUpS78aGnUdhwH9897bZbEYGiX447lWaN/y8sgM6IZIRHzwrStXh+lPu0USZRgZOD00tlZhW/h1H2vwlsc8lcqaa8JdtsNQAE5vUEV4OAXVu66dTWntAsOZZfVbmaAjHv5jOtyxZxQ3VDcjnsM6P4Dws+xOgQSICh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoOx/r3R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22d95f0dda4so50782695ad.2;
        Mon, 19 May 2025 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677260; x=1748282060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2GLRz8JGOHg3OGSOt87e8l0+TbpKundQEHAiJsUB0Q=;
        b=hoOx/r3RwOt8Rs8gqmnshRJM4NDOD6C+1Zw9RA/ZDHLJMS/ucBNjobb2tEoFbHHMa0
         pGIs6OQKGq/xduFi/YpPtLZRlmOkF+hHBOtY+53WLTRCRZ8LHhyAJW+3VWJA9FjP2qjg
         JFGE7VRUGAbclipaOSom/nRUuXBjZP+STz9bPB8Qcs9dAIxrvRSvXQzpYgoLPKWfb25f
         sDRkQxQlWxxwsieYx4CW+wMCGa+XKJCr3gRI5Sz0mBr6hfQV2qDi55Yf2b55rBaoymuc
         VV7EsSONhx7wKzKufbXBv80gdc6dYiHYAQsZ0gStF/W8GyEyIG5Dn0pmM4Irb9yOSwzi
         b77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677260; x=1748282060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2GLRz8JGOHg3OGSOt87e8l0+TbpKundQEHAiJsUB0Q=;
        b=I5x4UEiOS/DYpuGrSoW01m3eiVSrQEb5ss+Grqd9S4ZwncWFSSrtfeawcFfD92YMTl
         PoxyqLVrwcgzPwAPCLrWTfEWLWLfZ7Zpx1Fa27buocqx0zxRUJ1F6x/pw89OWXgJdPhD
         frdt+mDfrO2Z6xQie2blMGmX5UjurE3JzyJvbkn0Hnfn35zb0KkepAwWA6gkThvKuRuB
         fxWI4u0mXwFtnkFNUl3iH5g7VN+zEUkIjsMsbTCP7O8kIoc1HJVhHhMYncDDFZaCStOS
         iyphxfWdqA0jGJE8tp1poUO9QtUku/BMxF2elb1rZTuVzlfNejVh4LGXCjGWegskSGLE
         SiNA==
X-Forwarded-Encrypted: i=1; AJvYcCVwhKBBlRkF9RpXXfmD1zZ1lUYBLeJ05czhdIkmah5BZOjDwWQ/wWY/hr/8/Q9V5ZdxXRJRzi+bHzzkurMV@vger.kernel.org, AJvYcCXnLREcuPQ5T7zKZYB8j71bGPEiLudgf6H6drR2HJVEJR8w03MM4X/Xnq5e944hrzEJ3HB69dktFSVukjOX@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaqAEcTNbZzC1aP26HAq4faT6qSFeaZ0oQc+Cr5Lzy/mQn17z
	dSm94S03yADxYPjTFfuv7R6FYK24zkOMbD5NgTZbdPgnuRpZGvJTOI5n
X-Gm-Gg: ASbGnctskIn3xyAban8Ej7WdSciF0djnqaS+mWNQfevDrliV0IklFSzPlOX1/foSKgF
	cp55INGTn/XB0aHzjXStAbqPfMuolQOwdZVTb3z3iZ4a69l24VpGCAbPz2KTH/QG0upMTsiY1uS
	iTFpSE94aHEvDTFjwbW7pXGtYilSIndxaeoMlpXcUHAZxTdF+n6ht6i2i/a1Ky4XG7IgmRtNquY
	MjJIejO8HJWeJOKXiIdBjn9H4E0PTfN81Af2JdjmqXTCAE7OdoT3UTO+TMw9IYT30l4B8bZMYvu
	UExZDHjZsta/7H3I24LyKq9J4NR6D9gfTF+BuLgUy7lxPIsu3ys9NfQuAW+1japRTKRAgBTTw75
	7h/TPhOFVlPqCebtbcI7AMps2gg==
X-Google-Smtp-Source: AGHT+IH2WqLWtOHrqBPUnezx4TsYoSZdJNpBSBzObXgLOEWBSEBtNE7MpDGnat/hGDNWJDd8wLzYpg==
X-Received: by 2002:a17:902:e788:b0:22e:8560:46ff with SMTP id d9443c01a7336-231d452db9fmr167399335ad.27.1747677260497;
        Mon, 19 May 2025 10:54:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac93besm62433505ad.12.2025.05.19.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:19 -0700 (PDT)
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
Subject: [PATCH v5 03/40] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Mon, 19 May 2025 10:51:26 -0700
Message-ID: <20250519175348.11924-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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
index c6240bab3fa5..c8f983571c70 100644
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
index bcd54020d6ba..b611a9482abf 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -556,10 +556,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
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


