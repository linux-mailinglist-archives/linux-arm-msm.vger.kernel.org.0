Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7CF44DA1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhKKQQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbhKKQQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20363C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:14:01 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d24so10752397wra.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRpNVGa1JbcZn1FKX6AjH+HRmVh5j5nACRnygN1F+XI=;
        b=To3zHBYITlvL6+1g219fMTYZ+0FG5KSN6a5/en039XIlmdPV1FIyjqf8BKuqz1FGy7
         F7OuGQIwu/hUkXR097BMxmHORv7rPJSZeXm6WIBSEsUblGj5FtfUK9JeDfbCeVvW7bTs
         p0wURRlEmQLT106zj/0qTO9arbJ3yBGWglb0h8G/yR/pCKL67NuD+8agp775DBQrBrEr
         HVLM7ypkN5aXinTg3QtN6ntZEtjtmq6KeLJpqUi+PJrABeRRLkaKI4LEiXvJ3C4ehuYo
         z1vrtTjfJeNrQiVhRmLgdbsvTVGdpieMGW7is1pk0QyO0dvIpoUQkLk7EHJRFGJy/T/c
         N2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRpNVGa1JbcZn1FKX6AjH+HRmVh5j5nACRnygN1F+XI=;
        b=ccLAbzaHrrEFiHYqo5F+h5bmkgmOeiHuUsR3FfSWQIDId/qjKzSKP4g10i68sLPFHq
         QHlw7nr4MfyySXF1BRHNw5M+XBxTG/smdxGQ38P/fICxVhg9BtYSOJBs6l8RnU4tLFkv
         etlhB3wxIChXOGtWFHtbmk/+Eda6BLwgKKOpsJiZ4WqAGNPdsweGNzuYsIUU1uGtnz6S
         VgxmWgmylARzV+lbOIQ19TfeVEvU3auSWXdekGozz+ccVY/uVssnZcCeIqAcOTzHaLsC
         41E5QGNu39Ha8LoT8EbSTAz272gjQ5WR+jhIlcfH+UXlFlDnysw9j6Dm3ol9ztvDBSGI
         YNMQ==
X-Gm-Message-State: AOAM532x2DBj9E4Kk7nNEdp0YkTvg7VjoUtd1H7xBp/W9mdnAmyD9ltm
        qXYcOZ3S5vdT7NaXSKLfdnj0LOBr4tIXXg==
X-Google-Smtp-Source: ABdhPJzM1hL9CaN8faohfitlbCQP6Zaql8AWstKZH5bdFJkSybFKmWU9NzrLBdp+EF4yA1fqNaZ9tw==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr9845559wrs.219.1636647239286;
        Thu, 11 Nov 2021 08:13:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 13/18] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Thu, 11 Nov 2021 16:15:37 +0000
Message-Id: <20211111161542.3936425-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This function waits for halt_complete but doesn't do anything to cause
it to complete, and always hits the "VFE halt timeout" error. Just delete
this code for now.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 5c083d70d495..af71dc659bb9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -402,17 +402,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
  */
 static int vfe_halt(struct vfe_device *vfe)
 {
-	unsigned long time;
-
-	reinit_completion(&vfe->halt_complete);
-
-	time = wait_for_completion_timeout(&vfe->halt_complete,
-					   msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
-	if (!time) {
-		dev_err(vfe->camss->dev, "VFE halt timeout\n");
-		return -EIO;
-	}
-
+	/* rely on vfe_disable_output() to stop the VFE */
 	return 0;
 }
 
-- 
2.33.0

