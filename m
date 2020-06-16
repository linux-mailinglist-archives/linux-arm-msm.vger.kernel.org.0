Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9571FBFD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 22:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbgFPUP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 16:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731642AbgFPUPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 16:15:43 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E754C0613F0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 13:15:43 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g1so137497edv.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 13:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AZqdoAEGz2z2dhDjwXWaMZ24wdl6oc5L+Rca1tEh8dc=;
        b=gy3NOO0TVFbQO8JeVz50/yi9A6AS7UoNAvAWS0yUYYqBasL4KYmzd6LX0YSCcoYzih
         WZAXIMLWxXdlpY/bvSoQGSycZqpuRHWIneQo9OcdzFjNUomCLSSqIOPp+mszgZqoPk58
         11vlXMHdE8MlJ4HgS2M268UOIQg/vg94l2gEPrHYgzwAlfNPcT+aLo+uzZqgkLwSOejQ
         7pTvUWtbeRhK8owv8gttck7ySAvgy2te3vvK1RRACY0AitSSke1l+HqJN1XmObrNj9pk
         9Gt8EA3JTwxuKVwPRdbirVeQDhKiVXmFX2yjEqB5roJ5YX8jD5XeOYouqsyg4Mbq/taa
         zXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AZqdoAEGz2z2dhDjwXWaMZ24wdl6oc5L+Rca1tEh8dc=;
        b=Xyp0KLZ4E+SRPqv4O/B5UsZXSgZs/4bKJzM1oqHaZ0XYN2qK0CabD9bCqXDe+dVidK
         8ljXE6PVrAf2yEVPQXJfdZZkq9FUEFN8FNcZ/CX+YuCoxWWhAzUfKK3A5bO+DEzWvFqa
         Xoay48seu8IItFzPAo19jT3QLN86VamUNK0rT731Xo6X14CSZgiu8WOAMV7h3b6dk/rZ
         kUm7WBsDMWlxjwUr+hLbzbkh70JmAS9Di6ud874OCtkjFXKUW2IzriPWlF58FQMHeUNV
         HjVViB558Nda0H2aXymJsyUnSQTQM+ffYb4WKwj8nQRN3Oav1mZTR1h6wNQ1zXZttoZg
         6u7w==
X-Gm-Message-State: AOAM533OhKX3WtuzK17EA8RCpHC0172bnCl8yE0hDH6dABj5AXtHCwty
        kHa/PQW3P8Cy7rovblytB/DzqA==
X-Google-Smtp-Source: ABdhPJxIsyuMwyfFK+YWY/8UN0ykI79Dmd+IfHF88uSKNdHy2vmbGNi43R1JVapD/sonJonUkmDEIg==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr4234503eds.385.1592338542217;
        Tue, 16 Jun 2020 13:15:42 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id b14sm11602658ejq.105.2020.06.16.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:15:41 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/4] venus: vdec: Add support for decode intra frames only
Date:   Tue, 16 Jun 2020 23:14:46 +0300
Message-Id: <20200616201446.15996-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
References: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
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

