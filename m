Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2772F487807
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 14:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347488AbiAGNM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 08:12:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:65434 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347480AbiAGNM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 08:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641561147; x=1673097147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z3uwJpUx3nS2c2Ljo9axsvIkHFp1lFASKJDyR50po30=;
  b=D5dc9MwIxgLyT4Hg2XoAnIT8MQn7HFG+wotfKNQu3MW5ACAUwUXQdK4x
   XI62ZqrVS8Af0uCEBO/6xdAleENOESNYXf0dqUiOZ9BA/iLQIjkRRbpjF
   pb3wDZERvs7LtBqlAXXfZ1d0AbYpwmOn9CmHIYBO0PJIoVCRfxilHVECI
   w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Jan 2022 05:12:27 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Jan 2022 05:12:26 -0800
X-QCInternal: smtphost
Received: from hu-dikshita-hyd.qualcomm.com (HELO hu-sgudaval-hyd.qualcomm.com) ([10.213.110.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Jan 2022 18:42:15 +0530
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
        id 45895422C; Fri,  7 Jan 2022 18:42:14 +0530 (+0530)
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH 1/2] media: v4l2-ctrls: Add intra-refresh type control
Date:   Fri,  7 Jan 2022 18:42:03 +0530
Message-Id: <1641561124-19476-2-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641561124-19476-1-git-send-email-quic_dikshita@quicinc.com>
References: <1641561124-19476-1-git-send-email-quic_dikshita@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a control to set intra-refresh type.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  6 +++++
 3 files changed, 43 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e141f0e..ce0201b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1180,6 +1180,33 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     is set to non zero value.
     Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE (enum)``
+
+enum v4l2_mpeg_video_intra_refresh_type -
+    Sets the type of intra refresh. The period to refresh
+    the whole frame is specified by V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD.
+    Note if the client sets this control to either ``V4L2_MPEG_VIDEO_INTRA_REFRESH_RANDOM``
+    or ``V4L2_MPEG_VIDEO_INTRA_REFRESH_CYCLIC`` the ``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB``
+    control shall be ignored.
+    If the client sets this control to ``V4L2_MPEG_VIDEO_INTRA_REFRESH_NONE`` the
+    V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB control shall not be ignored.
+    Applicable to H264, H263 and MPEG4 encoder. Possible values are:
+
+.. tabularcolumns:: |p{9.6cm}|p{7.9cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_NONE``
+      - Intra refresh is disabled.
+    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_RANDOM``
+      - The whole frame is completely refreshed randomly
+      after the specified period.
+    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_CYCLIC``
+      - The whole frame MBs are completely refreshed in cyclic order
+      after the specified period.
+
 ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
     Intra macroblock refresh period. This sets the period to refresh
     the whole frame. In other words, this defines the number of frames
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 54ca4e6..403c77b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -572,6 +572,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"VBV/CPB Limit",
 		NULL,
 	};
+	static const char * const intra_refresh_type[] = {
+		"None"
+		"Random",
+		"Cyclic",
+		NULL,
+	};
 
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
@@ -705,6 +711,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return hevc_start_code;
 	case V4L2_CID_CAMERA_ORIENTATION:
 		return camera_orientation;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:
+		return intra_refresh_type;
 	default:
 		return NULL;
 	}
@@ -834,6 +842,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:		return "Intra Refresh Type";
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
@@ -1360,6 +1369,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c8e0f84..5429c25 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -443,6 +443,12 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
 #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
 #define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE		(V4L2_CID_CODEC_BASE+237)
+enum v4l2_mpeg_video_intra_refresh_type {
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_NONE		= 0,
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_RANDOM	= 1,
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_CYCLIC	= 2,
+};
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.7.4

