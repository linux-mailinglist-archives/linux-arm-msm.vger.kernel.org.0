Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A362938C79E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 15:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbhEUNRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 09:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbhEUNRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 09:17:49 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B656CC06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 06:16:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r12so21052444wrp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Kj0vccf4CDleUcreicAHJeYdRZK+zdzW+NErGJ5FYhs=;
        b=SeAmmkTMJ5dHl00eV/vbjVDpidOVjYBnTjPickS7DM0pK7tYCe+ok9z2cdf9fmKF7I
         oGZregza1m5lAuCQQHbcrAaOhmaDFvLwEnWJX0uEuj1Ddi943hTyvx2RXuLiU5BZY/lt
         oX2Z7RqsgjLkwzvnMRTT+LVB0vcgwfnnc2OJnwsocE6tjlBeHvb8zI1eV6fepf38OztB
         KjwhiWJe2/n1Zp1a7Hd3RiW0JP4/ec71tD9o5JCjle+TxVSA4cqryNkN7wle2eiIiZey
         peyKkguLZ6zxVQC3xEAW9V+fr5eLQr6861Jm1SbvTA106ehYStUbAiILvgTw5DZ64761
         2BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Kj0vccf4CDleUcreicAHJeYdRZK+zdzW+NErGJ5FYhs=;
        b=QIKue7w/5qb7sta3MAdIK/0NsDaISlfyKlbKzNXPjbiIiZztl8tvV88v6iTdFzP70F
         JBkl4X0pxoPMacpeukt/vqWHjYcbC54qZwZ4UitFh882+NMidDs8dIWPqj/8e80jYPW1
         rT8O1Fa2OBKcIoAiNgy38PPolDkFHsmgGnwzkzgb8aNqTokj3ddBMu20Z26UlLEV/mEK
         tZBUHdhwzhtGgj3Gxksi3M1ueXmacgZkTn6rVI7EOUDNrdiE1d9oJul+S+Ugttey9rvl
         kGOiXKKH0c4wvtH1Jq6ammIHwkd7XfraFM3ViZ7WwCOclstk4RI4W5sVFdwt6nfUDuUE
         2Idg==
X-Gm-Message-State: AOAM533BONEmvE7h4ElLNUj8Oiyz+CYZTMg1J+ba53LtC/7AWnBtehqF
        VhfWcCFl5Z6Ubo6CpQ911Z33Ow==
X-Google-Smtp-Source: ABdhPJyR4dN925guhfSc7V06PXjB74UaFzQvWylkviZwSniUaOl415AtK48YAKV2/5r3mDCluSFuiw==
X-Received: by 2002:adf:d081:: with SMTP id y1mr9433435wrh.179.1621602984261;
        Fri, 21 May 2021 06:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:f807:32a1:b2c8:8ec5])
        by smtp.gmail.com with ESMTPSA id q20sm11997352wmq.2.2021.05.21.06.16.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 06:16:23 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: Add inbound buffers allocation flag
Date:   Fri, 21 May 2021 15:25:19 +0200
Message-Id: <1621603519-16773-1-git-send-email-loic.poulain@linaro.org>
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
Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: Update API in mhi_wwan_ctrl driver

 drivers/bus/mhi/core/internal.h  |  2 +-
 drivers/bus/mhi/core/main.c      | 11 ++++++++---
 drivers/net/mhi/net.c            |  2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c |  2 +-
 include/linux/mhi.h              | 12 +++++++++++-
 net/qrtr/mhi.c                   |  2 +-
 6 files changed, 23 insertions(+), 8 deletions(-)

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
index 6b5bf23..3ddfb72 100644
--- a/drivers/net/mhi/net.c
+++ b/drivers/net/mhi/net.c
@@ -323,7 +323,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
 
 	/* Start MHI channels */
-	err = mhi_prepare_for_transfer(mhi_dev);
+	err = mhi_prepare_for_transfer(mhi_dev, 0);
 	if (err)
 		goto out_err;
 
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index 3a44b22..84e75e4 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -110,7 +110,7 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
 	int ret;
 
 	/* Start mhi device's channel(s) */
-	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
+	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev, 0);
 	if (ret)
 		return ret;
 
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

