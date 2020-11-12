Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A53B2AFFA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 07:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgKLGat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 01:30:49 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22483 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgKLGat (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 01:30:49 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Nov 2020 22:30:49 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Nov 2020 22:30:46 -0800
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Nov 2020 12:00:22 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 050622F87; Thu, 12 Nov 2020 12:00:21 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH] usb: dwc3: qcom: Add shutdown callback for dwc3
Date:   Thu, 12 Nov 2020 12:00:18 +0530
Message-Id: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a shutdown callback to USB DWC QCOM driver to ensure that
it is properly shutdown in reboot/shutdown path. This is required
where SMMU address translation is enabled like on SC7180
SoC and few others. If the hardware is still accessing memory after
SMMU translation is disabled as part of SMMU shutdown callback in
system reboot or shutdown path, then IOVAs(I/O virtual address)
which it was using will go on the bus as the physical addresses which
might result in unknown crashes (NoC/interconnect errors).

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d55..a930e06 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -790,13 +790,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_qcom_remove(struct platform_device *pdev)
+static void __dwc3_qcom_teardown(struct dwc3_qcom *qcom)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
-	struct device *dev = &pdev->dev;
 	int i;
 
-	of_platform_depopulate(dev);
+	of_platform_depopulate(qcom->dev);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -807,12 +805,27 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
 
-	pm_runtime_allow(dev);
-	pm_runtime_disable(dev);
+	pm_runtime_allow(qcom->dev);
+	pm_runtime_disable(qcom->dev);
+}
+
+static int dwc3_qcom_remove(struct platform_device *pdev)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+
+	__dwc3_qcom_teardown(qcom);
 
 	return 0;
 }
 
+static void dwc3_qcom_shutdown(struct platform_device *pdev)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+
+	__dwc3_qcom_teardown(qcom);
+
+}
+
 static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
@@ -887,6 +900,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
 	.remove		= dwc3_qcom_remove,
+	.shutdown	= dwc3_qcom_shutdown,
 	.driver		= {
 		.name	= "dwc3-qcom",
 		.pm	= &dwc3_qcom_dev_pm_ops,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

