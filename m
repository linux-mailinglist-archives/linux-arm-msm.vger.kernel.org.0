Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D367C47CA63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239896AbhLVAgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239908AbhLVAgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:02 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C728EC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:01 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n10-20020a7bc5ca000000b00345c520d38eso44625wmk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5aY/+5y0GXzDTlZpEpWE7obtZJUB89+l2L8U2MuTUUk=;
        b=BPeDKNPCB6WWlt8zL5J0NV2FukQ5IXZpWGqrRef6mF5EdaCV+13qg1lDSc6z7iKn4N
         Xh1KWvmuaoywmqX+iePZaH0dvSp3yrs+PvqecQTKRcwwc8AuOSV00CvKOnSpsUi0kjWa
         2zKoAl9VDkx4LcJ+UUfG2z7bQhleJgS1HRsA3yUMbPtiv07of7wvTi77Hs0NSUCz3T7q
         zexOt84VzynROd1yZJs+u31IzMqoooNg2pPgQTciD/EZ1450lkpX/kTxGseO2u5RzLJa
         spOc4x8k8peZBanPILRAzduKwBxItPjgYiRZjXBvL2/eJ389QXf+Xq3jFla/PyfCUMTZ
         pKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5aY/+5y0GXzDTlZpEpWE7obtZJUB89+l2L8U2MuTUUk=;
        b=19m4UdtbnB+FGyUwsv6QxhV1z7vAk7NrToWtIXHK96rH4yCDdeFfwh+i085JFAhiPm
         uSC1/y2F/pj14H4/aJ0CPqYOeuuq1wpk9Ia6DaWDuTRSIZvIX4pzbF1/uNHHLu2ZYnG+
         k2nidE5fWwm1wxg7CfGbhh7jNyf6FY/hXfPTtwybNxEdmyZEz1qtagozJg+ohmxBOBbM
         CSVz1Ifn9C9RAL84Esnsgev6ywIjxE1hLekDdR38ibC+aTb3KeGr8sgADGINM4bVk307
         S/UfX8jVejZGf3kVSmB1T/XjXKk7J0k1lX04uskzhVssgGkEYnPuE3og5o85C/pUaiWg
         FPNA==
X-Gm-Message-State: AOAM532O5uWeEUwU0DW/W+1fqd9sszIW2rzMzviX0Wl2KKZL5syjNqeS
        tsq2CRlMAhvgqHP3vxBMiLIL3SAw1YZIfw==
X-Google-Smtp-Source: ABdhPJyP69RpXtfZKXT3i1uOsP07mPntAbukYp2+qWwxXn3c8Q0+4IXIwFCmyHEH6pDhEUvj2jbnXA==
X-Received: by 2002:a05:600c:24e:: with SMTP id 14mr426637wmj.67.1640133360158;
        Tue, 21 Dec 2021 16:36:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:59 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 13/19] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Wed, 22 Dec 2021 00:37:45 +0000
Message-Id: <20211222003751.2461466-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index 5c083d70d4950..af71dc659bb98 100644
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

