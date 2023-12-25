Return-Path: <linux-arm-msm+bounces-5954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E513981E0BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 14:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4752824CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C01E51C4F;
	Mon, 25 Dec 2023 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkSSVg3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3351C46
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccc6e509c8so5398011fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 05:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703509735; x=1704114535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds+hYbRdXt699nnqJQf9eScow4R7odD6pKoCP6ap1b0=;
        b=wkSSVg3t8V/lpjMajwdZzAsdhB+J88PnC44bT/gle0aqO2B4FqCuG/81LpFBIvBR19
         uhr/pBndMuYSqwjUkWV8S+n0kBJnejktxzQrpa0v7+cuHD0u5quOfuNL7YNn19LX3Cxj
         +6wtLOSwaCqOWE7cwD2jZFjCJx2xZiZGroP/j8Li8W0IcywkuxR9wChZEqnCjQaKcEvk
         dHiBJ39BHYceevFQGkwqaz5g0DV1PG/RrJkr0hFsSXGeHKQ0ojVVyU7iVf/8eUdtV8W8
         oLzSdMuAESMm/5o/J7fDj69tN2ddOvF6WqEIk85RBKeGCIMeEg9U+BCZdQHB07XUGpCM
         Wj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703509735; x=1704114535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds+hYbRdXt699nnqJQf9eScow4R7odD6pKoCP6ap1b0=;
        b=f7lpBbW0iG+W++JsY/XC7u1saloc8F9oAt+6vyQEva8ilA+445Bb+g7g8fW+Jn/+Os
         jRqkMoE+0W1nXQrzyvKB9vPNYS3nu7OVZsFwDCmyoMAtafTo4FZaWY655j8pBAwKYSod
         PZUhMrs42UDFmfnD6Cul+q4A4DmnDIGBtx8Kj4JJn1nYRwdoB6Hx0AncYCgu61LHZJF8
         ctDqybuCHdE3dDNRMNTOkv0LKDhGNFONxEv6rs5UdSj8OISKxoIjOrQdN7yJyGIEu7Xg
         DQNFey27rYuvQGCiIypBy0ZQQxaMmZtNrU3J6gre3DZwo8670lH50Gu9josuoHxxUyR6
         V+Jw==
X-Gm-Message-State: AOJu0YyybE/iLybwyC24Tk06ECoaczY2KSJG7Qrcx2baYqb09ZdJDcxL
	eRHkNdPo7lgcZII1Y5A2D0opsp1S2NnqWQ==
X-Google-Smtp-Source: AGHT+IG9a84U8JVAESOZxDil7OjvDwALjPx4uH+O5Ga6xIAhHHGNmYnz0SNMeFAoN/njtWkQa9ca8A==
X-Received: by 2002:a05:6512:1282:b0:50e:7e2d:1740 with SMTP id u2-20020a056512128200b0050e7e2d1740mr435868lfs.3.1703509735288;
        Mon, 25 Dec 2023 05:08:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:08:54 -0800 (PST)
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
Subject: [PATCH v3 1/5] drm/msm/dpu: split irq_control into irq_enable and _disable
Date: Mon, 25 Dec 2023 15:08:49 +0200
Message-Id: <20231225130853.3659424-2-dmitry.baryshkov@linaro.org>
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

The single helper for both enable and disable cases is too complicated,
especially if we start adding more code to these helpers. Split it into
irq_enable and irq_disable cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 65 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 46 +++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 29 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 62 ++++++++++++++----
 6 files changed, 158 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f2b82ca5efb3..5ab32ace7707 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -714,7 +714,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 }
 
-static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
+static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	int i;
@@ -726,14 +726,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	DPU_DEBUG_ENC(dpu_enc, "enable:%d\n", enable);
+	DPU_DEBUG_ENC(dpu_enc, "\n");
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys->ops.irq_control)
-			phys->ops.irq_control(phys, enable);
+		phys->ops.irq_enable(phys);
+	}
+}
+
+static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	if (!drm_enc) {
+		DPU_ERROR("invalid encoder\n");
+		return;
 	}
 
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		phys->ops.irq_disable(phys);
+	}
 }
 
 static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
