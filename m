Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9BB35724E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 18:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347398AbhDGQmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 12:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234029AbhDGQmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 12:42:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D478BC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 09:41:52 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f12so12690327wro.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=K22TxkApdXHD7VpjFcZF79cdb4BhQ5CPxOENhBmjZKw=;
        b=QZBtR/vTOZQs3uToJlvDCUu+kYZF/HIkY4hWVby67ODOCXP/zBYHyDOJVrVqCMiOJ/
         xl2571+WJxBD+BJfVz9tDL1hmEPERl6cEnxwoMH4Ygvpvf2fx1lh8/8o4szHqXH6y9zA
         yJ5iFzUVcpxG3gv1HVa1EpoiHL/ZfWywFSQxozEUJdY6JxzKpMopsNnKtjKQ/WxRYbe1
         yX/X4DEGcgFVNXu0nFdH4RPwCI0ank9CHbwtbZA6UCS1YUjtO65X5rbpJK5jLLMEYPvt
         dlRR4DxgnMMeAbq0y5lmhDsh554xMdAEpkIXZHym9eKOFeD1ULhzpNtVXkINlu+WjPOH
         vt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K22TxkApdXHD7VpjFcZF79cdb4BhQ5CPxOENhBmjZKw=;
        b=eEz2Q2ifEHmV34d+qMliuDRln0W38kHgvxe/ctSO8+ZGzNTECdVpBt0229eXquVfSG
         3J9oH2Cak92GXHyN1UWq9tYd3zu6tXIgXALsUlAjF9lY0Te36440ME7kTjBcA2dHBIhR
         TIp+zdfPIe9Vg6bLL/SeG4JeMPoDyA64It31WirvcBfu7VaA+XjrOrIhP0pi17pE/fyp
         OuE+eKzKUlQb5dlKo8JTo4hrPUizAO/KzvLo7oFK+pL5pyyWqlAXWU/AjBUX5819CGf3
         A0XpCGbWFN6Nd0dsB/e64dkdit8W4YE0qao/0nrKPlk+LJ8qCQti+y1gpqhJzW8fxdf/
         rUEw==
X-Gm-Message-State: AOAM531mtkMBKBuxC9mFUQrnCSMd/u8EhAc5pKLg+zLMhplP22V9mnbh
        AcQuwHPJL3RJypJs6o3Z9nvuH7U4g5hNWEty
X-Google-Smtp-Source: ABdhPJyERs991GxeCa6AuZ+afneYHiQNNr2zTD5m3sSvbcQb5XwKfvXoIlRuCt2J2U/lqUZ55ysOvg==
X-Received: by 2002:adf:f88a:: with SMTP id u10mr5539706wrp.162.1617813711196;
        Wed, 07 Apr 2021 09:41:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:c4d8:afb9:68e4:d58e])
        by smtp.gmail.com with ESMTPSA id o14sm29250335wrc.3.2021.04.07.09.41.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Apr 2021 09:41:50 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [RESEND PATCH] bus: mhi: Add inbound buffers allocation flag
Date:   Wed,  7 Apr 2021 18:50:35 +0200
Message-Id: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, the MHI controller driver defines which channels should
have their inbound buffers allocated and queued. But ideally, this is
something that should be decided by the MHI device driver instead,
which actually deals with that buffers.

Add a flag parameter to mhi_prepare_for_transfer allowing to specify
if buffers have to be allocated and queued by the MHI stack.

Keep auto_queue flag for now, but should be removed at some point.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/internal.h |  2 +-
 drivers/bus/mhi/core/main.c     | 11 ++++++++---
 drivers/net/mhi/net.c           |  2 +-
 include/linux/mhi.h             | 12 +++++++++++-
 net/qrtr/mhi.c                  |  2 +-
 5 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5b9ea66..672052f 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan);
+			struct mhi_chan *mhi_chan, enum mhi_chan_flags flags);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 0f1febf..432b53b 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1384,7 +1384,8 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan,
+			enum mhi_chan_flags flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1409,6 +1410,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1555,7 +1559,8 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     enum mhi_chan_flags flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1566,7 +1571,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
index 5ec7a29..06e1455 100644
--- a/drivers/net/mhi/net.c
+++ b/drivers/net/mhi/net.c
@@ -327,7 +327,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
 
 	/* Start MHI channels */
-	err = mhi_prepare_for_transfer(mhi_dev);
+	err = mhi_prepare_for_transfer(mhi_dev, 0);
 	if (err)
 		goto out_err;
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d095fba..9372acf 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -60,6 +60,14 @@ enum mhi_flags {
 };
 
 /**
+ * enum mhi_chan_flags - MHI channel flags
+ * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
+ */
+enum mhi_chan_flags {
+	MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
+};
+
+/**
  * enum mhi_device_type - Device types
  * @MHI_DEVICE_XFER: Handles data transfer
  * @MHI_DEVICE_CONTROLLER: Control device
@@ -719,8 +727,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
  *                            host and device execution environments match and
  *                            channels are in a DISABLED state.
  * @mhi_dev: Device associated with the channels
+ * @flags: MHI channel flags
  */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     enum mhi_chan_flags flags);
 
 /**
  * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 2bf2b19..47afded 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -77,7 +77,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	int rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev);
+	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
 	if (rc)
 		return rc;
 
-- 
2.7.4

