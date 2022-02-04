Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883854AA22E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243096AbiBDVTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:19:43 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:34876 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243659AbiBDVTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009572; x=1675545572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jhZ7iwY8GHH2dmriMOdF3RCraXP7TbEIGaAbozAEU8Q=;
  b=m2ifxH/2Gm4ar9SJrA+Fh6z1si8GQ3f6s/UM8zUJeZnxSRnRd3uZbmHo
   wnFpYthaQA4zCkToxKV27yEfPlPTYF9PdC8iRSXPKl8u68vMG/RJIu/rE
   6moO3yiI/zLtaxX5H3AEwTE1QqKkAUwwlzdYcySJbLoho0pi23+rn/cD3
   o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 13:18:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:18:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:04 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:03 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 11/12] drm/msm/dpu: gracefully handle null fb commits for writeback
Date:   Fri, 4 Feb 2022 13:17:24 -0800
Message-ID: <1644009445-17320-12-git-send-email-quic_abhinavk@quicinc.com>
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

kms_writeback test cases also verify with a null fb for the
writeback connector job. In addition there are also other
commit paths which can result in kickoffs without a valid
framebuffer like while closing the fb which results in the
callback to drm_atomic_helper_dirtyfb() which internally
triggers a commit.

Add protection in the dpu driver to ensure that commits for
writeback encoders without a valid fb are gracefully skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7c9fe1..f7963b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	DPU_ATRACE_BEGIN("crtc_commit");
 
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+			crtc->state->encoder_mask) {
+		if (!dpu_encoder_has_valid_fb(encoder)) {
+			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
+			goto end;
+		}
+	}
 	/*
 	 * Encoder will flush/start now, unless it has a tx pending. If so, it
 	 * may delay and flush at an irq event (e.g. ppdone)
@@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 		dpu_encoder_kickoff(encoder);
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
+
+end:
 	DPU_ATRACE_END("crtc_commit");
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3746432..e990dbc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1832,6 +1832,27 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 	}
 }
 
+bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	unsigned int i;
+	struct dpu_encoder_phys *phys;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
+		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+			phys = dpu_enc->phys_encs[i];
+			if (phys->ops.has_valid_output_fb && !phys->ops.has_valid_output_fb(phys)) {
+				DPU_DEBUG("invalid FB not kicking off\n");
+				return false;
+			}
+		}
+	}
+
+	return true;
+}
+
 void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index da5b6d6..63d90b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -187,4 +187,10 @@ void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
 
+/**
+ * dpu_encoder_has_valid_fb - cleanup writeback job for the encoder.
+ * @drm_enc:    Pointer to drm encoder structure
+ */
+bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 80da0a9..5b45b3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -151,6 +151,7 @@ struct dpu_encoder_phys_ops {
 			struct drm_writeback_job *job);
 	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
 			struct drm_writeback_job *job);
+	bool (*has_valid_output_fb)(struct dpu_encoder_phys *phys_enc);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 783f83e..7eeed79 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -717,6 +717,16 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 	wb_enc->wb_conn = NULL;
 }
 
+static bool dpu_encoder_phys_wb_has_valid_fb(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
+
+	if (wb_enc->wb_job)
+		return true;
+	else
+		return false;
+}
+
 /**
  * dpu_encoder_phys_wb_init_ops - initialize writeback operations
  * @ops:	Pointer to encoder operation table
@@ -738,6 +748,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
 	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->has_valid_output_fb = dpu_encoder_phys_wb_has_valid_fb;
+
 }
 
 /**
-- 
2.7.4

