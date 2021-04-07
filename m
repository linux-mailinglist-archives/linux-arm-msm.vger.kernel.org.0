Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9242A35617F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 04:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343687AbhDGCwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 22:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbhDGCwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 22:52:04 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF200C06174A;
        Tue,  6 Apr 2021 19:51:54 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so2285735pjb.1;
        Tue, 06 Apr 2021 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HufBpw0G6m/IhYI4e//EaIgU2yBcjTK3RNOlZTy+jC0=;
        b=Y3X94X8KLcOhQBjtubZSDUEXKuIY8kikyWaCo1jH1bMRaNB990nFdAYYY+G8xRXqeG
         uxxulJ7cFqzRs+X5vtvHQkRt6g/VBJMzkexYibDcLtsGXHc24iLvRHmg/2lensYyHROJ
         +jdIQPIn7wC3rzR/jmV89SSs0r/Ge0KKtbmz73E8NQ/EE5YejWaaxRfuq3clIR6AhUAd
         d6aNYOFQV0YKAQPgTe4jbZdjB1uQ/1Lv/PefF1kEGWIDgyoQiw9xKOwq/IRIhyZN9pxU
         MZcl/KV7jaKQBntdSCMI5LGAIEo5BHy35aLrRt7KXtLn+XJUgGnFq2J49hGjEknujiaY
         uGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HufBpw0G6m/IhYI4e//EaIgU2yBcjTK3RNOlZTy+jC0=;
        b=L6vt6EtCxgC1pp9idnqhTxIZoPp3imFeDJSaFy9Ka4Q2br7/x0fCKf0G+pLs9h7Bu4
         o8gE/OFwa4bIJ+5KI1SKABHiecs4pTLiR9PzLZBeeAZd8+5Kq9mcNv0P6VPF1jGzaz/L
         ySPLR896RerTRFmLHfaBNOQcN+2NZfyEef0zvjhiNGu+hjZiY+3/Aamr8d2KXpXeVJ3e
         8JgfbE8VR+RWXeWAuh50f6ty4jWmyddAjVhXVrWywQn2ZqI/M8ZxECXESok/jRFI3ZSF
         6qZ3Z3lYVa8Fu5Q0oF+4ozg1bx1GHrZnN18K+WsmjFQy85ot6ZnjMzV/DRhMkG9adZSM
         rk1g==
X-Gm-Message-State: AOAM531LgtOZXt4HNHQRsplnvCMlpaaXAavT9tWP1/t146inMgE8C0nV
        5amEd32XOdJbVdBKRaNz53Q=
X-Google-Smtp-Source: ABdhPJwpzsBD2HEio1DYG7ojoi+vAXNfBgjO+olWFIKxVl79mLtYmRDWNQcCXrSVCrYf2RK21SxkSA==
X-Received: by 2002:a17:902:a716:b029:e8:ba45:ea0f with SMTP id w22-20020a170902a716b02900e8ba45ea0fmr1158166plq.63.1617763914249;
        Tue, 06 Apr 2021 19:51:54 -0700 (PDT)
Received: from localhost.localdomain ([103.152.151.6])
        by smtp.gmail.com with ESMTPSA id t18sm19702215pfh.57.2021.04.06.19.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 19:51:53 -0700 (PDT)
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com,
        Jarvis Jiang <jarvis.w.jiang@gmail.com>
Subject: [PATCH] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
Date:   Tue,  6 Apr 2021 19:50:29 -0700
Message-Id: <20210407025029.2616-1-jarvis.w.jiang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for T99W175 modems, this modem series is based on SDX55
qcom chip. The modem is mainly based on MBIM protocol for both the
data and control path.

This patch was tested with Ubuntu 20.04 X86_64 PC as host

Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
---
 drivers/bus/mhi/pci_generic.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 5cf44bcfe040..3e396c65a758 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -260,6 +260,52 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(16, "QMI1", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(17, "QMI1", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
+};
+
+static struct mhi_controller_config modem_foxconn_sdx55_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
+	.ch_cfg = mhi_foxconn_sdx55_channels,
+	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
+	.event_cfg = mhi_foxconn_sdx55_events,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
+	.name = "foxconn-sdx55",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
@@ -269,6 +315,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab), /* T99W175 (sdx55) */
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b2), /* T99W175 (sdx55) */
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b3), /* T99W175 (sdx55) */
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* DW5930e (sdx55), With eSIM, It's also T99W175 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.25.1

