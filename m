Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68B72D58F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 12:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733004AbgLJLJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 06:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgLJLJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 06:09:30 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C59C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 03:08:50 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id e25so4871148wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VapKC0F7lyscSctbK97hEtuP5mXbtCFlx94A7dqei/c=;
        b=thzzgsdXnMcBCx4HmSmaa1ZwCbajIM4XmNOg9MwjyjmioAJYcIbAJW1meuJwoFDkM3
         xW41EHEvBr+b1eGkrtXEamJqtafB91ERnpZ2vfbSHzrAVOOpl6yZKjtGhOvbXU3VDvKI
         oD5aRb0r7DhYgGnGIQXSNcTDhXuWiv/X5QmfdOT1zTYRrXS1mVhGrdOsWBhJdvrKeQbX
         0r7GXEcT4keLDBliAJ8NRpjy/OdW9LOGfR1D77L3M9nbj5bf1Of8QFnd1nUSjSx6cE44
         lEtz6iDphnhvFrJb4vSCqRwexayYrCegDf44XZnWB01L1KQlZmxFG1VNBo0gmhtkDmxI
         T2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VapKC0F7lyscSctbK97hEtuP5mXbtCFlx94A7dqei/c=;
        b=lTkMF/A7TLgAyc5/7EqRrQqIwM7+/ceOH1vTzY5N6VYAVDwMm98dGosIUjFzPSVerW
         pc8uVrBcBCCj3iZ0rh90xjBnzWpJmj6BeSy+YstRGyklDdZlIiaLLkYmpnO987k3jHF2
         LTGzfJ8XgaRy9CwfXo+AOTnktq8cagA2NvIsnUDzwfOMoTUfvdKCnY2DOkgBRcLeuEVG
         biOkJndjp9zwhah5wOIy5KGA0Cj6IruxwkKN/fSJxfEGJRF6n8b/8LEo1P7ccbvBLhi7
         sKkDrsnu0CKsPnwT3FNeKKRPbONvd7EvtCjldr44J4bBf6r7qY2tpTiwJSC8P8I+OrFu
         ykcw==
X-Gm-Message-State: AOAM5336aEYYTQ/dJEQaQBOWVgowKQ4b4LkQERVkGc+E4SYorkWHwuTl
        nB4zXoWIFuGyjhm6O97lbUmIUHU9GBFPCkxa
X-Google-Smtp-Source: ABdhPJyOWS+5uAXDH8mhqvSCmbXlXNt+9gVCBrc6da4fN5Lm4DZ9VLwEellB0qolj6aDFhFCOMoyPQ==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr7405352wmc.10.1607598528905;
        Thu, 10 Dec 2020 03:08:48 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id n123sm8961809wmn.7.2020.12.10.03.08.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 03:08:48 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, jhugo@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v2 1/3] bus: mhi: core: Add helper API to return number of free TREs
Date:   Thu, 10 Dec 2020 12:15:49 +0100
Message-Id: <1607598951-2340-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Introduce mhi_get_free_desc_count() API to return number
of TREs available to queue buffer. MHI clients can use this
API to know before hand if ring is full without calling queue
API.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: no change

 drivers/bus/mhi/core/main.c | 12 ++++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 54d9c80..a24ba4f 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -303,6 +303,18 @@ int mhi_destroy_device(struct device *dev, void *data)
 	return 0;
 }
 
+int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
+				enum dma_data_direction dir)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
+		mhi_dev->ul_chan : mhi_dev->dl_chan;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+	return get_nr_avail_ring_elements(mhi_cntrl, tre_ring);
+}
+EXPORT_SYMBOL_GPL(mhi_get_free_desc_count);
+
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 {
 	struct mhi_driver *mhi_drv;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 09f786e..25c69a0 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -616,6 +616,15 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
 
 /**
+ * mhi_get_free_desc_count - Get transfer ring length
+ * Get # of TD available to queue buffers
+ * @mhi_dev: Device associated with the channels
+ * @dir: Direction of the channel
+ */
+int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
+				enum dma_data_direction dir);
+
+/**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
  *                            This is optional, call this before power up if
  *                            the controller does not want bus framework to
-- 
2.7.4

