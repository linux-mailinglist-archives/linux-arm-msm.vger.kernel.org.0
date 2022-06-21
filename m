Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB355528C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 02:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbiFUAwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 20:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbiFUAwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 20:52:19 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DE71AF39
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 17:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655772738; x=1687308738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mwEAUH2mJwVkWedVIVMkFhCgo9vtuRo39L/H8Vk/rBc=;
  b=Amtc2TlBciDsVsOUdISG1YLkoQ7s2EvV5RpCKAyUimrr8oIDx6ZfEEpb
   4s6cq5DLmI8qeGJyKBh1q1nPuvP6o7YlKshCY/6IhG936XuVZuYhfo39t
   JSB91OiIzXY+dbVA3rgUxm175V7OC5BW1noYljkpnmTusBxZ9DxnCEu5x
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jun 2022 17:52:18 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 17:52:19 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 17:52:18 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 3/4] drm/msm/dpu: Add MISR register support for interface
Date:   Mon, 20 Jun 2022 17:52:09 -0700
Message-ID: <20220621005209.377-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
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

Changes since V1:
- Replaced dpu_hw_intf collect_misr and setup_misr implementations with
  calls to dpu_hw_utils helper methods

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 +++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 3f4d2c6e1b45..b37eeea36532 100644
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
@@ -67,6 +69,9 @@
 #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
 #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
 
+#define INTF_MISR_CTRL			0x180
+#define INTF_MISR_SIGNATURE		0x184
+
 static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -319,6 +324,16 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
+static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
+{
+	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
+}
+
+static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
+{
+	return dpu_hw_collect_misr(&intf->hw, INTF_MISR_CTRL, INTF_MISR_SIGNATURE, misr_value);
+}
+
 static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		unsigned long cap)
 {
@@ -329,6 +344,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
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

