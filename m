Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545BB4D9369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 05:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239772AbiCOEos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 00:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239466AbiCOEor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 00:44:47 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B60A20F70;
        Mon, 14 Mar 2022 21:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647319414; x=1678855414;
  h=from:to:cc:subject:date:message-id;
  bh=Y62Bp0DtP64nX4dUyApeCl25z1PAdj4TTBx+FN08dxc=;
  b=QAyehw4jn1+8QlWe6ay3IifikcMvmmNGqVgPbfjh263O6gQNcR9EQum6
   8rTs+NOIRn7f04+7h0AdnelsvbkviO0YnWXiGImx2LPVfj0K5geRZ0qHD
   /JEwcg1vXmtBBYeouHhfQkoX+C6b6Yv3HQx3hxMXSylQTACCzH6M7kbxg
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Mar 2022 21:43:34 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Mar 2022 21:43:31 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Mar 2022 10:13:18 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
        id 524C94E34; Tue, 15 Mar 2022 10:13:17 +0530 (IST)
From:   Vinod Polimera <quic_vpolimer@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, dianders@chromium.org,
        quic_kalyant@quicinc.com
Subject: [PATCH v4] drm/msm/disp/dpu1: add inline rotation support for sc7280 target
Date:   Tue, 15 Mar 2022 10:13:14 +0530
Message-Id: <1647319394-11426-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Some DPU versions support inline rot90. It is supported only for
limited amount of UBWC formats.
- There are two versions of inline rotators, v1 (present on sm8250 and
sm7250) and v2 (sc7280). These versions differ in the list of supported
formats and in the scaler possibilities.

Changes in RFC:
- Rebase changes to the latest code base.
- Append rotation config variables with v2 and
remove unused variables.(Dmitry)
- Move pixel_ext setup separately from scaler3 config.(Dmitry)
- Add 270 degree rotation to supported rotation list.(Dmitry)

Changes in V2:
- Remove unused macros and fix indentation.
- Add check if 90 rotation is supported and
add supported rotations to rot_cfg.

Changes in V3:
- Fix indentation.
- Move rot_supported to sspp capabilities. (Dmitry)
- Config pixel_ext based on src_h/src_w directly. (Dmitry)
- Misc changes.

Changes in V4:
- Pass boolean value to sspp blk based on supported rotations for each hw.

Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 187 ++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  18 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 113 ++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
 4 files changed, 215 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a4fe77c..060bf53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,6 +35,9 @@
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
+#define VIG_SC7280_MASK \
+	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -203,6 +206,11 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_YVU420,
 };
 
+static const u32 rotation_v2_formats[] = {
+	DRM_FORMAT_NV12,
+	/* TODO add formats after validation */
+};
+
 /*************************************************************
  * DPU sub blocks config
  *************************************************************/
@@ -642,8 +650,7 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
  *************************************************************/
 
 /* SSPP common configuration */
-
-#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
+#define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
@@ -660,6 +667,7 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	.rotation_cfg = rot_cfg, \
 	}
 
 #define _DMA_SBLK(num, sdma_pri) \
@@ -676,22 +684,28 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3, NULL);
+
+static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
+	.rot_maxheight = 1088,
+	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
+	.rot_format_list = rotation_v2_formats,
+};
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3, NULL);
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
@@ -699,7 +713,7 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 
 #define SSPP_BLK(_name, _id, _base, _features, \
-		_sblk, _xinid, _type, _clkctrl) \
+		_sblk, _xinid, _type, _clkctrl, _rotsupported) \
 	{ \
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x1c8, \
@@ -707,98 +721,103 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 	.sblk = &_sblk, \
 	.xin_id = _xinid, \
 	.type = _type, \
-	.clk_ctrl = _clkctrl \
+	.clk_ctrl = _clkctrl, \
+	.rot_supported = _rotsupported ? DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK : \
+			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK, \
 	}
 
 static const struct dpu_sspp_cfg msm8998_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK, sdm845_vig_sblk_0,
