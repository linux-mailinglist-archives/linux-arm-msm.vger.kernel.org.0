Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 893B3138D20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 09:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgAMIkq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 03:40:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:43612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728950AbgAMIkl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 03:40:41 -0500
Received: from localhost.localdomain (unknown [106.200.247.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2670D207FF;
        Mon, 13 Jan 2020 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578904841;
        bh=jZl8xgRoQpS61f5V158YZ1RZcDbf9UZ3oLAOvnSRF0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gx4q8ig5vDM0d2EF5D4raTi+e0zPRc+aeDbhl6v7pXyWEqquX6d1RVp4/MQYWUC2r
         DppAPBRU2dwTWPuHq01nEJ3cxIeKoZFsqvxJEuXOyt2If8+HbgPIEaY5nuUhqn7Cir
         A69ZYUI/MpQQoTmwhoGNIGTK7Rnbc1ctBrJq8Yus=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] usb: xhci: provide a debugfs hook for erasing rom
Date:   Mon, 13 Jan 2020 14:10:05 +0530
Message-Id: <20200113084005.849071-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113084005.849071-1-vkoul@kernel.org>
References: <20200113084005.849071-1-vkoul@kernel.org>
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
index fe95487ca888..be2e7eff492f 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019-2020 Linaro Limited */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -229,6 +230,9 @@ static int renesas_fw_verify(struct pci_dev *dev,
 
 	return 0;
 }
+
+static void debugfs_init(struct pci_dev *pdev);
+
 static int renesas_check_rom_state(struct pci_dev *pdev)
 {
 	const struct renesas_fw_entry *entry;
@@ -252,6 +256,7 @@ static int renesas_check_rom_state(struct pci_dev *pdev)
 		if (version == entry->expected_version) {
 			dev_dbg(&pdev->dev, "Detected valid ROM version..\n");
 			valid_version = true;
+			debugfs_init(pdev);
 		}
 	}
 	if (valid_version == false)
@@ -536,6 +541,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
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
+	debugfs_root = debugfs_create_dir("renesas-usb", NULL);
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
@@ -889,6 +922,8 @@ static int renesas_xhci_pci_probe(struct pci_dev *dev,
 
 static void renesas_xhci_pci_remove(struct pci_dev *dev)
 {
+	debugfs_exit();
+
 	if (renesas_fw_alive_check(dev)) {
 		/*
 		 * bail out early, if this was a renesas device w/o FW.
-- 
2.24.1

