Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CD63AED48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhFUQTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhFUQTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:19:02 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91234C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:46 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so5576962pjy.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+dpVZyr8rPiOYKf459BLI0kqBiib0mNiwfzh7CH9DU=;
        b=mA8N9nzD7ReO5CFSZR5qI2Ld6w+GIkI6nVZMrPi/0U+cy/PXg4kgXZtXjWP45xyZNx
         CYbxHt4q1CQZwkZOCAkLoRiL5DUpY56ZMRV4ZkB6UD+fJzIJmUjy2rxEltaDVjXfYJdO
         yt97b1VM8ZKUuLRt9tzuOJz4vUVAhselVhj8PoiFEgjtQzKv+kyem/q7/7TBhsj4HIM9
         vO2xi4rxG9bKhWBjeUD5SxOE0qz1o+LwZ1RmhCtCeR9R5iIJFo5BzxOmHNOxzWOAJgOn
         fw6wRGSBvFBRfIH4/YWLbsbti43ClJIBI2ocsJatl8cVn+K5by67fh1tvsC52G5gRYC+
         F+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+dpVZyr8rPiOYKf459BLI0kqBiib0mNiwfzh7CH9DU=;
        b=Otd1xMdp3AHumJoYkndC+owTk7sYo0A4yB/skiUFuYuVOSYx3Gdcz0u6svkGDbzRz6
         Jw8QwSVj+7ZFrEWDC1e2EGYZL1gXD89GlgmyAwtfD7RRbYAYMPi6IDMqn6UWtfSdyfnp
         uRv4nf+AYb0tgEU/1jInsh8J+Fla2AsX9WDQhFKyX2qd/m6GPp7mgFUuHZYp0BXqlEMO
         /ySBvsnUX63K12IM9kIl447rGASn3UfV1EbSDXpuFNXQwxM9XCC6zQlt1PC/tXMRU/bh
         oQSsngYzVbS1jFNV8fXC8xTOOGHX9FSQSI9lF5z48cw07uxMvhDJrcWDLKG5t4mZX24P
         nOQg==
X-Gm-Message-State: AOAM530X0H9j9rFy+kXbCZQ5qDHXIo0E1IRORwfW4Q4GQViFdQSMoGtd
        SH5qGcs7B0JmrjZ7dHYfdA/4
X-Google-Smtp-Source: ABdhPJx/+btbutJsjHyOxTbc5sa9qxmH6cw04/AqDq5m9MXBNymrWaogeeMc88n+B6qgQUXaOM1L7Q==
X-Received: by 2002:a17:90a:4101:: with SMTP id u1mr37854467pjf.59.1624292205991;
        Mon, 21 Jun 2021 09:16:45 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id k88sm10734730pjk.15.2021.06.21.09.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:16:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 4/8] bus: mhi: Add inbound buffers allocation flag
Date:   Mon, 21 Jun 2021 21:46:12 +0530
Message-Id: <20210621161616.77524-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

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
Acked-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h  |  2 +-
 drivers/bus/mhi/core/main.c      | 11 ++++++++---
 drivers/net/mhi/net.c            |  2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c |  2 +-
 include/linux/mhi.h              | 12 +++++++++++-
 net/qrtr/mhi.c                   |  2 +-
 6 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5b9ea66b92dc..672052fe3b44 100644
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
index ed07421c4870..8ac73f9e92a6 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1428,7 +1428,8 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan,
+			enum mhi_chan_flags flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1453,6 +1454,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1608,7 +1612,8 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     enum mhi_chan_flags flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1619,7 +1624,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
index 0d8293a47a56..774e32960e09 100644
--- a/drivers/net/mhi/net.c
+++ b/drivers/net/mhi/net.c
@@ -327,7 +327,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
 
 	/* Start MHI channels */
-	err = mhi_prepare_for_transfer(mhi_dev);
+	err = mhi_prepare_for_transfer(mhi_dev, 0);
 	if (err)
 		goto out_err;
 
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index 1bc6b69aa530..1e18420ce404 100644
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
index 944aa3aa3035..86cea5256e3c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -59,6 +59,14 @@ enum mhi_flags {
 	MHI_CHAIN = BIT(2),
 };
 
+/**
+ * enum mhi_chan_flags - MHI channel flags
+ * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
+ */
+enum mhi_chan_flags {
+	MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
+};
+
 /**
  * enum mhi_device_type - Device types
  * @MHI_DEVICE_XFER: Handles data transfer
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
index fa611678af05..29b4fa3b72ab 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -79,7 +79,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	int rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev);
+	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
 	if (rc)
 		return rc;
 
-- 
2.25.1

