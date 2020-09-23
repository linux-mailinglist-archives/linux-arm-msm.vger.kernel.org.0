Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFF2275B31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIWPLN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWPLN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:11:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C87C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:11:13 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so361860wrn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=p8H0btfRh+e4tPp/ipESQPm6FkWW1CaKfV98jscyQcE=;
        b=dqRcOzP1XjQ787vESG2mMUHbZuZRWpfVXVlsUOxqmAiI7H0eUQb/okm3ppGTatlgC/
         GS9BnPxm1rsW/Seiv8Rb6EKWRsRjDVzJIHh0fdFPTic96W2lSnFard1Cgf+8FhOEgbLu
         r6ZwPL/ysk8GR9LQTLepxhVt1k5iUB3yTqVEInPr5VBMUBDMEivallqnlKTLdl+Ni/5w
         IgPHkKE1bvcmF8df1n0DvzKXp6Uk4VEnUMRRrJXvtiglyUMaEnLI2tXdCdDTs2l3yVsW
         A3PU9kgvSwLeLKApESUEWPkGT//5LHGNW+KRjsa6pAzssJ68Pq/b5QVkl0gruc8wEq3t
         JV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p8H0btfRh+e4tPp/ipESQPm6FkWW1CaKfV98jscyQcE=;
        b=Y055WlivcVC9wPMUHrF3/ZaWfIBU7NMxRiynuRWNpj/jiRT5NLBnt9+suunr8uFOcp
         3dsk6az6Km+uvQ2sfIvhEFvMl80NVj+fGPvEcIOKQGTK821bx0Znu97TT2lY6Tze0Le0
         Dbn2vMdAS8KjN6P+9rawtWLnQbwgZ0FAvmeIAw0pLZkkWnRF/jMrj4WuOQTPWiK691R6
         typoG3GMZl6rxgiALX3p2nq7a6+2Z2UeIZBhtrvVO2sgo62ez56YWiU+tFlFess+EEie
         93V6OkphJ/5G93KU1pyHMU4CSyj1vfax9jSxC4BHju+Ze5WFxMUGl/sCFA5xLLf5jgq6
         DPlQ==
X-Gm-Message-State: AOAM532mNIFhZUrNrpBHRDruQVSH4g+OPD+htaaz3Ben+bScYB7+RDuF
        2e1g7slftpGVVdwwEWtjLGHy6NZ+NNZXxQ==
X-Google-Smtp-Source: ABdhPJxz5K4hJqIQ85yFDKr4lVfDgzVXnUynn5Jv9+5Oh9rIHz16aXB1lZfFqyPLXWTzPFWc1RsRCg==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr100663wru.33.1600873871690;
        Wed, 23 Sep 2020 08:11:11 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id w14sm59745wrk.95.2020.09.23.08.11.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 08:11:10 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Add inbound buffers allocation flag
Date:   Wed, 23 Sep 2020 17:16:58 +0200
Message-Id: <1600874218-10815-1-git-send-email-loic.poulain@linaro.org>
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
 include/linux/mhi.h             | 12 +++++++++++-
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 33c2320..5b636e2 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -666,7 +666,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan);
+			struct mhi_chan *mhi_chan, enum mhi_chan_flags flags);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a44fedb..fb71a0e 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1274,7 +1274,8 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan,
+			enum mhi_chan_flags flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -1334,6 +1335,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	mhi_chan->ch_state = MHI_CH_STATE_ENABLED;
 	write_unlock_irq(&mhi_chan->lock);
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1480,7 +1484,8 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     enum mhi_chan_flags flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1491,7 +1496,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 6522a4a..9d67e75 100644
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
@@ -684,8 +692,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
 /**
  * mhi_prepare_for_transfer - Setup channel for data transfer
  * @mhi_dev: Device associated with the channels
+ * @flags: MHI channel flags
  */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     enum mhi_chan_flags flags);
 
 /**
  * mhi_unprepare_from_transfer - Unprepare the channels
-- 
2.7.4

