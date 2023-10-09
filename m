Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A100F7BD700
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 11:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345822AbjJIJ3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 05:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345742AbjJIJ33 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 05:29:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C3DB6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 02:29:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50307acd445so5412675e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696843764; x=1697448564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVwMJP0/SPDt31jQ8TATKalr6/tapoN+GlCQyYbUs7w=;
        b=XwGm5F9dgEXc49w7srF/PZco05xQuO5fX6e+RAw/U7QcnLHiu74NkJQVJb1yiKIyD0
         MAtIekFx+BPjBUAs9Usylw2yvu6aCr7Fk/lfVyiEyVhgYGlEv7IXsZp/ocicDyyeatFw
         81xIfceyCjwKBMNftZPv67mKWOi6/8k7H14Ud7dSUO1pv5DOVEYcS+WbxCcMNCyGeFDe
         V5Ev8fgeVNDvwA2/VJ0vaDQ0jGgOBkcfy+34v/kPEucr1wKfuGkA6sph+IuZxgF8y3WW
         jPh9wtLkh55Ozj0QKPEcelghXGn6IxV5t3R/C6Ez1Z8dMS2tyiZ7IkgN2qSDM6lpoMYO
         OGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696843764; x=1697448564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVwMJP0/SPDt31jQ8TATKalr6/tapoN+GlCQyYbUs7w=;
        b=FxakVNeUxon6hdEsLPtol1dP5v60hdazcjBG5cT73w7Lwmiygz1Gzt5KzWbxgc1JWi
         FnZ4mHB9EJzXQBreONcINfb/WFt6pDz9sSGqSl2blF3ntE4b6xSD8CPt33n5l4Xy4IMf
         qZZz3LFkRLI8gLt0Z51mxVmz4ekHHeme44alQRdEUk+kgfFGrU7KQ3Uhc6hO3t93aj5q
         KukaNiRwBOsoBQmRFMeMLHOqHwh4eoPKsahES8+smQzdmv9AIaXSjTv1MO92cNoiw5oQ
         pBKYedD95xahizGpk5GZZBiwhTb+amFsAKxfk+57eIm7dK734BPXtisJzk84KqUyp1qd
         oVOA==
X-Gm-Message-State: AOJu0Yy0prwtn3p+mBsQcAQDqctncEFAuaKbeTuOHtrpG8SBuf8bjsUW
        ZivBIvCTGmqpEdjReRcOS6UuKjQ/KcKW0fltVWoNvOJH
X-Google-Smtp-Source: AGHT+IENgnpVlTSE4EbQuRQOvobKoDdXbS3pi3c/w5mJlgvj+8wCbA82iDef+CFSDsFtGMG4sjqGUw==
X-Received: by 2002:a05:6512:39d1:b0:504:30eb:f2ac with SMTP id k17-20020a05651239d100b0050430ebf2acmr15447702lfu.68.1696843764463;
        Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n24-20020a195518000000b004ff9ab6463fsm1377495lfe.87.2023.10.09.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/dpu: split irq_control into irq_enable and _disable
Date:   Mon,  9 Oct 2023 12:29:20 +0300
Message-Id: <20231009092922.2590891-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
References: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The single helper for both enable and disable cases is too complicated,
especially if we start adding more code to these helpers. Split it into
irq_enable and irq_disable cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 ++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 63 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 44 +++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 29 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 62 +++++++++++++-----
 6 files changed, 156 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..46f4abe54cbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -729,7 +729,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 }
 
-static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
+static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	int i;
@@ -741,14 +741,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 
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
@@ -774,11 +792,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
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
@@ -839,7 +857,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, true);
 
@@ -894,7 +912,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		if (is_vid_mode &&
 			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		}
 		/* skip if is already OFF or IDLE, resources are off already */
 		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
@@ -969,7 +987,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode)
-			_dpu_encoder_irq_control(drm_enc, false);
+			_dpu_encoder_irq_disable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77..f241d7312279 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,7 +84,8 @@ struct dpu_encoder_phys;
  * @handle_post_kickoff:	Do any work necessary post-kickoff work
  * @trigger_start:		Process start event on physical encoder
  * @needs_single_flush:		Whether encoder slaves need to be flushed
- * @irq_control:		Handler to enable/disable all the encoder IRQs
+ * @irq_enable:			Handler to enable all the encoder IRQs
+ * @irq_disable:		Handler to disable all the encoder IRQs
  * @prepare_idle_pc:		phys encoder can update the vsync_enable status
  *                              on idle power collapse prepare
  * @restore:			Restore all the encoder configs.
@@ -111,7 +112,8 @@ struct dpu_encoder_phys_ops {
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
index be185fe69793..6b902d3fcebe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -280,40 +280,42 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	return ret;
 }
 
-static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
-	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, atomic_read(&phys_enc->vblank_refcount));
-
-	if (enable) {
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG],
-				dpu_encoder_phys_cmd_pp_tx_done_irq,
-				phys_enc);
+	trace_dpu_enc_phys_cmd_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_pp->idx - PINGPONG_0,
+					  atomic_read(&phys_enc->vblank_refcount));
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
+					       phys_enc->irq[INTR_IDX_CTL_START],
+					       dpu_encoder_phys_cmd_ctl_start_irq,
+					       phys_enc);
+}
 
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START],
-					dpu_encoder_phys_cmd_ctl_start_irq,
-					phys_enc);
-	} else {
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START]);
+static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_cmd_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_pp->idx - PINGPONG_0,
+					   atomic_read(&phys_enc->vblank_refcount));
 
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
@@ -739,7 +741,8 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_vblank = dpu_encoder_phys_cmd_wait_for_vblank;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
-	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
+	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
 	ops->restore = dpu_encoder_phys_cmd_enable_helper;
 	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
 	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda711883..d9dcf3e87bd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -610,30 +610,33 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
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
-			    atomic_read(&phys_enc->vblank_refcount));
+	trace_dpu_enc_phys_vid_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_intf->idx - INTF_0,
+					  atomic_read(&phys_enc->vblank_refcount));
 
-	if (enable) {
-		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
-		if (WARN_ON(ret))
-			return;
+	ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
+	if (WARN_ON(ret))
+		return;
 
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_vid_underrun_irq,
-				phys_enc);
-	} else {
-		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-	}
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
+					   atomic_read(&phys_enc->vblank_refcount));
+
+	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					 phys_enc->irq[INTR_IDX_UNDERRUN]);
 }
 
 static int dpu_encoder_phys_vid_get_line_count(
@@ -686,7 +689,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
-	ops->irq_control = dpu_encoder_phys_vid_irq_control;
+	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 870a1f5060e3..9b0f73955d9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -376,21 +376,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
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
 
@@ -665,7 +675,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
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

