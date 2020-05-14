Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC31D2F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 14:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgENMVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 08:21:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgENMVA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 08:21:00 -0400
Received: from localhost.localdomain (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABF2920722;
        Thu, 14 May 2020 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589458859;
        bh=m4hWX5XVUi9nRCAyM6YQ7AFIdRBUm5X47bF+DD6RTiY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jjqcL552u8STCF0krFihjXAPSdbBHHOs/41t7oO3fiiQTvm3ZgJwwcF8NXz7feUsi
         nuZqYl1+1T1rHafJvsw/jqqLpyYKgn0Tp7hcAhVQTA3dDthtsKtnp7rafe77nVrAZb
         GU31UUigBtMXngsVu2mL0I/HjQBKkL4c1dXdJGoQ=
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
        linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH REPOST v13 1/4] usb: hci: add hc_driver as argument for usb_hcd_pci_probe
Date:   Thu, 14 May 2020 17:50:36 +0530
Message-Id: <20200514122039.300417-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200514122039.300417-1-vkoul@kernel.org>
References: <20200514122039.300417-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

usb_hcd_pci_probe expects users to call this with driver_data set as
hc_driver, that limits the possibility of using the driver_data for
driver data.

Add hc_driver as argument to usb_hcd_pci_probe and modify the callers
ehci/ohci/xhci/uhci to pass hc_driver as argument and freeup the
driver_data used

Tested xhci driver on Dragon-board RB3, compile tested ehci, ohci and
uhci.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
[For all but the xHCI parts]
Acked-by: Alan Stern <stern@rowland.harvard.edu>
[For the xhci part]
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/core/hcd-pci.c  |  7 ++++---
 drivers/usb/host/ehci-pci.c |  6 ++----
 drivers/usb/host/ohci-pci.c |  9 ++++++---
 drivers/usb/host/uhci-pci.c |  8 ++++++--
 drivers/usb/host/xhci-pci.c | 14 +++++---------
 include/linux/usb/hcd.h     |  3 ++-
 6 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index f0a259937da8..1547aa6e5314 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -159,6 +159,7 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
  * usb_hcd_pci_probe - initialize PCI-based HCDs
  * @dev: USB Host Controller being probed
  * @id: pci hotplug id connecting controller to HCD framework
+ * @driver: USB HC driver handle
  * Context: !in_interrupt()
  *
  * Allocates basic PCI resources for this USB host controller, and
@@ -169,9 +170,9 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
  *
  * Return: 0 if successful.
  */
