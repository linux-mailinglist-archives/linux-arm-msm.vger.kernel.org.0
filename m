Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA62138D1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 09:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgAMIkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 03:40:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbgAMIki (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 03:40:38 -0500
Received: from localhost.localdomain (unknown [106.200.247.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4C5D207E0;
        Mon, 13 Jan 2020 08:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578904837;
        bh=1qv/uiqU+lvGy4vNbaTZDSE+L9LCBmyo2jSjlXzCaFY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LE2FTxi8KP8KWNCs7FOLql20SYThhwNY5bp18tlM/U2vFrjt3J882AzBQsZdewcQK
         GF7hDywxp2IdeiIK8yO1BgSwVCSJ8FV7uyFGkurQ52xbxrdZsY1h9ac5BEYfXAhSV/
         N3XywRwbmQ64mcf2vuAXcRfJ9viEPIEI8zd1GYNY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] usb: renesas-xhci: allow multiple firmware versions
Date:   Mon, 13 Jan 2020 14:10:04 +0530
Message-Id: <20200113084005.849071-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113084005.849071-1-vkoul@kernel.org>
References: <20200113084005.849071-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow multiple firmware file versions in table and load them in
increasing order as we find them in the file system.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/usb/host/xhci-pci-renesas.c | 45 +++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 1d073c5637c4..fe95487ca888 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -73,13 +73,20 @@ static const struct renesas_fw_entry {
 	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
 	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
 	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
+	 *
+	 *  Entry expected_version should be kept in decreasing order for a
+	 *  chip, so that driver will pick latest version and if that fails
+	 *  then next one will be picked
 	 */
 	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
+	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
 	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
+	{ "K2026090.mem", 0x0015, 0x02, 0x2026 },
 	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
 };
 
 MODULE_FIRMWARE("K2013080.mem");
+MODULE_FIRMWARE("K2026090.mem");
 
 static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
 {
@@ -100,6 +107,24 @@ static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
 	return NULL;
 }
 
+static const struct
+renesas_fw_entry *renesas_get_next_entry(struct pci_dev *dev,
+					 const struct renesas_fw_entry *entry)
+{
+	const struct renesas_fw_entry *next_entry;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
+		next_entry = &renesas_fw_table[i];
+		if (next_entry->device == dev->device &&
+		    next_entry->revision == dev->revision &&
+		    next_entry->expected_version < entry->expected_version)
+			return next_entry;
+	}
+
+	return NULL;
+}
+
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw,
 				     size_t step)
@@ -700,13 +725,29 @@ static void renesas_fw_callback(const struct firmware *fw,
 	struct renesas_fw_ctx *ctx = context;
 	struct pci_dev *pdev = ctx->pdev;
 	struct device *parent = pdev->dev.parent;
+	const struct renesas_fw_entry *next_entry;
 	bool rom;
 	int err;
 
 	if (!fw) {
 		dev_err(&pdev->dev, "firmware failed to load\n");
-
-		goto cleanup;
+		/*
+		 * we didn't find firmware, check if we have another
+		 * entry for this device
+		 */
+		next_entry = renesas_get_next_entry(ctx->pdev, ctx->entry);
+		if (next_entry) {
+			ctx->entry = next_entry;
+			dev_dbg(&pdev->dev, "Found next entry, requesting: %s\n",
+				next_entry->firmware_name);
+			request_firmware_nowait(THIS_MODULE, 1,
+						next_entry->firmware_name,
+						&pdev->dev, GFP_KERNEL,
+						ctx, renesas_fw_callback);
+			return;
+		} else {
+			goto cleanup;
+		}
 	}
 
 	err = renesas_fw_verify(pdev, fw->data, fw->size);
-- 
2.24.1

