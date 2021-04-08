Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E743358007
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 11:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhDHJ5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 05:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhDHJ5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 05:57:04 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12A7C061760;
        Thu,  8 Apr 2021 02:56:53 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id t140so1024474pgb.13;
        Thu, 08 Apr 2021 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjas6KXkAso9tZS0xachLDZT9jXyy102BfQigMLfs5Q=;
        b=ZHfsAxlWuMoAC90JtmGXFDFhGet/a8iFMmxha3DYZVnKOgp0GBFKNRYK4qyQHjparV
         2FNZMQskEX9xbZ++dpOT9/HD0yF8KiBYOSSMYhZadG92sbwpYp/guguvMHm0ynxZo2Nz
         inlTakN9g+jPUvKulTFnnTWinBPmHpPqtwecmkDztdUIoq4Uvb5dpan+1ighyHZQIsAC
         R/ngTnbtIq3nU71f/A690n+5SvX4gLkqDABfa7ZZ063raBPKvMjj3AC3aR5wfvnwcTLT
         bIIiaXrmSsPR0Xv43kt5O9jsuKZUIT9dAZgH2hUfEzE7em47ZelG6MGN7v/6LVRPj9Uc
         JzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjas6KXkAso9tZS0xachLDZT9jXyy102BfQigMLfs5Q=;
        b=paqJf9aveQAJH9XW/+nk1MmqMoQZVZfLTjhN/UnyqX29BZvbzLdJa5VpudeCOIwLwz
         Txq174mia5X3PZuKXUWC5genHKrT7uUO+b6bGwcSaOn2tUNvAt2l2jNNFNcNeD4MWKMM
         gQR3NZU4Qv9549P3T0bpBgZNOiPZmrorcS5Y3t39h/vGKXWoNJ1wSq6OSt9/7bJtMpQm
         uWVtPmXr+SboFLaUFSNmNvYiV4Nl75Vnr37Otek5AEgodrEQoeNVwAxKbkqI70TBp+Ur
         kFNAFkUY5OlEHoAGPWSSsrMSb0e8hdHhNL5m8s6TdjyJ5AcJlyGnse5Ca+aW/R4uv46B
         15Fg==
X-Gm-Message-State: AOAM532Rt8mQ/SzRiyE0qeSOX3sxSMzmJFFDcYb1LqRgDr/xYdeIjwIN
        378r5Id+BKkTMeUnOqPJfMM=
X-Google-Smtp-Source: ABdhPJz/1NJOz5J+Ib5cVb+NUk6W79W7kt3rH3y4U6R8xQr8tyhvBBABRvUEBcKr4gZh8hkaPTsZQw==
X-Received: by 2002:a05:6a00:2292:b029:214:7a33:7f08 with SMTP id f18-20020a056a002292b02902147a337f08mr6665544pfe.15.1617875813340;
        Thu, 08 Apr 2021 02:56:53 -0700 (PDT)
Received: from localhost.localdomain ([2.58.242.54])
        by smtp.gmail.com with ESMTPSA id az9sm6481947pjb.54.2021.04.08.02.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:56:53 -0700 (PDT)
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com,
        Jarvis Jiang <jarvis.w.jiang@gmail.com>
Subject: [PATCH 1/2] [v2] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
Date:   Thu,  8 Apr 2021 02:55:24 -0700
Message-Id: <20210408095524.3559-1-jarvis.w.jiang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for T99W175 modems, this modem series is based on SDX55
qcom chip. The modem is mainly based on MBIM protocol for both the
data and control path.

This patch adds support for below modems:

 - T99W175(based on sdx55), Both for eSIM and Non-eSIM
 - DW5930e(based on sdx55), With eSIM, It's also T99W175
 - DW5930e(based on sdx55), Non-eSIM, It's also T99W175

This patch was tested with Ubuntu 20.04 X86_64 PC as host

Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
---
 drivers/bus/mhi/pci_generic.c | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 544853c67e02..c66fb73e47ad 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -269,6 +269,44 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
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
@@ -280,6 +318,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
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

