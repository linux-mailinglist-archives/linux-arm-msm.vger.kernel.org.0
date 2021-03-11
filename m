Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686D833711D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 12:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhCKLZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 06:25:55 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31885 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbhCKLZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 06:25:29 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Mar 2021 03:25:29 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2021 03:25:27 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 16:55:11 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 1EB55212F0; Thu, 11 Mar 2021 16:55:11 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v8 2/2] venus: venc: Add support for Long Term Reference (LTR) controls
Date:   Thu, 11 Mar 2021 16:55:01 +0530
Message-Id: <1615461901-16675-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615461901-16675-1-git-send-email-dikshita@codeaurora.org>
References: <1615461901-16675-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for below LTR controls in encoder:
- V4L2_CID_MPEG_VIDEO_LTR_COUNT
- V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
- V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 49 +++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b800..2e7a69b 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -20,6 +20,7 @@
 #define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
+#define MAX_LTR_FRAME_COUNT 4
 
 static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 {
@@ -72,6 +73,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_enable en = { .enable = 1 };
 	struct hfi_bitrate brate;
+	struct hfi_ltr_use ltr_use;
+	struct hfi_ltr_mark ltr_mark;
+	struct hfi_ltr_mode ltr_mode;
 	u32 bframes;
 	u32 ptype;
 	int ret;
@@ -276,6 +280,37 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
+		ltr_mode.ltr_count = ctrl->val;
+		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
+		ltr_mode.trust_mode = 1;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		ptype = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME;
+		ltr_mark.mark_frame = ctrl->val;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mark);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		ptype = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME;
+		ltr_use.ref_ltr = ctrl->val;
+		ltr_use.use_constrnt = true;
+		ltr_use.frames = 0;
+		ret = hfi_session_set_property(inst, ptype, &ltr_use);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -291,7 +326,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 54);
 	if (ret)
 		return ret;
 
@@ -498,6 +533,18 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
+			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_LTR_COUNT, 0,
+			  MAX_LTR_FRAME_COUNT, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
+			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.7.4

