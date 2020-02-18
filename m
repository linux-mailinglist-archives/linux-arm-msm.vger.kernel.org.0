Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37C2162F83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 20:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgBRTN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 14:13:26 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:47193 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRTN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 14:13:26 -0500
Received: by mail-pg1-f201.google.com with SMTP id l15so14452126pgk.14
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 11:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LCLnkWXoXz9OcghUi3epooWnoZGfpAtSgZMaGiJOKu8=;
        b=YIweNER3ez6cX4gaq18ciHLsjwesfuzsnzZUVkEWb1usGcYqij6EvEOSioq9vbcNLG
         uKFvYE3Xk/a7jQig8xL9EBlN9i8+ihe4RKWXgdJ5nKCYgJXND+u2ZetufpqA9KDrCIFv
         lvjBXDYLfHfGTMQaLOdbQa87yxio9rdG/JGD07S3w7NgAbjgfOYqzYx7GMRbP9D7GG4x
         bhpfm915Ho/+44e8OjsBgqnCJILJ5MPkaQ2xBqFr7qkEre01WuEZS4SgALakc2fxFPk+
         4xhXijqyKnjj0ycBtuXsCdykIer2P2yWy4PgU1uyxuGZR5QyvRmmRGM1UdoUmBpUDcdD
         EFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LCLnkWXoXz9OcghUi3epooWnoZGfpAtSgZMaGiJOKu8=;
        b=SsmiQBdIQ+ciLNTWogxI6ZER6Zpcm1C2X1YFYuSpwfOMKjSwV85tvcYtYcm6JJbPOr
         VWRj+QogEE4C0DOuGXi0dP9BAj4Q2MXRIhpz4xur0FF0KMPTHsNWcZLRRQU2BDxaYKgA
         YPFFIYiAIis+hQGGll8sFAY84vscC5Ro8tQyTU/62ga1Wym7RSkEguJKSw362YIu/wjN
         +slP5MKh7o0L2tVQ96/U+vk/1kduInK8PYqTLTKqOKfmSadcShRjmnIFqCFqshMZIHNj
         OdqB+80ULRFGMQpzeDuo2wkEHV3zesjGKBw++YjBXW28ml+bTpPQgFqNOWNLQtH9zw8O
         tWug==
X-Gm-Message-State: APjAAAUUWfnzOgPVh3qJ+s4Ow6WT5N8YUCnSviWq+FgjCWhC5yuu+y3P
        yKDOcUJYphZs6ji9wnxQGRnPJBMfQGNSiIE=
X-Google-Smtp-Source: APXvYqw9YyGXQE/cL94lSoCe4U1L2Ew9nOOYDNGW+B885moEiafTKrGvfabznypD6GeZYgyW48nJ3NAelWnoIpaX
X-Received: by 2002:a63:2a02:: with SMTP id q2mr23581913pgq.198.1582053205231;
 Tue, 18 Feb 2020 11:13:25 -0800 (PST)
Date:   Tue, 18 Feb 2020 11:13:14 -0800
In-Reply-To: <20200213213007.17023-1-jkardatzke@google.com>
Message-Id: <20200218191314.157285-1-jkardatzke@google.com>
Mime-Version: 1.0
References: <20200213213007.17023-1-jkardatzke@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] media: venus: support frame rate control
From:   Jeffrey Kardatzke <jkardatzke@google.com>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Mauro Carvalho Chehab )" <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Frame rate control is always enabled in this driver, so make it silently
support the V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 877c0b3299e9..15852bc26231 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		/* Silently ignore, it's always enabled. */
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -214,7 +217,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 30);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 31);
 	if (ret)
 		return ret;
 
@@ -351,6 +354,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.0.265.gbab2e86ba0-goog

