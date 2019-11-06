Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B678F114C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 09:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbfKFIjo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 03:39:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:48368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731551AbfKFIjo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 03:39:44 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDA752187F;
        Wed,  6 Nov 2019 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573029583;
        bh=3n0e0WMZun+KvTCKIcTClGi7plTjhUdFq8O6kRTeDpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rNnTVDZGvuJNE9U/We2e99vZEei5l67uDysMZQG5l4KeRRK5bLB0QKTTK2vUeuwxT
         UOMjAP+CA54iijJNe7JhwkSSmOonkbBluMlisDtt28ngF03460l9OjF8j2ypFjRmRb
         OSjcOu11IBo20xstiJ7qJ1ZtCFixFc3bu7j10dYU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] usb: xhci: provide a debugfs hook for erasing rom
Date:   Wed,  6 Nov 2019 14:08:43 +0530
Message-Id: <20191106083843.1718437-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106083843.1718437-1-vkoul@kernel.org>
References: <20191106083843.1718437-1-vkoul@kernel.org>
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
 drivers/usb/host/xhci-pci.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 4d0c0fd18c23..ac8f433861e9 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/firmware.h>
 #include <linux/unaligned/access_ok.h>
+#include <linux/debugfs.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -493,6 +494,8 @@ static int renesas_fw_verify(struct pci_dev *dev,
 	return 0;
 }
 
+static void debugfs_init(struct pci_dev *pdev);
+
 static int renesas_check_rom_state(struct pci_dev *pdev)
 {
 	const struct renesas_fw_entry *entry;
@@ -516,6 +519,7 @@ static int renesas_check_rom_state(struct pci_dev *pdev)
 		if (version == entry->expected_version) {
 			dev_dbg(&pdev->dev, "Detected valid ROM version..\n");
 			valid_version = true;
+			debugfs_init(pdev);
 		}
 	}
 	if (valid_version == false)
@@ -803,6 +807,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
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
@@ -1248,6 +1280,8 @@ static void xhci_pci_remove(struct pci_dev *dev)
 {
 	struct xhci_hcd *xhci;
 
+	debugfs_exit();
+
 	if (renesas_fw_alive_check(dev)) {
 		/*
 		 * bail out early, if this was a renesas device w/o FW.
-- 
2.23.0