-int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
+		      const struct hc_driver *driver)
 {
-	struct hc_driver	*driver;
 	struct usb_hcd		*hcd;
 	int			retval;
 	int			hcd_irq = 0;
@@ -181,7 +182,7 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	if (!id)
 		return -EINVAL;
-	driver = (struct hc_driver *)id->driver_data;
+
 	if (!driver)
 		return -EINVAL;
 
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 1a48ab1bd3b2..3c3820ad9092 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -360,23 +360,21 @@ static int ehci_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	if (is_bypassed_id(pdev))
 		return -ENODEV;
-	return usb_hcd_pci_probe(pdev, id);
+	return usb_hcd_pci_probe(pdev, id, &ehci_pci_hc_driver);
 }
 
 static void ehci_pci_remove(struct pci_dev *pdev)
 {
 	pci_clear_mwi(pdev);
-	usb_hcd_pci_remove(pdev);	
+	usb_hcd_pci_remove(pdev);
 }
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids [] = { {
 	/* handle any USB 2.0 EHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_EHCI, ~0),
-	.driver_data =	(unsigned long) &ehci_pci_hc_driver,
 	}, {
 	PCI_VDEVICE(STMICRO, PCI_DEVICE_ID_STMICRO_USB_HOST),
-	.driver_data = (unsigned long) &ehci_pci_hc_driver,
 	},
 	{ /* end: all zeroes */ }
 };
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index 22117a6aeb4a..585222af24ff 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -277,21 +277,24 @@ static const struct ohci_driver_overrides pci_overrides __initconst = {
 static const struct pci_device_id pci_ids[] = { {
 	/* handle any USB OHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_OHCI, ~0),
-	.driver_data =	(unsigned long) &ohci_pci_hc_driver,
 	}, {
 	/* The device in the ConneXT I/O hub has no class reg */
 	PCI_VDEVICE(STMICRO, PCI_DEVICE_ID_STMICRO_USB_OHCI),
-	.driver_data =	(unsigned long) &ohci_pci_hc_driver,
 	}, { /* end: all zeroes */ }
 };
 MODULE_DEVICE_TABLE (pci, pci_ids);
 
+static int ohci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	return usb_hcd_pci_probe(dev, id, &ohci_pci_hc_driver);
+}
+
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver ohci_pci_driver = {
 	.name =		hcd_name,
 	.id_table =	pci_ids,
 
-	.probe =	usb_hcd_pci_probe,
+	.probe =	ohci_pci_probe,
 	.remove =	usb_hcd_pci_remove,
 	.shutdown =	usb_hcd_pci_shutdown,
 
diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
index 957c87efc746..9b88745d247f 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -287,17 +287,21 @@ static const struct hc_driver uhci_driver = {
 static const struct pci_device_id uhci_pci_ids[] = { {
 	/* handle any USB UHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_UHCI, ~0),
-	.driver_data =	(unsigned long) &uhci_driver,
 	}, { /* end: all zeroes */ }
 };
 
 MODULE_DEVICE_TABLE(pci, uhci_pci_ids);
 
+static int uhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	return usb_hcd_pci_probe(dev, id, &uhci_driver);
+}
+
 static struct pci_driver uhci_pci_driver = {
 	.name =		hcd_name,
 	.id_table =	uhci_pci_ids,
 
-	.probe =	usb_hcd_pci_probe,
+	.probe =	uhci_pci_probe,
 	.remove =	usb_hcd_pci_remove,
 	.shutdown =	uhci_shutdown,
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 766b74723e64..b6c2f5c530e3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -327,11 +327,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
-	struct hc_driver *driver;
 	struct usb_hcd *hcd;
 
-	driver = (struct hc_driver *)id->driver_data;
-
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
 	pm_runtime_get_noresume(&dev->dev);
 
@@ -341,7 +338,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * to say USB 2.0, but I'm not sure what the implications would be in
 	 * the other parts of the HCD code.
 	 */
-	retval = usb_hcd_pci_probe(dev, id);
+	retval = usb_hcd_pci_probe(dev, id, &xhci_pci_hc_driver);
 
 	if (retval)
 		goto put_runtime_pm;
@@ -349,8 +346,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* USB 2.0 roothub is stored in the PCI device now. */
 	hcd = dev_get_drvdata(&dev->dev);
 	xhci = hcd_to_xhci(hcd);
-	xhci->shared_hcd = usb_create_shared_hcd(driver, &dev->dev,
-				pci_name(dev), hcd);
+	xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
+						 pci_name(dev), hcd);
 	if (!xhci->shared_hcd) {
 		retval = -ENOMEM;
 		goto dealloc_usb2_hcd;
@@ -544,10 +541,9 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 /*-------------------------------------------------------------------------*/
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
-static const struct pci_device_id pci_ids[] = { {
+static const struct pci_device_id pci_ids[] = {
 	/* handle any USB 3.0 xHCI controller */
-	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
-	.driver_data =	(unsigned long) &xhci_pci_hc_driver,
+	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
 	},
 	{ /* end: all zeroes */ }
 };
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index e12105ed3834..3dbb42c637c1 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -479,7 +479,8 @@ extern void usb_hcd_platform_shutdown(struct platform_device *dev);
 struct pci_dev;
 struct pci_device_id;
 extern int usb_hcd_pci_probe(struct pci_dev *dev,
-				const struct pci_device_id *id);
+			     const struct pci_device_id *id,
+			     const struct hc_driver *driver);
 extern void usb_hcd_pci_remove(struct pci_dev *dev);
 extern void usb_hcd_pci_shutdown(struct pci_dev *dev);
 
-- 
2.25.4

