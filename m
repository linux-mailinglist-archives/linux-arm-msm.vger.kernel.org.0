Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC834E293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 11:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfFUJCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 05:02:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFUJCo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 05:02:44 -0400
Received: from localhost.localdomain (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A27921655;
        Fri, 21 Jun 2019 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561107763;
        bh=AJ5YZZ7aNGQ26uRq7wkeWcROpCQIPAFYNskq21f0tBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oGDMN3Bp/H4T/y/JaHLy+JTYzG1C6kMrnVt/KZz9zQ9FO27lZHHpxWxSoH/nKJhlM
         X3sQ5bi5R5yLZbJHeghcKBqkd/SoYKcHi4uEO3od7oPEWkVpJYMaK645uM9lEmElLb
         h9H48TuLKrdYmydT47eYT26ZOUZ0X3WVQ0nOGsmo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] usb: xhci: Use register defined and field names
Date:   Fri, 21 Jun 2019 14:29:11 +0530
Message-Id: <20190621085913.8722-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621085913.8722-1-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of using register values and fields lets define them and
use in the driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/usb/host/xhci-pci.c | 68 +++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 65de5e961892..d9081fe7ed6c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -57,6 +57,27 @@
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
 
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
 #define RENESAS_RETRY	1000
 #define RENESAS_DELAY	10
 
@@ -347,7 +368,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 
 	/* step+1. Read "Set DATAX" and confirm it is cleared. */
 	for (i = 0; i < RENESAS_RETRY; i++) {
-		err = pci_read_config_byte(dev, 0xF5, &fw_status);
+		err = pci_read_config_byte(dev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
 		if (!(fw_status & BIT(data0_or_data1)))
@@ -362,7 +384,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 	 * step+2. Write FW data to "DATAX".
 	 * "LSB is left" => force little endian
 	 */
-	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
+	err = pci_write_config_dword(dev, data0_or_data1 ?
+				     RENESAS_DATA1 : RENESAS_DATA0,
 				     (__force u32)cpu_to_le32(fw[step]));
 	if (err)
 		return pcibios_err_to_errno(err);
@@ -370,7 +393,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 	udelay(100);
 
 	/* step+3. Set "Set DATAX". */
-	err = pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
+	err = pci_write_config_byte(dev, RENESAS_FW_STATUS_MSB,
+				    BIT(data0_or_data1));
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -444,7 +468,7 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * BIOSes will initialize the device for us. If the device is
 	 * initialized.
 	 */
-	err = pci_read_config_byte(pdev, 0xF4, &fw_state);
+	err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_state);
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -453,10 +477,10 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * ready we can simply continue. If the FW is not ready, we have
 	 * to give up.
 	 */
-	if (fw_state & BIT(1)) {
+	if (fw_state & RENESAS_FW_STATUS_LOCK) {
 		dev_dbg(&pdev->dev, "FW Download Lock is engaged.");
 
-		if (fw_state & BIT(4))
+		if (fw_state & RENESAS_FW_STATUS_SUCCESS)
 			return 0;
 
 		dev_err(&pdev->dev,
@@ -469,33 +493,33 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * with it and it can't be resetted, we have to give up too... and
 	 * ask for a forgiveness and a reboot.
 	 */
-	if (fw_state & BIT(0)) {
+	if (fw_state & RENESAS_FW_STATUS_DOWNLOAD_ENABLE) {
 		dev_err(&pdev->dev,
 			"FW Download Enable is stale. Giving Up (poweroff/reboot needed).");
 		return -EIO;
 	}
 
 	/* Otherwise, Check the "Result Code" Bits (6:4) and act accordingly */
-	switch ((fw_state & 0x70)) {
+	switch (fw_state & RENESAS_FW_STATUS_RESULT) {
 	case 0: /* No result yet */
 		dev_dbg(&pdev->dev, "FW is not ready/loaded yet.");
 
 		/* tell the caller, that this device needs the firmware. */
 		return 1;
 
-	case BIT(4): /* Success, device should be working. */
+	case RENESAS_FW_STATUS_SUCCESS: /* Success, device should be working. */
 		dev_dbg(&pdev->dev, "FW is ready.");
 		return 0;
 
-	case BIT(5): /* Error State */
+	case RENESAS_FW_STATUS_ERROR: /* Error State */
 		dev_err(&pdev->dev,
 			"hardware is in an error state. Giving up (poweroff/reboot needed).");
 		return -ENODEV;
 
 	default: /* All other states are marked as "Reserved states" */
 		dev_err(&pdev->dev,
-			"hardware is in an invalid state %x. Giving up (poweroff/reboot needed).",
-			(fw_state & 0x70) >> 4);
+			"hardware is in an invalid state %lx. Giving up (poweroff/reboot needed).",
+			(fw_state & RENESAS_FW_STATUS_RESULT) >> 4);
 		return -EINVAL;
 	}
 }
@@ -518,7 +542,8 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * 0. Set "FW Download Enable" bit in the
 	 * "FW Download Control & Status Register" at 0xF4
 	 */
-	err = pci_write_config_byte(pdev, 0xF4, BIT(0));
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS,
+				    RENESAS_FW_STATUS_DOWNLOAD_ENABLE);
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -539,7 +564,8 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * is cleared by the hardware beforehand.
 	 */
 	for (i = 0; i < RENESAS_RETRY; i++) {
-		err = pci_read_config_byte(pdev, 0xF5, &fw_status);
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
 		if (!(fw_status & (BIT(0) | BIT(1))))
@@ -554,16 +580,16 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * 11. After finishing writing the last data of FW, the
 	 * System Software must clear "FW Download Enable"
 	 */
-	err = pci_write_config_byte(pdev, 0xF4, 0);
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS, 0);
 	if (err)
 		return pcibios_err_to_errno(err);
 
 	/* 12. Read "Result Code" and confirm it is good. */
 	for (i = 0; i < RENESAS_RETRY; i++) {
-		err = pci_read_config_byte(pdev, 0xF4, &fw_status);
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
-		if (fw_status & BIT(4))
+		if (fw_status & RENESAS_FW_STATUS_SUCCESS)
 			break;
 
 		udelay(RENESAS_DELAY);
@@ -735,21 +761,21 @@ static int renesas_check_if_fw_dl_is_needed(struct pci_dev *pdev)
 	 * Test if the firmware was uploaded and is running.
 	 * As most BIOSes will initialize the device for us.
 	 */
-	err = pci_read_config_byte(pdev, 0xf4, &fw_state);
+	err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_state);
 	if (err)
 		return pcibios_err_to_errno(err);
 
 	/* Check the "Result Code" Bits (6:4) and act accordingly */
-	switch (fw_state & 0x70) {
+	switch (fw_state & RENESAS_FW_STATUS_RESULT) {
 	case 0: /* No result yet */
 		dev_err(&pdev->dev, "FW is not ready/loaded yet.");
 		return -ENODEV;
 
-	case BIT(4): /* Success, device should be working. */
+	case RENESAS_FW_STATUS_SUCCESS:
 		dev_dbg(&pdev->dev, "FW is ready.");
 		return 0;
 
-	case BIT(5): /* Error State */
+	case RENESAS_FW_STATUS_ERROR:
 		dev_err(&pdev->dev, "HW is in an error state.");
 		return -ENODEV;
 
-- 
2.20.1

