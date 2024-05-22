Return-Path: <linux-arm-msm+bounces-20190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B9E8CBF36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10ECB1F21A1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A846E823B0;
	Wed, 22 May 2024 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yN/EHl9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E7981ABA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373474; cv=none; b=qFQqJm/ViK+lweV7c+8n27f0kTKFwOEifcWiwrBFzRtMNZ9omHMMn9c7mhOCDKjc/FMT+yyM1Bvj2XgM1iIkrMQUXQNm3hTPVSzD14axGbkb2WdgS35X4Imi7tiOymtoBipm+q0dYQe4Ryq8LyTQLK1ACK0jR4L6rVfAcLCOm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373474; c=relaxed/simple;
	bh=/wEmGaBmLdTni55W6XkvEa18Wfmd70BaIonNgCkUxsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aJJl9IUAThOQ+XdATu6LzQ24fU1ABoh1z4/BUhYsv/dlhKuHeYksBBb0EuPgM3NhtYQDoQ9St8ehxvto6IcQA7Zls5ux1m2THDCA9xHovpRSIgqrxEh1VhDrUv0VVsZk6qvW1x6QAb26dHvSPrpftqi4zwhJPfoU/n4rei6ThO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yN/EHl9k; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ffff16400so10294902e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716373470; x=1716978270; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuuZbtTxQbyoy45odG0qTznmh20zGHX67BYPrGUhl7w=;
        b=yN/EHl9kq/Y8cpHEZznPdurqH8KVDW8/hutSatWWVx36XDbVXHTGJtUJxrGgRU3Y8l
         ZZ4tFk1ki3+Rbw/5tdg8eZoUZ0X21FKgficEUW4Ilaot4/Aak5cl6G7RrFFkY3FuSUyw
         jN5GpNFhNrSVD8e+dW239xsyodcVNK90V60zet4twZ3W95jIhaOJbRSSBC+yMz4DpT+5
         1koyt6pKGFTo6Xz+X4wH0X9g5/10VZT6h0pG7GP4wwUeZLkDfq9+/9xlZBegqMJMJIjQ
         GVjHSsUN2e8d5lWuTZUliIi0coi31uv8fU9vCZOyfl/yRaIXQZFrvSacfc3wdfwElJKg
         lU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716373470; x=1716978270;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuuZbtTxQbyoy45odG0qTznmh20zGHX67BYPrGUhl7w=;
        b=L3Xccyx0UhLq0HEPFGJdEbxxHI+XqJeTztkKrfW8mFV7ess4Ed0emUVcScmK6ifYf/
         YtxgXFY6I3E8tv+syeFa67Pe/hl4qN+/DSCaxFj1TkAx9dItnGujXj+CXtUw4qZrrZw3
         HcJOq5ZxW2LOHBYe4bdKlWJzcxzaW5xqNFaBcHoue5/aJNLLUL9no2teJYOaZoJcGAO2
         +6uIBNmHbgtDJu1EkAy2T40M9X8IBqtwIASxYHpqHvzI9L0VA0iuGjVNtCKB+8O7J0Hl
         ifwuVILGsJ5xaDToO2FYCf7mxGUJqM/8UL1VH3B//PBgAWev2RzCp56o01CCmgkhIOPE
         huwA==
X-Gm-Message-State: AOJu0Yxgl4K0IN0pTSo8x00rkeWd0ZrvLPfuavDg5YoqEcH1QyQKtGWP
	gax6yrT+mTx5SwIbn6HRFJTP6w4V0UHB7LmFM5BQ7BfJHb9fzNCU4eEnbNRe2JE=
X-Google-Smtp-Source: AGHT+IHPbVr1ifPzejL1oqr8FOtzXHojewq+wtSz0YT2lBxTujeSpXY3ge7i7C++WLRBRstGJcuY6Q==
X-Received: by 2002:ac2:5466:0:b0:521:cc8a:46dd with SMTP id 2adb3069b0e04-526bebb3e10mr1075615e87.11.1716373470166;
        Wed, 22 May 2024 03:24:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f9a9563dsm4801499e87.74.2024.05.22.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:24:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:24:28 +0300
