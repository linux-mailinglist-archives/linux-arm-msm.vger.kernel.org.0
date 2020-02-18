Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4F8162EE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgBRSma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:42:30 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:34416 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgBRSma (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:42:30 -0500
Received: by mail-pg1-f201.google.com with SMTP id w5so14482624pgw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=d2wRJbkLFbnX5h47+/KLKTC9EOu1JUk/eVuafQjYbHQ=;
        b=oI+QH8Mdb2jaFfP3q7AupqB0QhhC5C1B/q18uf5tlCkfj0fGYsfGN3WEhSgn8ktTye
         UiMgo+VvnJG1h3Bgz5YmaO1VlLK93iihg4L36/gRFJNb2Qd3D5Efu0r8r3znpxP83uCe
         JHZIezRmf7eCcLSzet3tsvEgcms82qlBc2J8accp8ALlkwXpz+nhXOQ15ndG0JuS9C+j
         b+vSHiWUr6dM8sbKQEbaEITysRx+/3XJNjx+f35KRLF7cucVH/OoTLPRV0xXAJgaawi1
         Kbsyhl9TtefwGkKkozcsvWIJnfYrtV9lmiao7Oz6XkOxa83P5/iqajKbDe+n0dWBB0jV
         2mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=d2wRJbkLFbnX5h47+/KLKTC9EOu1JUk/eVuafQjYbHQ=;
        b=DhO9vGh7Cc0HPfEFL7tZBKbJsZ4vH0PDgkIfShtqFoL8cHXG2impgw4bit4wxIQh7j
         Jz8esfyFEDi7znKh32m7QgV0YjSAMCPHuvQFjyQDkwfEA1QisV/jbOjNuA7/tCHC7JzV
         fgB8h3aGbaJ8KZxWt6JMetd/+ZUY60kcFvWlG0Kppim3jkybljWaVpZA+R/21vxQ2O2N
         9eGQA10K1o6R1GMEqZaWlXAal7RVdyBKXvrLq39xVutnqZDTbbJ7gx/q5v2wPEnTvS9Z
         tctS6m4mxPCI4ex6EPWY4/YFxbSYqy5a/03umxaTAgvzqzdPyiWLUJmHnuqSZ4TDYCp2
         AFWw==
X-Gm-Message-State: APjAAAVYLPt5Fmxg/LhoFVfkpx4s04tQIgN0UipPesEAiP8uqYMjlTdb
        OfYOEtxHGHLaBaYAKyypSum63pN6+QZisU8=
X-Google-Smtp-Source: APXvYqybJhwnaBstjsEqK9dPPh5DMtXVQM3bbQkXsUXhhmQa5y81y2B1B6yYNSTQz30gxNcqcGYiP6k0NLPF8xd5
X-Received: by 2002:a63:455c:: with SMTP id u28mr24914926pgk.163.1582051348672;
 Tue, 18 Feb 2020 10:42:28 -0800 (PST)
Date:   Tue, 18 Feb 2020 10:42:16 -0800
Message-Id: <20200218184220.139656-1-jkardatzke@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v3] media: venus: add support for selection rectangles
From:   Jeffrey Kardatzke <jkardatzke@google.com>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Malathi Gottam <mgottam@codeaurora.org>,
        Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Malathi Gottam <>

Handles target type crop by setting the new active rectangle
to hardware. The new rectangle should be within YUV size.

This was taken from: https://lkml.org/lkml/2018/11/9/899

Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
---
 drivers/media/platform/qcom/venus/venc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 453edf966d4f..73b3181eed9a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -479,10 +479,26 @@ venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP:
-		if (s->r.width != inst->out_width ||
-		    s->r.height != inst->out_height ||
-		    s->r.top != 0 || s->r.left != 0)
-			return -EINVAL;
+		if (s->r.left != 0) {
+			s->r.width += s->r.left;
+			s->r.left = 0;
+		}
+
+		if (s->r.top != 0) {
+			s->r.height += s->r.top;
+			s->r.top = 0;
+		}
+
+		if (s->r.width > inst->width)
+			s->r.width = inst->width;
+		else
+			inst->width = s->r.width;
+
+		if (s->r.height > inst->height)
+			s->r.height = inst->height;
+		else
+			inst->height = s->r.height;
+
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.0.265.gbab2e86ba0-goog

