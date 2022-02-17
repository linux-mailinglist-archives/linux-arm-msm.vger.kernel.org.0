Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F504B97BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbiBQEcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:32:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiBQEcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:32:11 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4C5240A5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:56 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id c15so6421205ljf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Ij795RFmdPjNFDRfADbJ6/13zfauvOFlKnSWJ8Cp4A=;
        b=a6fYVOjOQpMH3S7kbP8Doy1yIiPTLrvUFX7THjNn/OpJNuWftgyBHWuVzsUmygc2nE
         OmT4qZYSiu9nInWmQuM3skoLA20Qa1ef4/AzA/KUFoSBUdNBmZrNG8abulOFihOJ4eSu
         3sWgBIAFDHxuQ1iSpXFAnMmOCr96iIe7YboC2pkzukLOQ9WaKKTs5BXHTZk/XraOiB/9
         CwhFzP3PvEJqlESGCMSL9uTCMtxhTepeWqMx06MYDA83kO4+V/vw7Fhl0mcPMgg3g7EI
         QeBxtmUSNB2/XocjpgXz6MJNBt+KawHxr4IMRaEBSD4zEYNuxA9d6K44z29E7pgXjZxF
         eIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Ij795RFmdPjNFDRfADbJ6/13zfauvOFlKnSWJ8Cp4A=;
        b=Z/7Ina2TAxelM7XFXui5OHjtzaAEGuPL7LxLrQ6zDHG+ywMjCXp1Dg/jayC2QE0V5w
         7dc5RipRCwP1lQXoVIbnMibvgND5IOMVaipRaBJ0/AZEqe2v93TCXaWeky0r+gKfNeir
         VeDF4P1cZsgRCfKOfMMk9zIhwHTABk9sHqdfjBZ1hBwRlKk9i0t8jlmnCN2fcAYGxOER
         YRBi0euDh5wcL46Qj0d9Y1KLuurgtXbORwLIzw3oIq7TVLHNzk3lCJQD7XF93jkTlgjS
         q9aqLP6wG2pV/m9d2kTD+f76YUJXHdbMUnyTXvOc3eWRibAHMq97jSqHYYiqb0qfL++9
         NETg==
X-Gm-Message-State: AOAM531rxnDt+jICAaTwNkkpvNPAKfkFuealx4xTFUwd0G9oCt10o2Ms
        YVXybIa9UWS52ifCBzZMpJ7/ug==
X-Google-Smtp-Source: ABdhPJxEDuTIjDbEETe+x5CBXTbDHHNF2l6pxVEgSdhpODRMwjSlfSHeKeYl1CKAMMPtGDPCpth7lA==
X-Received: by 2002:a2e:155d:0:b0:246:c5c:84d4 with SMTP id 29-20020a2e155d000000b002460c5c84d4mr969372ljv.150.1645072313554;
        Wed, 16 Feb 2022 20:31:53 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:31:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/msm/dpu: remove struct dpu_encoder_irq
Date:   Thu, 17 Feb 2022 07:31:47 +0300
Message-Id: <20220217043148.480898-6-dmitry.baryshkov@linaro.org>
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

Remove additional indirection: specify IRQ callbacks and IRQ indices
directly rather than through the pointer in the irq structure. For each
IRQ we have a constant IRQ callback. This change simplifies code review
as the reader no longer needs to remember which function is called.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 28 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 21 +-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 73 +++++++------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 42 ++++-------
 4 files changed, 58 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index dbcbf96cf8eb..83b6715820fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -261,9 +261,10 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx,
+		void (*func)(void *arg, int irq_idx),
 		struct dpu_encoder_wait_info *wait_info)
 {
-	struct dpu_encoder_irq *irq;
+	int irq;
 	u32 irq_status;
 	int ret;
 
@@ -271,7 +272,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
-	irq = &phys_enc->irq[intr_idx];
+	irq = phys_enc->irq[intr_idx];
 
 	/* note: do master / slave checking outside */
 
@@ -279,53 +280,52 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
 		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
 			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx);
+			  irq);
 		return -EWOULDBLOCK;
 	}
 
-	if (irq->irq_idx < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
-			      DRMID(phys_enc->parent), intr_idx,
-			      irq->name);
+	if (irq < 0) {
+		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d\n",
+			      DRMID(phys_enc->parent), intr_idx);
 		return 0;
 	}
 
 	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), intr_idx,
