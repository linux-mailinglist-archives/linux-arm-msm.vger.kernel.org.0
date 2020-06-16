Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82381FB0C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 14:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgFPMbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 08:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgFPMbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 08:31:41 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1442AC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 05:31:41 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d15so14104520edm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AZqdoAEGz2z2dhDjwXWaMZ24wdl6oc5L+Rca1tEh8dc=;
        b=QGi15kqWXZial5swvjRzFESRGm8P1uF/+daQjuuEcJHnP/4P0mWvGEyI3VbNHNcGuF
         9gu8Riy/E81QVAiaoDQWksYKN3Jg6kE/91NmcK9fW8frd0xE4oYxEg/QBx9mPEPLU8E8
         d48xQepzN+wqZd4elN8+ucSIW7sgmpa7afc1vcYVmFLivhMvQdj80HPyi2K2ochU8C0W
         8e5uDgT0hCafWH3qnl0GURd4xzkZJKDmriloiEpAZ9rCvfOEyseeWLyq1fOu55ZyvJ1D
         aj+e0nKrTarax2OXtmmEkrY21dZikHLNH2H9u4E5hd4R3L656iRjZt2wL3L+n9eeVMdU
         Dq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AZqdoAEGz2z2dhDjwXWaMZ24wdl6oc5L+Rca1tEh8dc=;
        b=dHBAXTDLPl0f6Yv4c+QlsqTStavT7HptB2OvX6jDGC1k3vZTqp79YazbJoN0VVT6Wy
         J/BgM0Gk8fdRcaCjd4jQjwdAkHuNsAda2JYENXvYOByu6OXLioYDXQVnNtYg4Q7NoJea
         zmfBh93xaMiY5RZLiBu3h4KgTCDOUL8Hru3+4bczqeOOTyLfpRv/W9ZEp6n12z78qBDq
         EwuCC+PIg89StGMjeuBiSwHJqsXX2QDf90xfIoIEcu8GLxhnCdXnMBUevU6ZOStFOpsc
         RMoFuM326stIVWMaBXTo+3wZmx3hs55EZVi7jxitG3GB5dWH1ncm3opZbPHaWfD2zY5L
         eJ1A==
X-Gm-Message-State: AOAM531AciaK31qnmmxsoDY0MiCruP+6uOsJ9VXe8+p7cxrhsId7kyJt
        FHSjbPplVXrt3NMDJQ/oyFXCtg==
X-Google-Smtp-Source: ABdhPJynMFNvVmd+K4aC03wqQdfGmBOF+p561hBlcodxI+Rt0LMvos6uNRNjfOaw6xakOZJ/UVPhSA==
X-Received: by 2002:a05:6402:1247:: with SMTP id l7mr2203095edw.61.1592310699774;
        Tue, 16 Jun 2020 05:31:39 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id p6sm11071983ejb.71.2020.06.16.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:31:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/4] venus: vdec: Add support for decode intra frames only
Date:   Tue, 16 Jun 2020 15:30:01 +0300
Message-Id: <20200616123001.11321-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
References: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds support in the decoder for intra frames only decode. The
implementation in the Venus use HFI property for thumbnail
generation to lower memory usage and when the control is enabled
the number of decoder output buffers for progressive stream
will be one (for interlace two). We assume that the client will
queue on the decoder input intra frames only but this is not
mandatory. If the client queue non-intra frames on decoder input
they will be returned on decoder output with an error.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/vdec.c       | 7 +++++++
 drivers/media/platform/qcom/venus/vdec_ctrls.c | 9 ++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1bac30d4cf50..b9a3b9ca6ae1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -191,6 +191,7 @@ struct vdec_controls {
 	u32 post_loop_deb_mode;
 	u32 profile;
 	u32 level;
+	bool intra_only;
 };
 
 struct venc_controls {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..aa68cefcae96 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -625,6 +625,13 @@ static int vdec_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (ctr->intra_only) {
+		ptype = HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE;
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 3a963cbd342a..96ca8d9dd22e 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -28,6 +28,9 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
 		ctr->level = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:
+		ctr->intra_only = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -86,7 +89,7 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 7);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 8);
 	if (ret)
 		return ret;
 
@@ -141,6 +144,10 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY,
+			  0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret) {
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.17.1

