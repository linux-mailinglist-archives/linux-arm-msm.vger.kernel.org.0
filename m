Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279ED138D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 09:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgAMIkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 03:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:43344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbgAMIke (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 03:40:34 -0500
Received: from localhost.localdomain (unknown [106.200.247.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1E16207FF;
        Mon, 13 Jan 2020 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578904834;
        bh=kH0WLcveNENEJBOZHvRBUYMIxE8tSH1QdU5tPNFvPiU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q2kZtkh1z5GF7cPYuUI8KKp7kLnSbjKUuO25hqPTgWTz9N4rTNM/VW7A5JaLiGAw3
         e9IXp6wqfarZXEe+ZaYJGSB4NYsnYekVbWUwL4tR72hSdg1OCbtcjgAE8Nx9WiLcmM
         SJ9FEgLgEohgB80KVch1aMEWgK3SikW/jj8vEOh8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] usb: renesas-xhci: Add ROM loader for uPD720201
Date:   Mon, 13 Jan 2020 14:10:03 +0530
Message-Id: <20200113084005.849071-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113084005.849071-1-vkoul@kernel.org>
References: <20200113084005.849071-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

uPD720201 supports ROM and allows software to program the ROM and boot
from it. Add support for detecting if ROM is present, if so load the ROM
if not programmed earlier.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/usb/host/xhci-pci-renesas.c | 352 ++++++++++++++++++++++++++++
 1 file changed, 352 insertions(+)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 110c914ea7ef..1d073c5637c4 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -33,6 +33,20 @@
 #define RENESAS_FW_STATUS_SET_DATA0			BIT(8)
 #define RENESAS_FW_STATUS_SET_DATA1			BIT(9)
 
+#define RENESAS_ROM_STATUS_ACCESS			BIT(0)
+#define RENESAS_ROM_STATUS_ERASE			BIT(1)
+#define RENESAS_ROM_STATUS_RELOAD			BIT(2)
+#define RENESAS_ROM_STATUS_RESULT			GENMASK(6, 4)
+  #define RENESAS_ROM_STATUS_INVALID			0
+  #define RENESAS_ROM_STATUS_SUCCESS			BIT(4)
+  #define RENESAS_ROM_STATUS_ERROR			BIT(5)
+#define RENESAS_ROM_STATUS_SET_DATA0			BIT(8)
+#define RENESAS_ROM_STATUS_SET_DATA1			BIT(9)
+#define RENESAS_ROM_STATUS_ROM_EXISTS			BIT(15)
+
+#define RENESAS_ROM_ERASE_MAGIC				0x5A65726F
+#define RENESAS_ROM_WRITE_MAGIC				0x53524F4D
+
 #define RENESAS_RETRY	10000
 #define RENESAS_DELAY	10
 
@@ -190,12 +204,81 @@ static int renesas_fw_verify(struct pci_dev *dev,
 
 	return 0;
 }
+static int renesas_check_rom_state(struct pci_dev *pdev)
+{
+	const struct renesas_fw_entry *entry;
+	u16 rom_state;
+	u32 version;
+	bool valid_version = false;
+	int err, i;
+
+	/* check FW version */
+	err = pci_read_config_dword(pdev, RENESAS_FW_VERSION, &version);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	version &= RENESAS_FW_VERSION_FIELD;
+	version = version >> RENESAS_FW_VERSION_OFFSET;
+	dev_dbg(&pdev->dev, "Found FW version loaded is %x\n", version);
+
+	/* treat version in renesas_fw_table as correct ones */
+	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
+		entry = &renesas_fw_table[i];
+		if (version == entry->expected_version) {
+			dev_dbg(&pdev->dev, "Detected valid ROM version..\n");
+			valid_version = true;
+		}
+	}
+	if (valid_version == false)
+		dev_dbg(&pdev->dev, "Didn't find valid ROM version\n");
+
+	/*
+	 * Test if ROM is present and loaded, if so we can skip everything
+	 */
+	err = pci_read_config_word(pdev, RENESAS_ROM_STATUS, &rom_state);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	if (rom_state & BIT(15)) {
+		/* ROM exists */
+		dev_dbg(&pdev->dev, "ROM exists\n");
+
+		/* Check the "Result Code" Bits (6:4) and act accordingly */
+		switch (rom_state & RENESAS_ROM_STATUS_RESULT) {
+		case RENESAS_ROM_STATUS_SUCCESS:
+			dev_dbg(&pdev->dev, "Success ROM load...");
+			/* we have valid version and status so success */
+			if (valid_version)
+				return 0;
+			break;
+
+		case RENESAS_ROM_STATUS_INVALID: /* No result yet */
+			dev_dbg(&pdev->dev, "No result as it is ROM...");
+			/* we have valid version and status so success */
+			if (valid_version)
+				return 0;
+			break;
+
+		case RENESAS_ROM_STATUS_ERROR: /* Error State */
+		default: /* All other states are marked as "Reserved states" */
+			dev_err(&pdev->dev, "Invalid ROM..");
+			break;
+		}
+	}
+
+	return -EIO;
+}
 
 static int renesas_fw_check_running(struct pci_dev *pdev)
 {
 	int err;
 	u8 fw_state;
 
+	/* Check if device has ROM and loaded, if so skip everything */
+	err = renesas_check_rom_state(pdev);
+	if (!err)
+		return err;
+
 	/*
 	 * Test if the device is actually needing the firmware. As most
 	 * BIOSes will initialize the device for us. If the device is
@@ -363,12 +446,261 @@ struct renesas_fw_ctx {
 	const struct renesas_fw_entry *entry;
 };
 
+static bool renesas_check_rom(struct pci_dev *pdev)
+{
+	u16 rom_status;
+	int retval;
+
+	/* 1. Check if external ROM exists */
+	retval = pci_read_config_word(pdev, RENESAS_ROM_STATUS, &rom_status);
+	if (retval)
+		return false;
+
+	rom_status &= RENESAS_ROM_STATUS_ROM_EXISTS;
+	if (rom_status) {
+		dev_dbg(&pdev->dev, "External ROM exists\n");
+		return true; /* External ROM exists */
+	}
+
+	return false;
+}
+
+static void renesas_rom_erase(struct pci_dev *pdev)
+{
+	int retval, i;
+	u8 status;
+
+	dev_dbg(&pdev->dev, "Performing ROM Erase...\n");
+	retval = pci_write_config_dword(pdev, RENESAS_DATA0,
+					RENESAS_ROM_ERASE_MAGIC);
+	if (retval) {
+		dev_err(&pdev->dev, "ROM erase, magic word write failed: %d\n",
+			pcibios_err_to_errno(retval));
+		return;
+	}
+
+	retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS, &status);
+	if (retval) {
+		dev_err(&pdev->dev, "ROM status read failed: %d\n",
+			pcibios_err_to_errno(retval));
+		return;
+	}
+	status |= RENESAS_ROM_STATUS_ERASE;
+	retval = pci_write_config_byte(pdev, RENESAS_ROM_STATUS, status);
+	if (retval) {
+		dev_err(&pdev->dev, "ROM erase set word write failed\n");
+		return;
+	}
+
+	/* sleep a bit while ROM is erased */
+	msleep(20);
+
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
+					      &status);
+		status &= RENESAS_ROM_STATUS_ERASE;
+		if (!status)
+			break;
+
+		mdelay(RENESAS_DELAY);
+	}
+
+	if (i == RENESAS_RETRY)
+		dev_dbg(&pdev->dev, "Chip erase timedout: %x\n", status);
+
+	dev_dbg(&pdev->dev, "ROM Erase... Done success\n");
+}
+
+static bool renesas_download_rom(struct pci_dev *pdev,
+				 const u32 *fw, size_t step)
+{
+	bool data0_or_data1;
+	u8 fw_status;
+	size_t i;
+	int err;
+
+	/*
+	 * The hardware does alternate between two 32-bit pages.
+	 * (This is because each row of the firmware is 8 bytes).
+	 *
+	 * for even steps we use DATA0, for odd steps DATA1.
+	 */
+	data0_or_data1 = (step & 1) == 1;
+
+	/* Read "Set DATAX" and confirm it is cleared. */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
+					   &fw_status);
+		if (err) {
+			dev_err(&pdev->dev, "Read ROM Status failed: %d\n",
+				pcibios_err_to_errno(err));
+			return false;
+		}
+		if (!(fw_status & BIT(data0_or_data1)))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		dev_err(&pdev->dev, "Timeout for Set DATAX step: %zd\n", step);
+		return false;
+	}
+
+	/*
+	 * Write FW data to "DATAX".
+	 * "LSB is left" => force little endian
+	 */
+	err = pci_write_config_dword(pdev, data0_or_data1 ?
+				     RENESAS_DATA1 : RENESAS_DATA0,
+				     (__force u32)cpu_to_le32(fw[step]));
+	if (err) {
+		dev_err(&pdev->dev, "Write to DATAX failed: %d\n",
+			pcibios_err_to_errno(err));
+		return false;
+	}
+
+	udelay(100);
+
+	/* Set "Set DATAX". */
+	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
+				    BIT(data0_or_data1));
+	if (err) {
+		dev_err(&pdev->dev, "Write config for DATAX failed: %d\n",
+			pcibios_err_to_errno(err));
+		return false;
+	}
+
+	return true;
+}
+
+static bool renesas_setup_rom(struct pci_dev *pdev, const struct firmware *fw)
+{
+	const u32 *fw_data = (const u32 *)fw->data;
+	int err, i;
+	u8 status;
+
+	/* 2. Write magic word to Data0 */
+	err = pci_write_config_dword(pdev, RENESAS_DATA0,
+				     RENESAS_ROM_WRITE_MAGIC);
+	if (err)
+		return false;
+
+	/* 3. Set External ROM access */
+	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS,
+				    RENESAS_ROM_STATUS_ACCESS);
+	if (err)
+		goto remove_bypass;
+
+	/* 4. Check the result */
+	err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS, &status);
+	if (err)
+		goto remove_bypass;
+	status &= GENMASK(6, 4);
+	if (status) {
+		dev_err(&pdev->dev,
+			"setting external rom failed: %x\n", status);
+		goto remove_bypass;
+	}
+
+	/* 5 to 16 Write FW to DATA0/1 while checking SetData0/1 */
+	for (i = 0; i < fw->size / 4; i++) {
+		err = renesas_download_rom(pdev, fw_data, i);
+		if (!err) {
+			dev_err(&pdev->dev,
+				"ROM Download Step %d failed at position %d bytes\n",
+				 i, i * 4);
+			goto remove_bypass;
+		}
+	}
+
+	/*
+	 * wait till DATA0/1 is cleared
+	 */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
+					   &status);
+		if (err)
+			goto remove_bypass;
+		if (!(status & (BIT(0) | BIT(1))))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		dev_err(&pdev->dev, "Final Firmware ROM Download step timed out\n");
+		goto remove_bypass;
+	}
+
+	/* 17. Remove bypass */
+	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS, 0);
+	if (err)
+		return false;
+
+	udelay(10);
+
+	/* 18. check result */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS, &status);
+		if (err) {
+			dev_err(&pdev->dev, "Read ROM status failed:%d\n",
+				pcibios_err_to_errno(err));
+			return false;
+		}
+		status &= RENESAS_ROM_STATUS_RESULT;
+		if (status ==  RENESAS_ROM_STATUS_SUCCESS) {
+			dev_dbg(&pdev->dev, "Download ROM success\n");
+			break;
+		}
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) { /* Timed out */
+		dev_err(&pdev->dev,
+			"Download to external ROM TO: %x\n", status);
+		return false;
+	}
+
+	dev_dbg(&pdev->dev, "Download to external ROM scuceeded\n");
+
+	/* Last step set Reload */
+	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS,
+				    RENESAS_ROM_STATUS_RELOAD);
+	if (err) {
+		dev_err(&pdev->dev, "Set ROM execute failed: %d\n",
+			pcibios_err_to_errno(err));
+		return false;
+	}
+
+	/*
+	 * wait till Reload is cleared
+	 */
+	for (i = 0; i < RENESAS_RETRY; i++) {
+		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS, &status);
+		if (err)
+			return false;
+		if (!(status & RENESAS_ROM_STATUS_RELOAD))
+			break;
+
+		udelay(RENESAS_DELAY);
+	}
+	if (i == RENESAS_RETRY) {
+		dev_err(&pdev->dev, "ROM Exec timed out: %x\n", status);
+		return false;
+	}
+
+	return true;
+
+remove_bypass:
+	pci_write_config_byte(pdev, RENESAS_ROM_STATUS, 0);
+	return false;
+}
+
 static void renesas_fw_callback(const struct firmware *fw,
 				void *context)
 {
 	struct renesas_fw_ctx *ctx = context;
 	struct pci_dev *pdev = ctx->pdev;
 	struct device *parent = pdev->dev.parent;
+	bool rom;
 	int err;
 
 	if (!fw) {
@@ -381,6 +713,25 @@ static void renesas_fw_callback(const struct firmware *fw,
 	if (err)
 		goto cleanup;
 
+	/* Check if the device has external ROM */
+	rom = renesas_check_rom(pdev);
+	if (rom) {
+		/* perfrom chip erase first */
+		renesas_rom_erase(pdev);
+
+		/* lets try loading fw on ROM first */
+		rom = renesas_setup_rom(pdev, fw);
+		if (!rom) {
+			dev_err(&pdev->dev,
+				"ROM load failed, falling back on FW load\n");
+		} else {
+			dev_dbg(&pdev->dev, "ROM load done..\n");
+
+			release_firmware(fw);
+			goto do_probe;
+		}
+	}
+
 	err = renesas_fw_download(pdev, fw);
 	release_firmware(fw);
 	if (err) {
@@ -388,6 +739,7 @@ static void renesas_fw_callback(const struct firmware *fw,
 		goto cleanup;
 	}
 
+do_probe:
 	if (ctx->resume)
 		return;
 
-- 
2.24.1

