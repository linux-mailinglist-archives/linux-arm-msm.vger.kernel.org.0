Return-Path: <linux-arm-msm+bounces-62932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8422AECD13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7222D1728A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CA3225787;
	Sun, 29 Jun 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8p4peux"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA32248B9
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206026; cv=none; b=mI6XypipuhY/Rd+PZzNz6hYC8ZQTxocJfmrQxDW+y2FUL9vwhYPs7J8BBfCZJzBFtPeTdgsFbFnexw879O+jvVCgCpZ/NpzdWx+tJ69aVwf5Xh0zLRIVOlyBYVDWrCL1tgInp0wc+R0YMqNBe+U/+u0vOKNW5F1BZNaxtiBp9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206026; c=relaxed/simple;
	bh=XRVvkiZdyuUD3BzpHrxk2CyWGEjPti1XCiRHl00bWx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+viY32o9h7Vb2xW7++kTpCHhkhUwUJP9OZZovCzyyou3fkF4eqFpREzcCg+2g2LWluHqGCnQj9+/ITjdDFbRn2vsngG23x0DIqWdkUaM+sp4E+s24m5p/hDDP/7DcTYzEkbpLJUUs2WljG4G90dIVvKxqaAJ19UclY29Cwtoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8p4peux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBM447020199
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UaLuKm/3fKy
	TMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=; b=G8p4peux7N+5tDdYCe9rJ2y5b/z
	dL+Fg7E1BREfn752e39SMxTzRfXBNnBTmNR/qoow9UgpnI07Y7YrfO7l/S/lwSyb
	GCDw1ZV4ofDxgCnuvlbPgOyLOHhB5VkEehkMsCnDjQqG8MNVMlay9idBjxGUZy+M
	QlG2ss3q6JBECXDzrcydv6yqx7QnVjvgJq0xf4FbeCfX4al6wYtfp7tZTwT2TCHb
	LmCxT+7+nDi+TRdBYfWvgMykNiPtKT1y19Ey4PkjDF+Zk8+xF1Ba7ZrfT6XQske0
	pZ/FYMYEyLTUPImbKJAVb1FntQe/lQviX2agE6HH39dxnNmk72iFZ6NwCuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht64g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394772635dso2703415b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206023; x=1751810823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaLuKm/3fKyTMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=;
        b=lvywO3YkS/kJKwnW6dk9pMOuwa5sB7uFSQtbPK5S0rf0aDv0UG5zx9M7Jp8Mow1dWj
         LO7Y7ndhlDr5KAgbET+4R1GHseBjrWqfyCcvdAZ4awalcQbn2cLd09BSUJ4JAh88vmiw
         jZVrh+XRXSCiCswrFdYOncnDj0FvQguuIADgz8DuQXqgYwprAAXh0umZ4+eg/RDC+2rG
         xyD6ZwR1BVZlOe4lvzj/9ZoA3Zjb8b56X9qoNVmqCtqHDWFxIcOEis3OZAR9gXBc87c/
         /MCTt7Bi/RXVqSgg+XkajfPx7QdbuxYC7WWQm6Bt9aO3DY4opR0M8+nexeT5a+8KcH66
         64DA==
X-Forwarded-Encrypted: i=1; AJvYcCXvupEvnLrNH+kdh2WrX+AzWbGzz/3pXVQgDEk1pmpliu9/Z1F8/zwMNjyyR5ya8Gq/f0MK6ZBMvWMG5UK6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0TU6tfbgxcoBr3miSXMuRv/7WsWe6iLSXVdQGUc2iXGvJ9ExI
	oENfrU0ytyXXHxuqzTystnxSkYTlBaIDg2yqIy1LhZL0OVww3TRC0mXZXfXKpOPVlpsUF+XlGgf
	1xTLSv6gtMVrLHMoEKg1jm4IAa0TzIuNAyzPcQtVnwO6OPqTsdIemGPrHeAGoxEQdKku5
X-Gm-Gg: ASbGncssswmCmcsRs/2qDlIx1EkNVCnSfEHS9xwf9e3RKndzRrm+t3IWZ4wpO1LsEu9
	o7muOlPA53jPqnuVqJ7MCzjuxjvGUvb9UxFa6KOBr8AUWlr7VfPOPxWCBQcHP/AT76kpHAIECrx
	qQcAjykG3OpzanPQKGjsvrAft/JXWY4zSP/4uaq3JCbzFXGWDEJV/v4/ETiR1SR320HkJX5bVsx
	mKbAZPXGMTWKOVwBnhFF54TAdVFK7dNdXziHihOzuSVvBaoiB4RyzGAea539svhVBJwZBNkTYdA
	kHjQQ6du7uS0iy33XDjCy+ScTjrMSgT7
X-Received: by 2002:a05:6a00:92a6:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-74af6e27ba7mr12454247b3a.1.1751206023409;
        Sun, 29 Jun 2025 07:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF64qcH/Dvu1RsA66gxeamabybbwejYBsbv5pTYh18PMePejoeduNagkrBZeEp0IvcikwbAuw==
X-Received: by 2002:a05:6a00:92a6:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-74af6e27ba7mr12454211b3a.1.1751206022909;
        Sun, 29 Jun 2025 07:07:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da8f7sm5914737a12.62.2025.06.29.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 03/42] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Sun, 29 Jun 2025 07:03:06 -0700
Message-ID: <20250629140537.30850-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX2CWREF4FOo0r
 UqUbu3f4gVTZ0RlVADFBE61CCfQFvs2EI/IbRYKO3wMJuocvHFAZSUO+FggoPLvl1rKdqZWNLCz
 c3MMTZ9PgiPYlOODH6FpkjgadeNq/uDSxZHtnQ+2INcbKju31VMwhRfBhYPyJyXdPz0QenR7NTz
 uCS5N+A3/78EUOLSFV4xZJHp1TpID7qDCf3JEnuV1Ej71MaMo1XPqYoRWM4LwS7nWfnxXi80kdd
 5eS2ZjGeWnkI2x4lfrO6ZeazhjVzgPs30nj5kYnC06hUClozWsxpJ+8VEbcqeEajrzite6qDfc9
 SdQ5H53zgm8HF3G4TI07hGvvE7zCbuF9weOBYa1KRhAc/Q/YOQ9CCSVbuyUo4RWTQWFV5SzE0oV
 jjMgswitN17Q6cxhkLxbEhZp45EGQsNSqh+NaJYBRWHwchKvsX+7eHRdXt4k5N7EqkWY6vA/
X-Proofpoint-ORIG-GUID: AXrokd3cptGiMbh6vaYRmvz8IkQpafO0
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68614888 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: AXrokd3cptGiMbh6vaYRmvz8IkQpafO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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


