Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4ECF458D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 12:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhKVLQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 06:16:50 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:46471 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235881AbhKVLQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 06:16:50 -0500
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6396724000F;
        Mon, 22 Nov 2021 11:13:40 +0000 (UTC)
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     mani@kernel.org, hemantk@codeaurora.org, aleksander@aleksander.es,
        Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [PATCH] bus: mhi: pci_generic: Introduce Sierra EM919X support
Date:   Mon, 22 Nov 2021 12:11:35 +0100
Message-Id: <20211122111135.3272126-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for EM919X modems, this modem series is based on SDX55
qcom chip.

Tested-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 drivers/bus/mhi/pci_generic.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..076a951fd587 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -403,7 +403,50 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
 	.dma_data_width = 32,
 };
 
+static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 128, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
+};
+
+static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
+	/* first ring is control+data and DIAG ring */
+	MHI_EVENT_CONFIG_CTRL(0, 2048),
+	/* Hardware channels request dedicated hardware event rings */
+	MHI_EVENT_CONFIG_HW_DATA(1, 2048, 100),
+	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
+};
+
+static const struct mhi_controller_config modem_sierra_em919x_config = {
+	.max_channels = 128,
+	.timeout_ms = 24000,
+	.num_channels = ARRAY_SIZE(mhi_sierra_em919x_channels),
+	.ch_cfg = mhi_sierra_em919x_channels,
+	.num_events = ARRAY_SIZE(modem_sierra_em919x_mhi_events),
+	.event_cfg = modem_sierra_em919x_mhi_events,
+};
+
+static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
+	.name = "sierra-em919x",
+	.config = &modem_sierra_em919x_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
2.31.1