+		0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, 0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK, sdm845_vig_sblk_1,
+		4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, 0),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK, sdm845_vig_sblk_2,
+		8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, 0),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK, sdm845_vig_sblk_3,
+		12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, 0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
+		1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, 0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
+		5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, 0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
+		9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, 0),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
+		13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, 0),
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK, sdm845_vig_sblk_0,
+		0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, 0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK, sdm845_vig_sblk_1,
+		4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, 0),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK, sdm845_vig_sblk_2,
+		8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, 0),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK, sdm845_vig_sblk_3,
+		12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, 0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
+		1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, 0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
+		5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, 0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
+		9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, 0),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
+		13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, 0),
 };
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, NULL);
+
+static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_cfg sc7180_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK, sc7180_vig_sblk_0,
+		0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, 0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
+		1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, 0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,	sdm845_dma_sblk_1,
+		5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, 0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
+		9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, 0),
 };
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
-		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
-		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
-		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
-		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK, sm8250_vig_sblk_0,
+		0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, 0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK, sm8250_vig_sblk_1,
+		4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, 0),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK, sm8250_vig_sblk_2,
+		8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, 0),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK, sm8250_vig_sblk_3,
+		12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, 0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
+		1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, 0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
+		5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, 0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
+		9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, 0),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
+		13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, 0),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK, sc7280_vig_sblk_0,
+		0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, 1),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
+		1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, 0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,	sdm845_dma_sblk_1,
+		5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, 0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
+		9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, 0),
 };
 
 
@@ -820,9 +839,11 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
-		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
+		DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+		qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
+		DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b85b24b..d009d83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -112,6 +112,7 @@ enum {
  * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
  * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper multirec
  * @DPU_SSPP_CDP             Supports client driven prefetch
+ * @DPU_SSPP_INLINE_ROTATION Support inline rotation
  * @DPU_SSPP_MAX             maximum value
  */
 enum {
@@ -132,6 +133,7 @@ enum {
 	DPU_SSPP_TS_PREFILL,
 	DPU_SSPP_TS_PREFILL_REC1,
 	DPU_SSPP_CDP,
+	DPU_SSPP_INLINE_ROTATION,
 	DPU_SSPP_MAX
 };
 
@@ -315,6 +317,18 @@ struct dpu_qos_lut_tbl {
 };
 
 /**
+ * struct dpu_rotation_cfg - define inline rotation config
+ * @rot_maxheight: max pre rotated height allowed for rotation
+ * @rot_num_formats: number of elements in @rot_format_list
+ * @rot_format_list: list of supported rotator formats
+ */
+struct dpu_rotation_cfg {
+	u32 rot_maxheight;
+	size_t rot_num_formats;
+	const u32 *rot_format_list;
+};
+
+/**
  * struct dpu_caps - define DPU capabilities
  * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
@@ -369,6 +383,7 @@ struct dpu_caps {
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
  * @virt_num_formats: Number of supported formats for virtual planes
+ * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
 	u32 creq_vblank;
@@ -390,6 +405,7 @@ struct dpu_sspp_sub_blks {
 	u32 num_formats;
 	const u32 *virt_format_list;
 	u32 virt_num_formats;
+	const struct dpu_rotation_cfg *rotation_cfg;
 };
 
 /**
@@ -492,6 +508,7 @@ struct dpu_ctl_cfg {
  * @xin_id:            bus client identifier
  * @clk_ctrl           clock control identifier
  * @type               sspp type identifier
+ * @rot_supported      allowed rotations
  */
 struct dpu_sspp_cfg {
 	DPU_HW_BLK_INFO;
@@ -499,6 +516,7 @@ struct dpu_sspp_cfg {
 	u32 xin_id;
 	enum dpu_clk_ctrl_type clk_ctrl;
 	u32 type;
+	u32 rot_supported;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6565682..7017fc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -528,11 +528,19 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
-		struct dpu_hw_pixel_ext *pixel_ext,
 		const struct dpu_format *fmt,
 		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
 {
 	uint32_t i;
+	bool inline_rotation = pstate->rotation & DRM_MODE_ROTATE_90;
+
+	/*
+	 * For inline rotation cases, scaler config is post-rotation,
+	 * so swap the dimensions here. However, pixel extension will
+	 * need pre-rotation settings.
+	 */
+	if (inline_rotation)
+		swap(src_w, src_h);
 
 	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
 		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
@@ -571,11 +579,6 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
 		}
-
-		pixel_ext->num_ext_pxls_top[i] =
-			scale_cfg->src_height[i];
-		pixel_ext->num_ext_pxls_left[i] =
-			scale_cfg->src_width[i];
 	}
 	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
 		&& (src_w == dst_w))
@@ -591,6 +594,24 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 	scale_cfg->enable = 1;
 }
 
+static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
+				struct dpu_hw_pixel_ext *pixel_ext,
+				uint32_t src_w, uint32_t src_h,
+				uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
+{
+	int i;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++) {
+		if (i == DPU_SSPP_COMP_1_2 || i == DPU_SSPP_COMP_2) {
+			src_w /= chroma_subsmpl_h;
+			src_h /= chroma_subsmpl_v;
+		}
+
+		pixel_ext->num_ext_pxls_top[i] = src_h;
+		pixel_ext->num_ext_pxls_left[i] = src_w;
+	}
+}
+
 static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
 	{
 		/* S15.16 format */
@@ -665,7 +686,12 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg->src_rect),
 			drm_rect_width(&pipe_cfg->dst_rect),
 			drm_rect_height(&pipe_cfg->dst_rect),
