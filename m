Return-Path: <linux-arm-msm+bounces-60374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981CACF6A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B969F189DD7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA0027A933;
	Thu,  5 Jun 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm/ofcbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E481F099A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148333; cv=none; b=W+2jXQmy5joTXuZ5y0q4ScJxu6vhLEDYPhm2TTEyw6bnQvmkqZlyTSxo6tM0N204fxn1gGYRcRojUPgOL5CJ2icLYmt5Ty39cN082XIXCP3L8Dqh5fE+mw1a7A0DmhtXbY7s0H1IfQFHY8TbbrZLX3IlMX6U7aOze8SRX8nIeBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148333; c=relaxed/simple;
	bh=Ljxp0rbVayEqE7lmqppBFPy5GFbKDreN6wHhP8x2y+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upmoO7W5/2FfLfq20Qa6yGu5RzBLBC/SJQk5YgAigD8p0WisI1I6rOVkuzcQqNOOqmdj+xxT4S5oA7yRDQtce0NJN4SdRb10FaN/oldjCG7IjorBwhjV25VHey9ie3YLjn8ZniNgqAHmzcbNza8ZyrAThnKcOT8obROmD4QPlfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm/ofcbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3rJ006413
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tgiGXs8Fmtg
	Byi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=; b=Zm/ofcbnD1VZQDOavBBxUSU3b4o
	oRFCLbynsakKodEStLUnV11nCCPtyeTkcc5APS7EBlGjyGMQlCNokAEeD5ARkY12
	p7WTJDskcEqc6O/IhFn2e6JsW9tjbnQdFEmtBokpeTyCVjjGKP5PI9AqRP65tvyv
	ZE+GyND+rO+pj+uGD+UVK0lyNWAI2myLXv8/eD8kZclNsgrqnu3TWArZqWgcOGx2
	+jwJ9Sgb6KbXwY4hqrr5l/jWkA1mxX+tG2BK9yNJY5k8HZjK9gCzs2OUK4Hf4sgr
	a9I947nzzO3ZQvLwwJUttyUklgFCayV6aEU4tKWHX8/Ic84pbE5tTH0Gf8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2a7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2f5a5da5efso167114a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148329; x=1749753129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgiGXs8FmtgByi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=;
        b=CZriQsmDu9E5EY4p+AqaEqqLGGMTdSiml/exN0zCOAWWzkBdn28Wr2I/4paQLso9Dy
         3V6/snwh7GWOGJWDT33pQ6cUDfaSENAwZeFKPZnwqHVcMgempws8VawvOZnSVh6NqrVM
         BTdQ6qCfD+c5hMQD2LMbOcy+Ya15AKX8AcdYFN9UcTRFENJXag2j2LwdMJwLqwjDoJ4P
         jhq0gFwbxyCSd2M7YQGTV9OdPB+VJJqC8OveXkOyIMXgdDmxS1yXQ/VMoAq6Rqe2o9Dc
         o+qtcqFelJqF+Jxky3WPGzutSI/Nsk7tMJ1sBPleGRsKSRnIxV7MbyXVuJeNBL+PJHCE
         rQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNbHcMedkjvfzzrMrS0andMQwuyGDtVmIjRbaDVnDKGuI8kOi2XGb2A4EbBrZ14EZlpuaOh4ucAP+X4m48@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfOxLgInoh+NE4EsDvjzcZ+VKmK0ReH2ny7D8KL1CnN08lT8x
	Z92yZIplz9mUr5EEpmiYBXIVTKw33OIpAOnufrC2Q9RezeRI2snZlj7YtTOfK1aEkbkZnTA4IUm
	kK7h4FgjHnGH06PSQbea0ZrMiI2QHeYfcFQQyoIYBlpZ7dTCXW1GsTgcINp1V0UPAWtOj
X-Gm-Gg: ASbGncuoLMoNYN/h6LXu5DDhUGUT5LRns7I+ldDIcFRKR/HRzCjpGoizxT02WeL794D
	rNqYEdSf28IPthI+ew4/gom+6C0M+pPiBWjapU0MmeNyrrARH3My9+CqLJP5J3PWzQMaZ8pIfwI
	2B5oYCXWVKxyrWbuY7bSYhicGkXZ0ZdIFYn95DZWvF6ExrOqHmpa1idttCjzbAdelYeaYnV33BA
	7AJKY6/9EDSe3wA842dt1RiJimKLhKWoL2eNdj0eNUoUiAd7LlCmxi7AQ6B0/CHOg5pDKe6/Ime
	ReKZ6BF+2+2A/JXoV+Kx4Q==
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id adf61e73a8af0-21ee257726cmr346309637.24.1749148329203;
        Thu, 05 Jun 2025 11:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6yEyRAo6qHQu3LjusRo5WiuixIyyerG+CXnhIKpPAvFwR7mK8AVmwqDRnbddTUCiGjf/KQA==
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id adf61e73a8af0-21ee257726cmr346258637.24.1749148328731;
        Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683a5sm4687a12.37.2025.06.05.11.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 01/40] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Thu,  5 Jun 2025 11:28:46 -0700
Message-ID: <20250605183111.163594-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O456aXyKeb-tSJniQytYPebW18AdcFU4
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2aa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: O456aXyKeb-tSJniQytYPebW18AdcFU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4BNoCMbbU0Fl
 F//BzmOB8YvwqI3T1Jr0SvTYzmCLp7KGj9pLwkKM5Oe6cMFiZNuLfsPxFvJIuz+dj6pCWVDu2+c
 pRU0Sb1RImRLcbyuoXxH1bQpUuIZqoD5hY/N8oUoel7GPN18Bsml/WRv8GE+4OKSsbGdQSOXifL
 Okigx1dmyMRLZHG73mEt6ky2ZMxM/rv0w9AIhtvdHaHYas/W5dGIjIz9lxKUrfX+mOf16eKM/MM
 kuuaGZ3O49Y4xdCfwXrvSQ/rpm976nKAxDkrpQ3FKuvXSSsRbGqhhH/vgOMeDeyiYJ7jQELL6PW
 L/+eUxUtIVgj16npp02gVGJwt/z8zqfdVm6PJt3cC+yT4twxou0eU5VoKCdoQhRcr+iasv7ds+u
 G3zAVwy9CKc4W0TPLaZGWdaDub3Gtt/fK2lhmeqnBXtFXCYmHPZfTqknejCPKETjXfu0SDwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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


