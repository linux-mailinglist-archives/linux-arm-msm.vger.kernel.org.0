Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65FD053672F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 20:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354437AbiE0Syj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 14:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354479AbiE0Syh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 14:54:37 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0B34CD4A
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653677676; x=1685213676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=80Y53CZQilhomOXFE3myPxHni9r7GhO8Y5DutJUF3R4=;
  b=u8LIPh0F6H6OHSOC5CWJHPKhvNGy6QtyiR/5/0DRCYPhqnZsqP8w3OxL
   k4D5pK8chW3zo5H+00hUHnm7FApH8JFQVfsWAc0vxWfjDFj8LHcZWXTvd
   ioIN8EwRmfkPxg36/eHjVDHq0okPCuSY4Q24s2Kctifph/aDmuVZZJtrF
   0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 May 2022 11:54:35 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 11:54:35 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 11:54:34 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Date:   Fri, 27 May 2022 11:54:06 -0700
Message-ID: <20220527185407.162-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527185407.162-1-quic_jesszhan@quicinc.com>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Add support for setting MISR registers within the interface

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 55 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 3f4d2c6e1b45..29aaeff9eacd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_hwio.h"
@@ -67,6 +69,14 @@
 #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
 #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
 
+#define INTF_MISR_CTRL			0x180
+#define INTF_MISR_SIGNATURE		0x184
+#define INTF_MISR_FRAME_COUNT_MASK	0xFF
+#define INTF_MISR_CTRL_ENABLE		BIT(8)
+#define INTF_MISR_CTRL_STATUS		BIT(9)
+#define INTF_MISR_CTRL_STATUS_CLEAR	BIT(10)
+#define INTF_MISR_CTRL_FREE_RUN_MASK	BIT(31)
+
 static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -319,6 +329,47 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
+static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
+{
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
+	u32 config = 0;
+
+	DPU_REG_WRITE(c, INTF_MISR_CTRL, INTF_MISR_CTRL_STATUS_CLEAR);
+
+	/* Clear old MISR value (in case it's read before a new value is calculated)*/
+	wmb();
+
+	if (enable) {
+		config = (frame_count & INTF_MISR_FRAME_COUNT_MASK) |
+				INTF_MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
+
+		DPU_REG_WRITE(c, INTF_MISR_CTRL, config);
+	} else {
+		DPU_REG_WRITE(c, INTF_MISR_CTRL, 0);
+	}
+}
+
+static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
+{
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
+	u32 ctrl = 0;
+
+	if (!misr_value)
+		return -EINVAL;
+
+	ctrl = DPU_REG_READ(c, INTF_MISR_CTRL);
+
+	if (!(ctrl & INTF_MISR_CTRL_ENABLE))
+		return -ENODATA;
+
+	if (!(ctrl & INTF_MISR_CTRL_STATUS))
+		return -EINVAL;
+
+	*misr_value = DPU_REG_READ(c, INTF_MISR_SIGNATURE);
+
+	return 0;
+}
+
 static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		unsigned long cap)
 {
@@ -329,6 +380,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 	ops->get_line_count = dpu_hw_intf_get_line_count;
 	if (cap & BIT(DPU_INTF_INPUT_CTRL))
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
+	ops->setup_misr = dpu_hw_intf_setup_misr;
+	ops->collect_misr = dpu_hw_intf_collect_misr;
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 7b2d96ac61e8..8d0e7b509260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_INTF_H
@@ -57,6 +59,8 @@ struct intf_status {
  * @ get_line_count: reads current vertical line counter
  * @bind_pingpong_blk: enable/disable the connection with pingpong which will
  *                     feed pixels to this interface
+ * @setup_misr: enable/disable MISR
+ * @collect_misr: read MISR signature
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
 	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
 			bool enable,
 			const enum dpu_pingpong pp);
+	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
+	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
 };
 
 struct dpu_hw_intf {
-- 
2.35.1

