Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025B776CA60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjHBKEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbjHBKEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C55726B7
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so10636246e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970669; x=1691575469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuizbfmaDO2vV++M3XhC6onxflL387BwUN+e79YzhTs=;
        b=MjS4gxCcVFhKXuvAoeTKnxaBr+zmwUXtqhTcqI+iltgu6d+z7eq66Mt3gjY5yqhEgT
         osxUKkCPF4w2PygtR9XycV/rVc9U0HBiqSpSExM3Yk2hW98X0nrkBvkZA7mgN9CsAJan
         XBw952CNEeoYc7u/KCd4f0SOwRdzW5CuoxqTWseJaTpVlivz5affBhddcKdHfmDU+BA2
         a5qr+m0AKhQjb/oUbkvYjcPAXIHvb3+zYiFnty7NkltGJcuyJXVESgJ87vuDEKKUQJ3+
         ctDdyIDJ0VsvrTCsX0m20MTj+0ckoCFF499fO1zL+1b/iTQtWiJMujQvd8CcpQi9JFnT
         G1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970669; x=1691575469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuizbfmaDO2vV++M3XhC6onxflL387BwUN+e79YzhTs=;
        b=IKdWc5iwkBkGMNDx3UsEeKJdsNQvAve+LOwFF9bk2C6kF4yFyGStxL0Pm2GP204J97
         3hJww/lYqnXGA9duuWPbEyvAXUhmcpSCLHEvJhqnL6NFal+KBdp3IGkwzHoVxNFNf+Qx
         1T2ESq2N2TCDF9QITVqMECMTFJzWiq2a4IZHtVDkyPxrb+vvPMQn6kPBKPGt5rYGwvYa
         TXOknLBebH76YRhRWIrkUA84BPODNDFU5SiYhWrb4Rp3IL0y+DZmAhAIZJz63O8dlh8H
         Tm8zcYKn0C6gnqBnj4XLopHKtQLzVpNhk2+ofEzXz2HbmBjEZvQ3W/+M6qAT1mnOvn74
         bnuQ==
X-Gm-Message-State: ABy/qLaMhFoZZvyxFobZ/aF45ynH/Lu2s7z/Duk2p4NCgQA/pSQsHhiL
        rTB1W+okxvZNgNSsUA0ECBrRow==
X-Google-Smtp-Source: APBJJlGALS0FvWiqRMLtWmkDOtjsbot6hp6v/R+TGk5SXHQYMRwimvrR2pJ8BGJ5mb6rK/V57zi+Bw==
X-Received: by 2002:a05:6512:3ba8:b0:4fb:52a3:e809 with SMTP id g40-20020a0565123ba800b004fb52a3e809mr5522353lfv.28.1690970668747;
        Wed, 02 Aug 2023 03:04:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:28 -0700 (PDT)
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
Subject: [PATCH v5 2/8] drm/msm/dpu: remove irq_idx argument from IRQ callbacks
Date:   Wed,  2 Aug 2023 13:04:20 +0300
Message-Id: <20230802100426.4184892-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no point in passing the IRQ index to IRQ callbacks, no function
uses that. Drop it at last.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 16 +++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  2 +-
 8 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index b5b6e7031fb9..ba06312cbb16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -53,7 +53,7 @@ u32 dpu_core_irq_read(
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
 		int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f0a2a1dca741..051447a3620c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -352,7 +352,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
 	u32 irq_status;
@@ -399,7 +399,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			func(phys_enc, irq);
+			func(phys_enc);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..f91661a69888 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -365,7 +365,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..9589fe719452 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -76,7 +76,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
 }
 
-static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	unsigned long lock_flags;
@@ -103,7 +103,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("pp_done_irq");
 }
 
-static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
@@ -126,7 +126,7 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("rd_ptr_irq");
 }
 
-static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
@@ -139,7 +139,7 @@ static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("ctl_start_irq");
 }
 
-static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c2189e58de6a..a01fda711883 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -297,7 +297,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	programmable_fetch_config(phys_enc, &timing_params);
 }
 
-static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_vblank_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_hw_ctl *hw_ctl;
@@ -334,7 +334,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("vblank_irq");
 }
 
-static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 78037a697633..870a1f5060e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -345,7 +345,11 @@ static void dpu_encoder_phys_wb_setup(
 
 }
 
-static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
+/**
+ * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
+ * @arg:	Pointer to writeback encoder
+ */
+static void dpu_encoder_phys_wb_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -371,16 +375,6 @@ static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
 	wake_up_all(&phys_enc->pending_kickoff_wq);
 }
 
-/**
- * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
- * @arg:	Pointer to writeback encoder
- * @irq_idx:	interrupt index
- */
-static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
-{
-	_dpu_encoder_phys_wb_frame_done_helper(arg);
-}
-
 /**
  * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
  * @phys:	Pointer to physical encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index e3c50439f80a..01a9ccfcd54b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -217,7 +217,7 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 	/*
 	 * Perform registered function callback
 	 */
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -507,7 +507,7 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
 	unsigned long irq_flags;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index dab761e54863..e2b00dd32619 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -58,7 +58,7 @@ struct dpu_hw_intr {
 	const struct dpu_intr_reg *intr_set;
 
 	struct {
-		void (*cb)(void *arg, int irq_idx);
+		void (*cb)(void *arg);
 		void *arg;
 		atomic_t count;
 	} irq_tbl[];
-- 
2.39.2

