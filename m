Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EA235ECD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 08:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349174AbhDNGEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 02:04:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13775 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349122AbhDNGEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 02:04:23 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Apr 2021 23:04:02 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Apr 2021 23:03:59 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 11:33:33 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 71C2037A5; Wed, 14 Apr 2021 11:33:32 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2] usb: dwc3: core: Add shutdown callback for dwc3
Date:   Wed, 14 Apr 2021 11:33:29 +0530
Message-Id: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
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

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
Changes in v2:
        - As per Stephen's comment, calling dwc3_remove in dwc3_shutdown.

 drivers/usb/dwc3/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 05e2e54c..2022d90 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1658,6 +1658,11 @@ static int dwc3_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void dwc3_shutdown(struct platform_device *pdev)
+{
+	dwc3_remove(pdev);
+}
+
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 {
@@ -1975,6 +1980,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
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

