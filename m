Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA785528BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 02:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiFUAuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 20:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbiFUAut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 20:50:49 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B838E1B788
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 17:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655772648; x=1687308648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v57ZrySMdXgMFQT+laPDpcxxLhtcDyiA2RvmRgWaOqs=;
  b=JC/6zodIjfVvNmCTa1nf9ly7pXH3om1EU9TC54andi72c+fZCY3NR5ha
   3OWIhLI7lhUdbOjVmXkvPCsTRVWKDU1MEoOe70jiQviCDdr9vTo3htTkh
   /QxVmbTrtmE2QUuQ0HDjfbb2KI1vqe3a3zIqE/DBJsDaeX/idelMWjHp2
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jun 2022 17:50:47 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 17:50:47 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 17:50:47 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 2/4] drm/msm/dpu: Move MISR methods to dpu_hw_util
Date:   Mon, 20 Jun 2022 17:50:32 -0700
Message-ID: <20220621005033.274-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621005033.274-1-quic_jesszhan@quicinc.com>
References: <20220621005033.274-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move layer mixer specific MISR methods to generalized helper methods.
This will make it easier to add CRC support for other blocks in the
future.

Changes since V2:
- Reordered parameters so that offsets are after hw_blk_reg_map
- Fixed mismatched whitespace in bitmask definitions

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 42 ++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 49 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 16 +++++++
 3 files changed, 67 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 462f5082099e..e370dcd76e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -27,11 +28,6 @@
 
 #define LM_MISR_CTRL                     0x310
 #define LM_MISR_SIGNATURE                0x314
-#define LM_MISR_FRAME_COUNT_MASK         0xFF
-#define LM_MISR_CTRL_ENABLE              BIT(8)
-#define LM_MISR_CTRL_STATUS              BIT(9)
-#define LM_MISR_CTRL_STATUS_CLEAR        BIT(10)
-#define LM_MISR_CTRL_FREE_RUN_MASK     BIT(31)
 
 
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
@@ -108,44 +104,12 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 config = 0;
-
-	DPU_REG_WRITE(c, LM_MISR_CTRL, LM_MISR_CTRL_STATUS_CLEAR);
-
-	/* Clear old MISR value (in case it's read before a new value is calculated)*/
-	wmb();
-
-	if (enable) {
-		config = (frame_count & LM_MISR_FRAME_COUNT_MASK) |
-			LM_MISR_CTRL_ENABLE | LM_MISR_CTRL_FREE_RUN_MASK;
-
-		DPU_REG_WRITE(c, LM_MISR_CTRL, config);
-	} else {
-		DPU_REG_WRITE(c, LM_MISR_CTRL, 0);
-	}
-
+	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 ctrl = 0;
-
-	if (!misr_value)
-		return -EINVAL;
-
-	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
-
-	if (!(ctrl & LM_MISR_CTRL_ENABLE))
-		return -ENODATA;
-
-	if (!(ctrl & LM_MISR_CTRL_STATUS))
-		return -EINVAL;
-
-	*misr_value = DPU_REG_READ(c, LM_MISR_SIGNATURE);
-
-	return 0;
+	return dpu_hw_collect_misr(&ctx->hw, LM_MISR_CTRL, LM_MISR_SIGNATURE, misr_value);
 }
 
 static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 512316f25a51..a679757159e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
@@ -447,3 +449,48 @@ u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 
 	return 0;
 }
+
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
+		u32 misr_ctrl_offset,
+		bool enable, u32 frame_count)
+{
+	u32 config = 0;
+
+	DPU_REG_WRITE(c, misr_ctrl_offset, MISR_CTRL_STATUS_CLEAR);
+
+	/* Clear old MISR value (in case it's read before a new value is calculated)*/
+	wmb();
+
+	if (enable) {
+		config = (frame_count & MISR_FRAME_COUNT_MASK) |
+			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
+
+		DPU_REG_WRITE(c, misr_ctrl_offset, config);
+	} else {
+		DPU_REG_WRITE(c, misr_ctrl_offset, 0);
+	}
+
+}
+
+int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
+		u32 misr_ctrl_offset,
+		u32 misr_signature_offset,
+		u32 *misr_value)
+{
+	u32 ctrl = 0;
+
+	if (!misr_value)
+		return -EINVAL;
+
+	ctrl = DPU_REG_READ(c, misr_ctrl_offset);
+
+	if (!(ctrl & MISR_CTRL_ENABLE))
+		return -ENODATA;
+
+	if (!(ctrl & MISR_CTRL_STATUS))
+		return -EINVAL;
+
+	*misr_value = DPU_REG_READ(c, misr_signature_offset);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index e4a65eb4f769..98f1be0d2559 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -12,6 +13,11 @@
 #include "dpu_hw_catalog.h"
 
 #define REG_MASK(n)                     ((BIT(n)) - 1)
+#define MISR_FRAME_COUNT_MASK           0xFF
+#define MISR_CTRL_ENABLE                BIT(8)
+#define MISR_CTRL_STATUS                BIT(9)
+#define MISR_CTRL_STATUS_CLEAR          BIT(10)
+#define MISR_CTRL_FREE_RUN_MASK         BIT(31)
 
 /*
  * This is the common struct maintained by each sub block
@@ -343,4 +349,14 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
+		u32 misr_ctrl_offset,
+		bool enable,
+		u32 frame_count);
+
+int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
+		u32 misr_ctrl_offset,
+		u32 misr_signature_offset,
+		u32 *misr_value);
+
 #endif /* _DPU_HW_UTIL_H */
-- 
2.35.1

