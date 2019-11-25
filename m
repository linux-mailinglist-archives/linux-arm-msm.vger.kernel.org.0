Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6939D108D6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfKYMAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:00:03 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11529 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfKYMAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:00:01 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2019 17:29:59 +0530
IronPort-SDR: dIZVpYKMubnPx89RpbGCZddgRJQFGAdkUk33un/axipKANfWlOY6SnO7uv6FJqOao7dgNDGfx1
 xWgZ0cmUXBs/KKuu6qeqka4D8YWVxEeAQVeve8Zh9jPEeLlGS3/SMwO33JicWtm2mB4dIAM+Im
 ENRyznQoqhmxNXN+/hW2vHtOntTiWNesYfJHYqZS93/UqfaGH9XvYYcDY7MRDECHn3H7u2myjm
 diXGTFSJ+THdFGuvXiLlqIe+1lfF56ZbPXi5uKCi6eNy7L4NCndns5jbp2jPvIH3hXiq83rWBF
 7+VhF/33SgHL4HtTZ1brfMls
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2019 17:29:43 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id AC0D7432B; Mon, 25 Nov 2019 17:29:42 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH 4/4] msm:disp:dpu1: add mixer selection for display topology
Date:   Mon, 25 Nov 2019 17:29:29 +0530
Message-Id: <1574683169-19342-5-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mixer selection in the display topology is based on multiple
factors
1) mixers available in the hw
2) interfaces to be enabled
3) merge capability

change will pickup mixer as per the topology need.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 21 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d82ea99..067ef0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -58,7 +58,7 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_VDISPLAY_SPLIT 1080
+#define MAX_HDISPLAY_SPLIT 1080
 
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
@@ -534,8 +534,23 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* User split topology for width > 1080 */
-	topology.num_lm = (mode->vdisplay > MAX_VDISPLAY_SPLIT) ? 2 : 1;
+	/* Datapath topology selection
+	 *
+	 * Dual display
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
+	 * Single display
+	 * 1 LM, 1 INTF
+	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
+	 *
+	 */
+	if (intf_count == 2)
+		topology.num_lm = 2;
+	else if (!dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = 1;
+	else
+		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0ee2b6c..de69f71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -67,6 +67,7 @@
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_3d_merge = true,
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 2607ef3..d0cb41c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -287,6 +287,7 @@ struct dpu_qos_lut_tbl {
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
+ * @has_3d_merge       indicate if 3D merge is supported
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -297,6 +298,7 @@ struct dpu_caps {
 	bool has_src_split;
 	bool has_dim_layer;
 	bool has_idle_pc;
+	bool has_3d_merge;
 };
 
 /**
-- 
1.9.1

