Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DBC2FCE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 12:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732998AbhATKdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 05:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731327AbhATJ2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 04:28:43 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFA9C06179C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:39 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ox12so8232978ejb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MiTsU3N2AEa1ZXLRORW5cxTPfFrxekkDKqSBZREPFg=;
        b=lfSJbpRhrQiT4g6I14nJUgeGqQvOqM29Xz7/bAZ/PIuZedSRZDj2QPpgqc+5DjCVqF
         lOnL4vlKTAycvbcio8+ic8jhyhLYaxkIdZS4Hr6iQBplw0djoG+w7DScLglfdQPIk0XF
         adhYwqWjeOVvU/BOXbJ/LqkUAUpN4TnunYjcZMt9bv+UZ7qET00ViAC6JW6rsm4UUPQP
         3SPV3tFrQBxAGXqT1OQammYCPTTKULP7i9sXLWD2QlixUyqwvqvENUH88VuswxHp7IDU
         ZGUvG43e3FTaJh/76t7sD8061BtoxC8a6RGnRCogUx1DFTcx9ARZLXA8712IywvvYG+y
         S7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MiTsU3N2AEa1ZXLRORW5cxTPfFrxekkDKqSBZREPFg=;
        b=SdRle8tvmQYaVQieDN9zPixjoxcsr75SavNtEgH9ktDMee8Gjgf3lxhCGMK5ZKjR/K
         RhxGwZdDwPiVEbozGUrf/Rwe8fvxiDY4oY1n5w8hG+FDR5ruLraaB8fCtrdkUlBqoS/D
         G97WzMl2iIe7qfP0KdcoHn2Pw37CXe3jQPPUGW15EYNLEkdCUFRL+HPZJbZl3M9BmSHA
         NO591EKvXnaf31tDG0hgXyLMzq1apQw0lcXVM+9Gw2sYgbCVrAh+mAtiZeoNEkJsI0mB
         jWBofkjM3GEf1lYbSKd8PESmLNKY4Qu+NT0g3W0TeqdTq13rfSbgD7iT0h1y5e7eKSod
         A7Pw==
X-Gm-Message-State: AOAM532kZYq3SFsD0jg8j6GFlaSoDJeXBUOt5DbjqqfGdW3Ih7idEeF1
        hlwQswftxgKlNR50hTW0kVBMOQ==
X-Google-Smtp-Source: ABdhPJxsNboXYbktxzCo02+KzjeSp1vEtkL2iqpIjcagAeMCx8imVxhxBKaMz12lWM5cHjpPfx6sGQ==
X-Received: by 2002:a17:906:ae9b:: with SMTP id md27mr5819629ejb.357.1611134797966;
        Wed, 20 Jan 2021 01:26:37 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:37 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 5/5] venus: venc: Add support for CLL and Mastering display controls
Date:   Wed, 20 Jan 2021 11:26:06 +0200
Message-Id: <20210120092606.3987207-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create CLL and Mastering display colour volume v4l2 controls for
encoder, add handling of HDR10 PQ SEI packet payloads for v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 +++++++++++++
 drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++++++++-
 5 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b984d508ed71..d2776a18217f 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -238,6 +238,8 @@ struct venc_controls {
 	} level;
 
 	u32 base_priority_id;
+	struct v4l2_ctrl_hdr10_cll_info cll;
+	struct v4l2_ctrl_hdr10_mastering_display mastering;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 7022368c1e63..081e5a816bca 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1205,6 +1205,14 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI: {
+		struct hfi_hdr10_pq_sei *in = pdata, *hdr10 = prop_data;
+
+		memcpy(hdr10, in, sizeof(*hdr10));
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*hdr10);
+		break;
+	}
+
 	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
 	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
 	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 1f1c3faa4631..ecbe05a5cee1 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -513,6 +513,7 @@
 #define HFI_PROPERTY_PARAM_VENC_VPX_ERROR_RESILIENCE_MODE	0x2005029
 #define HFI_PROPERTY_PARAM_VENC_HIER_B_MAX_NUM_ENH_LAYER	0x200502c
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_HYBRID_MODE		0x200502f
+#define HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI			0x2005036
 
 /*
  * HFI_PROPERTY_CONFIG_VENC_COMMON_START
@@ -809,6 +810,25 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_mastering_display_colour_sei_payload {
+	u32 display_primaries_x[3];
+	u32 display_primaries_y[3];
+	u32 white_point_x;
+	u32 white_point_y;
+	u32 max_display_mastering_luminance;
+	u32 min_display_mastering_luminance;
+};
+
+struct hfi_content_light_level_sei_payload {
+	u32 max_content_light;
+	u32 max_pic_average_light;
+};
+
+struct hfi_hdr10_pq_sei {
+	struct hfi_mastering_display_colour_sei_payload mastering;
+	struct hfi_content_light_level_sei_payload cll;
+};
+
 struct hfi_framesize {
 	u32 buffer_type;
 	u32 width;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index e4775ec97a87..464027c88499 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -588,6 +588,35 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		struct hfi_hdr10_pq_sei hdr10;
+		unsigned int c;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
+
+		for (c = 0; c < 3; c++) {
+			hdr10.mastering.display_primaries_x[c] =
+				ctr->mastering.display_primaries_x[c];
+			hdr10.mastering.display_primaries_y[c] =
+				ctr->mastering.display_primaries_y[c];
+		}
+
+		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
+		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
+		hdr10.mastering.max_display_mastering_luminance =
+			ctr->mastering.max_display_mastering_luminance;
+		hdr10.mastering.min_display_mastering_luminance =
+			ctr->mastering.min_display_mastering_luminance;
+
+		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
+		hdr10.cll.max_pic_average_light =
+			ctr->cll.max_pic_average_light_level;
+
+		ret = hfi_session_set_property(inst, ptype, &hdr10);
+		if (ret)
+			return ret;
+	}
+
 	/* IDR periodicity, n:
 	 * n = 0 - only the first I-frame is IDR frame
 	 * n = 1 - all I-frames will be IDR frames
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 9fbe8388a938..5a18330b82b8 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -262,6 +262,12 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
+		ctr->cll = *ctrl->p_new.p_hdr10_cll;
+		break;
+	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
+		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -277,7 +283,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
 	if (ret)
 		return ret;
 
@@ -483,6 +489,14 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
+				   v4l2_ctrl_ptr_create(NULL));
+
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
+				   v4l2_ctrl_ptr_create(NULL));
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.1

