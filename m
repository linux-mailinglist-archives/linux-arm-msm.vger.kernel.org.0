Return-Path: <linux-arm-msm+bounces-62990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D491CAED064
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1602B7A566E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B523D287;
	Sun, 29 Jun 2025 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPnQNg1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6C23B614
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228155; cv=none; b=q96KYrOJsVYUoTm63s7zCChNeNX+sMBFKtpNmCroO5cg3YnUVeoNIyGo/txhfdRMzH4v2egT10EjgCopSZIvXjF/ltAnS1ZLxtU1VrZ6NhfBtzujYug+2vFJSsvbZMMZty3UkKW2AgIrxv4hcfy1E9sSmrtJRRPtX9bTnbhp4V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228155; c=relaxed/simple;
	bh=XRVvkiZdyuUD3BzpHrxk2CyWGEjPti1XCiRHl00bWx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIsGSZSrP+WaSJadd4/Arh+nYmo/wqVfJi36EBra8vBmBISrIX/WK68pDNrwvqmiguMicfTITmjTZeeKL+bfOmEuWq6BN2OZ03BHj5Rkuar6pENbBxL5gsIdoNFAfnyanIa2u1oq3e4TEWnviqYniilx1U59KcHryQ49LBcrXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPnQNg1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFUPTA014511
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UaLuKm/3fKy
	TMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=; b=LPnQNg1XSAYcbSetYNHooRrnO8W
	qZbNVhN4xoK+0FMTyGYBD1L4TffW6GYQrCiC2rAPFUbN5ZPYWoz6iQPQxWelTPhF
	krkQxrM53++qvwas99wSVUukqHh1CWHHGu9f16yaolRChhe5yfEPOdwhsm0pjoKl
	rIYOfdoiBq4gOKg4AHam67BPFLjcSps3bFJpKgrMCGRdug1wgQazJs3N08LqYySx
	KJZm+sstuoEpS0NH5Fp7Yr+6FalWX6lSm7F1b2+gvXErrZ8xeiSFkf18+EjM7C8U
	8yZSK8Sy8LC5INYakJySvOZRN4UOvZ5rvGB09vRi4luvooNkIrsM7qyN+uQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2teg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234b133b428so25519145ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228151; x=1751832951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaLuKm/3fKyTMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=;
        b=nhnztsrKgXe3BPUOm7HvBRsrg5KqveZQ0g4dbciAq0mz0q0nX4kFHXe5wt60gqa+hN
         fE+ePCO/ymPD/3lI76eOMB9zzrvESmbzh2XY9SLCUFmP+XwSlQFp67aa5xnQFPCV9CBX
         RQnsiv/OxZdd5xk643PxFCOgYCAfpNodRIa9igkapNWYgIqJcmfhm38p01UKcq4SZPY6
         nUBmOPAGvrxcvVWYzkr9vIxrchT15Y/Evc2KtlP6nWauhMsJT1Cp7TTPTj9gX1PKUX72
         qD7bDYajPr6i2tFzv8zStCIHcCvFApK4uSOOV4TCzvmjae8NMvuYTZu2ZEiTqA1xufAl
         yU1Q==
X-Gm-Message-State: AOJu0Yw7nA/71Thj2Xmt1c6IpVB4aLYFu4pEvN0enEJ93RjmNItqccEV
	0Nr1MQ7GWZ2uHVEnrHcNK4MM34XCoxv+k1pNoRtbNe5ccJJu8hVBANyqyQYfQfMTQdFu9Lg5otu
	D5v34CRpNYFGWzTvDD61af8M+OzvF18lpQCkPZ2zJ/5028e8cceWalz1qfedw7aPs7k7/
X-Gm-Gg: ASbGncvKdyLmzxd0vFDaSTjozdFV1ZWjha/f2FW1mv1Ur2cuKKhNckIbYefKRVhDr6K
	k9t/rcuD0KkPodIT+pyK5ajIzvYEi/XHppnygF1SGutxQVYP9BC/qnbQO8gu96Y4sATGSwfCXhY
	l6vdJ4Zw90XqmCpf71xd4acMtoyOWBc+rCJme/wOjdNBzLSaeyyuojLn+rAh6bjmeddr91qVTjD
	0dvoRVE3r8cS+f55pREREfrYw1IbVC7AsY1ajhluhJ/s1ztu3E7HyvfpXGEJkle2+x9uW0F8fWZ
	YDyR/zPvhVlYOdVOiDz6CCi3sBa3h9LwxQ==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr166592355ad.45.1751228151508;
        Sun, 29 Jun 2025 13:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF91VIBntcqp9WNNfCaG+mV6yoeu+EQxzldo5DrH4AVc4zimszgPr9aZqGuN+EaweEGWuwtA==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr166592025ad.45.1751228151042;
        Sun, 29 Jun 2025 13:15:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3026c5fsm5959735a12.28.2025.06.29.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 03/42] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Sun, 29 Jun 2025 13:12:46 -0700
Message-ID: <20250629201530.25775-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619ef8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfXxAlixtpgc5cg
 YLOmqmJBdQFZErM/JtY+8XHJJ+A2SURyQSquzSwyECLF+GZN2WXbx5VggyuVwNWr8w0bf+/Zkvd
 sNNHw3ZMDSc3XGvDtZng5rjA5gesXURf2A3qGLuQYmdZvFvqnvTaZqF8Xm+lNbaWUFKxhJLwcCi
 hZiekd0uVRFfAZNaOdfmhPwXy9dHKzjazxIsSPGsrF91QdBGgV65SglA6P84fFtHIK+30cacjEU
 P5rYXqgY6U4x62gDM4/9j5DnyUACjRhkewW4b6ffYtb4tAyro3N3AIQVNBdP8QQoEGGrC6OtYpj
 U5sWlLEyxcAznacHp/DW2YjCOJcsIjCqjlYmT7ChubHPQiNbAFFOgRyc2aiGLCg6+Q5quT3Tawt
 mY9iC5R/sCN5rLyxCnQFEQJ1Zdy0vKKSm168xzdpUY1VS0lgsHQkVcLg0mlTMAGqQ+l1Om8I
X-Proofpoint-ORIG-GUID: uYL9Ilhd88DQLGBThQQWTJXKWobLW1Dr
X-Proofpoint-GUID: uYL9Ilhd88DQLGBThQQWTJXKWobLW1Dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..95158cd7145e 100644
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
index a3133a08267c..02b5e9402e32 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -559,10 +559,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
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
 
 int drm_gem_evict_locked(struct drm_gem_object *obj);
 
-- 
2.50.0


