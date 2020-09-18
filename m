Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9273226F9FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgIRKLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 06:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRKLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 06:11:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFA8C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 03:11:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so4961895wmk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=AVgBejU6PKGR4LfpM4yfP5XdNO6wVoUQaPlrdan1azc=;
        b=BfFdpSh6I88rbRG6B4e5Cs8zmhXx3ja7UJiseS9ajgqFE5qakXBRoLj8Jp3HhJS5yG
         r9WDP+T2LnrtKZCEjysfIcgVGhG+Jw9+nlciTT36nyJ/6gD7tUWrYL/GH8DRi10At7WO
         8PIpiA6pcdBmhG2jDKwDzZe5j6Sf/a47u3+Dhu1rVc0CoGKqXnLrqP65MXtBk48sqiDS
         Yg8JhHNXzmvDOQXtREk8VAIZeVE8omGzja8xTqZDMAVOegptJ8ktiN7lKNj8QB9cFBcg
         a55safTSe/P571bjp6/Od/G7aMHNV9spYGaODA0+MlDKnBXnizRUkzPXVoFiBXVW+gMG
         73Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AVgBejU6PKGR4LfpM4yfP5XdNO6wVoUQaPlrdan1azc=;
        b=TXDHAThWdwErW2K9p6NAoJkCaO6c9AcCtqVe9C1WtujmSBdCcpNhAzhG6cPyafmh+L
         diywcmldNXIpshBp9dFPeDxhdmYAj+67mppoimfyTpJ7LlB/6RXuHNDXheYn3EPXBu7Y
         GTATUHmW0lhp/dnOa4fC+xx8nR1A38JtLqIHjHjJCA40Ij2xylVnCVBuUUzRiZ7e4i0H
         BiCyAHwkgOjNA435HF15CYR4tRtgH9O2mIWCkr0rxH/5uMLKyJfnr0ojnXb9JApeW4lA
         WUySduGFi9cqck1soVDLj4xTzOp1s/+Aah+kkoNIrHmx3J2yVNAHWn6P+cMcyNQZz0o3
         BT2g==
X-Gm-Message-State: AOAM530nSX6rgP4VKCNmL5X8Ms2lZH2WeDJP/GSIY9cVHpjFr8weXpg9
        Stl9B0qgHUZxX8xwROUu+swlC20XLHqVgg==
X-Google-Smtp-Source: ABdhPJzUJKW+0m5SQEja3BikfktnOJlg7U2SeMNOBiFXgqEe44Rm+67b+cQ7PhOFZC5gJufjfKnxVg==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr15117434wmg.117.1600423867788;
        Fri, 18 Sep 2020 03:11:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:c407:647e:3839:49ce])
        by smtp.gmail.com with ESMTPSA id z14sm4202939wrh.14.2020.09.18.03.11.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2020 03:11:07 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Remove auto-start option
Date:   Fri, 18 Sep 2020 12:16:59 +0200
Message-Id: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is really no point having an auto-start for channels.
This is confusing for the device drivers, some have to enable the
channels, others don't have... and waste resources (e.g. pre allocated
buffers) that may never be used.

This is really up to the MHI device(channel) driver to manage the state
of its channels.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c     | 9 ---------
 drivers/bus/mhi/core/internal.h | 1 -
 include/linux/mhi.h             | 2 --
 net/qrtr/mhi.c                  | 5 +++++
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index ac19067..7aef6b7 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -727,7 +727,6 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
-		mhi_chan->auto_start = ch_cfg->auto_start;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
@@ -1125,11 +1124,6 @@ static int mhi_driver_probe(struct device *dev)
 			goto exit_probe;
 
 		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
-		if (ul_chan->auto_start) {
-			ret = mhi_prepare_channel(mhi_cntrl, ul_chan);
-			if (ret)
-				goto exit_probe;
-		}
 	}
 
 	ret = -EINVAL;
@@ -1163,9 +1157,6 @@ static int mhi_driver_probe(struct device *dev)
 	if (ret)
 		goto exit_probe;
 
-	if (dl_chan && dl_chan->auto_start)
-		mhi_prepare_channel(mhi_cntrl, dl_chan);
-
 	mhi_device_put(mhi_dev);
 
 	return ret;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5a81a42..73b52a0 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -563,7 +563,6 @@ struct mhi_chan {
 	bool configured;
 	bool offload_ch;
 	bool pre_alloc;
-	bool auto_start;
 	bool wake_capable;
 };
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 008b8f6..742dabe 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -214,7 +214,6 @@ enum mhi_db_brst_mode {
  * @offload_channel: The client manages the channel completely
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
  * @auto_queue: Framework will automatically queue buffers for DL traffic
- * @auto_start: Automatically start (open) this channel
  * @wake-capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
@@ -232,7 +231,6 @@ struct mhi_channel_config {
 	bool offload_channel;
 	bool doorbell_mode_switch;
 	bool auto_queue;
-	bool auto_start;
 	bool wake_capable;
 };
 
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index ff0c414..7100f0b 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
+	/* start channels */
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc)
+		return rc;
+
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
-- 
2.7.4

