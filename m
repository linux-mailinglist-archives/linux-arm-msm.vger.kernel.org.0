Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3511A8558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 18:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407358AbgDNQmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 12:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407342AbgDNQmX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 12:42:23 -0400
Received: from localhost.localdomain (unknown [122.167.127.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B6E520678;
        Tue, 14 Apr 2020 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586882542;
        bh=uIADPVJhn47LELHLQYmbheTe3bWLvztWOpj8M2xE458=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eFbRq5fGZ8xVT3F/+m3uU1z7njQ0Vy27gqlI++KlXQzeRSiDI97NKhzlpAtTm6yQ+
         BVOx7OhaY26u5KIi3b3fpoNhzrrzukt1kPrUGYewtCURNWVc/b1O5pVoC/RPesJXR8
         I4BA0tRH1YMAm1E39jO9xItxPoTb/LWuikZvJKOM=
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
Subject: [PATCH v9 3/5] usb: xhci: Add support for Renesas controller with memory
Date:   Tue, 14 Apr 2020 22:11:50 +0530
Message-Id: <20200414164152.2786474-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414164152.2786474-1-vkoul@kernel.org>
References: <20200414164152.2786474-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some rensas controller like uPD720201 and uPD720202 need firmware to be
loaded. Add these devices in table and invoke renesas firmware loader
functions to check and load the firmware into device memory when
required.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci.c | 33 +++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b6c2f5c530e3..11521e2e1720 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 
 #include "xhci.h"
 #include "xhci-trace.h"
+#include "xhci-pci.h"
 
 #define SSIC_PORT_NUM		2
 #define SSIC_PORT_CFG2		0x880c
@@ -328,6 +329,21 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	int retval;
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
+	struct xhci_driver_data *driver_data;
+
+	driver_data = (struct xhci_driver_data *)id->driver_data;
+
+	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
+		retval = renesas_xhci_pci_probe(dev, id);
+		switch (retval) {
+		case 0: /* fw check success, continue */
+			break;
+		case 1: /* fw will be loaded by async load */
+			return 0;
+		default: /* error */
+			return retval;
+		}
+	}
 
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
 	pm_runtime_get_noresume(&dev->dev);
@@ -387,6 +403,11 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 static void xhci_pci_remove(struct pci_dev *dev)
 {
 	struct xhci_hcd *xhci;
+	int err;
+
+	err = renesas_xhci_pci_remove(dev);
+	if (err)
+		return;
 
 	xhci = hcd_to_xhci(pci_get_drvdata(dev));
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
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
2.25.1

