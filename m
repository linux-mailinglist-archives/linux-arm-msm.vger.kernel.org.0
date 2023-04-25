Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B586EEA9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 01:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbjDYXG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 19:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236352AbjDYXGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 19:06:15 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6A217DE9;
        Tue, 25 Apr 2023 16:06:12 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EB5231F9C3;
        Wed, 26 Apr 2023 01:06:10 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Wed, 26 Apr 2023 01:06:03 +0200
Subject: [PATCH v3 12/21] drm/msm/dpu: Move autorefresh disable from CMD
 encoder to pingpong
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v3-12-693b17fe6500@somainline.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This autorefresh disable logic in the physical command-mode encoder
consumes three callbacks to the pingpong block, and will explode in
unnecessary complexity when the same callbacks need to be called on the
interface block instead to accommodate INTF TE support.  To clean this
up, move the logic into the pingpong block under a disable_autorefresh
callback, replacing the aforementioned three get_autorefresh,
setup_autorefresh and get_vsync_info callbacks.

The same logic will have to be replicated to the interface block when it
receives INTF TE support, but it is less complex than constantly
switching on a "has_intf_te" boolean to choose a callback.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 60 ++--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 47 +++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    | 25 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  4 ++
 4 files changed, 57 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622e..a60fb8d3736b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -36,10 +36,6 @@
 #define DEFAULT_TEARCHECK_SYNC_THRESH_START	4
 #define DEFAULT_TEARCHECK_SYNC_THRESH_CONTINUE	4
 
-#define DPU_ENC_WR_PTR_START_TIMEOUT_US 20000
-
-#define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
-
 static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
 
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
@@ -574,28 +570,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			atomic_read(&phys_enc->pending_kickoff_cnt));
 }
 
-static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
-		struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_hw_pp_vsync_info info;
-
-	if (!phys_enc)
-		return false;
-
-	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
-	if (info.wr_ptr_line_count > 0 &&
-	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
-		return true;
-
-	return false;
-}
-
 static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc =
-		to_dpu_encoder_phys_cmd(phys_enc);
-	int trial = 0;
-
 	if (!phys_enc)
 		return;
 	if (!phys_enc->hw_pp)
@@ -603,37 +579,11 @@ static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return;
 
-	/* If autorefresh is already disabled, we have nothing to do */
-	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
-		return;
-
-	/*
-	 * If autorefresh is enabled, disable it and make sure it is safe to
-	 * proceed with current frame commit/push. Sequence fallowed is,
-	 * 1. Disable TE
-	 * 2. Disable autorefresh config
-	 * 4. Poll for frame transfer ongoing to be false
-	 * 5. Enable TE back
-	 */
-	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
-	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
-
-	do {
-		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
-		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
-				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
-			DPU_ERROR_CMDENC(cmd_enc,
-					"disable autorefresh failed\n");
-			break;
-		}
-
-		trial++;
-	} while (dpu_encoder_phys_cmd_is_ongoing_pptx(phys_enc));
-
-	_dpu_encoder_phys_cmd_connect_te(phys_enc, true);
-
-	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc),
-			 "disabled autorefresh\n");
+	if (phys_enc->hw_pp->ops.disable_autorefresh) {
+		phys_enc->hw_pp->ops.disable_autorefresh(phys_enc->hw_pp,
+							 DRMID(phys_enc->parent),
+							 phys_enc->cached_mode.vdisplay);
+	}
 }
 
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index b18efd640abd6..dea270c0936f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -228,6 +228,49 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 	return line;
 }
 
+static void dpu_hw_pp_disable_autorefresh(struct dpu_hw_pingpong *pp,
+					  uint32_t encoder_id, u16 vdisplay)
+{
+	struct dpu_hw_pp_vsync_info info;
+	int trial = 0;
+
+	/* If autorefresh is already disabled, we have nothing to do */
+	if (!dpu_hw_pp_get_autorefresh_config(pp, NULL))
+		return;
+
+	/*
+	 * If autorefresh is enabled, disable it and make sure it is safe to
+	 * proceed with current frame commit/push. Sequence followed is,
+	 * 1. Disable TE
+	 * 2. Disable autorefresh config
+	 * 4. Poll for frame transfer ongoing to be false
+	 * 5. Enable TE back
+	 */
+
+	dpu_hw_pp_connect_external_te(pp, false);
+	dpu_hw_pp_setup_autorefresh_config(pp, 0, false);
+
+	do {
+		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
+		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
+				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
+			DPU_ERROR("enc%d pp%d disable autorefresh failed\n",
+				  encoder_id, pp->idx - PINGPONG_0);
+			break;
+		}
+
+		trial++;
+
+		dpu_hw_pp_get_vsync_info(pp, &info);
+	} while (info.wr_ptr_line_count > 0 &&
+		 info.wr_ptr_line_count < vdisplay);
+
+	dpu_hw_pp_connect_external_te(pp, true);
+
+	DPU_DEBUG("enc%d pp%d disabled autorefresh\n",
+		  encoder_id, pp->idx - PINGPONG_0);
+}
+
 static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
 {
 	struct dpu_hw_blk_reg_map *c = &pp->hw;
@@ -260,10 +303,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
 	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
-	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
-	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
+	c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index cf94b4ab603b5..851b013c4c4b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -61,9 +61,6 @@ struct dpu_hw_dither_cfg {
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_tearcheck : program tear check values
  *  @enable_tearcheck : enables tear check
- *  @get_vsync_info : retries timing info of the panel
- *  @setup_autorefresh : configure and enable the autorefresh config
- *  @get_autorefresh : retrieve autorefresh config from hardware
  *  @setup_dither : function to program the dither hw block
  *  @get_line_count: obtain current vertical line counter
  */
@@ -89,28 +86,14 @@ struct dpu_hw_pingpong_ops {
 			bool enable_external_te);
 
 	/**
-	 * provides the programmed and current
-	 * line_count
-	 */
-	int (*get_vsync_info)(struct dpu_hw_pingpong *pp,
-			struct dpu_hw_pp_vsync_info  *info);
-
-	/**
-	 * configure and enable the autorefresh config
-	 */
-	void (*setup_autorefresh)(struct dpu_hw_pingpong *pp,
-				  u32 frame_count, bool enable);
-
-	/**
-	 * retrieve autorefresh config from hardware
+	 * Obtain current vertical line counter
 	 */
-	bool (*get_autorefresh)(struct dpu_hw_pingpong *pp,
-				u32 *frame_count);
+	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Obtain current vertical line counter
+	 * Disable autorefresh if enabled
 	 */
-	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
+	void (*disable_autorefresh)(struct dpu_hw_pingpong *pp, uint32_t encoder_id, u16 vdisplay);
 
 	/**
 	 * Setup dither matix for pingpong block
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f48..e7fc67381c2bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -118,6 +118,10 @@ struct vsync_info {
 	u32 line_count;
 };
 
+#define DPU_ENC_WR_PTR_START_TIMEOUT_US 20000
+
+#define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
+
 #define to_dpu_kms(x) container_of(x, struct dpu_kms, base)
 
 #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)

-- 
2.40.1

