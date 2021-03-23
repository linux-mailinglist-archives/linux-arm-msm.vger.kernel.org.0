Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C41346904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 20:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhCWT22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 15:28:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48616 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhCWT2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 15:28:13 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Mar 2021 12:28:12 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 23 Mar 2021 12:28:10 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Mar 2021 00:57:48 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 5E4043823; Wed, 24 Mar 2021 00:57:47 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
Date:   Wed, 24 Mar 2021 00:57:32 +0530
Message-Id: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a shutdown callback to USB DWC core driver to ensure that
it is properly shutdown in reboot/shutdown path. This is required
where SMMU address translation is enabled like on SC7180
SoC and few others. If the hardware is still accessing memory after
SMMU translation is disabled as part of SMMU shutdown callback in
system reboot or shutdown path, then IOVAs(I/O virtual address)
which it was using will go on the bus as the physical addresses which
might result in unknown crashes (NoC/interconnect errors).

Previously this was added in dwc3 qcom glue driver.
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
But observed kernel panic as glue driver shutdown getting called after
iommu shutdown. As we are adding iommu nodes in dwc core node
in device tree adding shutdown callback in core driver seems correct.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/core.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 94fdbe5..777b2b5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1634,11 +1634,9 @@ static int dwc3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_remove(struct platform_device *pdev)
+static void __dwc3_teardown(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = platform_get_drvdata(pdev);
-
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dwc->dev);
 
 	dwc3_debugfs_exit(dwc);
 	dwc3_core_exit_mode(dwc);
@@ -1646,19 +1644,32 @@ static int dwc3_remove(struct platform_device *pdev)
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
 
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_put_noidle(dwc->dev);
+	pm_runtime_set_suspended(dwc->dev);
 
 	dwc3_free_event_buffers(dwc);
 	dwc3_free_scratch_buffers(dwc);
 
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
+}
+
+static int dwc3_remove(struct platform_device *pdev)
+{
+	struct dwc3	*dwc = platform_get_drvdata(pdev);
+
+	__dwc3_teardown(dwc);
 
 	return 0;
 }
 
+static void dwc3_shutdown(struct platform_device *pdev)
+{
+	struct dwc3	*dwc = platform_get_drvdata(pdev);
+
+	__dwc3_teardown(dwc);
+}
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 {
@@ -1976,6 +1987,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
 static struct platform_driver dwc3_driver = {
 	.probe		= dwc3_probe,
 	.remove		= dwc3_remove,
+	.shutdown   = dwc3_shutdown,
 	.driver		= {
 		.name	= "dwc3",
 		.of_match_table	= of_match_ptr(of_dwc3_match),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

