Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9623AB575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 16:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhFQOLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 10:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhFQOLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 10:11:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F0FC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r198so10714364lff.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WfFXrar9tq9d2GnwBn8aV9oDZ7o99TslqCnz61e/wow=;
        b=JKPGoCBDdqU6HIXYOfRt8Gdmd4I6H92S3Gi4hNgmDVvXCYzS/zfzYUETniMvp3Qzl6
         QPO2ef68n2UQF0ECPUnx3N4I7sVoT7aiUFn6dRP4grXnpfrlpwCl5UxhIb0ikZvXq+95
         zsn2oPevMSc9Go2deGtXZaQIbzr2bbd6SyQV1Jj7+l0lxKg4IEjDZho9Fu8yvXFESeY2
         bMJmvcpG1tSVwJcKaOwBB2ilkfdTgUDqypGMQqm0BMMFFGMdiE82QIu3id7lbafre5Ep
         Ji2DKGhRxgjZm7khh9l33iCR8WiIasskuV0E1cpGm6bZ5xo/RE5K/RLri1CruT6NLp9k
         fFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WfFXrar9tq9d2GnwBn8aV9oDZ7o99TslqCnz61e/wow=;
        b=kjtRxrHcotkBvY/eSRQc9kY5nw5d2pg7SMWVcpnOVQDp4uxsPzrx298eI5kWAq7TVz
         Jio2Oe5bPbFCdcsY25TOMQadQX5uL1Rz4tQfPyzlwg2I0EKjFkVs/oRRG4mzZPYyN9zN
         1+vZXjbD018iTTLp/vkaME15D+hpCUmqHTrku0JJLNgBQSM8ZjPQH7U9zr4rQ0DlyW3K
         vP+RCQX8v7ERaVeUokuf28A6k2NBxfaTVYtP42BgF/KJwN6g2EPi7ICrytraiGYS6D01
         U8/fIrQepgHwQm14sUwvZOB+ZhVetCfMB38UnCGgQKlzDuYCIe4H0252vkF85/UMEnSf
         g0Xg==
X-Gm-Message-State: AOAM533t4QzqYgNgrfi9717go6mENK11j5AR6c2KqvMnWuEZPvsIoFp/
        EkDcOyffq9iq0QktDGd+6Ncwxw==
X-Google-Smtp-Source: ABdhPJxI4v41L+TxT3WTPpc6FJQisyIeNwxRBOLQxx3lyi8xBEjz1QO5UZwaO3sVSUA4iFNHFj6omA==
X-Received: by 2002:a05:6512:4de:: with SMTP id w30mr4227207lfq.480.1623938955519;
        Thu, 17 Jun 2021 07:09:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:09:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 6/7] drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
Date:   Thu, 17 Jun 2021 17:09:07 +0300
Message-Id: <20210617140908.412298-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
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
index 186b2f87d193..23a7a22d4f3f 100644
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
index dbc8f0811dd1..d5d4ee7f0a10 100644
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
index 21722cdfaaf7..7cf4ee28412f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -407,10 +407,13 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
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
@@ -542,7 +545,9 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
 		msm_disp_snapshot_state(drm_enc->dev);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
+				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
 	}
 }
 
@@ -631,10 +636,14 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
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
index 124b38e2102c..dc815a83fedd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -487,6 +487,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	}
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_register_success(irq_idx);
+
 	return 0;
 }
 
@@ -544,6 +546,8 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	}
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_unregister_success(irq_idx);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index d0b04e2668d1..f9f6326416f0 100644
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

