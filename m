Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458B81D2F80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 14:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgENMVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 08:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgENMVF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 08:21:05 -0400
Received: from localhost.localdomain (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 239B620727;
        Thu, 14 May 2020 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589458863;
        bh=kSe2m6rbGI9X0LM++0tOgGrJ5jMUePaew8mE/VCPgBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u3QFuiVcE3iBfzt2BxISQFCAEu56h8dp3VH8k3P2R3gFNbTj9wbTMntPVifw9deDP
         VBA1VfrIRkB+K3QNhMXbAfdO0Nc+GmM2bUW22/SEjKzjoCxBCiYTMK2yTPiirKZHKV
         IaaDVg9o1xFjQCCZDnZB6DkFltVG9i9ezZ1+0IyM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH REPOST v13 2/4] usb: renesas-xhci: Add the renesas xhci driver
Date:   Thu, 14 May 2020 17:50:37 +0530
Message-Id: <20200514122039.300417-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200514122039.300417-1-vkoul@kernel.org>
References: <20200514122039.300417-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@googlemail.com>

This add a new driver for renesas xhci which is basically a firmware
loader for uPD720201 and uPD720202 w/o ROM. The xhci-pci driver will
invoke this driver for loading/unloading on relevant devices.

This patch adds a firmware loader for the uPD720201K8-711-BAC-A
and uPD720202K8-711-BAA-A variant. Both of these chips are listed
in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
devices which need the firmware loader on page 2 in order to
work as they "do not support the External ROM".

The "Firmware Download Sequence" is describe in chapter
"7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.

The firmware "K2013080.mem" is available from a USB3.0 Host to
PCIe Adapter (PP2U-E card) "Firmware download" archive. An
alternative version can be sourced from Netgear's WNDR4700 GPL
archives.

The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
(2012-06-15) state that the firmware is for the following devices:
 - uPD720201 ES 2.0 sample whose revision ID is 2.
 - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
 - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[vkoul: fixed comments:
	used macros for timeout count and delay
	removed renesas_fw_alive_check
	cleaned renesas_fw_callback
	removed recursion for renesas_fw_download
	add register defines and field names
	move to a separate file
	make fw loader as sync probe so that we execute in probe and
        prevent race
	make xhci-pci-renesas a seprate module]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/Kconfig            |   9 +
 drivers/usb/host/Makefile           |   1 +
 drivers/usb/host/xhci-pci-renesas.c | 365 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.h         |  28 +++
 4 files changed, 403 insertions(+)
 create mode 100644 drivers/usb/host/xhci-pci-renesas.c
 create mode 100644 drivers/usb/host/xhci-pci.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 55bdfdf11e4c..b5c542d6a1c5 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,15 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_RENESAS
+	tristate "Support for additional Renesas xHCI controller with firwmare"
+	depends on USB_XHCI_PCI
+	---help---
+	  Say 'Y' to enable the support for the Renesas xHCI controller with
+	  firwmare. Make sure you have the firwmare for the device and
+	  installed on your system for this device to work.
+	  If unsure, say 'N'.
+
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
 	select USB_XHCI_RCAR if ARCH_RENESAS
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index b191361257cc..f9a99187b436 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
 obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
 obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
+obj-$(CONFIG_USB_XHCI_PCI_RENESAS)	+= xhci-pci-renesas.o
 obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
 obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
 obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
