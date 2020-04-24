Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630031B71CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 12:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgDXKPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 06:15:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbgDXKPR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 06:15:17 -0400
Received: from localhost.localdomain (unknown [117.99.83.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BFE521569;
        Fri, 24 Apr 2020 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587723317;
        bh=1CQ4YVRv2hptMYIZ2vyFq7ockdg1+3qtqMcz6/rIcWw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Phwx+4VH+LLPa9c0y9/8hkSQRk6CngxvX3rE2ZNxMDFa7h08emSzSZfxZekgFZUDX
         W46BLvNjdA+UL4+k6nsfGq3VpK7TJ+xiWt0eVlgt76u4Rv9NAf82NFHM5Fc87pomkj
         boh+bqkSvXYAMgYogP0IK4kCOcNbI+DZA3igxAh4=
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
Subject: [PATCH v10 5/5] usb: xhci: provide a debugfs hook for erasing rom
Date:   Fri, 24 Apr 2020 15:44:10 +0530
Message-Id: <20200424101410.2364219-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200424101410.2364219-1-vkoul@kernel.org>
References: <20200424101410.2364219-1-vkoul@kernel.org>
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
index 6bb537999754..193ebec24153 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019-2020 Linaro Limited */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -160,6 +161,8 @@ static int renesas_fw_verify(const void *fw_data,
 	return 0;
 }
 
+static void debugfs_init(struct pci_dev *pdev);
+
 static bool renesas_check_rom(struct pci_dev *pdev)
 {
 	u16 rom_status;
@@ -173,6 +176,7 @@ static bool renesas_check_rom(struct pci_dev *pdev)
 	rom_status &= RENESAS_ROM_STATUS_ROM_EXISTS;
 	if (rom_status) {
 		dev_dbg(&pdev->dev, "External ROM exists\n");
+		debugfs_init(pdev);
 		return true; /* External ROM exists */
 	}
 
@@ -439,6 +443,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
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
@@ -690,4 +722,5 @@ int renesas_xhci_check_request_fw(struct pci_dev *pdev,
 
 void renesas_xhci_pci_exit(struct pci_dev *dev)
 {
+	debugfs_exit();
 }
-- 
2.25.1

