Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D27E3B4356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFYMgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhFYMgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:36:44 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871C8C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id c5so7929640pfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZYNDb4xzGmZSM7Z9Ig9ZvRwbBZW3WBf8mohzvqiLTM=;
        b=QQoylyQ6iGE2SvHaMCWeJfomUftn2k0LasW46c6SKrq/J9S7wGJJlSB8rHITNMMEmF
         snljNt7VBX/5Il4gh2S5BAWvEs5U1LR+SLyGbVUjmAMQKuo9o5cPtjmOVdQKxfAD9xYf
         8oIOdHdMbc7tSsANE9eDoruleL+l17eRTuMnm0Vcgp2Msq6nZ52gpSE5Aqsd14sNnOcT
         wCbO8o/Q4Qlge7N0nmqpHXUB5pWLv4yXaGf7lL8jZRR8+yNFoS5+4t6aNzP46F+HZDso
         GAxl7L+fzMLJu3xhEtguQDB/jcwhDG5SuwfSV1s2T2tKo1USAnDThgGevKy/ljU6nhIC
         +Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZYNDb4xzGmZSM7Z9Ig9ZvRwbBZW3WBf8mohzvqiLTM=;
        b=NDHCBfBteu4IXNUsHWJVZYMhMkROy0ZKxFCbTq+LjUARdkN4Nh4Tu57fibpJLTsC9e
         wAuQv9t/NwYFzJt+mfZB43Uw4zIzQa+IMbr6i/ANU/SUBbUOxlC4qhfGDc+xfuYVOzNj
         EalmNTQuM/1vQ+6+jqzZ7P/tAjfDuXYsPYUOlPdAVQeGciBpCJeOOHoNipfOCu+2GzmC
         khtxOAQ3WQzqYPPCOuFTEjCNmHzPT09rsxKCAw49lKglnsEiHHKGKY8yMz/Tp71rqjYL
         h8FWtFnx8ihv/WGfxX8yMoZpZoDtT7AURrUNuTg2vCr4yluf4V2A76gobei5u7d1Hyxs
         l99A==
X-Gm-Message-State: AOAM531t8XZC3qqEFeqkinNSXi+xWTO3zDjXsq/r1cChtw+FlOI0OdBV
        SnyBQ8RsjMKxPmKAThzapdx7
X-Google-Smtp-Source: ABdhPJwikdDmUjUTMGNdR7IoTEhspPdwbMZ81uSgM+SBleVnKdbOnrOrC6KQq+kD+x7PZfyLqcG8XQ==
X-Received: by 2002:a65:4ccb:: with SMTP id n11mr2064153pgt.231.1624624462039;
        Fri, 25 Jun 2021 05:34:22 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        stable@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/10] bus: mhi: pci_generic: Apply no-op for wake using sideband wake boolean
Date:   Fri, 25 Jun 2021 18:03:47 +0530
Message-Id: <20210625123355.11578-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Devices such as SDX24 do not have the provision for inband wake
doorbell in the form of channel 127 and instead have a sideband
GPIO for it. Newer devices such as SDX55 or SDX65 support inband
wake method by default. Ensure the functionality is used based on
this such that device wake stays held when a client driver uses
mhi_device_get() API or the equivalent debugfs entry.

Cc: stable@vger.kernel.org
Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1624560809-30610-1-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index d84b74396c6a..eac4d10f99c9 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -32,6 +32,8 @@
  * @edl: emergency download mode firmware path (if any)
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
+ * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
+ *		   of inband wake support (such as sdx24)
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -40,6 +42,7 @@ struct mhi_pci_dev_info {
 	const char *edl;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
+	bool sideband_wake;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -242,7 +245,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
 	.edl = "qcom/sdx65m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
@@ -251,7 +255,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
@@ -259,7 +264,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
@@ -301,7 +307,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_quectel_em1xx_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
@@ -339,7 +346,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct pci_device_id mhi_pci_id_table[] = {
@@ -640,9 +648,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
-	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
-	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
-	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+
+	if (info->sideband_wake) {
+		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
+		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
+		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+	}
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-- 
2.25.1