-		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
+		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
 
 	ret = dpu_encoder_helper_wait_event_timeout(
 			DRMID(phys_enc->parent),
-			irq->irq_idx,
+			irq,
 			wait_info);
 
 	if (ret <= 0) {
-		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
+		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq);
 		if (irq_status) {
 			unsigned long flags;
 
 			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
-				      irq->irq_idx,
+				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			irq->func(phys_enc, irq->irq_idx);
+			func(phys_enc, irq);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
 			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
-				      irq->irq_idx,
+				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 		}
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			intr_idx, irq->irq_idx,
+			intr_idx, irq,
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index ff2218155b44..803fd6f25da1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -162,21 +162,6 @@ enum dpu_intr_idx {
 	INTR_IDX_MAX,
 };
 
-/**
- * dpu_encoder_irq - tracking structure for interrupts
- * @name:		string name of interrupt
- * @intr_idx:		Encoder interrupt enumeration
- * @irq_idx:		IRQ interface lookup index from DPU IRQ framework
- *			will be -EINVAL if IRQ is not registered
- * @irq_cb:		interrupt callback
- */
-struct dpu_encoder_irq {
-	const char *name;
-	enum dpu_intr_idx intr_idx;
-	int irq_idx;
-	void (*func)(void *arg, int irq_idx);
-};
-
 /**
  * struct dpu_encoder_phys - physical encoder that drives a single INTF block
  *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
@@ -207,7 +192,7 @@ struct dpu_encoder_irq {
  * @pending_ctlstart_cnt:	Atomic counter tracking the number of ctl start
  *                              pending.
  * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
- * @irq:			IRQ tracking structures
+ * @irq:			IRQ indices
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
@@ -231,7 +216,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_ctlstart_cnt;
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
-	struct dpu_encoder_irq irq[INTR_IDX_MAX];
+	int irq[INTR_IDX_MAX];
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
@@ -357,11 +342,13 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  *	note: will call dpu_encoder_helper_wait_for_irq on timeout
  * @phys_enc: Pointer to physical encoder structure
  * @intr_idx: encoder interrupt index
+ * @func: IRQ callback to be called in case of timeout
  * @wait_info: wait info struct
  * @Return: 0 or -ERROR
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx,
+		void (*func)(void *arg, int irq_idx),
 		struct dpu_encoder_wait_info *wait_info);
 
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index ca7d557312ff..7f5b7f0fff2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -151,7 +151,6 @@ static void dpu_encoder_phys_cmd_mode_set(
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
-	struct dpu_encoder_irq *irq;
 
 	if (!mode || !adj_mode) {
 		DPU_ERROR("invalid args\n");
@@ -161,17 +160,13 @@ static void dpu_encoder_phys_cmd_mode_set(
 	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
 	drm_mode_debug_printmodeline(adj_mode);
 
-	irq = &phys_enc->irq[INTR_IDX_CTL_START];
-	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
 
-	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
-	irq->irq_idx = phys_enc->hw_pp->caps->intr_done;
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
 
-	irq = &phys_enc->irq[INTR_IDX_RDPTR];
-	irq->irq_idx = phys_enc->hw_pp->caps->intr_rdptr;
+	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
 
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 }
 
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
@@ -212,7 +207,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
 		msm_disp_snapshot_state(drm_enc->dev);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
+				phys_enc->irq[INTR_IDX_RDPTR]);
 	}
 
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -240,6 +235,7 @@ static int _dpu_encoder_phys_cmd_wait_for_idle(
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
 	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_PINGPONG,
+			dpu_encoder_phys_cmd_pp_tx_done_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT)
 		_dpu_encoder_phys_cmd_handle_ppdone_timeout(phys_enc);
@@ -279,11 +275,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
-				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
+				phys_enc->irq[INTR_IDX_RDPTR],
+				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
+				phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
+				phys_enc->irq[INTR_IDX_RDPTR]);
 
 end:
 	if (ret) {
@@ -305,27 +302,30 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 
 	if (enable) {
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
-				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
+				phys_enc->irq[INTR_IDX_PINGPONG],
+				dpu_encoder_phys_cmd_pp_tx_done_irq,
+				phys_enc);
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->irq[INTR_IDX_UNDERRUN],
+				dpu_encoder_phys_cmd_underrun_irq,
+				phys_enc);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
 
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
 			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
-					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
+					phys_enc->irq[INTR_IDX_CTL_START],
+					dpu_encoder_phys_cmd_ctl_start_irq,
+					phys_enc);
 	} else {
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
 			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START].irq_idx);
+					phys_enc->irq[INTR_IDX_CTL_START]);
 
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
+				phys_enc->irq[INTR_IDX_UNDERRUN]);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx);
+				phys_enc->irq[INTR_IDX_PINGPONG]);
 	}
 }
 
@@ -660,6 +660,7 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
 	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_CTL_START,
+			dpu_encoder_phys_cmd_ctl_start_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT) {
 		DPU_ERROR_CMDENC(cmd_enc, "ctl start interrupt wait failed\n");
@@ -715,6 +716,7 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 	atomic_inc(&cmd_enc->pending_vblank_cnt);
 
 	rc = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_RDPTR,
+			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
 			&wait_info);
 
 	return rc;
@@ -766,7 +768,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	struct dpu_encoder_irq *irq;
 	int i, ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
@@ -790,30 +791,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	cmd_enc->stream_sel = 0;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
-	for (i = 0; i < INTR_IDX_MAX; i++) {
-		irq = &phys_enc->irq[i];
-		irq->irq_idx = -EINVAL;
-	}
-
-	irq = &phys_enc->irq[INTR_IDX_CTL_START];
-	irq->name = "ctl_start";
-	irq->intr_idx = INTR_IDX_CTL_START;
-	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
-	irq->name = "pp_done";
-	irq->intr_idx = INTR_IDX_PINGPONG;
-	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_RDPTR];
-	irq->name = "pp_rd_ptr";
-	irq->intr_idx = INTR_IDX_RDPTR;
-	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->name = "underrun";
-	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->func = dpu_encoder_phys_cmd_underrun_irq;
+	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
+		phys_enc->irq[i] = -EINVAL;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 50c063de1509..1a319d56c879 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -366,19 +366,15 @@ static void dpu_encoder_phys_vid_mode_set(
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	struct dpu_encoder_irq *irq;
-
 	if (adj_mode) {
 		phys_enc->cached_mode = *adj_mode;
 		drm_mode_debug_printmodeline(adj_mode);
 		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
 	}
 
-	irq = &phys_enc->irq[INTR_IDX_VSYNC];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
 
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 }
 
 static int dpu_encoder_phys_vid_control_vblank_irq(
@@ -405,11 +401,12 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
-				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
+				phys_enc->irq[INTR_IDX_VSYNC],
+				dpu_encoder_phys_vid_vblank_irq,
+				phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
+				phys_enc->irq[INTR_IDX_VSYNC]);
 
 end:
 	if (ret) {
@@ -490,6 +487,7 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
 
 	/* Wait for kickoff to complete */
 	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_VSYNC,
