Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE562C80A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbgK3JKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbgK3JKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:10:50 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E168C061A4A
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:32 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id m19so14539446ejl.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9wOXMKATuHa9G+HaHhh8X09v/rbcq2HvMS+ihJfuLug=;
        b=QBgV4trjaAlL95oXB+TOb+G0HeF+xJY1TRbm4zPKApeO1Pu+GN64ccut7SQbm2nHNp
         l+XYTRtP9omMey2/SROVyoSNRx0GcMch+M7AlHA0dcjb0MuoR8QhwS2u5psw/QJZOCd/
         amBDgbPAJkvPjCUeK8e6aheKtUckKk0LLXxGf0Phb/d3zvgz3+72Ub5ua9ZIHbX2LXfc
         70hx1y0OiLpx9JjFnecWaZn5JBuItvTuwxQkDSDhflNE7MXsHv/FSx6KW+CXeINupdIM
         Ue+1BFRw2QrPWd5vEVdqImaMIUYWdozPIYILiWG9qI/xj75EKaVB5YYAK7qPsbCyZTpI
         Yi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9wOXMKATuHa9G+HaHhh8X09v/rbcq2HvMS+ihJfuLug=;
        b=BQ3CQMYuPRzyRqKpZmIe9Z5DCKrOLhXwcdNIbEPFCV0i2yWnGkxxa+5hDcIrcyXgoC
         sqAhJpRBdVGqVYct/d6nM8DpKUO5LOs29izuUJZTJR6rAoDlvnyTFBQC+5RBoYlENDnE
         aGWsRGGkXN2vMQ9jB78/dgNdM3Hu+ZRbbXXqyjAQFPqdbst5LyTilb0kSdbfzZvUQiJk
         P7z5GaHj16iahCLmUXkUGb+jrf4XUuy35xKFJcx+YvywnlQtYlGDxZwU5RB3witzugDI
         9musmgXkUHeoSE2WEsKrPDM53b6G6lRONOfU0sRKyZXisT/hpsWMNk8cU/DhevXDYgBl
         xILg==
X-Gm-Message-State: AOAM532awZWnzS84stPSbUGf02ECE6V//O6KMVb2u3DZTHVSuBAnv0SE
        4X5zYekdTCvRgpQUDRLzzzXDVA==
X-Google-Smtp-Source: ABdhPJxPHEghkA644AajakkGv7Keq6RpocvqbnqA4ImdwIXt8IG8ViO/ggApeOHvO1GKcGb19a5lPg==
X-Received: by 2002:a17:906:6c2:: with SMTP id v2mr19966240ejb.387.1606727371122;
        Mon, 30 Nov 2020 01:09:31 -0800 (PST)
Received: from localhost.localdomain (hst-221-92.medicom.bg. [84.238.221.92])
        by smtp.gmail.com with ESMTPSA id t19sm8239101eje.86.2020.11.30.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:09:30 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/4] media: v4l2-ctrls: Add control for AUD generation
Date:   Mon, 30 Nov 2020 11:08:58 +0200
Message-Id: <20201130090859.25272-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a control to enable inserting of AUD NALU into encoded
bitstream.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 59c5d3da4d95..d0a161add543 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -679,6 +679,11 @@ enum v4l2_mpeg_video_frame_skip_mode -
     otherwise the decoder expects a single frame in per buffer.
     Applicable to the decoder, all codecs.
 
+``V4L2_CID_MPEG_VIDEO_AU_DELIMITER (boolean)``
+    If enabled, AUD (Access Unit Delimiter) NALU will be generated. That
+    could be useful to find the start of a frame without having to fully
+    parse each NALU. Applicable to the H264 and HEVC encoders.
+
 ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
     Enable writing sample aspect ratio in the Video Usability
     Information. Applicable to the H264 encoder.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 5354547ed777..887fb13974de 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -875,6 +875,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Acess Unit Delimiter";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1228,6 +1229,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
 	case V4L2_CID_WIDE_DYNAMIC_RANGE:
 	case V4L2_CID_IMAGE_STABILIZATION:
 	case V4L2_CID_RDS_RECEPTION:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index cc7676ffff67..18c4f46423bc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -422,6 +422,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
 #define V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB	(V4L2_CID_MPEG_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_AU_DELIMITER		(V4L2_CID_MPEG_BASE+231)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
2.17.1

