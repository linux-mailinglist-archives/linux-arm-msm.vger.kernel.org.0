Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9C2F1BCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 18:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389168AbhAKRHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 12:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389150AbhAKRHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 12:07:17 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E12C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 09:06:36 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w5so485598wrm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 09:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i5vkZMIp6m8L5GT9AIEfOu/P1P8j2pgSz4aGREmv2dc=;
        b=hc4SWnDgCRkdhFw5rmB6qjPg+Nzrzldtt+7SAGFruq/vYPlVDBPgwI83U21xVtTzsv
         I95EFlAa4aVxi6k5UO/M0rfISOaAqof9Hr2WaBvXyvKVNgJtckXL8Z6TUH2vVjMvqBB8
         gmBqVW618gX5k9a4xXPeWT9F8hkmXh2BkoVeFpES9t0oVqZpH9QNk7VWuwiw11QSmR5i
         8bxm8eGMhZTikQg0nPTyRxtnlBFcQH0QH6xghxQHvwLIDNuWagitPrelC5KlydA4QIxD
         V4ekF6+QSDSOOZOiB0ur0Fq3TqoguNVpAv5HEyOwiBwvLCYfV0dG1bHj2tIt3fxYGEw4
         NkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i5vkZMIp6m8L5GT9AIEfOu/P1P8j2pgSz4aGREmv2dc=;
        b=hvtY1S1RBFfiNkXtohCxpQh5buQhOvhSWq4GKeijjX6TFyF50QB43n7j7at6eCeFB/
         sC//URLcYBRePQkPWwPqQ9WK8H2VbvoMT/Skhk3Ky0+68rUMO3yszaJlwyGAWjOlBHmk
         JpceFkeSYP4kdIBJJIY/2NaGKntAPkJaTFxUTc1tpjGfVF9voMBrkknKgcn/y1YyFcO6
         URvN9chN06cvCxV2n+ig5VrEuqpu63lCN6h1539eKMVb97JKsEMhPn4Y63sPzgcyRRr7
         Tf+1I+ILC2TC9n9ysAH4I8M55pOUVLik6bPsnO3o1juuP92x9xMJsSTTl25D3gJfsmNW
         Wu7Q==
X-Gm-Message-State: AOAM530ZB4pejPn3pZVLyR3xD4tVRniy+uHeulnMeIsZJl8UfDq119Rh
        Cj9shghMQx/B5OK5VJOf1zuLjA==
X-Google-Smtp-Source: ABdhPJx7QZB7qvZNZRA0GBFeq88QfjIAX+4wJzc9+IdeDEYjY18Nmb108+7xsgFgmVqhMryPTXEKEw==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr114826wrp.320.1610384795406;
        Mon, 11 Jan 2021 09:06:35 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id j59sm336806wrj.13.2021.01.11.09.06.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 09:06:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        manivannan.sadhasivam@linaro.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH 1/3] bus: mhi: core: Add helper API to return number of free TREs
Date:   Mon, 11 Jan 2021 18:14:09 +0100
Message-Id: <1610385251-14947-1-git-send-email-loic.poulain@linaro.org>
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
 drivers/bus/mhi/core/main.c | 12 ++++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 3db1108..4e31f4f 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -309,6 +309,18 @@ int mhi_destroy_device(struct device *dev, void *data)
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
index cd571ad..62da830 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -614,6 +614,15 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
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

