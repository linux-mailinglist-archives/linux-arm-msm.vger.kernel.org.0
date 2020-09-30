Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BC327F40A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 23:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbgI3VQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 17:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3VQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 17:16:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4013DC061755;
        Wed, 30 Sep 2020 14:16:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so2187132pfk.2;
        Wed, 30 Sep 2020 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcEhH3LkJwJxm1/YqfDogAmQdhcYfaMPXbiNt/rTvIg=;
        b=cCQpDwdZb0pK722MSI5vjiBihKBpkBYoKbO9i9WYCp65PrcPU0SZJt/3DyayvVaYsJ
         zfjL3bYcgY48wx/138a6xBdmhUSBFkbtA6YRCIBL3/i7plw3nGxmSZNirfsfyUJ3NUgD
         clTIPjDvPeI94WZhyTANXSWFUU6DE+KLXk3hsbrUA1JrRivzv0fKsgNI5CIO0FiTHAfo
         VTuS0Vi34MlydR5o31Zl4B2Ou46i9225PQtDhUR1R8wFC87kWMN/q5lhOotBIiz+lMdk
         24Dwt7vy63yhY5gOgFA8f2qCqGlelgmvkBvbyHj8os4I14vWsBjzdFkJFxH+P1orQ/Wz
         089g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcEhH3LkJwJxm1/YqfDogAmQdhcYfaMPXbiNt/rTvIg=;
        b=WNqyfS/rgLPD5o3I6ptDsIatMPSACeZYTRYeolyvjFPAk8J09tgKmw2YdTjOzSI299
         6uOu+hW9xIraCmIc4h5xBrAED7whl5ofHd8BkQ8Z2WX+tyh+6J9haAONJvUcr1eq4bHk
         CaK39FCFDF5agqsHE03wu8NEZV1rSYVyApst1Aj33dHeEK1aWbB2BhvXdJV0AtArmAtE
         2DSYeqKKYH2n5GpJZa2kM14VU8VAl8NGlqKceURHl6J7lU2DdwF2/+mg2uNvMNxkYQpN
         OhmZVYBxkLd+HiaDZCvS3y85yI6PITvWgGRcnRkCdg2+VhMazIw4yZNtry3UQgEl4I9c
         sHrQ==
X-Gm-Message-State: AOAM533/QgtaVXh4umxLEtiUK2vUyhY1hEryERB05+QN16/oqmqQQUje
        SzY3Ph1bsBEiFPYBIwVvvY0=
X-Google-Smtp-Source: ABdhPJxD11GEuDlHb0wKRQjVyEr8sh2uooNCpmemjI0OxxWDrhF/698+aqsFJ+xX8mM5791oIxfpYw==
X-Received: by 2002:aa7:939b:0:b029:142:2501:35f1 with SMTP id t27-20020aa7939b0000b0290142250135f1mr4294458pfe.81.1601500575753;
        Wed, 30 Sep 2020 14:16:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id a2sm3467427pfk.201.2020.09.30.14.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 14:16:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, Daniel Vetter <daniel@ffwll.ch>,
        Qais Yousef <qais.yousef@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/atomic: Use kthread worker for nonblocking commits
Date:   Wed, 30 Sep 2020 14:17:21 -0700
Message-Id: <20200930211723.3028059-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930211723.3028059-1-robdclark@gmail.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This will allow us to more easily switch scheduling rules based on what
userspace wants.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
 include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9e1ad493e689..75eeec5e7b10 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_state_put(old_state);
 }
 
-static void commit_work(struct work_struct *work)
+static void commit_work(struct kthread_work *work)
 {
 	struct drm_atomic_state *state = container_of(work,
 						      struct drm_atomic_state,
-						      commit_work);
+						      commit_kwork);
 	commit_tail(state);
 }
 
@@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock)
 {
+	struct kthread_worker *worker = NULL;
 	int ret;
 
 	if (state->async_update) {
@@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	INIT_WORK(&state->commit_work, commit_work);
+	kthread_init_work(&state->commit_kwork, commit_work);
 
 	ret = drm_atomic_helper_prepare_planes(dev, state);
 	if (ret)
@@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 */
 
 	drm_atomic_state_get(state);
+
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		worker = drm_atomic_pick_worker(state);
+
+	if (worker)
+		kthread_queue_work(worker, &state->commit_kwork);
 	else
 		commit_tail(state);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index d07c851d255b..8d0ee19953df 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -373,8 +373,18 @@ struct drm_atomic_state {
 	 *
 	 * Work item which can be used by the driver or helpers to execute the
 	 * commit without blocking.
+	 *
+	 * This is deprecated, use commit_kwork.
 	 */
 	struct work_struct commit_work;
+
+	/**
+	 * @commit_kwork:
+	 *
+	 * Work item which can be used by the driver or helpers to execute the
+	 * commit without blocking.
+	 */
+	struct kthread_work commit_kwork;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);
@@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 		      (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
 	     (__i)++)
 
+/**
+ * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
+ * @state: the &drm_atomic_state for the commit
+ *
+ * Pick an appropriate worker for a given atomic update.  The first CRTC
+ * invovled in the atomic update is used to pick the worker, to prevent
+ * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
+ */
+static inline struct kthread_worker *
+drm_atomic_pick_worker(const struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+		return crtc->worker;
+
+	return NULL;
+}
+
 /**
  * drm_atomic_crtc_needs_modeset - compute combined modeset need
  * @state: &drm_crtc_state for the CRTC
-- 
2.26.2

