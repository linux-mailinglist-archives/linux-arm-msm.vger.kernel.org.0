Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED561F69FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 16:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgFKO2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 10:28:51 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25936 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726657AbgFKO2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 10:28:51 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jun 2020 19:58:44 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Jun 2020 19:58:18 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 7135F2AC7; Thu, 11 Jun 2020 19:58:17 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/2] usb: dwc3: Host wake up support from system suspend
Date:   Thu, 11 Jun 2020 19:58:03 +0530
Message-Id: <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode so that it can be wake up by devices.
Set usb controller wakeup capable when wakeup capable devices are
connected to the host.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/core.c      | 47 ++++++++++++++++++++++++++-----
 drivers/usb/dwc3/core.h      |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 66 +++++++++++++++++++++++++++++++++-----------
 3 files changed, 91 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a7..8370350 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -31,15 +31,19 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 #include "gadget.h"
 #include "io.h"
 
 #include "debug.h"
+#include "../host/xhci.h"
 
 #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
 
+bool need_phy_for_wakeup;
+
 /**
  * dwc3_get_dr_mode - Validates and sets dr_mode
  * @dwc: pointer to our context structure
@@ -1627,10 +1631,36 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 	return ret;
 }
 
+static void dwc3_set_phy_speed_flags(struct dwc3 *dwc)
+{
+
+	int i, num_ports;
+	u32 reg;
+	struct usb_hcd	*hcd = platform_get_drvdata(dwc->xhci);
+	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
+
+	dwc->hs_phy_flags &= ~(PHY_MODE_USB_HOST_HS | PHY_MODE_USB_HOST_LS);
+
+	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
+
+	num_ports = HCS_MAX_PORTS(reg);
+	for (i = 0; i < num_ports; i++) {
+		reg = readl(&xhci_hcd->op_regs->port_status_base + i*0x10);
+		if (reg & PORT_PE) {
+			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
+				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_HS;
+			else if (DEV_LOWSPEED(reg))
+				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_LS;
+		}
+	}
+	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
+}
+
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	unsigned long	flags;
 	u32 reg;
+	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
@@ -1643,9 +1673,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
+		dwc3_set_phy_speed_flags(dwc);
 		if (!PMSG_IS_AUTO(msg)) {
-			dwc3_core_exit(dwc);
-			break;
+			if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+				need_phy_for_wakeup = true;
 		}
 
 		/* Let controller to suspend HSPHY before PHY driver suspends */
@@ -1705,11 +1736,13 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
 		if (!PMSG_IS_AUTO(msg)) {
-			ret = dwc3_core_init_for_resume(dwc);
-			if (ret)
-				return ret;
-			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
-			break;
+			if (!need_phy_for_wakeup) {
+				ret = dwc3_core_init_for_resume(dwc);
+				if (ret)
+					return ret;
+				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
+				break;
+			}
 		}
 		/* Restore GUSB2PHYCFG bits that were modified in suspend */
 		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 013f42a..ff02d41 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1094,6 +1094,7 @@ struct dwc3 {
 	struct phy		*usb3_generic_phy;
 
 	bool			phys_ready;
+	int			hs_phy_flags;
 
 	struct ulpi		*ulpi;
 	bool			ulpi_ready;
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024..ec183646 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,7 @@
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 
@@ -192,21 +193,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 
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
@@ -215,21 +229,34 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 
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
@@ -240,6 +267,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
 	int i;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
+
+	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+		device_init_wakeup(qcom->dev, 1);
 
 	if (qcom->is_suspended)
 		return 0;
@@ -262,6 +294,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	int ret;
 	int i;
 
+	device_init_wakeup(qcom->dev, 0);
+
 	if (!qcom->is_suspended)
 		return 0;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

