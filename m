Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 417894CBC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 12:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbfFTKZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 06:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:50048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731491AbfFTKZe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 06:25:34 -0400
Received: from localhost.localdomain (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91C7E206BA;
        Thu, 20 Jun 2019 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561026333;
        bh=wDwRd0hEpSkvmEKJfBABhPciAsp8oGwr7W3yIBEHFAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zNC8vD1Dn7oboJiVKACw/UYh/Fc4TiqQG/Vf5XOuVjiKc7FNv0AVEC/0bWOrcdeJY
         BV9vV8bhqA9n61R8/GD2QyJxAXagQflKF/lZVRjJBOWw4rnV8i9YFYcCQ/wtrX6Apt
         HH/4CMv1S488q0egYKrgyxQQQ055FC73DgPk7F/Y=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH 5/5] usb: xhci: allow multiple firmware versions
Date:   Thu, 20 Jun 2019 15:51:54 +0530
Message-Id: <20190620102154.20805-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620102154.20805-1-vkoul@kernel.org>
References: <20190620102154.20805-1-vkoul@kernel.org>
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
 drivers/usb/host/xhci-pci.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3574afac44c5..2ee9e6bbabcb 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -333,9 +333,12 @@ static const struct renesas_fw_entry {
 	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
 	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
 	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
+	 *
+	 *  Entry expected_version should be kept in increasing order
 	 */
 	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
 	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
+	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
 	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
 };
 
@@ -358,6 +361,24 @@ static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
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
+		    next_entry->expected_version > entry->expected_version)
+			return next_entry;
+	}
+
+	return NULL;
+}
+
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw,
 				     size_t step)
@@ -723,6 +744,7 @@ struct renesas_fw_ctx {
 	struct pci_dev *pdev;
 	const struct pci_device_id *id;
 	bool resume;
+	const struct renesas_fw_entry *entry;
 };
 
 static int xhci_pci_probe(struct pci_dev *pdev,
@@ -982,6 +1004,7 @@ static void renesas_fw_callback(const struct firmware *fw,
 	struct renesas_fw_ctx *ctx = context;
 	struct pci_dev *pdev = ctx->pdev;
 	struct device *parent = pdev->dev.parent;
+	const struct renesas_fw_entry *next_entry;
 	bool rom;
 	int err = -ENOENT;
 
@@ -1035,6 +1058,21 @@ static void renesas_fw_callback(const struct firmware *fw,
 		}
 	} else {
 		dev_err(&pdev->dev, "firmware failed to load (%d).", err);
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
+		}
 	}
 
 	dev_info(&pdev->dev, "Unloading driver");
@@ -1096,6 +1134,7 @@ static int renesas_fw_download_to_hw(struct pci_dev *pdev,
 	ctx->pdev = pdev;
 	ctx->resume = do_resume;
 	ctx->id = id;
+	ctx->entry = entry;
 
 	pci_dev_get(pdev);
 	err = request_firmware_nowait(THIS_MODULE, 1, entry->firmware_name,
-- 
2.20.1

