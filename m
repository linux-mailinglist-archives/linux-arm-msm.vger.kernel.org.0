Return-Path: <linux-arm-msm+bounces-34815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829499A2E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF7D1C21A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A208227BBB;
	Thu, 17 Oct 2024 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R0298k++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD975227B9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 20:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195496; cv=none; b=q7INOyKFuhBZMc9Jc1CAm8oBXy34k5ZShuW6bY0ScZ4mon5xGx1+EOPnJLmSzdceXchIyk66Gv57lLy6zUqN0+oFbMKJNXmiSXUxc6lLkVlJUn+HRYlWYJ/jugOhRi21rD47wKTJFvP9DOOlk9lRxHxqQDj7esE4B3fUM4Zqjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195496; c=relaxed/simple;
	bh=12O16X5m6L4TMZ4PbeKs96jQJ/iS228yoW4rZ8SI9eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsOfe3WPKm2m02ORVYyR2nM/CPPXvYI/udAalBHTXbM9fyMT/ryFlr8fnrmc9glunAF6OYNNjcbbcgUwyD3korboCmdLFrAti9j0n2eRaZ6wdxbWcHmC7HT9NLvAGqe+MSMKaZNGoEOripfcVLAbEmCg05L0+5bGgW4WlbAoKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R0298k++; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20caccadbeeso15207185ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729195492; x=1729800292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78oVIU4gxI+xMIbzD9bO4K9p/Czsp4tG3FVUEj/GjcI=;
        b=R0298k++0FHoo2UOvZVzr5AsEhHQ0s5j1IvL9aIx+x5RdX0jeLajxu2rG1PwOD0kF3
         /NSvDM7dES+3i7lvkt0I2edsYQtoHzRY+RbpR5xOFcvzbBziC0+C67TSEi3vgcc20Cwo
         +cSFs3wMIhFj/3828zatub1BbK8xRIZPNevW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195492; x=1729800292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78oVIU4gxI+xMIbzD9bO4K9p/Czsp4tG3FVUEj/GjcI=;
        b=V82UW4Xkp9sflN4cPss+NQLolHXC0+00gFWpCodB2nXgwUvvl+MLyEoIdF2BKQX1KP
         Ef/2rA7nVrZTvn7gnBXE3mFJHGHreXIeLzYeAeRX11BLUBLWsGC9tvO7pVUP9rYEin9r
         Xkfhm+JEIFbMZ+wiFdOVMUggVTjniYw9fdPBXWWAB0W3hwm5opnOV+lo8x1xQsa0Vtmk
         ACkV0A1vsfu0i1EIigAzEPY9UD3oemXXXgF+nSg/yhEnJKlyEcRB0Qp9nGDj1cRCMKdH
         Cxoj8QIRIm8UDdpcJeDuiaxUhI5h7vFOruaAR8phyl4rFVtniOEsIKD8s0hTMRgvBWhi
         AC8g==
X-Forwarded-Encrypted: i=1; AJvYcCVFu3ks5Q3V7Ju93PSiwBswHxcIEFaFXEoLjettYA66wp3WfvTa25kFnIzvK+lLgOE3+ryh2BtsIpLnivPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YweuAxasorVTp46iDbH/lfzYc7u5rrwd6w14hZrkxST2h25+sGp
	BSg2vq4kJFlDDjxWNRuFLF7zz+0ZEP8WaZWYKIsaVgIeXbEr4Et3vEn1OtxKIQ==
X-Google-Smtp-Source: AGHT+IHzPeXhgWDyIXpmlQORpJn8DNHSXWCs0phXrOp91LeLuJepEHcJ4i/UFxzjfJ7MobSc0wiMhg==
X-Received: by 2002:a17:90b:2785:b0:2e0:a77e:82ff with SMTP id 98e67ed59e1d1-2e561a168d1mr158327a91.33.1729195492077;
        Thu, 17 Oct 2024 13:04:52 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ab92:55d4:ae5d:528a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e56129dccesm110088a91.38.2024.10.17.13.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:04:51 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Thu, 17 Oct 2024 13:04:31 -0700
Subject: [PATCH v4 2/2] media: venus: Enable h.264 hierarchical coding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-submit-v4-2-d852bc7f7fdc@chromium.org>
References: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
In-Reply-To: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

HFI supports hierarchical P encoding and the ability to specify the
bitrate for the different layers.

