Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB0E18FADE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 18:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgCWRHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 13:07:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgCWRHF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 13:07:05 -0400
Received: from localhost.localdomain (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9486620719;
        Mon, 23 Mar 2020 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584983224;
        bh=1/kOzn/Eeb1iekxFlIf9k9yuB8Iupo7CBl1/M+b6eW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GbypS3fKvy3jMUGNsK5qPveKJLZfl0H7gsVdmtVKdjcyacTwDBQBx/3Gib5/5EB+C
         SiiJSislYB4DvW8d93ITVaOC8JpSiYBmz3i9s2+ZoQ+rq1IkFrUIHd7wmeNArjO9tb
         4s0PfxXiDmygDfrfRegbqMsvmInURWM0DHcfMwXc=
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
Subject: [PATCH v8 3/5] usb: xhci: Add support for Renesas controller with memory
Date:   Mon, 23 Mar 2020 22:35:59 +0530
Message-Id: <20200323170601.419809-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323170601.419809-1-vkoul@kernel.org>
References: <20200323170601.419809-1-vkoul@kernel.org>
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
 drivers/usb/host/xhci-pci-renesas.c |  1 +
 drivers/usb/host/xhci-pci.c         | 29 ++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-pci.h         |  3 +++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index c588277ac9b8..d413d53df94b 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -336,6 +336,7 @@ static void renesas_fw_callback(const struct firmware *fw,
 		goto cleanup;
 	}
 
+	xhci_pci_probe(pdev, ctx->id);
 	return;
 
 cleanup:
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a19752178216..7e63658542ac 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 
 #include "xhci.h"
 #include "xhci-trace.h"
+#include "xhci-pci.h"
 
 #define SSIC_PORT_NUM		2
 #define SSIC_PORT_CFG2		0x880c
@@ -312,11 +313,25 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
  * We need to register our own PCI probe function (instead of the USB core's
  * function) in order to create a second roothub under xHCI.
  */
-static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
+	char *renesas_fw;
+
+	renesas_fw = (char *)id->driver_data;
+	if (renesas_fw) {
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
@@ -379,6 +394,11 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
@@ -534,12 +554,19 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(0x1912, 0x0014),
+		.driver_data =  (unsigned long)"renesas_usb_fw.mem",
+	},
+	{ PCI_DEVICE(0x1912, 0x0015),
+		.driver_data =  (unsigned long)"renesas_usb_fw.mem",
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
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
index 092909dd85a0..1b4330f893fa 100644
--- a/drivers/usb/host/xhci-pci.h
+++ b/drivers/usb/host/xhci-pci.h
@@ -7,5 +7,8 @@
 int renesas_xhci_pci_probe(struct pci_dev *dev,
 			   const struct pci_device_id *id);
 int renesas_xhci_pci_remove(struct pci_dev *dev);
+
+int xhci_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id);
+
 #endif
 
-- 
2.25.1

