Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C304CBC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 12:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbfFTKZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 06:25:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbfFTKZ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 06:25:27 -0400
Received: from localhost.localdomain (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08171206BA;
        Thu, 20 Jun 2019 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561026326;
        bh=2fqzrfsRBQ8KnKJ/swh/DnGQFYUFATDpDON4Zvhh24I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wW7vweI93EYNRGxqkhxRulUSB8M5NCLdI9twUKZLBurQ5dKirzopiOISVh0vtcck6
         9CEH93JgGPHvHJ2KJXo8ycdAhBmyxVLjxLUzNKyBVleMRqibRYuM8NehaESxdkOWIg
         M5b+uKKNGkyf46wlD2ONeU5WkQHH4mIAA5OK+rdY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH 3/5] usb: xhci: Use register defined and field names
Date:   Thu, 20 Jun 2019 15:51:52 +0530
Message-Id: <20190620102154.20805-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620102154.20805-1-vkoul@kernel.org>
References: <20190620102154.20805-1-vkoul@kernel.org>
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
index 38a56128c1ee..a9497c6e3568 100644
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
 static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
@@ -342,7 +363,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 
 	/* step+1. Read "Set DATAX" and confirm it is cleared. */
 	for (i = 0; i < 10000; i++) {
-		err = pci_read_config_byte(dev, 0xF5, &fw_status);
+		err = pci_read_config_byte(dev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
 		if (!(fw_status & BIT(data0_or_data1)))
@@ -357,7 +379,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 	 * step+2. Write FW data to "DATAX".
 	 * "LSB is left" => force little endian
 	 */
-	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
+	err = pci_write_config_dword(dev, data0_or_data1 ?
+				     RENESAS_DATA1 : RENESAS_DATA0,
 				     (__force u32) cpu_to_le32(fw[step]));
 	if (err)
 		return pcibios_err_to_errno(err);
@@ -365,7 +388,8 @@ static int renesas_fw_download_image(struct pci_dev *dev,
 	udelay(100);
 
 	/* step+3. Set "Set DATAX". */
-	err = pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
+	err = pci_write_config_byte(dev, RENESAS_FW_STATUS_MSB,
+				    BIT(data0_or_data1));
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -439,7 +463,7 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * BIOSes will initialize the device for us. If the device is
 	 * initialized.
 	 */
-	err = pci_read_config_byte(pdev, 0xF4, &fw_state);
+	err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_state);
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -448,10 +472,10 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * ready we can simply continue. If the FW is not ready, we have
 	 * to give up.
 	 */
-	if (fw_state & BIT(1)) {
+	if (fw_state & RENESAS_FW_STATUS_LOCK) {
 		dev_dbg(&pdev->dev, "FW Download Lock is engaged.");
 
-		if (fw_state & BIT(4))
+		if (fw_state & RENESAS_FW_STATUS_SUCCESS)
 			return 0;
 
 		dev_err(&pdev->dev, "FW Download Lock is set and FW is not ready. Giving Up.");
@@ -463,30 +487,30 @@ static int renesas_fw_check_running(struct pci_dev *pdev)
 	 * with it and it can't be resetted, we have to give up too... and
 	 * ask for a forgiveness and a reboot.
 	 */
-	if (fw_state & BIT(0)) {
+	if (fw_state & RENESAS_FW_STATUS_DOWNLOAD_ENABLE) {
 		dev_err(&pdev->dev, "FW Download Enable is stale. Giving Up (poweroff/reboot needed).");
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
 		dev_err(&pdev->dev, "hardware is in an error state. Giving up (poweroff/reboot needed).");
 		return -ENODEV;
 
 	default: /* All other states are marked as "Reserved states" */
-		dev_err(&pdev->dev, "hardware is in an invalid state %x. Giving up (poweroff/reboot needed).",
-			(fw_state & 0x70) >> 4);
+		dev_err(&pdev->dev, "hardware is in an invalid state %lx. Giving up (poweroff/reboot needed).",
+			(fw_state & RENESAS_FW_STATUS_RESULT) >> 4);
 		return -EINVAL;
 	}
 }
@@ -530,7 +554,8 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * 0. Set "FW Download Enable" bit in the
 	 * "FW Download Control & Status Register" at 0xF4
 	 */
-	err = pci_write_config_byte(pdev, 0xF4, BIT(0));
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS,
+				    RENESAS_FW_STATUS_DOWNLOAD_ENABLE);
 	if (err)
 		return pcibios_err_to_errno(err);
 
@@ -550,7 +575,8 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * is cleared by the hardware beforehand.
 	 */
 	for (i = 0; i < 10000; i++) {
-		err = pci_read_config_byte(pdev, 0xF5, &fw_status);
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS_MSB,
+					   &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
 		if (!(fw_status & (BIT(0) | BIT(1))))
@@ -565,16 +591,16 @@ static int renesas_fw_download(struct pci_dev *pdev,
 	 * 11. After finishing writing the last data of FW, the
 	 * System Software must clear "FW Download Enable"
 	 */
-	err = pci_write_config_byte(pdev, 0xF4, 0);
+	err = pci_write_config_byte(pdev, RENESAS_FW_STATUS, 0);
 	if (err)
 		return pcibios_err_to_errno(err);
 
 	/* 12. Read "Result Code" and confirm it is good. */
 	for (i = 0; i < 10000; i++) {
-		err = pci_read_config_byte(pdev, 0xF4, &fw_status);
+		err = pci_read_config_byte(pdev, RENESAS_FW_STATUS, &fw_status);
 		if (err)
 			return pcibios_err_to_errno(err);
-		if (fw_status & BIT(4))
+		if (fw_status & RENESAS_FW_STATUS_SUCCESS)
 			break;
 
 		udelay(1);
@@ -757,21 +783,21 @@ static int renesas_check_if_fw_dl_is_needed(struct pci_dev *pdev)
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

