Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9313153D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhBIQ1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbhBIQ0g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:26:36 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9B6C06121C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:24:53 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v15so22677718wrx.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wu1Zf/mFp11ctNj1vtuDSQPYbJ+HL7jrEiQ0KZuFezo=;
        b=I6D4bF5uMxtRWwS0Mn+TavIJ4XVUv7hvagTHG3ISwzJ6D/6d3zSF2mNypBEES4av7Y
         hJxhwYsGmnnRSERkuFsGkCiLx5/fycwp13gXAiPeBIk1hei6pdyckZMlA6uJFrDbDf91
         W8LkGgTZ4DiQekZ6ace+CgTv2aRjSWN0ZpEdtrSHimr51N2xkkBJPRuFSVzPYj4uXYWx
         l0ubWK1bc+cKKQGXGI329I1xBooi6THHIgW7m4564Le9Jymvvo/OQ10LDX8C/qp25DJM
         WqQxR+X81bpjX2yOKQonm4dz4rO6rCfsgkNVW427O1s8gWplkQtlmMZLbZvKgDRs7Y8S
         JUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wu1Zf/mFp11ctNj1vtuDSQPYbJ+HL7jrEiQ0KZuFezo=;
        b=S2oz37+/vJ5N90O6VOikMCWqx2sh3dMvNYe2zQQuEWDde1hQoZLo3ZBV99fw67LjT4
         nnJx7guQYlMIsp0i8qA76oF1s+deLNWp2dUeNxPOyZOEa+s+e/YoruSJr/2rmkEi3ACM
         LT0QvQa7UbmAhpcG8WRHBFYcKs958VK3kyIAZvN+dN6kLkCXhUpAqwgtbgwUb5azSR8A
         St1jIitDEJv6hkCSoBVuvM6Q0c3KOQVkjeGXIED0BUk3LGsHz4ijEuZo7CX6pGzc6s9t
         kNIi1UNTlxENRsqH/8z/50xEpzO7VV2KKD0fncyeRrBr4APR3M0aVopKhZpU2vmgavOW
         Zwtg==
X-Gm-Message-State: AOAM533J7G/RHJJQhY6KUW7VRF7WIW4jj9d8RuPL4vKXxN8lhhIbDHOy
        SOBzpJHenoL5/7p6qP8JMZz6Rg==
X-Google-Smtp-Source: ABdhPJxArIq1MgIBSFwswh1oCzfmdRDGnZkYUUmsbnXFD6laxQ912wKVUj3UuGfdmyrGygBoc0S/Bg==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr12949443wrv.143.1612887892665;
        Tue, 09 Feb 2021 08:24:52 -0800 (PST)
Received: from localhost.localdomain (hst-221-125.medicom.bg. [84.238.221.125])
        by smtp.gmail.com with ESMTPSA id w8sm45210wrm.21.2021.02.09.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:24:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 5/5] venus: venc: Add support for CLL and Mastering display controls
Date:   Tue,  9 Feb 2021 18:24:25 +0200
Message-Id: <20210209162425.3970393-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
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
index a252ed32cc14..adbcda6e9386 100644
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
index 4f7565834469..d2edf3896cf1 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1217,6 +1217,14 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
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
index 6b524c7cde5f..d32d926c7b2c 100644
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
index 6976ed553647..192b8c4ef778 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -612,6 +612,35 @@ static int venc_set_properties(struct venus_inst *inst)
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
 	if (ctr->num_b_frames) {
 		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b80055173..52ae665f361e 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -276,6 +276,12 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -291,7 +297,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
 	if (ret)
 		return ret;
 
@@ -498,6 +504,14 @@ int venc_ctrl_init(struct venus_inst *inst)
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