-			&scaler3_cfg, &pixel_ext, fmt,
+			&scaler3_cfg, fmt,
+			info->hsub, info->vsub);
+
+	/* configure pixel extension based on scalar config */
+	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
+			drm_rect_width(&pipe_cfg->src_rect), drm_rect_height(&pipe_cfg->src_rect),
 			info->hsub, info->vsub);
 
 	if (pdpu->pipe_hw->ops.setup_pe)
@@ -956,6 +982,41 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 		drm_rect_equals(fb_rect, src);
 }
 
+static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
+						const struct dpu_sspp_sub_blks *sblk,
+						struct drm_rect src, const struct dpu_format *fmt)
+{
+	bool found = false;
+	size_t i, num_formats;
+	const u32 *supported_formats;
+
+	if (drm_rect_width(&src) > sblk->rotation_cfg->rot_maxheight) {
+		DPU_DEBUG_PLANE(pdpu, "invalid height for inline rot:%d max:%d\n",
+				src.y2, sblk->rotation_cfg->rot_maxheight);
+		return -EINVAL;
+	}
+
+	supported_formats = sblk->rotation_cfg->rot_format_list;
+	num_formats = sblk->rotation_cfg->rot_num_formats;
+
+	for (i = 0; i < num_formats; i++) {
+		/* check for valid formats supported by inline rotation */
+		if (fmt->base.pixel_format == supported_formats[i] &&
+			DPU_FORMAT_IS_UBWC(fmt)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found || !num_formats) {
+		DPU_DEBUG_PLANE(pdpu, "supported_format not found num: %zu\n",
+				num_formats);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -968,15 +1029,18 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct drm_rect src, dst, fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
+	unsigned int rotation = 0;
+	const struct dpu_sspp_cfg *pipe_hw_caps = pdpu->pipe_hw->cap;
+	const struct dpu_sspp_sub_blks *sblk = pdpu->pipe_hw->cap->sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
+	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
+						  sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -1002,8 +1066,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
+		(!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
+		 !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
@@ -1036,6 +1100,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	rotation = drm_rotation_simplify(new_plane_state->rotation,
+					pipe_hw_caps->rot_supported);
+
+	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
+		(rotation & DRM_MODE_ROTATE_90)) {
+		ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
+		if (ret)
+			return ret;
+	}
+
+	pstate->rotation = rotation;
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
@@ -1151,21 +1226,19 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_mode);
 
 	if (pdpu->pipe_hw->ops.setup_format) {
-		unsigned int rotation;
+		unsigned int rotation = pstate->rotation;
 
 		src_flags = 0x0;
 
-		rotation = drm_rotation_simplify(state->rotation,
-						 DRM_MODE_ROTATE_0 |
-						 DRM_MODE_REFLECT_X |
-						 DRM_MODE_REFLECT_Y);
-
 		if (rotation & DRM_MODE_REFLECT_X)
 			src_flags |= DPU_SSPP_FLIP_LR;
 
 		if (rotation & DRM_MODE_REFLECT_Y)
 			src_flags |= DPU_SSPP_FLIP_UD;
 
+		if (rotation & DRM_MODE_ROTATE_90)
+			src_flags |= DPU_SSPP_ROT_90;
+
 		/* update format */
 		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
 				pstate->multirect_index);
@@ -1531,11 +1604,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 			BIT(DRM_MODE_BLEND_COVERAGE));
 
 	drm_plane_create_rotation_property(plane,
-			DRM_MODE_ROTATE_0,
-			DRM_MODE_ROTATE_0 |
-			DRM_MODE_ROTATE_180 |
-			DRM_MODE_REFLECT_X |
-			DRM_MODE_REFLECT_Y);
+		    DRM_MODE_ROTATE_0, pdpu->pipe_hw->cap->rot_supported);
 
 	drm_plane_enable_fb_damage_clips(plane);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 50781e2..e146310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -26,6 +26,7 @@
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
+ * @rotation: simplified drm rotation hint
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -40,6 +41,7 @@ struct dpu_plane_state {
 	u64 plane_clk;
 
 	bool needs_dirtyfb;
+	unsigned int rotation;
 };
 
 /**
-- 
2.7.4

