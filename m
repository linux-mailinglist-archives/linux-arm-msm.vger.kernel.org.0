Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2737F2C2C6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390216AbgKXQLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390191AbgKXQLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:11:43 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B995C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:11:43 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id m6so22864487wrg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ic3iTTgQ5gaJNsBaoVYvbWzmRaSCtHiMPtCO7uAhv5w=;
        b=Av0qbJWT/JnaSJ1a8sP06+PDTjs8O6FcoowlcbqAMjyLiCnMGXb0o325aTc/vq/taQ
         uRBcp6g78PKzkaPkILAjDnCvNuWUQE8yIjuStl0Rid4g+9Ly1Q9vXbueCdszxgkVdNBj
         nf8j/r2De3oGcortzfCW2If81NjWURuxbBs5vT0Iqp2X2rhdR0RUhT9kMUdIPjLLITfU
         st7aOsxZ21F8L9vHyB+vNfNvwbouTHeQ5KmiPXekC4Vod4kGEzEwwyl/KPue7CZXKU2T
         3yMrWB53hQ4ndIsFAD7bY9HPbDTuJJeqXQhmfZD3f5FjyOYxcqCHu9XMhpAUy2i+bYlJ
         jdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ic3iTTgQ5gaJNsBaoVYvbWzmRaSCtHiMPtCO7uAhv5w=;
        b=g08GBLvP+iza3fHEzFah+GpgL3MNOA/6okE4/W58nM1q1gQvIZkI1qisYZjgWnotx7
         9GZ6k4hlobmQNoHccW1urQkGiSoIHk+wp01J+lpp4LBj2LAD3oZCkGiZr4WZhiCAICOx
         Hf7Nsiy4tZS0FsxBSEriqtm7VkuGpiw/81ffJ9Hl37Gi+gXJskJqIEOM6pLKxZzLMf6s
         0tD7Mao6KFYLReTsz54YBdz6i66J10KorpHCwhghyKzXmRmzA85QIvhIoTV5eIfoIFmW
         b5alNWtpOdfhkW87gAYLpr/tcdlnNonrNSI/WpnBz4Ax9KckZftG8GgM2LcvcuoDwSfl
         uQ2w==
X-Gm-Message-State: AOAM533CDHNGneV72SEvnyXNNwfeZ/l3FMfhbKEWBv0IF2Jczp8o6Ucb
        gf79YtxhkMNOAmkS0XQ5IvS2PA==
X-Google-Smtp-Source: ABdhPJy9343O8nPExAE691TCJa+noBXe1rnJ46WXmva4A/VUelIsDtWMIxC/lJKdVTSfi8RtOzrxAA==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr5998238wre.125.1606234301909;
        Tue, 24 Nov 2020 08:11:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id c9sm16666653wrp.73.2020.11.24.08.11.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 08:11:41 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
Date:   Tue, 24 Nov 2020 17:18:31 +0100
Message-Id: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A MHI client device should be child of the MHI controller device.
Today both MHI controller and its MHI clients are direct children
of the same bus device. This patch fixes the hierarchy.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: fix commit message

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

