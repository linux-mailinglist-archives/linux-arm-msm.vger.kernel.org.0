Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7EC3ABEC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhFQWWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbhFQWWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:47 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE67C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:39 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g13so838730ljj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58NuorL/oEtWT18DNmhnlatiHP80rDWDFnXyp4eWGaY=;
        b=wp1jijOoirUAkTBzrmx3UUZFdxae9oKyZ+IymBQLmp1N7MxRb+4Z3WwIS5bT3QRrzE
         RL6QcdNTI3OJQm0L3h2o7xRRa1rYL6DZvYz035abg71T4xhmUcfCbSSH1LZq+sx9EwCy
         lDm+b8xM3tsN3C1nko0hOG+d8MIqGvFpkYL/c6wusGYmtcRwQl4LU1xRGf9rkcpoTtCr
         bAJFkEc/4BNIirclj1MR40c0WRVkDP8JtXnL+qjObX/C9vFW/BAbE/1KDMxGcA6NzIIJ
         Q2wNMQE2wCTqiuiZhsxG/fbG6oyXTJX5VZGPvVwmvficE+xs1yX2ibtOzEF9pvgDwEWP
         E5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58NuorL/oEtWT18DNmhnlatiHP80rDWDFnXyp4eWGaY=;
        b=AERhQsoEmdhzMMMghu6zei4q2LkoI2qhGHE3LfzSSlIUJx9p3YXJ4JRDCpw4Byuk6r
         n9PihTyMTc1Eqz6rOmNw3Zg9stbgag0ZA027xH9YYRfsIvXGsThnw4dw+pUuVthM4Mbv
         pFnFRz8xIxLeGUeLdB2tpZdSA06op6kCjEwIb6sxL9tzwv19ROJ1G7PaWUO3fVylWCRU
         8SxPOaC+jWFzR1UYZb0dY0W6rWJLNW/mEYJx47RuhgrVL8UJ8X8Lo7Nrh+a3CSidguQi
         qfQH2Anfpa/JA4oIfwrPUcYIzBGIw5T2/jQ27fDhIR0Pw7FwgRco7UeeCLREiHfWPyGS
         wguQ==
X-Gm-Message-State: AOAM532Qa4q508pqlAc71csrIZ+UyYan3amXIceeICrSVuMPWZ5IjI57
        GXsm+m0+yoOwU6OG1DZT0jAMcQ==
X-Google-Smtp-Source: ABdhPJwYby76mIf4lsB1hCDE3sFttAP+WosyY9sNO5SG4xUbH0nAhYSVaDRWyzanfLFGDi83hlpacA==
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr6799179lji.200.1623968437422;
        Thu, 17 Jun 2021 15:20:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:20:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
Date:   Fri, 18 Jun 2021 01:20:28 +0300
Message-Id: <20210617222029.463045-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
dpu_core_register/unregister_callback directly, without surrounding them
with helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 64 -------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 18 ------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 39 +++++++----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 21 ++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 29 +++------
 6 files changed, 56 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d3557b0f4db9..3d8864df8605 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -333,70 +333,6 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	return ret;
 }
 
-int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx)
-{
-	struct dpu_encoder_irq *irq;
-	int ret = 0;
-
-	if (intr_idx >= INTR_IDX_MAX) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-	irq = &phys_enc->irq[intr_idx];
-
-	if (irq->irq_idx < 0) {
-		DPU_ERROR_PHYS(phys_enc,
-			"invalid IRQ index:%d\n", irq->irq_idx);
-		return -EINVAL;
-	}
-
-	ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
-			irq->func, phys_enc);
-	if (ret) {
-		DPU_ERROR_PHYS(phys_enc,
-			"failed to register IRQ callback for %s\n",
-			irq->name);
-		irq->irq_idx = -EINVAL;
-		return ret;
-	}
-
-	trace_dpu_enc_irq_register_success(DRMID(phys_enc->parent), intr_idx,
-				irq->irq_idx);
-
-	return ret;
-}
-
-int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx)
-{
-	struct dpu_encoder_irq *irq;
-	int ret;
-
-	irq = &phys_enc->irq[intr_idx];
-
-	/* silently skip irqs that weren't registered */
-	if (irq->irq_idx < 0) {
-		DRM_ERROR("duplicate unregister id=%u, intr=%d, irq=%d",
-			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx);
-		return 0;
-	}
-
-	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
-			irq->func, phys_enc);
-	if (ret) {
-		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
-			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx, ret);
-	}
-
-	trace_dpu_enc_irq_unregister_success(DRMID(phys_enc->parent), intr_idx,
-					     irq->irq_idx);
-
-	return 0;
-}
-
 int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 80d87871fd94..ff2218155b44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -364,22 +364,4 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx,
 		struct dpu_encoder_wait_info *wait_info);
 
