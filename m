Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54440261D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbgIHTjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730942AbgIHPyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:54:44 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB778C06134D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 05:33:34 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z22so22235775ejl.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NcEeOZgUSVybaozrvzLOP4ZsIw0NJzWU1jk5v7jntbE=;
        b=vBa7YSUiMOArxRr8RYn5eMWXo+v3zACwmzTxGkJE5TSuaR0Pvugz/dUS4+/6GX2aTT
         u1pNNYLrANE3rkjF7hrp2TSp60/UBruOyThfQKtkN6RrezEOioNm0wsqP3XUXPRb1+nr
         eSsqXB+AkojP3vY0Ui544eY3EIx27JaQZhbcr1rhWSMxfdxnzw1HN+vrHrjmg98sGffC
         54p8qXVm/QErO+a9emGrfC0SCcq0mbB5oRJg9OLkW2wgIIzsKAMZ9DW9+TvgmhW3RWzz
         F6Y82uraV0LRFwBmlLbAV+PHNoFARq4y8oPrFzfjBFqSYBULrP1IKc464lqiGHUdHU+G
         41Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NcEeOZgUSVybaozrvzLOP4ZsIw0NJzWU1jk5v7jntbE=;
        b=AXjarDG08PPCbl0XnyaAS9x9ujikaSj3PCtxyMYDxgTbfXdW6TT0sbXntxsbVAaO1R
         i2i59vCusdJVY6lO3Ka2oEue8HR1679WJgy55VCL1MdhSl/h7Fw8Z21KE45B2HklvIZa
         tAclX8EI++KyhuBK87jLFxKLrrFEK+EXlKz/zhOd1OFh0EIGCU/BIr1fDM0Gs2lq5lo8
         ZyAuT8DFhbdduI0FAjZGA9BZ7XUzs3i/TEwDx1Z8F+BsB97WbpVf/4IA3zrM2pevtLQ8
         g/vqtJZT2VXhAIdMFB8b8+7+pt+fSxc3SfbE8SDSOSHAbWDzCVqoUZxjzkwoF7JElkZK
         ovHA==
X-Gm-Message-State: AOAM5315v8zb10A6EorLm+Gr7FcDIRQRHjU1+SCfJvFNeX4+XXYBr2fi
        wKbPJY7BONTB0pLgKddrspUM1vkdAZjzzjes
X-Google-Smtp-Source: ABdhPJz4IJDBT7vUASqEAhfweZQi4at//aV2U5ukkwEvWdJ28fgPl6KV05PWHdqQJOWQOQfX3foC7A==
X-Received: by 2002:a17:906:2c14:: with SMTP id e20mr26923490ejh.205.1599568413372;
        Tue, 08 Sep 2020 05:33:33 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:32 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 4/6] venus: vdec: Set/Get VP9 profile/level
Date:   Tue,  8 Sep 2020 15:32:19 +0300
Message-Id: <20200908123221.2793-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Get and set VP9 codec profile and levels.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/platform/qcom/venus/vdec_ctrls.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 3a963cbd342a..f3f41c1baa6e 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -22,10 +22,12 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		ctr->profile = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		ctr->level = ctrl->val;
 		break;
 	default:
@@ -49,6 +51,7 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		ret = hfi_session_get_property(inst, ptype, &hprop);
 		if (!ret)
 			ctr->profile = hprop.profile_level.profile;
@@ -56,6 +59,7 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		ret = hfi_session_get_property(inst, ptype, &hprop);
 		if (!ret)
 			ctr->level = hprop.profile_level.level;
@@ -86,7 +90,7 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 7);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 9);
 	if (ret)
 		return ret;
 
@@ -133,6 +137,20 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
+				      V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
+				      V4L2_MPEG_VIDEO_VP9_PROFILE_3,
+				      0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
+				      V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
+				      V4L2_MPEG_VIDEO_VP9_LEVEL_6_2,
+				      0, V4L2_MPEG_VIDEO_VP9_LEVEL_1_0);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER, 0, 1, 1, 0);
 
-- 
2.17.1

