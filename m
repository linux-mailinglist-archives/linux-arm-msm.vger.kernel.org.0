Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975424B97BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiBQEcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:32:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbiBQEcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:32:10 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A767220E7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:55 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u16so6492674ljk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuHJT/ilHnfIvakQlcf7DLkm/nE9veQjpahHC8SXWEk=;
        b=IphCEEOs6JhyHGzvR2ncvPOiXJ1UU/6Wljbahll6pZm54K219xSr12BJ7GA36+h8Es
         J0pHVVSzb3XBZO+ukIKF2mIbFu3YAvssigJbV5vhy2pNv6B3BFuLPMH9lTjtSPjMPab7
         qZgPo8VyWqNIfAZUXYqmDDvzxHN4pch3mHLPYsTw8YjShhwwPjmIfCIDLD1qEXZTnzkk
         zn6fL+o3v5FOp/kUEqRrgbOhGCQrq3S/1vdPipnCBplX1V6l52opVAgq5l56r11T+9r5
         Acf+waFnBI7ogPP2fLdcynBCY6FaEK7/8WbKo9xst5DH8a/u2HUG1P9PokpIAWYyxV3p
         a7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuHJT/ilHnfIvakQlcf7DLkm/nE9veQjpahHC8SXWEk=;
        b=BePvbAR5tS8BCOoVA3ILzCG6hWWVpH+wLSZ5RfmWC/CtemWmb0XpgFteNtxC2u57bs
         y4yGj0xem/23LSktllugyBXpZ3iYA1PrZPYw+3Q1XYCwehm1qce0oq91SfSkEDTH9oLo
         dm/mDuLFzq0GiciSBgKmOdqvswZuljhK5VWir7r5TlXDbmP6Cee+yyioaDiV5pa3bGt3
         RMN5VqNp8zVvjEBrtf6O+jk28UGBvrm5mIzZj3VcNyOjHgH5sZexfysC99XEB/PZ6PEl
         /5lCozmEnCZPWhtJIAlmnmdnLcK1Xm3TLFgGvBgCgwnGJZFMJuCEDdZK70YAbjFi4six
         FV7A==
X-Gm-Message-State: AOAM531GL9skB6Dtjritz1zRi9UexAvYHY1oC8PjqJHFhL5oJkdlM4ty
        sO5ZZ4zd88xjkwNM9PvRA8tUng==
X-Google-Smtp-Source: ABdhPJwGypqML0FjR6YrpZCcWfslfnNMYRbUOLn/Pnd9DKzIZjynN+7goVih/HRXG+QzgU9SArZz8Q==
X-Received: by 2002:a05:651c:1782:b0:244:cb09:c317 with SMTP id bn2-20020a05651c178200b00244cb09c317mr970795ljb.488.1645072312740;
        Wed, 16 Feb 2022 20:31:52 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:31:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 4/6] drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
Date:   Thu, 17 Feb 2022 07:31:46 +0300
Message-Id: <20220217043148.480898-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
dpu_core_register/unregister_callback directly, without surrounding them
with helpers.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 63 -------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 18 ------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 34 ++++++----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 18 ++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 29 +++------
 6 files changed, 48 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 17ca149e7dcd..dbcbf96cf8eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -333,69 +333,6 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
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
-	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx);
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
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
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
index a0652bdcf59b..ca7d557312ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -211,7 +211,8 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
 		msm_disp_snapshot_state(drm_enc->dev);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
 	}
 
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -277,10 +278,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
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
+				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
 
 end:
 	if (ret) {
@@ -301,21 +304,28 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
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
+					phys_enc->irq[INTR_IDX_CTL_START].irq_idx);
 
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_UNDERRUN);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_PINGPONG);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 407e45e2010b..50c063de1509 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -404,10 +404,12 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
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
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
 
 end:
 	if (ret) {
@@ -539,7 +541,8 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
 		msm_disp_snapshot_state(drm_enc->dev);
-		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
+		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
 	}
 }
 
@@ -628,10 +631,13 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
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
+				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 8297498f2279..78e1eca6aa70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -469,6 +469,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 					irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_register_success(irq_idx);
+
 	return 0;
 }
 
@@ -497,6 +499,8 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
+	trace_dpu_irq_unregister_success(irq_idx);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 2d492b03a8b1..60f63a15a894 100644
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
2.34.1

