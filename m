Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A01121904A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 21:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGHTRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 15:17:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42149 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHTRG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 15:17:06 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jul 2020 15:17:05 EDT
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Jul 2020 12:11:00 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Jul 2020 12:10:58 -0700
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 09 Jul 2020 00:40:35 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 4A7372BFB; Thu,  9 Jul 2020 00:40:34 +0530 (IST)
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
Subject: [PATCH v2 2/3] usb: dwc3: qcom: Configure wakeup interrupts and set genpd active wakeup flag
Date:   Thu,  9 Jul 2020 00:40:16 +0530
Message-Id: <1594235417-23066-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

configure interrupts based on hs_phy_flag. Set genpd active wakeup flag
for usb gdsc if wakeup capable devices are connected.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 73 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024..8902670 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -16,9 +16,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_domain.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 
@@ -192,21 +194,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 
 static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+
 	if (qcom->hs_phy_irq) {
 		disable_irq_wake(qcom->hs_phy_irq);
 		disable_irq_nosync(qcom->hs_phy_irq);
 	}
+	if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
+		if (qcom->dp_hs_phy_irq) {
+			disable_irq_wake(qcom->dp_hs_phy_irq);
+			disable_irq_nosync(qcom->dp_hs_phy_irq);
+		}
+	} else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
+		if (qcom->dm_hs_phy_irq) {
+			disable_irq_wake(qcom->dm_hs_phy_irq);
+			disable_irq_nosync(qcom->dm_hs_phy_irq);
+		}
+	} else {
 
-	if (qcom->dp_hs_phy_irq) {
-		disable_irq_wake(qcom->dp_hs_phy_irq);
-		disable_irq_nosync(qcom->dp_hs_phy_irq);
-	}
+		if (qcom->dp_hs_phy_irq) {
+			disable_irq_wake(qcom->dp_hs_phy_irq);
+			disable_irq_nosync(qcom->dp_hs_phy_irq);
+		}
 
-	if (qcom->dm_hs_phy_irq) {
-		disable_irq_wake(qcom->dm_hs_phy_irq);
-		disable_irq_nosync(qcom->dm_hs_phy_irq);
+		if (qcom->dm_hs_phy_irq) {
+			disable_irq_wake(qcom->dm_hs_phy_irq);
+			disable_irq_nosync(qcom->dm_hs_phy_irq);
+		}
 	}
-
 	if (qcom->ss_phy_irq) {
 		disable_irq_wake(qcom->ss_phy_irq);
 		disable_irq_nosync(qcom->ss_phy_irq);
@@ -215,21 +230,34 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+
 	if (qcom->hs_phy_irq) {
 		enable_irq(qcom->hs_phy_irq);
 		enable_irq_wake(qcom->hs_phy_irq);
 	}
+	if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
+		if (qcom->dp_hs_phy_irq) {
+			enable_irq(qcom->dp_hs_phy_irq);
+			enable_irq_wake(qcom->dp_hs_phy_irq);
+		}
+	} else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
+		if (qcom->dm_hs_phy_irq) {
+			enable_irq(qcom->dm_hs_phy_irq);
+			enable_irq_wake(qcom->dm_hs_phy_irq);
+		}
+	} else {
 
-	if (qcom->dp_hs_phy_irq) {
-		enable_irq(qcom->dp_hs_phy_irq);
-		enable_irq_wake(qcom->dp_hs_phy_irq);
-	}
+		if (qcom->dp_hs_phy_irq) {
+			enable_irq(qcom->dp_hs_phy_irq);
+			enable_irq_wake(qcom->dp_hs_phy_irq);
+		}
 
-	if (qcom->dm_hs_phy_irq) {
-		enable_irq(qcom->dm_hs_phy_irq);
-		enable_irq_wake(qcom->dm_hs_phy_irq);
+		if (qcom->dm_hs_phy_irq) {
+			enable_irq(qcom->dm_hs_phy_irq);
+			enable_irq_wake(qcom->dm_hs_phy_irq);
+		}
 	}
-
 	if (qcom->ss_phy_irq) {
 		enable_irq(qcom->ss_phy_irq);
 		enable_irq_wake(qcom->ss_phy_irq);
@@ -240,6 +268,14 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
 	int i;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
+	struct generic_pm_domain *genpd;
+
+	genpd = pd_to_genpd(qcom->dev->pm_domain);
+
+	if (genpd && usb_wakeup_enabled_descendants(hcd->self.root_hub))
+		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 
 	if (qcom->is_suspended)
 		return 0;
@@ -261,6 +297,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 {
 	int ret;
 	int i;
+	struct generic_pm_domain *genpd;
+
+	genpd = pd_to_genpd(qcom->dev->pm_domain);
+	if (genpd)
+		genpd->flags &= !GENPD_FLAG_ACTIVE_WAKEUP;
 
 	if (!qcom->is_suspended)
 		return 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

