Return-Path: <linux-arm-msm+bounces-2963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F180152A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF9B212CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA05659B4F;
	Fri,  1 Dec 2023 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MczMDKxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F318910E5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:19:01 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so34502081fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465540; x=1702070340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHrZLAi92FKs5kfh1kgknP+M8Pj6Rn7s//8U937xufs=;
        b=MczMDKxFcVUR1XwdQ3LPzb/8dWQvMkFdru2embuLkk0MeZfZWEBkbk8ftVXVDngfGw
         K4UUrM1FCeMwW+8nX7XliH0CO4eaRMNBtr0trlFQqFxePSQ3WHie1loMOG8Qun9ZTJ10
         P65F8E4Dccu1TVFhB2TQpDwFQ85XXukvcQwu2zcmsb0gF7L9pM+TA9YrCK+fmgcsZJM/
         2zLo2KkfLkWCk5upc2TyuwuoFt8Uod0ZA/gmIKHJ1sQRsiPgWZQwp6K9tVc/JAghsWkr
         SxY+Wx6anuMpj47ztNv2ZDXgxhKAHqvEDAOySwE9YQYICebNjfqlnASfqw/hyv43mVin
         l/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465540; x=1702070340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHrZLAi92FKs5kfh1kgknP+M8Pj6Rn7s//8U937xufs=;
        b=lrhrAR+mVkFb9RoPZDMmAcBwoauhQ+bK2krN77Y/UI73XQS7U0Lu4KaVYwGHJcQywL
         qiFrwADKEaAjv5DYhuuqFKsClYCX/7szTZQU8a7P9C/mVxRCWgJZ0b0DztNLt0BqJnCg
         HLXNilZXJiFlTVLCwvwUUUpawH7KVsy2AOeaXWLHIgE/2faztDfZhNEVDNIbAPNWcXq9
         yqhmZgH9zarou8jGFOn6APCHLsa1wSrHoNV7VXEKSsVnBZvlhl8apI1KoKGsncIGaAhJ
         JqncUF124BcUzdV/uxvqplTHkiowbc5RPm7bdwGh5eL30kD2YsWX+dDSksSCkc4d6kgg
         Soqw==
X-Gm-Message-State: AOJu0YyukPUv7bEzLoKWZswmOny8qnFVIiAxiijWhfCPMUuoNqFNBb5Z
	viLw6wS6gx+HqRGFKnUdAK8k7A==
X-Google-Smtp-Source: AGHT+IGE0NInCP5/gptARcB/89iUZoJgeKJ/TuGMq40sEDyIRFsADTnkEcqZuSheicTFf+YqD8+syQ==
X-Received: by 2002:a2e:3518:0:b0:2c9:954b:7249 with SMTP id z24-20020a2e3518000000b002c9954b7249mr1274903ljz.4.1701465540332;
        Fri, 01 Dec 2023 13:19:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:59 -0800 (PST)
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
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 11/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
Date: Sat,  2 Dec 2023 00:18:43 +0300
Message-Id: <20231201211845.1026967-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change struct allocation of encoder's phys backend data to use
drmm_kzalloc(). This removes the need to perform any actions on encoder
destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  9 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 ++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++++--------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 ++++---------------
 5 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..fdbaa92ec1ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2173,6 +2173,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
 }
 
 static int dpu_encoder_virt_add_phys_encs(
+		struct drm_device *dev,
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
 		struct dpu_enc_phys_init_params *params)
