Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315802D44E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 15:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733205AbgLIO4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 09:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733146AbgLIO4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 09:56:41 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C40C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 06:56:01 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id y17so2047137wrr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 06:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DvbvG6mQGm3snXcxs0szgugtcoGkSBwdHyd4ZKjZrVE=;
        b=oB8cX+Z4rNWyS4GCSBB/ODF7O05C4eQUADsbe2lrGqcdXoTFeqmv0cr+zaiHT8Ozpd
         ja3YSzbYRXWWLfMIvVIlnQKC5cGHMtSaqzUHqmSQLwnlAPnYZLvYSfP5nfSCItu/uMe5
         QicDJlzLCj10J5iZFEuiJ4jMSNuqkAt+kQ6+5d7JXhfk1zsdyp+9rkZ1llgrGZfms/qw
         2zDxF1GU049XQUfxzKX8URR6CqvdIjhUr+92PJPPxMs44PlQeYxNy5QKN9uFahftV8E5
         WWA+tz2y+TiiIqg5QqlrR0iWuX3sBh78XmSRKuz+LWOvcNLeZQCVdBhE4PrWlps0rsXQ
         XBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DvbvG6mQGm3snXcxs0szgugtcoGkSBwdHyd4ZKjZrVE=;
        b=mhW8M6QWZIagAAywnI+hWR5+brpOC1ktqGPglcHhi0MApatyDmaIQJeZgko1ronLDP
         uLlemrnTBX8G3rX82KE7EHOzltIrzjod6cxqQSXs7mEIkpB7YY044hA1vzmAdZ3wVIz/
         KoS/8J/2WmLBycz8bdotczAlSZLIQME/daGlQ+vmPRc3TTI5O99rgojgM42v0L50uGLF
         cZ5lEtCIpDARRNrXrmtewgCXRs6tBzj6hNev/is1097Fg+TRQEYmlnUt58XXi8i+Axmm
         u7egdSwSTrbkDYw1BLFxBBSR/fRXM2ZytJhdgrS2JVeFP7OMlfFXMSKpoobyXXm3cSiD
         pq5A==
X-Gm-Message-State: AOAM533PCPBQigoZNFlx/cLHGkDoxBx+eLtRnM0KBURpnz3r/nB5E/aU
        /DvVJ1kR31q1i+ngDhu7UaQ6Pg==
X-Google-Smtp-Source: ABdhPJyXtOpUmw7LcWmrd+o1rvAd+cU6WaHd2Ay85/a7Q5EWljbi+Y/+LpQK+VhbCaTiH62+JIMX2w==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr3132543wro.5.1607525759683;
        Wed, 09 Dec 2020 06:55:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:c728:53f6:5e7e:2f63])
        by smtp.gmail.com with ESMTPSA id i11sm3782219wrm.1.2020.12.09.06.55.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 06:55:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, davem@davemloft.net,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH 1/3] bus: mhi: core: Add helper API to return number of free TREs
Date:   Wed,  9 Dec 2020 16:03:01 +0100
Message-Id: <1607526183-25652-1-git-send-email-loic.poulain@linaro.org>
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

