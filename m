Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EDD18FAE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 18:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCWRHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 13:07:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727611AbgCWRHc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 13:07:32 -0400
Received: from localhost.localdomain (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D21E20719;
        Mon, 23 Mar 2020 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584983251;
        bh=fomihoNKlPSOdDcQeFVhX/QuKjKtyu63YoEHBqorJ4U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E51SSEP3w99hro3rEvMthEnIMeD48rKshU0vLz4Cj8bpcu6q4oxhDC5FsmRM3Cn26
         ST7Z7ohhBVRNdZMuXgahB+k5V0JYXUO83L05ShDLfaoG7Dxjj29/ZLlAcwzW89OeQr
         FF8rJFE3c+2VZdWS2DevX1bNBvkeVZR+QEHS4VOk=
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
Subject: [PATCH v8 5/5] usb: xhci: provide a debugfs hook for erasing rom
Date:   Mon, 23 Mar 2020 22:36:01 +0530
Message-Id: <20200323170601.419809-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323170601.419809-1-vkoul@kernel.org>
References: <20200323170601.419809-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

run "echo 1 > /sys/kernel/debug/renesas-usb/rom_erase" to erase firmware
when driver is loaded.

Subsequent init of driver shall reload the firmware

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci-renesas.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 6301730b1f8d..714932eaac90 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019-2020 Linaro Limited */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -162,6 +163,8 @@ static int renesas_fw_verify(struct pci_dev *dev,
 	return 0;
 }
 
+static void debugfs_init(struct pci_dev *pdev);
+
 static int renesas_check_rom_state(struct pci_dev *pdev)
 {
 	u16 rom_state;
@@ -194,9 +197,11 @@ static int renesas_check_rom_state(struct pci_dev *pdev)
 		/* Check the "Result Code" Bits (6:4) and act accordingly */
 		switch (rom_state & RENESAS_ROM_STATUS_RESULT) {
 		case RENESAS_ROM_STATUS_SUCCESS:
+			debugfs_init(pdev);
 			return 0;
 
 		case RENESAS_ROM_STATUS_NO_RESULT: /* No result yet */
+			debugfs_init(pdev);
 			return 0;
 
 		case RENESAS_ROM_STATUS_ERROR: /* Error State */
@@ -443,6 +448,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
 	dev_dbg(&pdev->dev, "ROM Erase... Done success\n");
 }
 
+static int debugfs_rom_erase(void *data, u64 value)
+{
+	struct pci_dev *pdev = data;
+
+	if (value == 1) {
+		dev_dbg(&pdev->dev, "Userspace requested ROM erase\n");
+		renesas_rom_erase(pdev);
+		return 0;
+	}
+	return -EINVAL;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(rom_erase_ops, NULL, debugfs_rom_erase, "%llu\n");
+
+static struct dentry *debugfs_root;
+
+static void debugfs_init(struct pci_dev *pdev)
+{
+	debugfs_root = debugfs_create_dir("renesas_usb", NULL);
+
+	debugfs_create_file("rom_erase", 0200, debugfs_root,
+			    pdev, &rom_erase_ops);
+}
+
+static void debugfs_exit(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+}
+
 static bool renesas_download_rom(struct pci_dev *pdev,
 				 const u32 *fw, size_t step)
 {
@@ -754,6 +787,8 @@ int renesas_xhci_pci_probe(struct pci_dev *dev,
 
 int renesas_xhci_pci_remove(struct pci_dev *dev)
 {
+	debugfs_exit();
+
 	if (renesas_fw_check_running(dev)) {
 		/*
 		 * bail out early, if this was a renesas device w/o FW.
-- 
2.25.1

