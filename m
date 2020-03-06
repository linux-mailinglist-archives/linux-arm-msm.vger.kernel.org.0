Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B1017B2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 01:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgCFAX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 19:23:26 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:34161 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCFAXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 19:23:25 -0500
Received: by mail-pf1-f201.google.com with SMTP id s13so234796pfe.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 16:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Ap4Y6lrA7wwms6HJbe1KlUHr7uZJFXAnwOc+aJCMcGw=;
        b=oDzVpckCB+y7yfmoAECXB8tohkyWsCOdsNKZkx+trBGowcgYtRkOOjHiLdun/wpXJl
         iXYjcJx2uz4NN0KC55Yigj1YnlhezsbcDM5WJ7Zg9An32BJE3UlhjPfJmv3Lmr4arJj0
         TEBF8Q4YrCn+/m74KDKnbENN92WnEww+9pHyo23Jf0y5JavPTTJNLkQPXQexaJbMEVR+
         SDn2AWNGzmNIKgrlaWxD4qh3RZCnW2dt5ZruCVsfQi17LeGCl+j72JXtJwD6RpOfEy/q
         qvqhvfuM4i8xopNYcQEvPxujz6S0+65M8vXwQ81CClwRcFfeJSTbEkr8N8OSgjEWRBkc
         zdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Ap4Y6lrA7wwms6HJbe1KlUHr7uZJFXAnwOc+aJCMcGw=;
        b=PVuoM3AbseMQSfkhjYXZxVfRZfgs7UEZgCQTN2BUj9Pv0xm5KFZGgNjPcSJwLPEBAk
         7gdg2kHvOotwTH+TKuYqlvMtSpNc6ItdtmQvfbXIFnGQzcj4I2K7vWSBwXCAutwjshEm
         ba5gtFUCZs7kMrCquQpmf/5IS5EE21MKM/weJD/IcC/UW9BKZtPYD2lOwxfO5n3hgmdX
         JPNGsSuIpMGOgcv27KgC2ScMLfEE09lKLihQKMryv80Dvf4+0s241Xgj8gne13WTKtQj
         8UonIx/WYcVF5eSD1DDVw+BrJLPOC+Y4397RoLxE9q19BlvQab9K7kQj/7jaInoNMKjH
         jsFw==
X-Gm-Message-State: ANhLgQ2OhQDLYX63oxY4BV4JhupqilxMJvErczMpzOvYWSRAWL0stN1R
        gBcKrk4T2+HaZdycV6XJTT9K9O1dr3CpUJc=
X-Google-Smtp-Source: ADFU+vtw4q/lhe18L1u2BOQESojFw4lseFTt0ZIIoe62O/odzRx0ul2wI2m5IhJjADKaviWBonS6Qc+2d7SaJwqS
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr697622pgh.96.1583454204720;
 Thu, 05 Mar 2020 16:23:24 -0800 (PST)
Date:   Thu,  5 Mar 2020 16:23:21 -0800
Message-Id: <20200306002321.3344-1-jkardatzke@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH] media: venus: fix use after free for registeredbufs
From:   Jeffrey Kardatzke <jkardatzke@google.com>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In dynamic bufmode we do not manage the buffers in the registeredbufs
list, so do not add them there when they are initialized. Adding them
there was causing a use after free of the list_head struct in the buffer
when new buffers were allocated after existing buffers were freed.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
---
 drivers/media/platform/qcom/venus/helpers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index bcc603804041..688a3593b49b 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1054,8 +1054,10 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
 	buf->size = vb2_plane_size(vb, 0);
 	buf->dma_addr = sg_dma_address(sgt->sgl);
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    !is_dynamic_bufmode(inst)) {
 		list_add_tail(&buf->reg_list, &inst->registeredbufs);
+	}
 
 	return 0;
 }
-- 
2.25.1.481.gfbce0eb801-goog

