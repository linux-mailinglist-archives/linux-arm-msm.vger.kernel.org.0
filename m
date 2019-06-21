Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 084974E28D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 11:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFUJCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 05:02:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFUJCk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 05:02:40 -0400
Received: from localhost.localdomain (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0DED21537;
        Fri, 21 Jun 2019 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561107759;
        bh=HPuu6qn99OJuGej92r5a0RCVoKbz0adjX409gX5Fu4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJqsQtTBFs6HYV8lb86iyIgWaWG3Inwh63l1x9u2JYCujVBUdUUI7TKHvMAbedV3B
         IBFpBc7/9MoEWus7Eap2Dbe25qAqdCUaXzkct3NeQMOKupdyUI8aED4f2R8cY9nl7b
         LtC5goceXr94fNES98FbhP7Ul0slEhwL9ABd+lCA=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/5] usb: xhci: handle uPD720201 and uPD720202 w/o ROM
Date:   Fri, 21 Jun 2019 14:29:10 +0530
Message-Id: <20190621085913.8722-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621085913.8722-1-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@googlemail.com>

This patch adds a firmware check for the uPD720201K8-711-BAC-A
and uPD720202K8-711-BAA-A variant. Both of these chips are listed
in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
devices which need a firmware in order to work as they do not have
support to load the firmware from an external ROM.

Currently, the xhci-pci driver is unable to initialize the hcd in
this case. Instead it will wait for 30 seconds and cause a timeout
in xhci_handshake() and fails.

[    5.116990] xhci_hcd 0000:45:00.0: new USB bus registered ...
[   32.335215] xhci_hcd 0000:45:00.0: can't setup: -110
[   32.340179] xhci_hcd 0000:45:00.0: USB bus 2 deregistered
[   32.345587] xhci_hcd 0000:45:00.0: init 0000:45:00.0 fail, -110
[   32.351496] xhci_hcd: probe of 0000:45:00.0 failed with error -110

Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci.c | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 724d0f567d98..65de5e961892 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -711,6 +711,55 @@ static int renesas_fw_download_to_hw(struct pci_dev *pdev,
 	return 1;
 }
 
+static int renesas_check_if_fw_dl_is_needed(struct pci_dev *pdev)
+{
+	int err;
+	u8 fw_state;
+
+	/*
+	 * Only the uPD720201K8-711-BAC-A or uPD720202K8-711-BAA-A
+	 * are listed in R19UH0078EJ0500 Rev.5.00 as devices which
+	 * need a firmware in order to work.
+	 *
+	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
+	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
+	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
+	 */
+	if (!((pdev->vendor == PCI_VENDOR_ID_RENESAS) &&
+	    ((pdev->device == 0x0015 && pdev->revision == 0x02) ||
+	    (pdev->device == 0x0014 &&
+	    (pdev->revision == 0x02 || pdev->revision == 0x03)))))
+		return 0;
+
+	/*
+	 * Test if the firmware was uploaded and is running.
+	 * As most BIOSes will initialize the device for us.
+	 */
+	err = pci_read_config_byte(pdev, 0xf4, &fw_state);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	/* Check the "Result Code" Bits (6:4) and act accordingly */
+	switch (fw_state & 0x70) {
+	case 0: /* No result yet */
+		dev_err(&pdev->dev, "FW is not ready/loaded yet.");
+		return -ENODEV;
+
+	case BIT(4): /* Success, device should be working. */
+		dev_dbg(&pdev->dev, "FW is ready.");
+		return 0;
+
+	case BIT(5): /* Error State */
+		dev_err(&pdev->dev, "HW is in an error state.");
+		return -ENODEV;
+
+	default: /* All other states are marked as "Reserved states" */
+		dev_err(&pdev->dev, "HW is in an invalid state (%x).",
+			(fw_state & 0x70) >> 4);
+		return -EINVAL;
+	}
+}
+
 /* called during probe() after chip reset completes */
 static int xhci_pci_setup(struct usb_hcd *hcd)
 {
@@ -765,6 +814,11 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return retval;
 	};
 
+	/* Check if this device is a RENESAS uPD720201/2 device. */
+	retval = renesas_check_if_fw_dl_is_needed(dev);
+	if (retval)
+		return retval;
+
 	driver = (struct hc_driver *)id->driver_data;
 
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
@@ -966,6 +1020,11 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
 		usb_enable_intel_xhci_ports(pdev);
 
+	/* Check if this device is a RENESAS uPD720201/2 device. */
+	retval = renesas_check_if_fw_dl_is_needed(pdev);
+	if (retval)
+		return retval;
+
 	if (xhci->quirks & XHCI_SSIC_PORT_UNUSED)
 		xhci_ssic_port_unused_quirk(hcd, false);
 
-- 
2.20.1

