Return-Path: <linux-arm-msm+bounces-5957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C386681E0C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 14:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2830AB21583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A9E51C5A;
	Mon, 25 Dec 2023 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXr6xasE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05A51C52
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cca664b0dfso30479561fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703509738; x=1704114538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/bY3cOQnuwB3eAWgf9usnK5Xs8FGiVWe7DMy14alrc=;
        b=TXr6xasEelrSrHg2WpOih3ju3JaUSN991ogsRv7Q18a6Ibvt5Qs+B0IImXgjLF6wJO
         DKV/z2r02raIamHRelP8YugmzmohP9rD3xMP/s3fdSghZJ7i+pbJS5iSlPv6IIoXQSZE
         hNIJjvuSfiVngIifcjyMMLc7Pht3az7mONXdUbBBhVHUwntf3tWfwqZ8eJ5q5vQ85f4b
         9VwOqzjwTZymKMT8+Urzc7IIKF0aUJ07te8oDJOTINileCbVvIJbyCkuF1j0h5oLv/7x
         AbfwElCTXd0zhNMY4P944f3bQz80CNK5tsW3ZRSgrCV/PCYQpZXkkpndQn32+CzS5XCj
         31XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703509738; x=1704114538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/bY3cOQnuwB3eAWgf9usnK5Xs8FGiVWe7DMy14alrc=;
        b=tys0/EPWRHSev/O3lXUc8SvMJAzspJEa594WBUGM6AbQUJ5k53ei5EzJAMx2bkLHw+
         n+CsTHg875XooOENVNVidcq+N+u+AnJNclDZrxWh9KnlaR6EpKoGm3Wz9EWWuGS8f0AX
         j+aPXDGisCxZARYFOIhegnk30a5RcEhc2KB0R4Y74JLO6GxmKUPcgDx8+tsOpiO8fWTb
         LxNyJaEIQBNoqwUyzjbugyiQOAAr6A2Gol2MXOeakAKFx3k7eHHjLTTZ/xzfk9HZJmel
         vAZRDMH2svwga9FwaagixmLSpodZ0Hnah5dZqJSmUZLfGbly/NedGHE0AMj/+yUPkz5P
         IT8A==
X-Gm-Message-State: AOJu0Yyk/aqqmDRZjKspF5DoaCE23DY8rfKF3JD54S1UcaKVARcey1DF
	FCUb5jHLOeTBj+7jG8nVBJr30H2IWRlq6g==
X-Google-Smtp-Source: AGHT+IHFY/1bs/4a/mE0IUKuV+Di9j7vkltG5l8Mf7t7z5slV2/5IIIPx12lsdm9ZGcP2lVPknqU2w==
X-Received: by 2002:a05:651c:552:b0:2cc:2025:5bd5 with SMTP id q18-20020a05651c055200b002cc20255bd5mr2338310ljp.51.1703509737797;
        Mon, 25 Dec 2023 05:08:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:08:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
Date: Mon, 25 Dec 2023 15:08:52 +0200
Message-Id: <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
Move corresponding checks to drm_writeback_connector's implementation
and drop the dpu_encoder_phys_wb_atomic_check() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 4 files changed, 64 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a0a28230fc31..8220cd920e6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -354,59 +354,6 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
- * @phys_enc:	Pointer to physical encoder
- * @crtc_state:	Pointer to CRTC atomic state
- * @conn_state:	Pointer to connector atomic state
- */
-static int dpu_encoder_phys_wb_atomic_check(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
-
-	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
-
-	if (!conn_state || !conn_state->connector) {
-		DPU_ERROR("invalid connector state\n");
-		return -EINVAL;
-	} else if (conn_state->connector->status !=
-			connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n",
-				conn_state->connector->status);
-		return -EINVAL;
-	}
-
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
-	fb = conn_state->writeback_job->fb;
-
-	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
-			fb->width, fb->height);
-
-	if (fb->width != mode->hdisplay) {
-		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
-				mode->hdisplay);
-		return -EINVAL;
-	} else if (fb->height != mode->vdisplay) {
-		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
-				  mode->vdisplay);
-		return -EINVAL;
-	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
-		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
-				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
-		return -EINVAL;
-	}
-
-	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
-}
-
-
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
@@ -777,7 +724,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->is_master = dpu_encoder_phys_wb_is_master;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
-	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..48728be27e15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -630,23 +630,26 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
+	const enum dpu_wb wb_idx = WB_2;
+	u32 maxlinewidth;
 	int rc;
 
 	memset(&info, 0, sizeof(info));
 
 	info.num_of_h_tiles = 1;
 	/* use only WB idx 2 instance for DPU */
-	info.h_tile_instance[0] = WB_2;
+	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
 
+	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
+
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
 		return PTR_ERR(encoder);
 	}
 
-	rc = dpu_writeback_init(dev, encoder, wb_formats,
-			n_formats);
+	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats, maxlinewidth);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 2a5a68366582..232b5f410de8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_framebuffer.h>
 
 #include "dpu_writeback.h"
 
@@ -24,6 +25,57 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 			dev->mode_config.max_height);
 }
 
+static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
+				    struct drm_atomic_state *state)
+{
+	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = conn_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *fb;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->mode;
+
+	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
+		  connector->base.id, mode->name, mode->hdisplay, mode->vdisplay);
+
+	if (!conn_state || !conn_state->connector) {
+		DPU_ERROR("invalid connector state\n");
+		return -EINVAL;
+	} else if (conn_state->connector->status != connector_status_connected) {
+		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
+		return -EINVAL;
+	}
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb = conn_state->writeback_job->fb;
+
+	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id, fb->width, fb->height);
+
+	if (fb->width != mode->hdisplay) {
+		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width, mode->hdisplay);
+		return -EINVAL;
+	} else if (fb->height != mode->vdisplay) {
+		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height, mode->vdisplay);
+		return -EINVAL;
+	} else if (fb->width > dpu_wb_conn->maxlinewidth) {
+		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
+			  fb->width, dpu_wb_conn->maxlinewidth);
+		return -EINVAL;
+	}
+
+	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
+}
+
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -59,12 +111,13 @@ static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
 
 static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
 	.get_modes = dpu_wb_conn_get_modes,
+	.atomic_check = dpu_wb_conn_atomic_check,
 	.prepare_writeback_job = dpu_wb_conn_prepare_job,
 	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
 };
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats)
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth)
 {
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
@@ -73,6 +126,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 
+	dpu_wb_conn->maxlinewidth = maxlinewidth;
+
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
 	/* DPU initializes the encoder and sets it up completely for writeback
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 5a75ea916101..4b11cca8014c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -18,6 +18,7 @@
 struct dpu_wb_connector {
 	struct drm_writeback_connector base;
 	struct drm_encoder *wb_enc;
+	u32 maxlinewidth;
 };
 
 static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
@@ -26,6 +27,6 @@ static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_conne
 }
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats);
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth);
 
 #endif /*_DPU_WRITEBACK_H */
-- 
2.39.2


