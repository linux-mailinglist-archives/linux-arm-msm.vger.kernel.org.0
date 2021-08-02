Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20653DCFEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhHBFNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhHBFNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:34 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55430C061796
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id l19so23730947pjz.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+g3xmhwvXvNwyFURwqnFUjz8KIxQ4PwLzCF4htxlpM=;
        b=BrpdnvIvatNHifnbl9+6Tk8b9r+2a8EpFYR/NJ+H8BQaqAS3QBizZJU0der+yaBVea
         kuIm2BUs9oGs0v5Rg5+O20kaZ2eALskHgi8nggs5G4TyUtHbjxneLRDz+v8dMzfoaW5B
         pUXCBGh7hWze5UL3Y7ygQsR+fJt4rJWueqKQirUQfPMpu30yWteYtMgWuO1I/CulPR+Z
         vgonfuCbpIVpXHDlljs8eMCluFsCx3ALdIbI4teiQ4qhgDmYIxs5mcfBdm/1asmlvHoM
         FycbgJvfNCevSxJoZw57YKXqzOT+Ruolas5rK0DB2T2jmaCCBN0eopDDC8+LKqJuI8J5
         tElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+g3xmhwvXvNwyFURwqnFUjz8KIxQ4PwLzCF4htxlpM=;
        b=MkZrPrAK6UIAPIn31MxzD9tvAMFeL9m5ltemUQn/bbWVglKpL5/2RqLOtuI8emXrbk
         8IONEhog3+o6rb4/Pdf9W1eQMZEOUBnIrLYEXF3qTUlFSI+b3OWZjE0YjVkIsx4B0fLv
         uO/br3boZbybyX6edwjN02AcywR+WlwxDihkDYBw02NiLXO5jLH+6uxIYe4wZOC7Iirm
         W2G8QPxLSx8O2+p3WXHqZlSlEbbkZv5NfId2htxK8iyyJzrf/Kh3QJ+6EscZaK/Yw1j6
         qI3K3SdcF12pLem2X79TXi4Q9kRtNEvvU+kr8HdkumDRfhizL4JO+q+/0A7Z4Pf4ZDX8
         CJHA==
X-Gm-Message-State: AOAM531a12kYCVXqWmqnrPfDzZ5qeUZa/HEyTORrnrp9lsEhgSLF5XAj
        0E8zOene6a9getBsn3QfeeUL
X-Google-Smtp-Source: ABdhPJyjYuC8YVoUGTKZvTvu2sTgfeUSUX/wODYPytQOST2jviWgZh6iTsCAlK9wT/8ZqoeNaL8k7Q==
X-Received: by 2002:a63:7209:: with SMTP id n9mr1214830pgc.253.1627881203840;
        Sun, 01 Aug 2021 22:13:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        ULRICH Thomas <thomas.ulrich@thalesgroup.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/10] bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI
Date:   Mon,  2 Aug 2021 10:42:47 +0530
Message-Id: <20210802051255.5771-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ULRICH Thomas <thomas.ulrich@thalesgroup.com>

This patch adds VendorID/ProductID and MBIM Channel Definitions for
M.2 Modem Card (PCIe Variant) to MHI PCI generic controller driver.

Cinterion MV31-W (by Thales)
Additional information on such Modem Card (USB or PCIe variant) is
available at:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

Signed-off-by: ULRICH Thomas <thomas.ulrich@thalesgroup.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM
[mani: fixed the subject, whitespace, and added sideband_wake field]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index ca3bc40427f8..6e1a86021b75 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -342,6 +342,40 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_channel_config mhi_mv31_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
+	/* MBIM Control Channel */
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 64, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 64, 0),
+	/* MBIM Data Channel */
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 512, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
+};
+
+static struct mhi_event_config mhi_mv31_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 256),
+	MHI_EVENT_CONFIG_DATA(1, 256),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101),
+};
+
+static const struct mhi_controller_config modem_mv31_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_mv31_channels),
+	.ch_cfg = mhi_mv31_channels,
+	.num_events = ARRAY_SIZE(mhi_mv31_events),
+	.event_cfg = mhi_mv31_events,
+};
+
+static const struct mhi_pci_dev_info mhi_mv31_info = {
+	.name = "cinterion-mv31",
+	.config = &modem_mv31_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
@@ -362,6 +396,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* MV31-W (Cinterion) */
+	{ PCI_DEVICE(0x1269, 0x00b3),
+		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.25.1