+			dpu_encoder_phys_vid_vblank_irq,
 			&wait_info);
 
 	if (ret == -ETIMEDOUT) {
@@ -542,7 +540,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 				ctl->idx, rc);
 		msm_disp_snapshot_state(drm_enc->dev);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
+				phys_enc->irq[INTR_IDX_VSYNC]);
 	}
 }
 
@@ -632,12 +630,13 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 			return;
 
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->irq[INTR_IDX_UNDERRUN],
+				dpu_encoder_phys_vid_underrun_irq,
+				phys_enc);
 	} else {
 		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
+				phys_enc->irq[INTR_IDX_UNDERRUN]);
 	}
 }
 
@@ -703,7 +702,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	struct dpu_encoder_irq *irq;
 	int i;
 
 	if (!p) {
@@ -729,20 +727,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
 	phys_enc->enc_spinlock = p->enc_spinlock;
-	for (i = 0; i < INTR_IDX_MAX; i++) {
-		irq = &phys_enc->irq[i];
-		irq->irq_idx = -EINVAL;
-	}
-
-	irq = &phys_enc->irq[INTR_IDX_VSYNC];
-	irq->name = "vsync_irq";
-	irq->intr_idx = INTR_IDX_VSYNC;
-	irq->func = dpu_encoder_phys_vid_vblank_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->name = "underrun";
-	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->func = dpu_encoder_phys_vid_underrun_irq;
+	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
+		phys_enc->irq[i] = -EINVAL;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-- 
2.34.1

