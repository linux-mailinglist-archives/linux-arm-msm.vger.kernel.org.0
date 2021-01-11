Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F152F1D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 19:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389665AbhAKSAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 13:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389620AbhAKSAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 13:00:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5199DC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:00:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r7so708058wrc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i5vkZMIp6m8L5GT9AIEfOu/P1P8j2pgSz4aGREmv2dc=;
        b=I/AKHGG3HMoRNy9lYcu3nJW8P7K50NkFE3b0sIJR4X1p8WYUTccsLtiyI0q81OljfG
         /Ejv1bmW1NNaPlUdEzB5SS4Xz0th4TlfipWApn2JyVw0ppDEmVpVAFyk3n3/6CjK96If
         cpgLvyCfMcQSGUUgQLqZKZjC00no64RfBbpdPs2Os/bNpB3M+HwF2hb6xEz/lrZQjytg
         Ryg5pOBQZ4cXDp2Vo7+M3qpVIO6HjpUWebrG9MR0meOhjcgFpCGB7jO+jot1bqfIgVuF
         ebXeYOhdRHmKN7mucpPo2msHkd95Hd38u5js9ulbMtmjSq4JgPZNE4pOu1P1LOfWXK/1
         gWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i5vkZMIp6m8L5GT9AIEfOu/P1P8j2pgSz4aGREmv2dc=;
        b=bgRuoywSaJyZKWfTQZ2i+mDSHWg+Axv/S64vcWRBZUM7wC6FdIO9Mr1WOtllPeculY
         zhdp+w3wcfRtV0QXldE6vDf83O4jziK6oUBgOtVsG8GHaU50v6Tlnw+vMAPqPUsSLUll
         LYBIIfAOWrdo3k0wd+Pl3PUFivitTzv473nzEv0ed/cyaRqw6lFMYdYEaJen8n6Afu80
         h9E1JOFuXVTIWPQRRI8BE4AWbjJR/nSkCbpHn9ltCUksznvvycezVmyekwK9/v5IKR0k
         Yoz/KNOSCqRzJUs5GM+ffByM6u9VThsscNgZmHL8H1Y4ap96FqRcyA79QU4wsj8HLvVD
         /b5g==
X-Gm-Message-State: AOAM531kHVH9ImlREDzv4dnKKAM7Pp8nkg6Q1YEkz3Jp5us/dVT0uMbJ
        Tf0LoVOU1BNXf1G96DEMZ+DeHw==
X-Google-Smtp-Source: ABdhPJyJUY4VchB207CwJz2pmCVJkJfTUIdTxaXswHaiiPtGVLt3mk/Nn2cUZ2JDTVWPpNyeMkyrvw==
X-Received: by 2002:adf:d085:: with SMTP id y5mr317551wrh.41.1610388006052;
        Mon, 11 Jan 2021 10:00:06 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id s12sm77662wmh.29.2021.01.11.10.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 10:00:05 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        manivannan.sadhasivam@linaro.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH net-next 1/3] bus: mhi: core: Add helper API to return number of free TREs
Date:   Mon, 11 Jan 2021 19:07:40 +0100
Message-Id: <1610388462-16322-1-git-send-email-loic.poulain@linaro.org>
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

