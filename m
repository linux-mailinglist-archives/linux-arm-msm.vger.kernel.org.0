Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F8D4AA232
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234946AbiBDVTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:19:52 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38681 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237265AbiBDVTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009551; x=1675545551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QyAob+wCIGVXxnaF1MriLaaaVPvPOcpFYOrFXQ8LAk0=;
  b=WQISEvg4PKakQLRwfcXPHcKnpVfO0o0qQ5xar6+2GXKgX+LiR+QCrFEA
   8GWa6ZS2iI3nhlV/vtDiRcnucGwPLMpNWKXc3zDMVXxGBTubIIul7UId9
   maWivEMJ85jbye2BH9spAYvqXdmtYzJbjPe/tiFEzoR+GlPjpS0WOmaY1
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 13:17:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:17:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:57 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:56 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 07/12] drm/msm/dpu: add encoder operations to prepare/cleanup wb job
Date:   Fri, 4 Feb 2022 13:17:20 -0800
Message-ID: <1644009445-17320-8-git-send-email-quic_abhinavk@quicinc.com>
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

add dpu encoder APIs to prepare and cleanup writeback job
for the writeback encoder. These shall be invoked from the
prepare_wb_job/cleanup_wb_job hooks of the drm_writeback
framework.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      | 16 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  5 ++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 947069b..b51a677 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -958,6 +958,40 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	return 0;
 }
 
+void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->ops.prepare_wb_job)
+			phys->ops.prepare_wb_job(phys, job);
+
+	}
+}
+
+void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->ops.cleanup_wb_job)
+			phys->ops.cleanup_wb_job(phys, job);
+
+	}
+}
+
 static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adj_mode)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index cc10436..da5b6d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -171,4 +171,20 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
  */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
+void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job);
+
+/**
+ * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
+void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 07c3525..7b3354d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -7,6 +7,7 @@
 #ifndef __DPU_ENCODER_PHYS_H__
 #define __DPU_ENCODER_PHYS_H__
 
+#include <drm/drm_writeback.h>
 #include <linux/jiffies.h>
 
 #include "dpu_kms.h"
@@ -146,6 +147,10 @@ struct dpu_encoder_phys_ops {
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
 	int (*get_frame_count)(struct dpu_encoder_phys *phys);
+	void (*prepare_wb_job)(struct dpu_encoder_phys *phys_enc,
+			struct drm_writeback_job *job);
+	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
+			struct drm_writeback_job *job);
 };
 
 /**
-- 
2.7.4

