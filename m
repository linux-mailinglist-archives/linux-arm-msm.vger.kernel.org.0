Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 929F015CD3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 22:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgBMVaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 16:30:14 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:50436 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgBMVaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 16:30:14 -0500
Received: by mail-pg1-f201.google.com with SMTP id q4so4591152pgr.17
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 13:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Zm5HmfQ08ScCng/zTBgIQ4r/Dsxq2SkuLGsGUlmZSkY=;
        b=FZy9rV7Klz9GDbl/2sdmUC/UJ/RAnihDFexPPquCcX7fA5myeQhOvB6yQbtB0DYzp8
         AHlnNLF6EHrPz+sdVv3oBVeJEE/PAosTHcZxnAOFF39O1ISUEyz4Bu5wHyGQyD3S+uyi
         Xec11iom33bDLtPhPCkzUgrbPooIQTdUE5E0+48ajYN1svFa7eX66g8+tdvllvLmCG8l
         RtBr0LKPOaY2xzET9klNKXlSJerTWzW4dunSlsqhSTzYLPx1WDhQNnw/cgkDSie6oN3c
         i06hiDP+jTigYs154mYeCq/yJK6n0w0H7S+QxdocB+QGVn69vSYW5Dj53FNUykILtAK+
         6/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Zm5HmfQ08ScCng/zTBgIQ4r/Dsxq2SkuLGsGUlmZSkY=;
        b=Uzve3smm48/irGnrD0G9V21HVxmv7+AnBBxQwG+gm2LseGTl1IN/A02fdKpHTfYDGi
         graqUWuRZnMFlilLZtPSSobwZ01uanIleDycR4PcqTrLH2hN4sHr6ReN3JJFl5MLgiyc
         4injqmryOCpWOKvFt1+h+se0l4Z+fYuMgxzxSl7HFYm9KvIEdBEwYubBFzlt3XJRT1RS
         v+bAV5dGqk4ad8wFjLHVEafpgAB/43MYU5pMGllc9qAEaZryBDPKyRhMrAkD7rVfwY/k
         azCD2gPmRlJp5yeBkCWtjobYqMBEiD5M4JWHLcQJw/Go9iFsytD1LIyxzbcoEAA4paZy
         +4sw==
X-Gm-Message-State: APjAAAUkKU48/u4eEkJvqW/WhMLn0i7sXojn0iKU5uSyOYw+oIf1a+SQ
        Aroih+waZHW8YgQUAY5g61QIS015qICiXtc=
X-Google-Smtp-Source: APXvYqxrnq4hOQ9yBYQtQJnm2++rP8XeKrGAyPFqtvw14576pDXWbHeTVzEyW97kxq423Tf9eiilGCGhoMx0u0yE
X-Received: by 2002:a63:2309:: with SMTP id j9mr20056541pgj.54.1581629413468;
 Thu, 13 Feb 2020 13:30:13 -0800 (PST)
Date:   Thu, 13 Feb 2020 13:30:07 -0800
Message-Id: <20200213213007.17023-1-jkardatzke@google.com>
Mime-Version: 1.0
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
 drivers/media/platform/qcom/venus/venc_ctrls.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 877c0b3299e9..9ede692f77c5 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		// Silently ignore, it's always enabled.
+		break;
 	default:
 		return -EINVAL;
 	}
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
2.25.0.225.g125e21ebc7-goog

