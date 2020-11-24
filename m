Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D80E2C2F76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 19:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390837AbgKXSBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 13:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390831AbgKXSBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 13:01:49 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08BAC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 10:01:48 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so23319400wrw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7LzRCu6TCih83AIRUkCJC2JP3sMANaYKcNclvJJDYEM=;
        b=BwPRjOAD1qmh9fwRFB0M/ZaFqrdEHcNHhZ+gSr1YnJBmTXn/0Df9wNPBX/ubdWHbz7
         CRSugrFwZTY8b24SYzqc841s1fnCCbTDdBqbVXm+qHv1eIsK3dbtUdxwCeunr/QPEB5c
         fvCvM5WvlokuZ4zvv7VffiCyRhgWpniLdbpGbSG0tVrLgNGybWLK0ml4clbaIB8jWq/Q
         LKc07pjDaVqemPYH1M1uKSAzFrS43d66EV03OszsEqEtJgmGiZ3WDmgNoU342ccz7GAK
         wTMOWwWwBBLYib311pRPcrc7zchIXYxcffTbSABzJZAxTeLVnCMDsztyey0Ok/DolDxX
         XUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7LzRCu6TCih83AIRUkCJC2JP3sMANaYKcNclvJJDYEM=;
        b=pHz+PXel6mcGPG7iJm8Dm7lyUd24hjZALz/Xp6zEulxJ8OcR9Ey9IMQSWoZhLbp7ns
         xL6BnAaMcWHuTLYMvnOkYk4jzKEmdDGLWhX+xMuIr1nPyjQ1ImF73KVDkrgyeNNrQ7Xo
         UJowK1uwbFaCadnKONLCCeUTQUb9XKSFhdVmjy3gwnkQmtVqboPIgVdHM2j1QXX25L/s
         vVjNZ2AIluU6hAnT/uba9RnPeGImdu/Aqrm72EuPdNb5V3oCTH5FjxMltawjylFO1e9t
         4mu5KMzZiwzbj2Gk4/Aixlco2wp3gUQFOhzicNMrftP6/6i3GWV2XPcfKOCMinfBGHvu
         VpbQ==
X-Gm-Message-State: AOAM533Xunqwirl9TGi3w8ETTqFj6whqS5Jfhs7mAos7sg+wkhPLPNmj
        /IAAzRFv1sZQgjbZyNawHY8/Vg==
X-Google-Smtp-Source: ABdhPJwiBRhYt+qatLrenybGXBb/mvkmb35H4z08wCo8CUDHyj3UbesLLmZiD3gdT6lG80g/xoZhTw==
X-Received: by 2002:adf:9461:: with SMTP id 88mr6628588wrq.171.1606240907482;
        Tue, 24 Nov 2020 10:01:47 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id m3sm29508704wrv.6.2020.11.24.10.01.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 10:01:46 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] bus: mhi: core: Fix device hierarchy
Date:   Tue, 24 Nov 2020 19:08:38 +0100
Message-Id: <1606241318-5492-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes the hierarchical structure of MHI devices. Indeed,
MHI client devices are directly 'enumerated' from the mhi controller
and therefore must be direct descendants/children of their mhi
controller device, in accordance with the Linux Device Model.

Today both MHI clients and controller devices are at the same level,
this patch ensures that MHI controller is parent of its client devices.

The hierarchy is especially important for power management (safe
suspend/resume order). It is also useful for userspace to determine
relationship between MHI client devices and controllers.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: fix commit message
 v3: reword commit message

 drivers/bus/mhi/core/init.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 436221c..c7a7354 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	device_initialize(dev);
 	dev->bus = &mhi_bus_type;
 	dev->release = mhi_release_device;
-	dev->parent = mhi_cntrl->cntrl_dev;
+
+	if (mhi_cntrl->mhi_dev) {
+		/* for MHI client devices, parent is the MHI controller device */
+		dev->parent = &mhi_cntrl->mhi_dev->dev;
+	} else {
+		/* for MHI controller device, parent is the bus device (e.g. pci device) */
+		dev->parent = mhi_cntrl->cntrl_dev;
+	}
+
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	mhi_dev->dev_wake = 0;
 
-- 
2.7.4

