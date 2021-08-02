Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9793DCFEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhHBFNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhHBFN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:29 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1224EC06175F
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:20 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id nh14so11894569pjb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGOXL06SjbERdU63V7RXxi5PCz4bgx6hAXgHjEBKUvQ=;
        b=LM17YKqXiGpPcdv6Q1BfTlUi3hYtGF+OJgTiqLG/jem+SpbKGz3Iqf+MLt+uMbzL/U
         JvJ4BZ8fQBPHUiRGFG7kgEgEOD/ovbxqJxjLW9KiddK7LbNSybVuLeTQHvf2yRQYW2VM
         9YWn2Wb+phjlSCdGFU9VwlHVCDl794up5qbIEg/jJos7I1/iSBmvr6h3WBFLEHJ2V7yB
         Kdjxzuj80q5nN1C2naHM1Fp7BOK7PkrLoi7qugBJkZSgDbvODxnZSLA/TJIJ5heuiCF5
         uUX3fl8lH2usd7/Jyw4VLTpFOcv7jP52FGxgBPgXz0P5FxevMU948BLoqYusmMTbsJQu
         lNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGOXL06SjbERdU63V7RXxi5PCz4bgx6hAXgHjEBKUvQ=;
        b=rLOohkbXwj93vjTnk41p+zU/XGOCx2pBAordOW8H5pf8y8Sa7Dc36AKkoo6LYrf3xq
         XjwV5aWjVpbEQya/UbbKmKvzUa89Q2h4rr75U02c6OS5dmNjUV79thHP/ilTXTPhdUBD
         W7UZaLqnVoHBif9TwrWdC+JV8knSLZoiH36APhMLFBPacgpzruS5nEPlhd5Fxo112VwR
         MdqE+HQVklCHoZIxJErcm/8oL3ipuQ+UTdC6+y19rKJpONOq2xnw556IUgT6pCw89ZPU
         Iw+A8kmr0WXMJIuQj+zrhqVa5eFUMDwH2PgZ2sdHt+aR40Tus7bbpRBTqiLijsmQq1AY
         6eAQ==
X-Gm-Message-State: AOAM533DMPlchz3lEy18QnNXGvilrUtMOvtuzGW6HpGQsi2DnNq1fvGX
        6oxz4sXNjJluZM1ezc2k+PtY
X-Google-Smtp-Source: ABdhPJxHlbFtK/unJ7ftwHlLBF0k0nZ43irzJn7M2k3s3OYdxVchAoCLtjV7x4mbnHoK8HOe5B4rqA==
X-Received: by 2002:a63:682:: with SMTP id 124mr2283129pgg.299.1627881199578;
        Sun, 01 Aug 2021 22:13:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 01/10] bus: mhi: Add inbound buffers allocation flag
Date:   Mon,  2 Aug 2021 10:42:46 +0530
Message-Id: <20210802051255.5771-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
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
Link: https://lore.kernel.org/r/1624566520-20406-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h  | 2 +-
 drivers/bus/mhi/core/main.c      | 9 ++++++---
 drivers/net/mhi/net.c            | 2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c | 2 +-
 include/linux/mhi.h              | 7 ++++++-
 net/qrtr/mhi.c                   | 2 +-
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5b9ea66b92dc..bc239a11aa69 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan);
+			struct mhi_chan *mhi_chan, unsigned int flags);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 22acde118bc3..69cd9dcde6d8 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1423,7 +1423,7 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan, unsigned int flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1448,6 +1448,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1603,7 +1606,7 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1614,7 +1617,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
index e60e38c1f09d..11be6bcdd551 100644
--- a/drivers/net/mhi/net.c
+++ b/drivers/net/mhi/net.c
@@ -335,7 +335,7 @@ static int mhi_net_newlink(void *ctxt, struct net_device *ndev, u32 if_id,
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
index 944aa3aa3035..5e08468854db 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -719,8 +719,13 @@ void mhi_device_put(struct mhi_device *mhi_dev);
  *                            host and device execution environments match and
  *                            channels are in a DISABLED state.
  * @mhi_dev: Device associated with the channels
+ * @flags: MHI channel flags
  */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     unsigned int flags);
+
+/* Automatically allocate and queue inbound buffers */
+#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
 
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

