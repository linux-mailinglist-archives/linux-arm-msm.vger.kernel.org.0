Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B8E4666B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241759AbhLBPjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359068AbhLBPjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:19 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D506DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:56 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso2620414wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=CivMWtr7KwaCmc+8k4tGJ3UJmtXhp2zR8gG/MM3FYYtuxaLNt9zbe26OCIlyLepU29
         eqOsAoDHDQM9piaxbYM4rFC56rFqnVmMxGYbpy6YyRX+/oA+0S6jAVbElEaK5NxhMXXJ
         U9LtQhCUZI7UgterA5GshvSmR43mN4vB+NtjLsQXVnaGvzW403fFjS7BUUFlfivPMFVf
         VR4jBYH0dOYHapH2pgMpPtSvrGBSuMVRzNtatMv3INbS4ZqRCxaXywz6PUyeIAI2d0zO
         dtsvz44ASUiP2Lt2Vrw8fKj3gRIWXVquN2FW4q1uomcV0/oT26WrfqEOcvtXW/TEEriQ
         Igzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=Q/SL0xeSYSuQi1qFEP85/iHhjf1frecX47Z4pT0JfUD6YZ4qf/PlG1FWWEfAKIiqcf
         5DYFn2PBJBrEqG9oDStzyFZuVNx/rF/mSc+Ewd263fvzyLkLHQy1V1KObMIdc+XVY9w4
         9Tqk+C2khKECweDlb+bD7tPFZFPCTJ/yvouEpGtmKNHnxZVKxcUVV4iwSLmoq0+EZBvc
         xbqXMuBOCgQhVBHDVqDk4Tu5CK83HUZc/Xqyn0rKOxcQrRJZfMhc30Jdy4W2uN+RlBJ2
         CgsCGoWzmdft8oZCqbagQxCHGOfn0BP0sVcUwRytKgZ+nf083/GfSwH+Sk2lpr1Q55/Q
         lhzg==
X-Gm-Message-State: AOAM532hLjcXNxWv7dLm57dkE3MIIkBMBSqz9GN8usevqpE22ADLRr+W
        riCqU9//FL6gmkUU1EEg2SPVSWBPSBu8OTVK
X-Google-Smtp-Source: ABdhPJxJFQlMOWafCwpeGdQjm8B78cvLopyfQMh2Tz+3/9qh3FvBd2wIdHyb4P9TEepVCVrRsbqe7Q==
X-Received: by 2002:a7b:c256:: with SMTP id b22mr7184832wmj.176.1638459355100;
        Thu, 02 Dec 2021 07:35:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 13/19] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Thu,  2 Dec 2021 15:37:23 +0000
Message-Id: <20211202153729.3362372-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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
Tested-by: Julian Grahsl <jgrahsl@snap.com>
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

