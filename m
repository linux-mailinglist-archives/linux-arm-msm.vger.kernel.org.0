Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BB723D6F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 08:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgHFGmB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 02:42:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60057 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbgHFGlN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 02:41:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596696072; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=y4puZpwgg//JDZy+2Q3u7RfwKCMl4fLcPSjBRmNaB4A=; b=TOq2IlZQl3149TCkvfsU48RaJ/MKL8to7mWBLDNusWdBvrfr0Ae3ebTRhGk4wf6lBL+UDBlH
 yx2owuCGTEb4nXVq3BwQNnaIL2MfR17h/KlOYFrcBs0etE4IvBHzCJdRotGQhkpoegDihNxm
 2BiRsuLzCiueiBdXOIDGJGAjrnc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f2ba60646ed996674e0c801 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 06:41:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94CC2C433C6; Thu,  6 Aug 2020 06:41:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CCFE7C433CA;
        Thu,  6 Aug 2020 06:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCFE7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     gregkh@linuxfoundation.org, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v5 1/4] bus: mhi: core: Add helper API to return number of free TREs
Date:   Wed,  5 Aug 2020 23:41:00 -0700
Message-Id: <1596696063-17802-2-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce mhi_get_no_free_descriptors() API to return number
of TREs available to queue buffer. MHI clients can use this
API to know before hand if ring is full without calling queue
API.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 12 ++++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2cff5dd..0599e7d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -258,6 +258,18 @@ int mhi_destroy_device(struct device *dev, void *data)
 	return 0;
 }
 
+int mhi_get_no_free_descriptors(struct mhi_device *mhi_dev,
+				enum dma_data_direction dir)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
+		mhi_dev->ul_chan : mhi_dev->dl_chan;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+	return get_nr_avail_ring_elements(mhi_cntrl, tre_ring);
+}
+EXPORT_SYMBOL_GPL(mhi_get_no_free_descriptors);
+
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 {
 	struct mhi_driver *mhi_drv;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a35d876..6565528 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -600,6 +600,15 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
 
 /**
+ * mhi_get_no_free_descriptors - Get transfer ring length
+ * Get # of TD available to queue buffers
+ * @mhi_dev: Device associated with the channels
+ * @dir: Direction of the channel
+ */
+int mhi_get_no_free_descriptors(struct mhi_device *mhi_dev,
+				enum dma_data_direction dir);
+
+/**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
  *                            This is optional, call this before power up if
  *                            the controller does not want bus framework to
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