@@ -2194,7 +2195,7 @@ static int dpu_encoder_virt_add_phys_encs(
 
 
 	if (disp_info->intf_type == INTF_WB) {
-		enc = dpu_encoder_phys_wb_init(params);
+		enc = dpu_encoder_phys_wb_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
@@ -2205,7 +2206,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
 	} else if (disp_info->is_cmd_mode) {
-		enc = dpu_encoder_phys_cmd_init(params);
+		enc = dpu_encoder_phys_cmd_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
@@ -2216,7 +2217,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
 	} else {
-		enc = dpu_encoder_phys_vid_init(params);
+		enc = dpu_encoder_phys_vid_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
@@ -2305,7 +2306,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			break;
 		}
 
-		ret = dpu_encoder_virt_add_phys_encs(disp_info,
+		ret = dpu_encoder_virt_add_phys_encs(dpu_kms->dev, disp_info,
 				dpu_enc, &phys_params);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77..5dc53b65040e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -281,22 +281,24 @@ struct dpu_encoder_wait_info {
  * @p:	Pointer to init params structure
  * Return: Error code or newly allocated encoder
  */
-struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
+struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
  * dpu_encoder_phys_cmd_init - Construct a new command mode physical encoder
+ * @dev:  Corresponding device for devres management
  * @p:	Pointer to init params structure
  * Return: Error code or newly allocated encoder
  */
-struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
+struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
  * dpu_encoder_phys_wb_init - initialize writeback encoder
+ * @dev:  Corresponding device for devres management
  * @init:	Pointer to init info structure with initialization params
  */
-struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
+struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index be185fe69793..d24f45d1f654 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -13,6 +13,8 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/drm_managed.h>
+
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
 		(e)->base.parent->base.id : -1, \
@@ -558,14 +560,6 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_encoder_phys_cmd *cmd_enc =
-		to_dpu_encoder_phys_cmd(phys_enc);
-
-	kfree(cmd_enc);
-}
-
 static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -731,7 +725,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
-	ops->destroy = dpu_encoder_phys_cmd_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
@@ -746,7 +739,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->get_line_count = dpu_encoder_phys_cmd_get_line_count;
 }
 
-struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
+struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -754,7 +747,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	DPU_DEBUG("intf\n");
 
-	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
+	cmd_enc = drmm_kzalloc(dev, sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
 		DPU_ERROR("failed to allocate\n");
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda711883..69bc1b2e514c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -11,6 +11,8 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/drm_managed.h>
+
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->parent ? \
 		(e)->parent->base.id : -1, \
@@ -438,12 +440,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		phys_enc->enable_state = DPU_ENC_ENABLING;
 }
 
-static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	DPU_DEBUG_VIDENC(phys_enc, "\n");
-	kfree(phys_enc);
-}
-
 static int dpu_encoder_phys_vid_wait_for_vblank(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -681,7 +677,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
-	ops->destroy = dpu_encoder_phys_vid_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
@@ -694,7 +689,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
 }
 
-struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
+struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -704,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-EINVAL);
 	}
 
-	phys_enc = kzalloc(sizeof(*phys_enc), GFP_KERNEL);
+	phys_enc = drmm_kzalloc(dev, sizeof(*phys_enc), GFP_KERNEL);
 	if (!phys_enc) {
 		DPU_ERROR("failed to create encoder due to memory allocation error\n");
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 0b6a761d68b7..bb94909caa25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 
 #include "dpu_encoder_phys.h"
 #include "dpu_formats.h"
@@ -580,20 +581,6 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-/**
- * dpu_encoder_phys_wb_destroy - destroy writeback encoder
- * @phys_enc:	Pointer to physical encoder
- */
-static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	if (!phys_enc)
-		return;
-
-	DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
-
-	kfree(phys_enc);
-}
-
 static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc,
 		struct drm_writeback_job *job)
 {
@@ -689,7 +676,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
-	ops->destroy = dpu_encoder_phys_wb_destroy;
 	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
@@ -705,9 +691,10 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 
 /**
  * dpu_encoder_phys_wb_init - initialize writeback encoder
+ * @dev:  Corresponding device for devres management
  * @p:	Pointer to init info structure with initialization params
  */
-struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
+struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -720,7 +707,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 		return ERR_PTR(-EINVAL);
 	}
 
-	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
+	wb_enc = drmm_kzalloc(dev, sizeof(*wb_enc), GFP_KERNEL);
 	if (!wb_enc) {
 		DPU_ERROR("failed to allocate wb phys_enc enc\n");
 		return ERR_PTR(-ENOMEM);
-- 
2.39.2


