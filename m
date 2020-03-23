Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E3A18F276
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 11:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgCWKMC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 06:12:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgCWKMC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 06:12:02 -0400
Received: from localhost.localdomain (unknown [171.76.96.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A55A206F8;
        Mon, 23 Mar 2020 10:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584958321;
        bh=PiXixryumVWJRKa+1DcnDRW4XAKbe0OHmg7lWxGR80U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pFDm8n5auKVF1cMdUTVP0i8zBGQZ3Dv76/fyD0OlEqdSc3g4KVRrWfYvbIQqDMiOj
         xOS+iaZ6uwPgbUySEm+GUQfdmaQdqEaPhZRHCMHoXu/NSn18XBCqnb/tjxnqn3crJE
         6HZ75DifbrMistDcRXMqbQtwufHwhGkRlOZA/eUQ=
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
Subject: [PATCH v7 4/5] usb: renesas-xhci: Add ROM loader for uPD720201
Date:   Mon, 23 Mar 2020 15:41:20 +0530
Message-Id: <20200323101121.243906-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323101121.243906-1-vkoul@kernel.org>
References: <20200323101121.243906-1-vkoul@kernel.org>
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
 drivers/usb/host/xhci-pci-renesas.c | 341 +++++++++++++++++++++++++++-
 1 file changed, 338 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index ce17778b80db..d43b3a76dff5 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -50,6 +50,22 @@
 #define RENESAS_RETRY	10000
 #define RENESAS_DELAY	10
 
+#define ROM_VALID_01 0x2013
+#define ROM_VALID_02 0x2026
+
+static int renesas_verify_fw_version(struct pci_dev *pdev, u32 version)
+{
+	switch (version) {
+	case ROM_VALID_01:
+	case ROM_VALID_02:
+		return 0;
+	default:
+		dev_err(&pdev->dev, "FW has invalid version :%d\n", version);
+		return 1;
+	}
+	return -EINVAL;
+}
+
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw,
 				     size_t step)
@@ -146,10 +162,62 @@ static int renesas_fw_verify(struct pci_dev *dev,
 	return 0;
 }
 
-static int renesas_fw_check_running(struct pci_dev *pdev)
+static int renesas_check_rom_state(struct pci_dev *pdev)
 {
+	u16 rom_state;
+	u32 version;
 	int err;
+
+	/* check FW version */
+	err = pci_read_config_dword(pdev, RENESAS_FW_VERSION, &version);
+	if (err)
+		return pcibios_err_to_errno(err);
+
+	version &= RENESAS_FW_VERSION_FIELD;
+	version = version >> RENESAS_FW_VERSION_OFFSET;
+
+	err = renesas_verify_fw_version(pdev, version);
+	if (err)
+		return err;
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
+			return 0;
+
+		case RENESAS_ROM_STATUS_NO_RESULT: /* No result yet */
+			return 0;
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
+
+static int renesas_fw_check_running(struct pci_dev *pdev)
+{
 	u8 fw_state;
+	int err;
+
+	/* Check if device has ROM and loaded, if so skip everything */
+	err = renesas_check_rom_state(pdev);
+	if (!err)
+		return err;
 
 	/*
 	 * Test if the device is actually needing the firmware. As most
@@ -315,16 +383,263 @@ static int renesas_fw_download(struct pci_dev *pdev,
 struct renesas_fw_ctx {
 	struct pci_dev *pdev;
 	const struct pci_device_id *id;
-	bool resume;
-	const struct renesas_fw_entry *entry;
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
@@ -336,6 +651,25 @@ static void renesas_fw_callback(const struct firmware *fw,
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
+			dev_err(&pdev->dev,
+				"ROM load success\n");
+			release_firmware(fw);
+			goto do_probe;
+		}
+	}
+
 	err = renesas_fw_download(pdev, fw);
 	release_firmware(fw);
 	if (err) {
@@ -343,6 +677,7 @@ static void renesas_fw_callback(const struct firmware *fw,
 		goto cleanup;
 	}
 
+do_probe:
 	xhci_pci_probe(pdev, ctx->id);
 	return;
 
-- 
2.25.1

