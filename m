Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EBB28857F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 10:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732787AbgJIIpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 04:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732474AbgJIIpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 04:45:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C150AC0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 01:45:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b19so4141917pld.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORjMAqZkzpP1CBUX3hMJCRTwWJbFlamPjNAuY/fQyLo=;
        b=U+15yQkQeJs/btau5BIG2D7ByHK7a1ek27TkHiV6qwJxbPFF2+afMtvhO5Xj6/E0gO
         oIplZv7qRTFoH2ROyu6YY3ceETHBmlGtzZd4EK4xfAGkU3qdj1jxxawBhQocl7YUPcqk
         hHLK1NPQro1DkOmcj4CdKffYZB5ssV2juSzL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORjMAqZkzpP1CBUX3hMJCRTwWJbFlamPjNAuY/fQyLo=;
        b=b5rGxphShx/F8CInYJM1lmYcbTOvqVIunGyhQzERvdJ5oiihcvzYyM6ezK5wNHH+v9
         o98WCoS7pnWmbW9LBjhHbWDAFrMcfV50kFM4nVSjNtVozHRZJnF5tIkPnIEhP9+cQ8M5
         vBuFROMsbIYjSG04lPZE6sP8vvir85MxeNPjQ+fF0bvwUPhze/8+gxCn/LwfhScYhuJM
         2xCmq2fpJLq+V1onwYlEeclpUUhGMtTvkrPPvYN8UIb0CkXuFkpI7RsVDiVxrDQEWbCP
         co35788dwGwvwcLhqxI7LK5hMbOjVPeEqU08fGpLMEdY641ST0Q2fjy5KjFgm15k8GcV
         ZPkw==
X-Gm-Message-State: AOAM533tzOAN2vpZ/1hC0cBbQeT2NDdlE6ogapY615x3pHuIn93ispb7
        GhoRHjyUk6+ySKgHDzzC+rMNnQ==
X-Google-Smtp-Source: ABdhPJzA0jWGMM2jo96MtVdKXdv8pv4bFGf3nZggi8s+JXNc15k3wzeGhC7sm6TVO8oYRFFSg9+qqQ==
X-Received: by 2002:a17:902:a588:b029:d3:7f4a:28a2 with SMTP id az8-20020a170902a588b02900d37f4a28a2mr11325987plb.26.1602233144239;
        Fri, 09 Oct 2020 01:45:44 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id w10sm9872760pjy.13.2020.10.09.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:45:43 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] venus: vdec: return parsed crop information from stream
Date:   Fri,  9 Oct 2020 17:45:33 +0900
Message-Id: <20201009084533.2405320-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per the stateful codec specification, VIDIOC_G_SELECTION with a target
of V4L2_SEL_TGT_COMPOSE is supposed to return the crop area of capture
buffers containing the decoded frame. Until now the driver did not get
that information from the firmware and just returned the dimensions of
CAPTURE buffers.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7b79a33dc9d6..3bc129a4f817 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -361,6 +361,7 @@ struct venus_inst {
 	unsigned int streamon_cap, streamon_out;
 	u32 width;
 	u32 height;
+	struct v4l2_rect crop;
 	u32 out_width;
 	u32 out_height;
 	u32 colorspace;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ea13170a6a2c..ee74346f0cae 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -325,6 +325,10 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 	inst->width = format.fmt.pix_mp.width;
 	inst->height = format.fmt.pix_mp.height;
+	inst->crop.top = 0;
+	inst->crop.left = 0;
+	inst->crop.width = inst->width;
+	inst->crop.height = inst->height;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->fmt_out = fmt;
@@ -343,6 +347,9 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	    s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
+	s->r.top = 0;
+	s->r.left = 0;
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -363,16 +370,12 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	case V4L2_SEL_TGT_COMPOSE:
 		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 			return -EINVAL;
-		s->r.width = inst->out_width;
-		s->r.height = inst->out_height;
+		s->r = inst->crop;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	s->r.top = 0;
-	s->r.left = 0;
-
 	return 0;
 }
 
@@ -1309,6 +1312,10 @@ static void vdec_event_change(struct venus_inst *inst,
 
 	inst->width = format.fmt.pix_mp.width;
 	inst->height = format.fmt.pix_mp.height;
+	inst->crop.left = ev_data->input_crop.left;
+	inst->crop.top = ev_data->input_crop.top;
+	inst->crop.width = ev_data->input_crop.width;
+	inst->crop.height = ev_data->input_crop.height;
 
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
@@ -1412,6 +1419,10 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->fmt_cap = &vdec_formats[0];
 	inst->width = frame_width_min(inst);
 	inst->height = ALIGN(frame_height_min(inst), 32);
+	inst->crop.left = 0;
+	inst->crop.top = 0;
+	inst->crop.width = inst->width;
+	inst->crop.height = inst->height;
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-- 
2.28.0.1011.ga647a8990f-goog

