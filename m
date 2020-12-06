Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867D72D02C3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Dec 2020 11:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgLFK2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Dec 2020 05:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbgLFK2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Dec 2020 05:28:47 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0896AC0613D0
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Dec 2020 02:27:48 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id x16so15178891ejj.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Dec 2020 02:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pU/BEnvHNZor0iOPVM1/S+HqmPaJIMs/busMwuezIyY=;
        b=b5a/HopZcTOmVh+DQlV7Q5Fplz2QY6DKujQjBu/qcTQfqIS3A/E1426hN3+2sazCXs
         m+UP0HIXmKSjeZcnkQJvNKFhVWfNHnc3BErhnyimNiyV23vaWhxknn4s9qfVhKBlA2CG
         Q2uPXXJ8OCZx76afynB+N5ckWJM0/TXlOaWgSirqVHS6zX84xdlgI94UesSS1UVd5Xpz
         CX3RKbO98vx++VHGbFVGU3hK2S0kaRrD+AdUltTQU7CI1FB/kIO618i02k9bXfPvJYRh
         yURxoekvQjwLYaSazatZo//nVYImDQ6AQSBrEakYDFHLK1D7k1pfKYFOyspK/rIDew0I
         Lj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pU/BEnvHNZor0iOPVM1/S+HqmPaJIMs/busMwuezIyY=;
        b=HbLNm4aQ6FYlJlBpeir/sChSDlQxoYYUAHyAroKmyiteJDNPGANwRJASyyRnsEyAY3
         X/lKcIB4qS2oqabD8XtdyzbDadQS+erafGfBmiWboMce7K762maZKVgBxugVDCfCNoK6
         4p1M9hytJUMo/+5GgEee7Tb4sy2+XqDa4f+Gwzjn9VXPl8QCxgBIO4rAbw8s5MXzPuhU
         i7k2S+XWGQ5QoJY7sqbv2ia48ClhTPnwziTQWO3iozGzWbvHj2qNBZWd3CcO5u/fbT7O
         5yFL/q44MgvqDJjpJ7Ng/5J7DYzN/IOG4xEijW+LQDVesZIvJ5GObui234XeturM5iVv
         2bjQ==
X-Gm-Message-State: AOAM530e3B99X8OJTNqOBT6bAiwdmO8LKguS0tUgOra/Yr9V88KA0470
        WYXo7GRb8QGS57DoR9T5h/06SIcCXipjz/WL
X-Google-Smtp-Source: ABdhPJzXuBijI/Qs1l+neDIo/NCCBqMc6zjMVX1WW4Sj311JbA8DINf9lAsCJ0idkex36y7FaU+4OQ==
X-Received: by 2002:a17:906:7ac7:: with SMTP id k7mr14437474ejo.454.1607250466782;
        Sun, 06 Dec 2020 02:27:46 -0800 (PST)
Received: from localhost.localdomain (hst-221-17.medicom.bg. [84.238.221.17])
        by smtp.gmail.com with ESMTPSA id d4sm8464736edq.36.2020.12.06.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 02:27:46 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/4] venus: venc: Add support for AUD NALU control
Date:   Sun,  6 Dec 2020 12:27:17 +0200
Message-Id: <20201206102717.19000-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
References: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Access Unit Delimiter control into encoder.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c |  8 +++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 097fca39eb79..f105a34ded5a 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -243,6 +243,7 @@ struct venc_controls {
 
 	u32 header_mode;
 	u32 intra_refresh_period;
+	bool aud_enable;
 
 	struct {
 		u32 h264;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 615d90612ebc..99e0a82a31e0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -745,6 +745,20 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		struct hfi_enable en = {};
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_GENERATE_AUDNAL;
+
+		if (ctr->aud_enable)
+			en.enable = 1;
+
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 801026fab89d..a1aa56c74bc5 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -211,6 +211,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		ctr->intra_refresh_period = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+		ctr->aud_enable = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -226,7 +229,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 34);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 35);
 	if (ret)
 		return ret;
 
@@ -381,6 +384,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
 			  ((4096 * 2304) >> 8), 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

