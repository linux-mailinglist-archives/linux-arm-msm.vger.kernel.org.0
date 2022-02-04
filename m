Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1EE4AA216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbiBDVTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:19:02 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11203 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243761AbiBDVR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009476; x=1675545476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QSMORbJXNxclB8ITNC6UPKDciw5CcSFsdN+sWFJjKAk=;
  b=RZ6vBX0IK+zRvA/qes50H2MHqUPslHI/y90iFh+koSivPf46Pqu3UXBX
   x4yVQ5oACG3qIM//eLSqPQdgzum96xzHitv4F+4Vv8H/mAZPOctE+h8w8
   jr2hNi+iA3IwvV5Ct35Vzo4CHpZWaEOO9YUWPedJEsYUMvr3v/Eg6XQ3I
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Feb 2022 13:17:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:17:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:55 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:54 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 06/12] drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
Date:   Fri, 4 Feb 2022 13:17:19 -0800
Message-ID: <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
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

Make changes to dpu_encoder to support virtual encoder needed
to support writeback for dpu.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 57 +++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e977c05..947069b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -974,6 +974,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
+	enum dpu_hw_blk_type blk_type;
 	int num_lm, num_ctl, num_pp;
 	int i, j;
 
@@ -1061,20 +1062,36 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
+		if (phys->intf_mode == INTF_MODE_WB_LINE)
+			blk_type = DPU_HW_BLK_WB;
+		else
+			blk_type = DPU_HW_BLK_INTF;
+
 		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
-			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
+			global_state, drm_enc->base.id, blk_type,
 			hw_blk, ARRAY_SIZE(hw_blk));
-		for (j = 0; j < num_blk; j++) {
-			struct dpu_hw_intf *hw_intf;
 
-			hw_intf = to_dpu_hw_intf(hw_blk[i]);
-			if (hw_intf->idx == phys->intf_idx)
-				phys->hw_intf = hw_intf;
+		if (blk_type == DPU_HW_BLK_WB) {
+			for (j = 0; j < num_blk; j++) {
+				struct dpu_hw_wb *hw_wb;
+
+				hw_wb = to_dpu_hw_wb(hw_blk[i]);
+				if (hw_wb->idx == phys->intf_idx)
+					phys->hw_wb = hw_wb;
+			}
+		} else {
+			for (j = 0; j < num_blk; j++) {
+				struct dpu_hw_intf *hw_intf;
+
+				hw_intf = to_dpu_hw_intf(hw_blk[i]);
+				if (hw_intf->idx == phys->intf_idx)
+					phys->hw_intf = hw_intf;
+			}
 		}
 
-		if (!phys->hw_intf) {
+		if (!phys->hw_intf && !phys->hw_wb) {
 			DPU_ERROR_ENC(dpu_enc,
-				      "no intf block assigned at idx: %d\n", i);
+				      "no intf or WB block assigned at idx: %d\n", i);
 			return;
 		}
 
@@ -1224,15 +1241,22 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
+static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
 
-	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return catalog->intf[i].id;
+	if (type != INTF_WB) {
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == type
+				&& catalog->intf[i].controller_id == controller_id) {
+				return catalog->intf[i].id;
+			}
+		}
+	} else {
+		for (i = 0; i < catalog->wb_count; i++) {
+			if (catalog->wb[i].id == controller_id)
+				return catalog->wb[i].id;
 		}
 	}
 
@@ -2096,6 +2120,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	case DRM_MODE_ENCODER_TMDS:
 		intf_type = INTF_DP;
 		break;
+	case DRM_MODE_ENCODER_VIRTUAL:
+		intf_type = INTF_WB;
+		break;
 	}
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
@@ -2128,11 +2155,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
+		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
 													intf_type,
 													controller_id);
 		if (phys_params.intf_idx == INTF_MAX) {
-			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
+			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
 						  intf_type, controller_id);
 			ret = -EINVAL;
 		}
-- 
2.7.4