Subject: [PATCH v2] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-dpu-revert-ams-v2-1-b37825d708e1@linaro.org>
X-B4-Tracking: v=1; b=H4sIANvHTWYC/3WMQQ6CMBBFr0Jm7RimFKKuuIdhUegAkyglUyQaw
 t2t7F2+n//eBpFVOMIt20B5lShhSmBOGXSjmwZG8YnB5MbmJVn08wvTkXVB94x4tZS7tiNme4E
 kzcq9vI/gvUk8SlyCfo7+Sr/1b2olJGypqEzhq86Xff2QyWk4Bx2g2ff9C04CNlutAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9785;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/wEmGaBmLdTni55W6XkvEa18Wfmd70BaIonNgCkUxsI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTcfdOeXb51BBPnr7B3dfbxayUHEHecGFAvX7E
 YByYqKbkiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3H3QAKCRCLPIo+Aiko
 1V1pB/sG2eavn1innxyXOIT0CghxLl/OiBSpT7gFwrxWpk6n8SUzavY3m8SSzEY2qQLUoRldXk3
 nUe+5zeQowbTJcqeqWpegGZ7FRf8NFCElx/WD77fyEJG5KTvFKG4G8gt41Odo+pnWXOtCgBsbVs
 cIOG6ZfY8O9y5S31FQ++sUw/qxLoWUuWWXzumEogg4aMtBkUdM4qe9+kzFWGQcsQrmZ9qiFNXDj
 3C4AdI93ExZKF9JSgXLVeXwUZfd27VWgA7Dz50p2LhauMnNnffI40L1URwnVk6yh0JPmlF92sdf
 X2L5s80LK6kQ7Yb215nQEWbUqDfd2opRMZiD8cvoymKCiGe1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In the DPU driver blank IRQ handling is called from a vblank worker and
can happen outside of the irq_enable / irq_disable pair. Using the
worker makes that completely asynchronous with the rest of the code.
Revert commit d13f638c9b88 ("drm/msm/dpu: drop
dpu_encoder_phys_ops.atomic_mode_set") to fix vblank IRQ assignment for
CMD DSI panels.

Call trace:
 dpu_encoder_phys_cmd_control_vblank_irq+0x218/0x294
  dpu_encoder_toggle_vblank_for_crtc+0x160/0x194
  dpu_crtc_vblank+0xbc/0x228
  dpu_kms_enable_vblank+0x18/0x24
  vblank_ctrl_worker+0x34/0x6c
  process_one_work+0x218/0x620
  worker_thread+0x1ac/0x37c
  kthread+0x114/0x118
  ret_from_fork+0x10/0x20

Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expanded commit message to describe the reason for revert and added a
  call trace (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..a7d8ecf3f5be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
+		if (phys->ops.atomic_mode_set)
+			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..30470cd15a48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -69,6 +69,8 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
+ * @atomic_mode_set:		DRM Call. Set a DRM mode.
+ *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
@@ -93,6 +95,9 @@ struct dpu_encoder_phys;
 struct dpu_encoder_phys_ops {
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
+	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
+			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 489be1c0c704..95cd39b49668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
+static void dpu_encoder_phys_cmd_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
-
-	phys_enc->irq[INTR_IDX_CTL_START] = 0;
-	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
-	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
@@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-
 	cmd_enc->stream_sel = 0;
 
 	if (!phys_enc->hw_intf) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..636a97432d51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
+static void dpu_encoder_phys_vid_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int dpu_encoder_phys_vid_control_vblank_irq(
 		struct dpu_encoder_phys *phys_enc,
 		bool enable)
@@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
@@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d3ea91c1d7d2..356dca5e5ea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
+static void dpu_encoder_phys_wb_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
+}
+
 static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
@@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 

---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240514-dpu-revert-ams-9410abc1ee48

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


