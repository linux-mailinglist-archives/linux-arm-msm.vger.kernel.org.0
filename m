Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773762279C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgGUHsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgGUHsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:48:08 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD59C0619D7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 00:48:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x9so23004472ljc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9fj+mlGbPwbJel6oxJ0D6OKXqr3G/qYico6GQrfC1qA=;
        b=cZ9RE5fPSflQWEsddknmkKOYwdvv9eV+TRDLjiyN0BX0Hr600TOyTuLrq9FQn1KT5S
         OOQR2+fbkdsI3nnYTEjTau9KeNre62JPteKeBxzMmUM4xaakYJM5Esfy1wlVIhZhKNpJ
         k3cFbxc8olENVw5Pk1gTLP33hTMTHynfKaL7KyTj1sF/Dgxfmxn8LX14N3S0A13n35am
         +l2sgUK+cbzhZSyqpFe7RSUh+ODJCxNxE86Y8qwsVSC3B5PmGE9qmsdPJrrVs83b0s/D
         zXlUtLcw/Cfli+yx49HUr71aZm43kaWJL6wekqUFiBD5piMa7YKGUPSZT41S15cy3Pgk
         /dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9fj+mlGbPwbJel6oxJ0D6OKXqr3G/qYico6GQrfC1qA=;
        b=KUbrALM8QUOzQ6rTTrHKJbwp70D/Mkoh+7H6EkB8JPkc3g1JFE80M5KSAHAOWdoNP5
         FBIawUr4BuKQDxaLWQ/gN4kajjxCS85fJKb0bwwRpEb+YPvtqAwLvdzyEtD5KUVbp9ub
         T3qgAwcWGolAV7Bdts0oEKRXO8j8K/xjxkl114BK8E2Ta+5n/PdErUrXquuEcjmYLehI
         aOX+zjiPgV/J5hM7hxvFER181E9q/pmMBJ0eLBPK0KZYm4G/A4Xf3bCM9rdbaVKaAKFa
         8oeI+XdOmh6qt1tI5muiBq5QWUtC59Lf9Bc3fLkQy+ZLSNoOT3cvjTqMKA+gtHBYjNkF
         AZsA==
X-Gm-Message-State: AOAM531tL1pdtxNQUKrWzdYpVpeFZr3/Ejg49oTiOr5bf36nWVANh01r
        KAfvXlZPpOEPmDpi06qD7zhglQ==
X-Google-Smtp-Source: ABdhPJymcoDeM/UpJDvJp0uFJhhf4P4WUSwQOIlEDLwYBl27ww4QUTQeqpTuZ8eoq9uH2nmBgETLLg==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr12603508ljp.272.1595317684778;
        Tue, 21 Jul 2020 00:48:04 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id d2sm4045334ljg.6.2020.07.21.00.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:48:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/6] media: v4l2-ctrls: Add encoder constant quality control
Date:   Tue, 21 Jul 2020 10:45:33 +0300
Message-Id: <20200721074538.505-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maheshwar Ajja <majja@codeaurora.org>

When V4L2_CID_MPEG_VIDEO_BITRATE_MODE value is
V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, encoder will produce
constant quality output indicated by
V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY control value.
Encoder will choose appropriate quantization parameter
and bitrate to produce requested frame quality level.

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                   |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..b9d3f7ae6486 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -581,6 +581,8 @@ enum v4l2_mpeg_video_bitrate_mode -
       - Variable bitrate
     * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CBR``
       - Constant bitrate
+    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
+      - Constant quality
 
 
 
@@ -592,6 +594,14 @@ enum v4l2_mpeg_video_bitrate_mode -
     the average video bitrate. It is ignored if the video bitrate mode
     is set to constant bitrate.
 
+``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY (integer)``
+    Constant quality level control. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` value is
+    ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``. Valid range is 1 to 100
+    where 1 indicates lowest quality and 100 indicates highest quality.
+    Encoder will decide the appropriate quantization parameter and
+    bitrate to produce requested frame quality.
+
 ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..bc00d02e411f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -200,6 +200,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 	static const char * const mpeg_video_bitrate_mode[] = {
 		"Variable Bitrate",
 		"Constant Bitrate",
+		"Constant Quality",
 		NULL
 	};
 	static const char * const mpeg_stream_type[] = {
@@ -832,6 +833,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
 	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
 	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
 	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
 	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
 	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..0f7e4388dcce 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -375,6 +375,7 @@ enum v4l2_mpeg_video_aspect {
 enum v4l2_mpeg_video_bitrate_mode {
 	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
+	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
 };
 #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_MPEG_BASE+207)
 #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_MPEG_BASE+208)
@@ -742,6 +743,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
2.17.1

