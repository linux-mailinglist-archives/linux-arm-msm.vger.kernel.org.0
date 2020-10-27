Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A4829CA57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 21:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1831820AbgJ0Uiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 16:38:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43794 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1831808AbgJ0Uit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 16:38:49 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 27 Oct 2020 13:38:48 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Oct 2020 13:38:46 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Oct 2020 02:08:19 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 34DA92EC8; Wed, 28 Oct 2020 02:08:19 +0530 (IST)
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
Subject: [PATCH v4 3/5] usb: dwc3: qcom: Configure wakeup interrupts and set genpd active wakeup flag
Date:   Wed, 28 Oct 2020 02:08:01 +0530
Message-Id: <1603831083-2025-4-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603831083-2025-1-git-send-email-sanm@codeaurora.org>
References: <1603831083-2025-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure interrupts based on hs_phy_mode to avoid triggering of
interrupts during system suspend and suspends successfully.
Set genpd active wakeup flag for usb gdsc if wakeup capable devices
are connected so that wake up happens without reenumeration.
Add helper functions to enable,disable wake irqs.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d55..c93f7bb 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -17,9 +17,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_domain.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 
@@ -291,60 +293,75 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
 	icc_put(qcom->icc_path_apps);
 }
 
-static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
+static void dwc3_qcom_enable_wakeup_irq(int wake_irq)
 {
-	if (qcom->hs_phy_irq) {
-		disable_irq_wake(qcom->hs_phy_irq);
-		disable_irq_nosync(qcom->hs_phy_irq);
+	if (wake_irq) {
+		enable_irq(wake_irq);
+		enable_irq_wake(wake_irq);
 	}
+}
 
-	if (qcom->dp_hs_phy_irq) {
-		disable_irq_wake(qcom->dp_hs_phy_irq);
-		disable_irq_nosync(qcom->dp_hs_phy_irq);
+static void dwc3_qcom_disable_wakeup_irq(int wake_irq)
+{
+	if (wake_irq) {
+		disable_irq_wake(wake_irq);
+		disable_irq_nosync(wake_irq);
 	}
+}
 
-	if (qcom->dm_hs_phy_irq) {
-		disable_irq_wake(qcom->dm_hs_phy_irq);
-		disable_irq_nosync(qcom->dm_hs_phy_irq);
-	}
+static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
+{
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+
+	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
 
-	if (qcom->ss_phy_irq) {
-		disable_irq_wake(qcom->ss_phy_irq);
-		disable_irq_nosync(qcom->ss_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	else {
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
 	}
+
+	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
-	if (qcom->hs_phy_irq) {
-		enable_irq(qcom->hs_phy_irq);
-		enable_irq_wake(qcom->hs_phy_irq);
-	}
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 
-	if (qcom->dp_hs_phy_irq) {
-		enable_irq(qcom->dp_hs_phy_irq);
-		enable_irq_wake(qcom->dp_hs_phy_irq);
-	}
+	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
 
-	if (qcom->dm_hs_phy_irq) {
-		enable_irq(qcom->dm_hs_phy_irq);
-		enable_irq_wake(qcom->dm_hs_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	else {
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
 	}
 
-	if (qcom->ss_phy_irq) {
-		enable_irq(qcom->ss_phy_irq);
-		enable_irq_wake(qcom->ss_phy_irq);
-	}
+	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
 	int i, ret;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct usb_hcd  *hcd;
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
 
 	if (qcom->is_suspended)
 		return 0;
 
+	if (dwc->xhci) {
+		hcd = platform_get_drvdata(dwc->xhci);
+		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+	}
+
 	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
 	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 		dev_err(qcom->dev, "HS-PHY not in L2\n");
@@ -366,10 +383,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 {
 	int ret;
 	int i;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
 
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (dwc->xhci)
+		genpd->flags &= ~GENPD_FLAG_ACTIVE_WAKEUP;
+
 	dwc3_qcom_disable_interrupts(qcom);
 
 	for (i = 0; i < qcom->num_clocks; i++) {
@@ -764,7 +786,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto interconnect_exit;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, of_property_read_bool(np, "wakeup-source"));
 	qcom->is_suspended = false;
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

