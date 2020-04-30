Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257381C0360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 19:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgD3RAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 13:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgD3RAD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 13:00:03 -0400
Received: from localhost.localdomain (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE87920873;
        Thu, 30 Apr 2020 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588266003;
        bh=cBBOkr8Xv31S9xr1BvALBUdHSj8emmus8DnnBktbEAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N/lfoA4RnwmEtSxFTRyTSD/TOMfRo6Si/gqyy79KnNOMV/QZm7f9AseH0W9Ja1qYf
         nxH8oPXwz7Hs/NzlWwDZ9uXcc6WkPaxdl5BSz1GZvN/sAOWOss8l2t2pis4lWS4Q8L
         5bLxeSWVsA4NMd1EFEZiZQZeUnYFlrXKUJzFx8Zw=
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
Subject: [PATCH v12 5/5] usb: xhci: provide a debugfs hook for erasing rom
Date:   Thu, 30 Apr 2020 22:29:20 +0530
Message-Id: <20200430165920.1345409-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200430165920.1345409-1-vkoul@kernel.org>
References: <20200430165920.1345409-1-vkoul@kernel.org>
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
 drivers/usb/host/xhci-pci-renesas.c | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index f7d2445d30ec..fa32ec352dc8 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019-2020 Linaro Limited */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -170,6 +171,8 @@ static int renesas_fw_verify(const void *fw_data,
 	return 0;
 }
 
+static void debugfs_init(struct pci_dev *pdev);
+
 static bool renesas_check_rom(struct pci_dev *pdev)
 {
 	u16 rom_status;
@@ -183,6 +186,7 @@ static bool renesas_check_rom(struct pci_dev *pdev)
 	rom_status &= RENESAS_ROM_STATUS_ROM_EXISTS;
 	if (rom_status) {
 		dev_dbg(&pdev->dev, "External ROM exists\n");
+		debugfs_init(pdev);
 		return true; /* External ROM exists */
 	}
 
@@ -449,6 +453,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
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
 static bool renesas_setup_rom(struct pci_dev *pdev, const struct firmware *fw)
 {
 	const u32 *fw_data = (const u32 *)fw->data;
@@ -639,6 +671,7 @@ EXPORT_SYMBOL_GPL(renesas_xhci_check_request_fw);
 
 void renesas_xhci_pci_exit(struct pci_dev *dev)
 {
+	debugfs_exit();
 }
 EXPORT_SYMBOL_GPL(renesas_xhci_pci_exit);
 
-- 
2.25.3

