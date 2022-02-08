Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01AF54ADDA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 16:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbiBHPwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 10:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244265AbiBHPwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 10:52:14 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C1DC06157B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 07:52:11 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k18so31548692wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oXg4Jj3B9xQjIaqAFM3fLctpAtmS47DYSQULyyYcAA=;
        b=ZmCN0TwD5zfpR1hL+i7yhZ7sHOiHkyV+2LHh1DCCmPa1hlUWNeTTplb2NISm3IpBXs
         TL/n5fgI893+GUe4KN5COGUy+2YhjUC2DtySCrOyuoygRlD9zBJQaOTi6jROC91fGaxQ
         mZvlNuQQQZz2JmyO1irBv6LzOAziHKg3E3+f/m/KikHQf53NUVaM3YigX/uEu0u1AhDj
         U6k9C7QwLt27E26fF8ikOTfuphXDXutuFogpfL0OZkgV3ObMYyeWxyiq5J+J8m3YqpUq
         e7e0JzCd+gXy/O8i4MPrD0tf9LWVqe3N3qwJPxD8f/XtKtr+uBk+ZE7jwoWVFeu8M5yu
         BZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oXg4Jj3B9xQjIaqAFM3fLctpAtmS47DYSQULyyYcAA=;
        b=H2Ruo9ih1zherrJw/IKzxqrsf+F694ZCgcXHQdI9OcholR9UfXhuoKFTkHFv/Wg8fb
         9ZxXhMS5zw2YvKzm/k7aW4kFqruaQVKgB/uZfvnDUpVmfKo1YT1CZ9T2WMFvPgyBbVTv
         90BhHpgzl+e/62+esLaxPem0exBFPBbB9qsG77MydmKNtwcrNqJWQU2r4hJYhTrW22w2
         mUzJf4kO+umUlwHsJZ/rtjYgW93mF6OCpjKidGNJ8leneDQi0LgqgosNBXMHTc8RBlaR
         fXPA2ifxIHJjDgzQc7uizS7w4Ch1de27zum8BQRZy+2rhfUMtpjLu6+3BaO3h0Nr+7rk
         v7vg==
X-Gm-Message-State: AOAM530Qt/VPRW6v1GE3NilueyCMzCowYXuqMqEq0qwklW4iZFwsf6r5
        IFly04HaO4PQJl8pCIxwPdk54RPKwPBIsg==
X-Google-Smtp-Source: ABdhPJy7L/4LKj0W2KQsp+BjC1Ka9Iz9ZZMvlooOUqwrdj6d19WKhR4wooW515NHj/8MT5dlEyJ0ow==
X-Received: by 2002:a05:6000:11c8:: with SMTP id i8mr4005541wrx.590.1644335530343;
        Tue, 08 Feb 2022 07:52:10 -0800 (PST)
Received: from localhost.localdomain (hst-221-62.medicom.bg. [84.238.221.62])
        by smtp.gmail.com with ESMTPSA id m6sm15076068wrw.54.2022.02.08.07.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 07:52:09 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc: Fix h264 8x8 transform control
Date:   Tue,  8 Feb 2022 17:52:04 +0200
Message-Id: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During encoder driver open controls are initialized via a call
to v4l2_ctrl_handler_setup which returns EINVAL error for
V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM v4l2 control. The control
default value is disabled and because of firmware limitations
8x8 transform cannot be disabled for the supported HIGH and
CONSTRAINED_HIGH profiles.

To fix the issue change the control default value to enabled
(this is fine because the firmware enables 8x8 transform for
high and constrained_high profiles by default). Also, correct
the checking of profile ids in s_ctrl from hfi to v4l2 ids.

Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c       | 4 ++--
 drivers/media/platform/qcom/venus/venc_ctrls.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 84bafc3118cc..adea4c3b8c20 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -662,8 +662,8 @@ static int venc_set_properties(struct venus_inst *inst)
 
 		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
 		h264_transform.enable_type = 0;
-		if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
-		    ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
+		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
+		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
 			h264_transform.enable_type = ctr->h264_8x8_transform;
 
 		ret = hfi_session_set_property(inst, ptype, &h264_transform);
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 1ada42df314d..ea5805e71c14 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -320,8 +320,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->intra_refresh_period = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
-		if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH &&
-		    ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
+		if (ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_HIGH &&
+		    ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
 			return -EINVAL;
 
 		/*
@@ -457,7 +457,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
+			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
-- 
2.25.1

