Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691184AA21A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244807AbiBDVS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:18:57 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10055 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348880AbiBDVSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009481; x=1675545481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mdXVrRClczTlrvvUfxixMENAybwz0givakdQipRAfjA=;
  b=MUnkqv9fEtUnyTT7cLxuwVqo6q1bkcRe3+yIEAN0xJ0e7ABe1GR91flN
   p6uYJ1SWQXOHOzEJWcYb5kKVnGuS6eWY/5CwO0cxmSK7Z2D81ahd7M8l9
   ciMbgOR4AQ0LBLjzHArf4E/IsnYJoeWpUM/LbA2ydqOE3OXIBXrxIwVp7
   c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Feb 2022 13:18:01 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:18:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:00 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:00 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 09/12] drm/msm/dpu: add the writeback connector layer
Date:   Fri, 4 Feb 2022 13:17:22 -0800
Message-ID: <1644009445-17320-10-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the dpu_writeback module which serves as the
interface between dpu operations and the drm_writeback.

This module manages the connector related operations for
dpu writeback.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile                  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 27 ++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 3abaf84..05a8515 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -74,6 +74,7 @@ msm-y := \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
+	disp/dpu1/dpu_writeback.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 	msm_atomic.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
new file mode 100644
index 0000000..7b61fad
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "dpu_writeback.h"
+
+static int dpu_wb_conn_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+			dev->mode_config.max_height);
+}
+
+static const struct drm_connector_funcs dpu_wb_conn_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
+		struct drm_writeback_job *job)
+{
+	if (!job->fb)
+		return 0;
+
+	dpu_encoder_prepare_wb_job(connector->encoder, job);
+
+	return 0;
+}
+
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
+		struct drm_writeback_job *job)
+{
+	if (!job->fb)
+		return;
+
+	dpu_encoder_cleanup_wb_job(connector->encoder, job);
+}
+
+static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
+	.get_modes = dpu_wb_conn_get_modes,
+	.prepare_writeback_job = dpu_wb_conn_prepare_job,
+	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
+};
+
+int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
+		const struct drm_encoder_helper_funcs *enc_helper_funcs, const u32 *format_list,
+		u32 num_formats)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_wb_connector *dpu_wb_conn;
+	int rc = 0;
+
+	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
+	dpu_wb_conn->base.base = &dpu_wb_conn->connector;
+	dpu_wb_conn->base.encoder = enc;
+
+	drm_connector_helper_add(dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
+
+	rc = drm_writeback_connector_init(dev, &dpu_wb_conn->base,
+			&dpu_wb_conn_funcs, enc_helper_funcs,
+			format_list, num_formats);
+
+	priv->connectors[priv->num_connectors++] = dpu_wb_conn->base.base;
+
+	return rc;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
new file mode 100644
index 0000000..206ce5e
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DPU_WRITEBACK_H
+#define _DPU_WRITEBACK_H
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_file.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_writeback.h>
+
+#include "msm_drv.h"
+#include "dpu_kms.h"
+#include "dpu_encoder_phys.h"
+
+struct dpu_wb_connector {
+	struct drm_connector connector;
+	struct drm_writeback_connector base;
+};
+
+int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
+		const struct drm_encoder_helper_funcs *enc_helper_funcs,
+		const u32 *format_list, u32 num_formats);
+
+#endif /*_DPU_WRITEBACK_H */
-- 
2.7.4