@@ -759,11 +777,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 		pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 		/* enable all the irq */
-		_dpu_encoder_irq_control(drm_enc, true);
+		_dpu_encoder_irq_enable(drm_enc);
 
 	} else {
 		/* disable all the irq */
-		_dpu_encoder_irq_control(drm_enc, false);
+		_dpu_encoder_irq_disable(drm_enc);
 
 		/* disable DPU core clks */
 		pm_runtime_put_sync(&dpu_kms->pdev->dev);
@@ -824,7 +842,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, true);
 
@@ -879,7 +897,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		if (is_vid_mode &&
 			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		}
 		/* skip if is already OFF or IDLE, resources are off already */
 		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
@@ -954,7 +972,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode)
-			_dpu_encoder_irq_control(drm_enc, false);
+			_dpu_encoder_irq_disable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 993f26343331..8c5b0c853572 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -85,7 +85,8 @@ struct dpu_encoder_phys;
  * @handle_post_kickoff:	Do any work necessary post-kickoff work
  * @trigger_start:		Process start event on physical encoder
  * @needs_single_flush:		Whether encoder slaves need to be flushed
- * @irq_control:		Handler to enable/disable all the encoder IRQs
+ * @irq_enable:			Handler to enable all the encoder IRQs
+ * @irq_disable:		Handler to disable all the encoder IRQs
  * @prepare_idle_pc:		phys encoder can update the vsync_enable status
  *                              on idle power collapse prepare
  * @restore:			Restore all the encoder configs.
@@ -110,7 +111,8 @@ struct dpu_encoder_phys_ops {
 	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
 	bool (*needs_single_flush)(struct dpu_encoder_phys *phys_enc);
-	void (*irq_control)(struct dpu_encoder_phys *phys, bool enable);
+	void (*irq_enable)(struct dpu_encoder_phys *phys);
+	void (*irq_disable)(struct dpu_encoder_phys *phys);
 	void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a301e2833177..de826f9745e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -291,40 +291,42 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	return ret;
 }
 
-static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
-	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, phys_enc->vblank_refcount);
-
-	if (enable) {
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG],
-				dpu_encoder_phys_cmd_pp_tx_done_irq,
-				phys_enc);
+	trace_dpu_enc_phys_cmd_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_pp->idx - PINGPONG_0,
+					  phys_enc->vblank_refcount);
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_PINGPONG],
+				       dpu_encoder_phys_cmd_pp_tx_done_irq,
+				       phys_enc);
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_cmd_underrun_irq,
+				       phys_enc);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_cmd_underrun_irq,
-				phys_enc);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
-
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START],
-					dpu_encoder_phys_cmd_ctl_start_irq,
-					phys_enc);
-	} else {
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START]);
+					       phys_enc->irq[INTR_IDX_CTL_START],
+					       dpu_encoder_phys_cmd_ctl_start_irq,
+					       phys_enc);
+}
 
+static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_cmd_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_pp->idx - PINGPONG_0,
+					   phys_enc->vblank_refcount);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG]);
-	}
+						 phys_enc->irq[INTR_IDX_CTL_START]);
+
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -713,7 +715,8 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_tx_complete = dpu_encoder_phys_cmd_wait_for_tx_complete;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
-	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
+	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
 	ops->restore = dpu_encoder_phys_cmd_enable_helper;
 	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
 	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..9743ec43d862 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -615,30 +615,33 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 	}
 }
 
-static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_vid_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
 	int ret;
 
-	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
-			    phys_enc->hw_intf->idx - INTF_0,
-			    enable,
-			   phys_enc->vblank_refcount);
+	trace_dpu_enc_phys_vid_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_intf->idx - INTF_0,
+					  phys_enc->vblank_refcount);
 
