Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571EB1C67C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 08:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgEFGBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 02:01:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgEFGBF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 02:01:05 -0400
Received: from localhost.localdomain (unknown [122.181.213.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7022320721;
        Wed,  6 May 2020 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588744864;
        bh=3XjrvdKFugJzjlQ8Be1xKGrt/AfsHPD8ngeihuJtzXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P6pgIFimenPb5Xda4iRKA1Gxj11BpjAh+oWxkwZFhD+bnwGleGQ0h9BqElo2ntWjL
         X2uO8NB6mEML95AOvmzC59NcH72IascIxGSJR13Hasc2/TTHQQ6P1Tnbk/UwWOWNwQ
         zxnzFy1QaAaX0o9ZlaXpnA1dPXQZTw87b7v3Z2bw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller with memory
Date:   Wed,  6 May 2020 11:30:23 +0530
Message-Id: <20200506060025.1535960-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506060025.1535960-1-vkoul@kernel.org>
References: <20200506060025.1535960-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some rensas controller like uPD720201 and uPD720202 need firmware to be
loaded. Add these devices in pci table and invoke renesas firmware loader
functions to check and load the firmware into device memory when
required.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci.c | 35 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b6c2f5c530e3..ef513c2fb843 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 
 #include "xhci.h"
 #include "xhci-trace.h"
+#include "xhci-pci.h"
 
 #define SSIC_PORT_NUM		2
 #define SSIC_PORT_CFG2		0x880c
@@ -87,7 +88,16 @@ static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 
 static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
-	struct pci_dev		*pdev = to_pci_dev(dev);
+	struct pci_dev                  *pdev = to_pci_dev(dev);
+	struct xhci_driver_data         *driver_data;
+	const struct pci_device_id      *id;
+
+	id = pci_match_id(pdev->driver->id_table, pdev);
+
+	if (id && id->driver_data) {
+		driver_data = (struct xhci_driver_data *)id->driver_data;
+		xhci->quirks |= driver_data->quirks;
+	}
 
 	/* Look for vendor-specific quirks */
 	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
@@ -328,6 +338,14 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	int retval;
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
+	struct xhci_driver_data *driver_data;
+
+	driver_data = (struct xhci_driver_data *)id->driver_data;
+	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
+		retval = renesas_xhci_check_request_fw(dev, id);
+		if (retval)
+			return retval;
+	}
 
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
 	pm_runtime_get_noresume(&dev->dev);
@@ -389,6 +407,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
 	struct xhci_hcd *xhci;
 
 	xhci = hcd_to_xhci(pci_get_drvdata(dev));
+	if (xhci->quirks & XHCI_RENESAS_FW_QUIRK)
+		renesas_xhci_pci_exit(dev);
+
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
 	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
@@ -540,14 +561,26 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 
 /*-------------------------------------------------------------------------*/
 
+static const struct xhci_driver_data reneses_data = {
+	.quirks  = XHCI_RENESAS_FW_QUIRK,
+	.firmware = "renesas_usb_fw.mem",
+};
+
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(0x1912, 0x0014),
+		.driver_data =  (unsigned long)&reneses_data,
+	},
+	{ PCI_DEVICE(0x1912, 0x0015),
+		.driver_data =  (unsigned long)&reneses_data,
+	},
 	/* handle any USB 3.0 xHCI controller */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
 	},
 	{ /* end: all zeroes */ }
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
+MODULE_FIRMWARE("renesas_usb_fw.mem");
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver xhci_pci_driver = {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3289bb516201..4047363c7423 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1873,6 +1873,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
+#define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.4

