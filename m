Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB6F138D13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 09:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgAMIk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 03:40:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:43044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbgAMIk1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 03:40:27 -0500
Received: from localhost.localdomain (unknown [106.200.247.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BB3A2082E;
        Mon, 13 Jan 2020 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578904826;
        bh=ZiXD4t/VqVmgHwtWL5sGCo6h0K9E6wwR6VpH1Q/ypHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vO0NXykK9nnRLs8R5RBkXnZXpO9Ddhyq8qdEq2EYcC/KayfyEAi5uOP7tZFGRT8D0
         6KhS0OUrpo0RGfA+7PVnjwGwx1DojB1zoCIepv4+53XFhO2sjDWkceZjWaamZe2qy+
         QU2I/U4B3pAqR7WmeLambh2tdpnwhQmJ26jxRguI=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] usb: xhci: export few functions
Date:   Mon, 13 Jan 2020 14:10:01 +0530
Message-Id: <20200113084005.849071-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113084005.849071-1-vkoul@kernel.org>
References: <20200113084005.849071-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Export the xhci_pci_setup(), xhci_pci_probe() xhci_pci_remove(),
xhci_pci_suspend() and xhci_pci_resume() functions as they would be used
by renesas-xhci driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci.c | 18 +++++++++++-------
 drivers/usb/host/xhci-pci.h | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+), 7 deletions(-)
 create mode 100644 drivers/usb/host/xhci-pci.h

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a0025d23b257..5115871b50af 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 
 #include "xhci.h"
 #include "xhci-trace.h"
+#include "xhci-pci.h"
 
 #define SSIC_PORT_NUM		2
 #define SSIC_PORT_CFG2		0x880c
@@ -60,8 +61,6 @@ static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
 
-static int xhci_pci_setup(struct usb_hcd *hcd);
-
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
 };
@@ -282,7 +281,7 @@ static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 #endif /* CONFIG_ACPI */
 
 /* called during probe() after chip reset completes */
-static int xhci_pci_setup(struct usb_hcd *hcd)
+int xhci_pci_setup(struct usb_hcd *hcd)
 {
 	struct xhci_hcd		*xhci;
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
@@ -307,12 +306,13 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	/* Find any debug ports */
 	return xhci_pci_reinit(xhci, pdev);
 }
+EXPORT_SYMBOL_GPL(xhci_pci_setup);
 
 /*
  * We need to register our own PCI probe function (instead of the USB core's
  * function) in order to create a second roothub under xHCI.
  */
-static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
@@ -378,8 +378,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_pci_probe);
 
-static void xhci_pci_remove(struct pci_dev *dev)
+void xhci_pci_remove(struct pci_dev *dev)
 {
 	struct xhci_hcd *xhci;
 
@@ -401,6 +402,7 @@ static void xhci_pci_remove(struct pci_dev *dev)
 
 	usb_hcd_pci_remove(dev);
 }
+EXPORT_SYMBOL_GPL(xhci_pci_remove);
 
 #ifdef CONFIG_PM
 /*
@@ -457,7 +459,7 @@ static void xhci_pme_quirk(struct usb_hcd *hcd)
 	readl(reg);
 }
 
-static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
+int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
@@ -482,8 +484,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(xhci_pci_suspend);
 
-static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
@@ -519,6 +522,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	retval = xhci_resume(xhci, hibernated);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_pci_resume);
 #endif /* CONFIG_PM */
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
new file mode 100644
index 000000000000..587f71dc5e35
--- /dev/null
+++ b/drivers/usb/host/xhci-pci.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2008 Intel Corp. */
+
+#ifndef XHCI_PCI_H
+#define XHCI_PCI_H
+
+int xhci_pci_setup(struct usb_hcd *hcd);
+
+int xhci_pci_probe(struct pci_dev *pdev,
+		   const struct pci_device_id *id);
+
+void xhci_pci_remove(struct pci_dev *dev);
+
+int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup);
+
+int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated);
+
+#endif
-- 
2.24.1