-/**
- * dpu_encoder_helper_register_irq - register and enable an irq
- * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: encoder interrupt index
- * @Return: 0 or -ERROR
- */
-int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx);
-
-/**
- * dpu_encoder_helper_unregister_irq - unregister and disable an irq
- * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: encoder interrupt index
- * @Return: 0 or -ERROR
- */
-int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx);
-
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index f921a5c99456..4bfeac821f51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -211,7 +211,9 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
 		msm_disp_snapshot_state(drm_enc->dev);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
+				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
 	}
 
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -277,10 +279,13 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		      enable ? "true" : "false", refcount);
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_RDPTR);
+		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
+				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_encoder_helper_unregister_irq(phys_enc,
-				INTR_IDX_RDPTR);
+		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
+				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
 
 end:
 	if (ret) {
@@ -301,21 +306,31 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 			enable, atomic_read(&phys_enc->vblank_refcount));
 
 	if (enable) {
-		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_PINGPONG);
-		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_UNDERRUN);
+		dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
+				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
+		dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
+				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
 
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_encoder_helper_register_irq(phys_enc,
-					INTR_IDX_CTL_START);
+			dpu_core_irq_register_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
+					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
 	} else {
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_encoder_helper_unregister_irq(phys_enc,
-					INTR_IDX_CTL_START);
+			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
+					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
 
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_UNDERRUN);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
+				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_PINGPONG);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
+				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 437af231d6a4..7f605287a377 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -404,10 +404,13 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 		      atomic_read(&phys_enc->vblank_refcount));
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_VSYNC);
+		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
+				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_encoder_helper_unregister_irq(phys_enc,
-				INTR_IDX_VSYNC);
+		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
+				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
 
 end:
 	if (ret) {
@@ -539,7 +542,9 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
 		msm_disp_snapshot_state(drm_enc->dev);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
+				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
 	}
 }
 
@@ -628,10 +633,14 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 		if (WARN_ON(ret))
 			return;
 
-		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_UNDERRUN);
+		dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
+				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
 	} else {
 		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_UNDERRUN);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
+				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 9b74cfdf5355..557ad831e651 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -451,6 +451,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 					irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_register_success(irq_idx);
+
 	return 0;
 }
 
@@ -493,6 +495,8 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_unregister_success(irq_idx);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 1e2619556f93..58b7b8654543 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -167,33 +167,24 @@ TRACE_EVENT(dpu_perf_crtc_update,
 			__entry->update_clk)
 );
 
-DECLARE_EVENT_CLASS(dpu_enc_irq_template,
-	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
-		 int irq_idx),
-	TP_ARGS(drm_id, intr_idx, irq_idx),
+DECLARE_EVENT_CLASS(dpu_irq_template,
+	TP_PROTO(int irq_idx),
+	TP_ARGS(irq_idx),
 	TP_STRUCT__entry(
-		__field(	uint32_t,		drm_id		)
-		__field(	enum dpu_intr_idx,	intr_idx	)
 		__field(	int,			irq_idx		)
 	),
 	TP_fast_assign(
-		__entry->drm_id = drm_id;
-		__entry->intr_idx = intr_idx;
 		__entry->irq_idx = irq_idx;
 	),
-	TP_printk("id=%u, intr=%d, irq=%d",
-		  __entry->drm_id, __entry->intr_idx,
-		  __entry->irq_idx)
+	TP_printk("irq=%d", __entry->irq_idx)
 );
-DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_register_success,
-	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
-		 int irq_idx),
-	TP_ARGS(drm_id, intr_idx, irq_idx)
+DEFINE_EVENT(dpu_irq_template, dpu_irq_register_success,
+	TP_PROTO(int irq_idx),
+	TP_ARGS(irq_idx)
 );
-DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_unregister_success,
-	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
-		 int irq_idx),
-	TP_ARGS(drm_id, intr_idx, irq_idx)
+DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
+	TP_PROTO(int irq_idx),
+	TP_ARGS(irq_idx)
 );
 
 TRACE_EVENT(dpu_enc_irq_wait_success,
-- 
2.30.2