new file mode 100644
index 000000000000..88341d79b651
--- /dev/null
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2019-2020 Linaro Limited */
+
+#include <linux/acpi.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/unaligned/access_ok.h>
+
+#include "xhci.h"
+#include "xhci-trace.h"
+#include "xhci-pci.h"
+
+#define RENESAS_FW_VERSION				0x6C
+#define RENESAS_ROM_CONFIG				0xF0
+#define RENESAS_FW_STATUS				0xF4
+#define RENESAS_FW_STATUS_MSB				0xF5
+#define RENESAS_ROM_STATUS				0xF6
+#define RENESAS_ROM_STATUS_MSB				0xF7
+#define RENESAS_DATA0					0xF8
+#define RENESAS_DATA1					0xFC
+
+#define RENESAS_FW_VERSION_FIELD			GENMASK(23, 7)
+#define RENESAS_FW_VERSION_OFFSET			8
+
+#define RENESAS_FW_STATUS_DOWNLOAD_ENABLE		BIT(0)
+#define RENESAS_FW_STATUS_LOCK				BIT(1)
+#define RENESAS_FW_STATUS_RESULT			GENMASK(6, 4)
+  #define RENESAS_FW_STATUS_INVALID			0
+  #define RENESAS_FW_STATUS_SUCCESS			BIT(4)
+  #define RENESAS_FW_STATUS_ERROR			BIT(5)
+#define RENESAS_FW_STATUS_SET_DATA0			BIT(8)
+#define RENESAS_FW_STATUS_SET_DATA1			BIT(9)
+
+#define RENESAS_ROM_STATUS_ACCESS			BIT(0)
+#define RENESAS_ROM_STATUS_ERASE			BIT(1)
+#define RENESAS_ROM_STATUS_RELOAD			BIT(2)
+#define RENESAS_ROM_STATUS_RESULT			GENMASK(6, 4)
+  #define RENESAS_ROM_STATUS_NO_RESULT			0
+  #define RENESAS_ROM_STATUS_SUCCESS			BIT(4)
+  #define RENESAS_ROM_STATUS_ERROR			BIT(5)
+#define RENESAS_ROM_STATUS_SET_DATA0			BIT(8)
+#define RENESAS_ROM_STATUS_SET_DATA1			BIT(9)
+#define RENESAS_ROM_STATUS_ROM_EXISTS			BIT(15)
+
+#define RENESAS_ROM_ERASE_MAGIC				0x5A65726F
+#define RENESAS_ROM_WRITE_MAGIC				0x53524F4D
+
+#define RENESAS_RETRY	10000
+#define RENESAS_DELAY	10
+
+static int renesas_fw_download_image(struct pci_dev *dev,
+				     const u32 *fw, size_t step)
+{
+	size_t i;
+	int err;
+	u8 fw_status;
+	bool data0_or_data1;
+
+	/*
+	 * The hardware does alternate between two 32-bit pages.
+	 * (This is because each row of the firmware is 8 bytes).
+	 *
+	 * for even steps we use DATA0, for odd steps DATA1.
+	 */
+	data0_or_data1 = (step & 1) == 1;
+
+	/* step+1. Read "Set DATAX" and confirm it is cleared. */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(dev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
+		if (err) {
+			dev_err(&dev->dev, "Read Status failed: %d\n",
+				pcibios_err_to_errno(err));
+			return pcibios_err_to_errno(err);
+		}
+		if (!(fw_status & BIT(data0_or_data1)))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		dev_err(&dev->dev, "Timeout for Set DATAX step: %zd\n", step);
+		return -ETIMEDOUT;
+	}
+
+	/*
+	 * step+2. Write FW data to "DATAX".
+	 * "LSB is left" => force little endian
+	 */
+	err = pci_write_config_dword(dev, data0_or_data1 ?
+				     RENESAS_DATA1 : RENESAS_DATA0,
+				     (__force u32)cpu_to_le32(fw[step]));
+	if (err) {
+		dev_err(&dev->dev, "Write to DATAX failed: %d\n",
+			pcibios_err_to_errno(err));
+		return pcibios_err_to_errno(err);
+	}
+
+	udelay(100);
+
+	/* step+3. Set "Set DATAX". */
+	err = pci_write_config_byte(dev, RENESAS_FW_STATUS_MSB,
+				    BIT(data0_or_data1));
+	if (err) {
+		dev_err(&dev->dev, "Write config for DATAX failed: %d\n",
+			pcibios_err_to_errno(err));
+		return pcibios_err_to_errno(err);
+	}
+
+	return 0;
+}
+
+static int renesas_fw_verify(const void *fw_data,
+			     size_t length)
+{
+	u16 fw_version_pointer;
+	u16 fw_version;
+
+	/*
+	 * The Firmware's Data Format is describe in
+	 * "6.3 Data Format" R19UH0078EJ0500 Rev.5.00 page 124
+	 */
+
+	/*
+	 * The bootrom chips of the big brother have sizes up to 64k, let's
+	 * assume that's the biggest the firmware can get.
+	 */
+	if (length < 0x1000 || length >= 0x10000) {
+		pr_err("firmware is size %zd is not (4k - 64k).",
+			length);
+		return -EINVAL;
+	}
+
+	/* The First 2 bytes are fixed value (55aa). "LSB on Left" */
+	if (get_unaligned_le16(fw_data) != 0x55aa) {
+		pr_err("no valid firmware header found.");
+		return -EINVAL;
+	}
+
+	/* verify the firmware version position and print it. */
+	fw_version_pointer = get_unaligned_le16(fw_data + 4);
+	if (fw_version_pointer + 2 >= length) {
+		pr_err("fw ver pointer is outside of the firmware image");
+		return -EINVAL;
+	}
+
+	fw_version = get_unaligned_le16(fw_data + fw_version_pointer);
+	pr_err("got firmware version: %02x.", fw_version);
+
+	return 0;
+}
+
+static int renesas_fw_check_running(struct pci_dev *pdev)
+{
+	int err;
+	u8 fw_state;
+
+	/*
+	 * Test if the device is actually needing the firmware. As most
+	 * BIOSes will initialize the device for us. If the device is
+	 * initialized.
+	 */
+	err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_state);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	/*
+	 * Check if "FW Download Lock" is locked. If it is and the FW is
+	 * ready we can simply continue. If the FW is not ready, we have
+	 * to give up.
+	 */
+	if (fw_state & RENESAS_FW_STATUS_LOCK) {
+		dev_dbg(&pdev->dev, "FW Download Lock is engaged.");
+
+		if (fw_state & RENESAS_FW_STATUS_SUCCESS)
+			return 0;
+
+		dev_err(&pdev->dev,
+			"FW Download Lock is set and FW is not ready. Giving Up.");
+		return -EIO;
+	}
+
+	/*
+	 * Check if "FW Download Enable" is set. If someone (us?) tampered
+	 * with it and it can't be reset, we have to give up too... and
+	 * ask for a forgiveness and a reboot.
+	 */
+	if (fw_state & RENESAS_FW_STATUS_DOWNLOAD_ENABLE) {
+		dev_err(&pdev->dev,
+			"FW Download Enable is stale. Giving Up (poweroff/reboot needed).");
+		return -EIO;
+	}
+
+	/* Otherwise, Check the "Result Code" Bits (6:4) and act accordingly */
+	switch (fw_state & RENESAS_FW_STATUS_RESULT) {
+	case 0: /* No result yet */
+		dev_dbg(&pdev->dev, "FW is not ready/loaded yet.");
+
+		/* tell the caller, that this device needs the firmware. */
+		return 1;
+
+	case RENESAS_FW_STATUS_SUCCESS: /* Success, device should be working. */
+		dev_dbg(&pdev->dev, "FW is ready.");
+		return 0;
+
+	case RENESAS_FW_STATUS_ERROR: /* Error State */
+		dev_err(&pdev->dev,
+			"hardware is in an error state. Giving up (poweroff/reboot needed).");
+		return -ENODEV;
+
+	default: /* All other states are marked as "Reserved states" */
+		dev_err(&pdev->dev,
+			"hardware is in an invalid state %lx. Giving up (poweroff/reboot needed).",
+			(fw_state & RENESAS_FW_STATUS_RESULT) >> 4);
+		return -EINVAL;
+	}
+}
+
+static int renesas_fw_download(struct pci_dev *pdev,
+			       const struct firmware *fw)
+{
+	const u32 *fw_data = (const u32 *)fw->data;
+	size_t i;
+	int err;
+	u8 fw_status;
+
+	/*
+	 * For more information and the big picture: please look at the
+	 * "Firmware Download Sequence" in "7.1 FW Download Interface"
+	 * of R19UH0078EJ0500 Rev.5.00 page 131
+	 */
+
+	/*
+	 * 0. Set "FW Download Enable" bit in the
+	 * "FW Download Control & Status Register" at 0xF4
+	 */
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS,
+				    RENESAS_FW_STATUS_DOWNLOAD_ENABLE);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	/* 1 - 10 follow one step after the other. */
+	for (i = 0; i < fw->size / 4; i++) {
+		err = renesas_fw_download_image(pdev, fw_data, i);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Firmware Download Step %zd failed at position %zd bytes with (%d).",
+				i, i * 4, err);
+			return err;
+		}
+	}
+
+	/*
+	 * This sequence continues until the last data is written to
+	 * "DATA0" or "DATA1". Naturally, we wait until "SET DATA0/1"
+	 * is cleared by the hardware beforehand.
+	 */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
+		if (err)
+			return pcibios_err_to_errno(err);
+		if (!(fw_status & (BIT(0) | BIT(1))))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY)
+		dev_warn(&pdev->dev, "Final Firmware Download step timed out.");
+
+	/*
+	 * 11. After finishing writing the last data of FW, the
+	 * System Software must clear "FW Download Enable"
+	 */
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS, 0);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	/* 12. Read "Result Code" and confirm it is good. */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_status);
+		if (err)
+			return pcibios_err_to_errno(err);
+		if (fw_status & RENESAS_FW_STATUS_SUCCESS)
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		/* Timed out / Error - let's see if we can fix this */
+		err = renesas_fw_check_running(pdev);
+		switch (err) {
+		case 0: /*
+			 * we shouldn't end up here.
+			 * maybe it took a little bit longer.
+			 * But all should be well?
+			 */
+			break;
+
+		case 1: /* (No result yet! */
+			dev_err(&pdev->dev, "FW Load timedout");
+			return -ETIMEDOUT;
+
+		default:
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int renesas_load_fw(struct pci_dev *pdev, const struct firmware *fw)
+{
+	int err = 0;
+
+	err = renesas_fw_download(pdev, fw);
+	if (err)
+		dev_err(&pdev->dev, "firmware failed to download (%d).", err);
+	return err;
+}
+
+int renesas_xhci_check_request_fw(struct pci_dev *pdev,
+				  const struct pci_device_id *id)
+{
+	struct xhci_driver_data *driver_data =
+			(struct xhci_driver_data *)id->driver_data;
+	const char *fw_name = driver_data->firmware;
+	const struct firmware *fw;
+	int err;
+
+	err = renesas_fw_check_running(pdev);
+	/* Continue ahead, if the firmware is already running. */
+	if (err == 0)
+		return 0;
+
+	if (err != 1)
+		return err;
+
+	pci_dev_get(pdev);
+	err = request_firmware(&fw, fw_name, &pdev->dev);
+	pci_dev_put(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "request_firmware failed: %d\n", err);
+		return err;
+	}
+
+	err = renesas_fw_verify(fw->data, fw->size);
+	if (err)
+		goto exit;
+
+	err = renesas_load_fw(pdev, fw);
+exit:
+	release_firmware(fw);
+	return err;
+}
+EXPORT_SYMBOL_GPL(renesas_xhci_check_request_fw);
+
+void renesas_xhci_pci_exit(struct pci_dev *dev)
+{
+}
+EXPORT_SYMBOL_GPL(renesas_xhci_pci_exit);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
new file mode 100644
index 000000000000..4d749556e350
--- /dev/null
+++ b/drivers/usb/host/xhci-pci.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019-2020 Linaro Limited */
+
+#ifndef XHCI_PCI_H
+#define XHCI_PCI_H
+
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
+int renesas_xhci_check_request_fw(struct pci_dev *dev,
+				  const struct pci_device_id *id);
+void renesas_xhci_pci_exit(struct pci_dev *dev);
+
+#else
+int renesas_xhci_check_request_fw(struct pci_dev *dev,
+				  const struct pci_device_id *id)
+{
+	return 0;
+}
+
+void renesas_xhci_pci_exit(struct pci_dev *dev) { };
+
+#endif
+
+struct xhci_driver_data {
+	u64 quirks;
+	const char *firmware;
+};
+
+#endif
-- 
2.25.4