Connect the controls that V4L2 provides and HFI supports.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h       |  4 ++
 drivers/media/platform/qcom/venus/venc.c       | 73 +++++++++++++-------
 drivers/media/platform/qcom/venus/venc_ctrls.c | 92 ++++++++++++++++++++++++++
 3 files changed, 145 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 55202b89e1b9..fd46a7778d8c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -26,6 +26,7 @@
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_RESETS_NUM_MAX		2
+#define VIDC_MAX_HIER_CODING_LAYER 6
 
 extern int venus_fw_debug;
 
@@ -255,6 +256,7 @@ struct venc_controls {
 	u32 rc_enable;
 	u32 const_quality;
 	u32 frame_skip_mode;
+	u32 layer_bitrate;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
@@ -273,6 +275,8 @@ struct venc_controls {
 	s32 h264_loop_filter_alpha;
 	s32 h264_loop_filter_beta;
 	u32 h264_8x8_transform;
+	u32 h264_hier_layers;
+	u32 h264_hier_layer_bitrate[VIDC_MAX_HIER_CODING_LAYER];
 
 	u32 hevc_i_qp;
 	u32 hevc_p_qp;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..d717e5dd6a39 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -734,6 +734,29 @@ static int venc_set_properties(struct venus_inst *inst)
 		if (ret)
 			return ret;
 
+		if (ctr->layer_bitrate) {
+			unsigned int i;
+
+			ptype = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_layers);
+			if (ret)
+				return ret;
+
+			ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->layer_bitrate);
+			if (ret)
+				return ret;
+
+			for (i = 0; i < ctr->h264_hier_layers; ++i) {
+				ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+				brate.bitrate = ctr->h264_hier_layer_bitrate[i];
+				brate.layer_id = i;
+
+				ret = hfi_session_set_property(inst, ptype, &brate);
+				if (ret)
+					return ret;
+			}
+		}
 	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
@@ -823,21 +846,36 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (!ctr->bitrate)
-		bitrate = 64000;
-	else
-		bitrate = ctr->bitrate;
+	if (!ctr->layer_bitrate) {
+		if (!ctr->bitrate)
+			bitrate = 64000;
+		else
+			bitrate = ctr->bitrate;
 
-	ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
-	brate.bitrate = bitrate;
-	brate.layer_id = 0;
+		ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+		brate.bitrate = bitrate;
+		brate.layer_id = 0;
 
-	ret = hfi_session_set_property(inst, ptype, &brate);
-	if (ret)
-		return ret;
+		ret = hfi_session_set_property(inst, ptype, &brate);
+		if (ret)
+			return ret;
+
+		if (!ctr->bitrate_peak)
+			bitrate *= 2;
+		else
+			bitrate = ctr->bitrate_peak;
+
+		ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
+		brate.bitrate = bitrate;
+		brate.layer_id = 0;
+
+		ret = hfi_session_set_property(inst, ptype, &brate);
+		if (ret)
+			return ret;
+	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
-	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+			inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
 		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
 		if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
 			en.enable = 0;
@@ -849,19 +887,6 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (!ctr->bitrate_peak)
-		bitrate *= 2;
-	else
-		bitrate = ctr->bitrate_peak;
-
-	ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
-	brate.bitrate = bitrate;
-	brate.layer_id = 0;
-
-	ret = hfi_session_set_property(inst, ptype, &brate);
-	if (ret)
-		return ret;
-
 	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
 		quant.qp_i = ctr->hevc_i_qp;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 3e1f6f26eddf..e340783a4ef2 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -346,6 +346,55 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ctr->h264_8x8_transform = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
+		if (ctrl->val != V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P)
+			return -EINVAL;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
+		ctr->layer_bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
+		if (ctrl->val > VIDC_MAX_HIER_CODING_LAYER)
+			return -EINVAL;
+		ctr->h264_hier_layers = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
+		ctr->h264_hier_layer_bitrate[0] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[0], 0);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
+		ctr->h264_hier_layer_bitrate[1] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[1], 1);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
+		ctr->h264_hier_layer_bitrate[2] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[2], 2);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
+		ctr->h264_hier_layer_bitrate[3] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[3], 3);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
+		ctr->h264_hier_layer_bitrate[4] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[4], 4);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
+		ctr->h264_hier_layer_bitrate[5] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[5], 5);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -628,6 +677,49 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
 			  ((4096 * 2304) >> 8), 1, 0);
 
+	if (IS_V4(inst->core) || IS_V6(inst->core)) {
+		v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
+				       V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+				       1, V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING, 0, 1, 1, 0);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER, 0,
+				  VIDC_MAX_HIER_CODING_LAYER, 1, 0);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR,
+				  BITRATE_MIN, BITRATE_MAX, BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+	}
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;

-- 
2.47.0.rc1.288.g06298d1525-goog


