Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6553B31FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhFXPAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhFXPAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:11 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE11C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i13so10789795lfc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RvPUwkcU8YKdVpw0wmyULc3mE/3A3bYC7lrOVQW/d7g=;
        b=i+PSGyzrpBs3DlVNlxKzljj/zSHJcFHpZsYbN5lbz4IL6zU67zg8J5Fb0t1ZH/R4tC
         CvWGbZ0mBowetCnqUvVAhIfO5Asx/O2P2hmm41UoXjEw6LrMA/VM59bidgrQDfRVV74f
         P8VyoJu5pcZdlHRIvoOvxOkM/tFoNy2Y1EjqVKkV+kEOPMFSupzMYH5/pylovJtHXNsc
         /U/TiNpzzXGnrAW2TcbQ4h1azhugDRNnZAolQcZXcEYhrrFyoTqZS9lvx0yPqE1OGvyR
         ZtErtpwBmPpG5R7hIivwVp6LeU3rUwK0JMJi7l3SVy+XPvjLbVe4jJXJ1Ibmlrwj9+2o
         OqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RvPUwkcU8YKdVpw0wmyULc3mE/3A3bYC7lrOVQW/d7g=;
        b=hbwB+t5aUcclebyeUkipl+zjdCHF67pAM9yxyg1/k9F7undGP3jdm6o/u/wKQiGAf9
         E8PF0T7CuUS8bjB+3xpay0ddkEzsEFHvPqCIOai9LD6jpQ2NGIQTOcMruYr3ag4Pxn0q
         HMZHvtz4sEZKRxDL8oVaz45EZZpEXe3NSC2/d+hDsmnoYNYsKVU8OhWv4atHJpmMmze2
         8IvRfpty0MgZf/ACqNLLjsBQcqbflFVSLEg38rQRquBl+UB48GnS6vnj0Mc2TZmMqH0v
         1g+HxKruDeXbBuQzHGMFSX4WvbTgLv10xqQdddgpG5L+hsZv6wJrccsc0QprSDMce1Ti
         iU3Q==
X-Gm-Message-State: AOAM530R13lOV9TZUWBnnqABgeB7GkEgByyjsblbBWp/9nCKdbKXDwxf
        7M0xJNBujzZvvv0adf1M0AA0zQ==
X-Google-Smtp-Source: ABdhPJyWqpG4HlRPLNz9qifGkctnq5uBXfnFjrho9St0ZMfJmYEIuU8XXBwicUfuxfW8067OdyojvQ==
X-Received: by 2002:ac2:5982:: with SMTP id w2mr4223270lfn.80.1624546669599;
        Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 15/17] drm/msm/dpu: add support for SSPP allocation to RM
Date:   Thu, 24 Jun 2021 17:57:31 +0300
Message-Id: <20210624145733.2561992-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for handling and allocting SSPP blocks through the resource
manager. Handling code is not converted to use it though.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 10 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 81 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  6 ++
 5 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index fcf131f77df2..1bbe178f6db5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -387,6 +387,16 @@ struct dpu_hw_pipe {
 	struct dpu_hw_sspp_ops ops;
 };
 
+/**
+ * to_dpu_hw_pipe - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_pipe *to_dpu_hw_pipe(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_pipe, base);
+}
+
 /**
  * dpu_hw_sspp_init - initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index ab65c817eb42..04a2ab548f54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -159,6 +159,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t pipe_to_plane_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8a8727ff7645..70e3eb165363 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1235,8 +1235,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
-
 		kfree(pdpu);
 	}
 }
@@ -1390,14 +1388,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog, false);
-	if (IS_ERR(pdpu->pipe_hw)) {
-		DPU_ERROR("[%u]SSPP init failed\n", pipe);
-		ret = PTR_ERR(pdpu->pipe_hw);
+	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
 		goto clean_plane;
-	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+
+	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_sspp;
+		goto clean_plane;
 	}
 
 	format_list = pdpu->pipe_hw->cap->sblk->format_list;
@@ -1407,7 +1404,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
 	if (ret)
-		goto clean_sspp;
+		goto clean_plane;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1433,9 +1430,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 					pipe, plane->base.id);
 	return plane;
 
-clean_sspp:
-	if (pdpu && pdpu->pipe_hw)
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
 	kfree(pdpu);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..9772427eae6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
@@ -35,6 +36,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks); i++) {
+		struct dpu_hw_pipe *hw;
+
+		if (rm->sspp_blks[i]) {
+			hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+			dpu_hw_sspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
@@ -166,6 +175,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->sspp_count; i++) {
+		struct dpu_hw_pipe *hw;
+		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
+
+		if (sspp->id <= SSPP_NONE || sspp->id >= SSPP_MAX) {
+			DPU_ERROR("skip sspp %d with invalid id\n", sspp->id);
+			continue;
+		}
+		hw = dpu_hw_sspp_init(sspp->id, mmio, cat, false);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed sspp object creation: err %d\n",
+				rc);
+			goto fail;
+		}
+		rm->sspp_blks[sspp->id - SSPP_NONE] = &hw->base;
+	}
+
 	for (i = 0; i < cat->intf_count; i++) {
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
@@ -660,3 +687,57 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale)
+{
+	int i;
+	enum dpu_sspp pipe = SSPP_NONE;
+	struct dpu_hw_pipe *pipe_hw;
+	bool retry = false;
+
+retry_loop:
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) {
+		if (!rm->sspp_blks[i])
+			continue;
+		if (reserved_by_other(global_state->pipe_to_plane_id, i, plane_id))
+			continue;
+
+		pipe_hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+
+		/* skip incompatible planes */
+		if (scale && !(pipe_hw->cap->features & DPU_SSPP_SCALER))
+			continue;
+
+		if (yuv && (!(pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+			    !(pipe_hw->cap->features & DPU_SSPP_CSC_ANY)))
+			continue;
+
+		/* For non-yuv, non-scaled planes try to find simple (DMA)
+		 * plane, fallback to VIG on a second try.
+		 *
+		 * This way we'd leave VIG pipes to be later used for YUV formats.
+		 */
+
+		if (!scale && !yuv && !retry &&
+		    (pipe_hw->cap->features & (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY)))
+			continue;
+
+		pipe = i + SSPP_NONE;
+	};
+
+	if (!scale && !yuv && !retry && pipe == SSPP_NONE) {
+		retry = true;
+		goto retry_loop;
+	}
+
+	if (pipe != SSPP_NONE)
+		global_state->pipe_to_plane_id[pipe - SSPP_NONE] = plane_id;
+
+	return pipe;
+}
+
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, struct drm_plane *plane)
+{
+	_dpu_rm_clear_mapping(global_state->pipe_to_plane_id,
+			ARRAY_SIZE(global_state->pipe_to_plane_id), plane->base.id);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..abd20509f963 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -16,6 +16,7 @@ struct dpu_global_state;
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @pingpong_blks: array of pingpong hardware resources
+ * @sspp_blks: array of sspp hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
@@ -25,6 +26,7 @@ struct dpu_global_state;
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
+	struct dpu_hw_blk *sspp_blks[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
@@ -88,5 +90,9 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale);
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, struct drm_plane *plane);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.30.2

