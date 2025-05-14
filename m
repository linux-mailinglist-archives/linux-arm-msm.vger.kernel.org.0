Return-Path: <linux-arm-msm+bounces-57903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E7AB7366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96CB51BA517A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5371028688B;
	Wed, 14 May 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbYuBMLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C8B283FE6;
	Wed, 14 May 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245362; cv=none; b=Nr9vWFf7qoLe1ikPUpkc1okX1y/4f5FUdRQPA+j51afPAbWTn56aIgUYQcEhGdGwwjawQwkcLkuhbT5GQH+BHEMAFEuNd6gv7IjDf39ZEisnVAQykg01V0Jm5JVuO0AwYyMe9D7fFk/lQTLU2jGheariBbuHzn0gkrOjNmuiROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245362; c=relaxed/simple;
	bh=HQTYjppayVSe6RMF1/nDWeCVEk0At2uUwSWtYOLEAf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDxI7YMQi86VnByYwTumXpidQzGqdQwJ2YQMkZn0q33qgQomGwv5xFZbE4UpRcX3jD9QLYHKmsmD92b02vkXZDq1jxqGwf1cw4l5o6fNamKjaavv3YxBp5ONLDIkS0MvRXCqQBCDnDkg4LJAtkR5esgKWjzO29kS5LwbEa3Q5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbYuBMLQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso173537a91.0;
        Wed, 14 May 2025 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245360; x=1747850160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzY7l39Nyf4cERK4w5Xc1S0qyexBdUxlhblg/1kA2ys=;
        b=lbYuBMLQRPXfiutvMqwKAPGwmLrGgnwtxz7jjm52H+rkc0xmh1nxC+M0E6cG10KUZ3
         cdAq4PgaVRI3EgF2B97VbvTxsgEvbohhE+tX6dvruy+vlVbllUwLcriGU4G9lOxOdUpP
         ah0nhuAIxnfpxin8N5Emmo2KNFYp1cRb50joqJ3xMfsR2yd2xyewEKjntMWsxIjFxiIi
         zWbDRTJ+fhD2wYCY+IC8PjzBX+TXrDSUc0MP0RR/Gd863cILayaA+oIK0vTnnu5V5YSY
         BX7XbOr6LEfbRyyMLQO+OmiKtGFCw3hmkW5Y0EmgPMTXd4Tj8rUbep+e66f08t5NBMQy
         0DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245360; x=1747850160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzY7l39Nyf4cERK4w5Xc1S0qyexBdUxlhblg/1kA2ys=;
        b=Fazqn0ZdWM/exSLNYwb+JyrFaBgtU/bah6B9H+X7G6C7j2l/bsrGK5a/nlFJCAx4pZ
         1Xf1RP8cqRtFLSmW07E34qwQcWezFwOhGV/w2k1GiyrEL3d2SjDun61IoaO2Yq7Rjzrk
         QcvIkCcLNOcpAliTDfAz/bX9f6dDaeQswVJ2yi5MLiD8ykMSj4/90gYeUS1JrxtJq4AX
         XxOht4hnlc1haEhkgL/qF4M3cYfbHYhLvw21IA3K9uGHH7OQMuVhfeq/pptYitviyGBK
         INcAZkiLm0mfDnNeU+Ka7xLO5WSIRWx11kvIQonO/G6ie8kHC3daZlZCVCIXHmB7RFVj
         1UgA==
X-Forwarded-Encrypted: i=1; AJvYcCWExojf3fLQ9/jxqEIsSSZJ5PWOd23p0ynNzESdn1MCxh6k3D4eWNbTAvm0eLy88+KlTklTiqIdYJ6q4CA1@vger.kernel.org, AJvYcCWey2stEwZFHU5Py08+c+obe7yFnFkoMOuyCQmJfRgnJxrcqDYUjdhSEeHxd7DNciwFOIsYuALdgu23Lkvz@vger.kernel.org
X-Gm-Message-State: AOJu0YwpwuC/3SX6LOacsRCXkHwXYSkk46o/MTj7P6yq0aLTXnYCqTHi
	C+qfmzGF/A9M7VkXUiv4hgw56/ePElGJP7Np9L8Tt4DJGY0ADngR
X-Gm-Gg: ASbGnct8i+QxjXQwhbrSoCwbjycCXNXEW2Wzk59pM9ugNsK7mHxxDCp96k0CsViUF0e
	p+EjXuwnznseQTIv3kosgkl/v0kBYLg2CPjDKJqGjUN7bkezZ0HuzQXITXmpDzlcB09kBMW6aPB
	AUC9qu8EH/d+5i1hdqyfQ4R+qJzRM21Q6GnAw8I4hLYbD7UEPS8CeZQ9ke4LQTFpLfkO7rcTGrP
	hOJ1wOnbk2AhleB6dH4x9IX6tzN7pmKuUA/H7KL6euZbRaIh0vkPWIfmWetM8gmbE7/oxOLryPm
	+Xre9MYpHk7vIOvEwDCl82HDCTRIGicgccvZD3RQ7wp5qHZisFd0JRdOz5BOdhiUX/Oh5Y6z5eU
	yFPi9pZw20+qDyetoVzqsDOlQ9g==
X-Google-Smtp-Source: AGHT+IFl0sTpr8mSBQJlGorxImtDer67Fr4shrE9RxujVkEMvU+2jIuSiXovt4GTRsHBlL2PF8IpJA==
X-Received: by 2002:a17:90b:1811:b0:30c:52c5:3dc4 with SMTP id 98e67ed59e1d1-30e2e62165dmr7821618a91.24.1747245359675;
        Wed, 14 May 2025 10:55:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e3fsm1873055a91.23.2025.05.14.10.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:55:58 -0700 (PDT)
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
Date: Wed, 14 May 2025 10:53:17 -0700
Message-ID: <20250514175527.42488-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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