-	if (enable) {
-		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
-		if (WARN_ON(ret))
-			return;
-
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_vid_underrun_irq,
-				phys_enc);
-	} else {
-		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-	}
+	ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
+	if (WARN_ON(ret))
+		return;
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_vid_underrun_irq,
+				       phys_enc);
+}
+
+static void dpu_encoder_phys_vid_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_vid_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_intf->idx - INTF_0,
+					   phys_enc->vblank_refcount);
+
+	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					 phys_enc->irq[INTR_IDX_UNDERRUN]);
 }
 
 static int dpu_encoder_phys_vid_get_line_count(
@@ -689,7 +692,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_tx_complete;
-	ops->irq_control = dpu_encoder_phys_vid_irq_control;
+	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a..602013725484 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -511,21 +511,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 }
 
 /**
- * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
+ * dpu_encoder_phys_wb_irq_enable - irq control of WB
  * @phys:	Pointer to physical encoder
- * @enable:	indicates enable or disable interrupts
  */
-static void dpu_encoder_phys_wb_irq_ctrl(
-		struct dpu_encoder_phys *phys, bool enable)
+static void dpu_encoder_phys_wb_irq_enable(struct dpu_encoder_phys *phys)
 {
 
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
 
-	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
+	if (atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
 		dpu_core_irq_register_callback(phys->dpu_kms,
-				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
-	else if (!enable &&
-			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
+					       phys->irq[INTR_IDX_WB_DONE],
+					       dpu_encoder_phys_wb_done_irq,
+					       phys);
+}
+
+/**
+ * dpu_encoder_phys_wb_irq_disable - irq control of WB
+ * @phys:	Pointer to physical encoder
+ */
+static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
+{
+
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
+
+	if (atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
@@ -785,7 +795,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->trigger_start = dpu_encoder_helper_trigger_start;
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
-	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->irq_enable = dpu_encoder_phys_wb_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_wb_irq_disable;
 	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
 
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 35d03b121a0b..95ce7647ff76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -514,24 +514,41 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
 		  __entry->expected_time, __entry->atomic_cnt)
 );
 
-TRACE_EVENT(dpu_enc_phys_cmd_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp, bool enable,
+TRACE_EVENT(dpu_enc_phys_cmd_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
 		 int refcnt),
-	TP_ARGS(drm_id, pp, enable, refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,		drm_id	)
+		__field(	enum dpu_pingpong,	pp	)
+		__field(	int,			refcnt	)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->pp = pp;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
+		  __entry->refcnt)
+);
+
+TRACE_EVENT(dpu_enc_phys_cmd_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
+		 int refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id	)
 		__field(	enum dpu_pingpong,	pp	)
-		__field(	bool,			enable	)
 		__field(	int,			refcnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->pp = pp;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, pp=%d, enable=%s, refcnt=%d", __entry->drm_id,
-		  __entry->pp, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
 		  __entry->refcnt)
 );
 
@@ -592,24 +609,41 @@ TRACE_EVENT(dpu_enc_phys_vid_post_kickoff,
 	TP_printk("id=%u, intf_idx=%d", __entry->drm_id, __entry->intf_idx)
 );
 
-TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx, bool enable,
+TRACE_EVENT(dpu_enc_phys_vid_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
 		 int refcnt),
-	TP_ARGS(drm_id, intf_idx, enable, refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,	drm_id		)
+		__field(	enum dpu_intf,	intf_idx	)
+		__field(	int,		refcnt		)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->intf_idx = intf_idx;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
+		  __entry->drm_id)
+);
+
+TRACE_EVENT(dpu_enc_phys_vid_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
+		 int refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id		)
 		__field(	enum dpu_intf,	intf_idx	)
-		__field(	bool,		enable		)
 		__field(	int,		refcnt		)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->intf_idx = intf_idx;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, intf_idx=%d enable=%s refcnt=%d", __entry->drm_id,
-		  __entry->intf_idx, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
 		  __entry->drm_id)
 );
 
-- 
2.39.2


