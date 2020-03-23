Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE1A18FADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 18:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgCWRGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 13:06:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgCWRGx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 13:06:53 -0400
Received: from localhost.localdomain (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 540C02074D;
        Mon, 23 Mar 2020 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584983211;
        bh=qjXwkqqbN+8/1E2c6utWOF4qu9RYE0z4FtSEG4xHfmI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cp8Htf9Aos4a4ej+NgmOi3yoB1LKs4q6Om9m7hg/D1RLHeh+U/nfbM/YbL7zyQ5Ij
         /2Numg1Lx+G1iyaDkumfNMQjXoz7Ucn8B6M6OeqHrXOyhiec5OtcUHwrLmI2ectjWh
         9DGyAC+MgWQ9dfVzt+BmTzcTojeKGcV9wc7hqjIM=
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
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8 2/5] usb: renesas-xhci: Add the renesas xhci driver
Date:   Mon, 23 Mar 2020 22:35:58 +0530
Message-Id: <20200323170601.419809-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323170601.419809-1-vkoul@kernel.org>
References: <20200323170601.419809-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@googlemail.com>

This add a new driver for renesas xhci which is basically a firmware
loader for uPD720201 and uPD720202 w/o ROM. It uses xhci-pci driver for
most of the work.

This is added in Makefile before the xhci-pci driver so that it first
get probed for renesas devices before the xhci-pci driver has a chance
to claim any device.

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

Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[vkoul: fixed comments:
	used macros for timeout count and delay
	removed renesas_fw_alive_check
	cleaned renesas_fw_callback
	removed recursion for renesas_fw_download
	add register defines and field names
	move to a separate file]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/Makefile           |   3 +-
 drivers/usb/host/xhci-pci-renesas.c | 431 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.h         |  11 +
 3 files changed, 444 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/host/xhci-pci-renesas.c
 create mode 100644 drivers/usb/host/xhci-pci.h

diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index b191361257cc..c3a79f626393 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -70,7 +70,8 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
 obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
 obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
-obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
+usb-xhci-pci-objs		:= xhci-pci.o xhci-pci-renesas.o
+obj-$(CONFIG_USB_XHCI_PCI)	+= usb-xhci-pci.o
 obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
 obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
 obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
new file mode 100644
index 000000000000..c588277ac9b8
--- /dev/null
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -0,0 +1,431 @@
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
+				     const u32 *fw,
+				     size_t step)
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
+		if (err)
+			return pcibios_err_to_errno(err);
+		if (!(fw_status & BIT(data0_or_data1)))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		dev_err(&dev->dev, "FW Load timedout");
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
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	udelay(100);
+
+	/* step+3. Set "Set DATAX". */
+	err = pci_write_config_byte(dev, RENESAS_FW_STATUS_MSB,
+				    BIT(data0_or_data1));
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	return 0;
+}
+
+static int renesas_fw_verify(struct pci_dev *dev,
+			     const void *fw_data,
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
+		dev_err(&dev->dev, "firmware is size %zd is not (4k - 64k).",
+			length);
+		return -EINVAL;
+	}
+
+	/* The First 2 bytes are fixed value (55aa). "LSB on Left" */
+	if (get_unaligned_le16(fw_data) != 0x55aa) {
+		dev_err(&dev->dev, "no valid firmware header found.");
+		return -EINVAL;
+	}
+
+	/* verify the firmware version position and print it. */
+	fw_version_pointer = get_unaligned_le16(fw_data + 4);
+	if (fw_version_pointer + 2 >= length) {
+		dev_err(&dev->dev,
+			"firmware version pointer is outside of the firmware image.");
+		return -EINVAL;
+	}
+
+	fw_version = get_unaligned_le16(fw_data + fw_version_pointer);
+	dev_dbg(&dev->dev, "got firmware version: %02x.", fw_version);
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
+struct renesas_fw_ctx {
+	struct pci_dev *pdev;
+	const struct pci_device_id *id;
+	bool resume;
+	const struct renesas_fw_entry *entry;
+};
+
+static void renesas_fw_callback(const struct firmware *fw,
+				void *context)
+{
+	struct renesas_fw_ctx *ctx = context;
+	struct pci_dev *pdev = ctx->pdev;
+	struct device *parent = pdev->dev.parent;
+	int err;
+
+	if (!fw) {
+		dev_err(&pdev->dev, "firmware failed to load\n");
+		goto cleanup;
+	}
+
+	err = renesas_fw_verify(pdev, fw->data, fw->size);
+	if (err)
+		goto cleanup;
+
+	err = renesas_fw_download(pdev, fw);
+	release_firmware(fw);
+	if (err) {
+		dev_err(&pdev->dev, "firmware failed to download (%d).", err);
+		goto cleanup;
+	}
+
+	return;
+
+cleanup:
+	/* in case of an error - fall through */
+	dev_info(&pdev->dev, "Unloading driver");
+
+	if (parent)
+		device_lock(parent);
+
+	device_release_driver(&pdev->dev);
+
+	if (parent)
+		device_unlock(parent);
+
+	pci_dev_put(pdev);
+}
+
+static int renesas_fw_download_to_hw(struct pci_dev *pdev,
+				     const struct pci_device_id *id)
+{
+	struct renesas_fw_ctx *ctx;
+	char *fw_name = (char *)id->driver_data;
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
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->pdev = pdev;
+	ctx->id = id;
+
+	pci_dev_get(pdev);
+	err = request_firmware_nowait(THIS_MODULE, 1, fw_name,
+				      &pdev->dev, GFP_KERNEL,
+				      ctx, renesas_fw_callback);
+	if (err) {
+		dev_err(&pdev->dev, "request_firmware failed: %d\n", err);
+		pci_dev_put(pdev);
+		return err;
+	}
+
+	/*
+	 * The renesas_fw_callback() callback will continue the probe
+	 * process, once it acquires the firmware.
+	 */
+	return 1;
+}
+
+int renesas_xhci_pci_probe(struct pci_dev *dev,
+			   const struct pci_device_id *id)
+{
+	int retval;
+
+	/*
+	 * Check if this device is a RENESAS uPD720201/2 device.
+	 * Otherwise, we can continue with xhci_pci_probe as usual.
+	 */
+	retval = renesas_fw_download_to_hw(dev, id);
+	switch (retval) {
+	case 0:
+		break;
+
+	case 1: /* let it load the firmware and recontinue the probe. */
+		retval = 1;
+		break;
+
+	default:
+		break;
+	};
+
+	return retval;
+}
+
+int renesas_xhci_pci_remove(struct pci_dev *dev)
+{
+	if (renesas_fw_check_running(dev)) {
+		/*
+		 * bail out early, if this was a renesas device w/o FW.
+		 * Else we might hit the NMI watchdog in xhci_handsake
+		 * during xhci_reset as part of the driver's unloading.
+		 * which we forced in the renesas_fw_callback().
+		 */
+		return -EIO;
+	}
+	return 0;
+}
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
new file mode 100644
index 000000000000..092909dd85a0
--- /dev/null
+++ b/drivers/usb/host/xhci-pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019-2020 Linaro Limited */
+
+#ifndef XHCI_PCI_H
+#define XHCI_PCI_H
+
+int renesas_xhci_pci_probe(struct pci_dev *dev,
+			   const struct pci_device_id *id);
+int renesas_xhci_pci_remove(struct pci_dev *dev);
+#endif
+
-- 
2.25.1

