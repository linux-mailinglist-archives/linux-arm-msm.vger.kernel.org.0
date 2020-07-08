Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1FE219050
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 21:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgGHTRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 15:17:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42149 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHTRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 15:17:08 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jul 2020 15:17:05 EDT
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Jul 2020 12:11:04 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Jul 2020 12:11:01 -0700
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 09 Jul 2020 00:40:32 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 157922BFB; Thu,  9 Jul 2020 00:40:32 +0530 (IST)
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
Subject: [PATCH v2 1/3] usb: dwc3: core: Host wake up support from system suspend
Date:   Thu,  9 Jul 2020 00:40:15 +0530
Message-Id: <1594235417-23066-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode so that it can be wake up by devices.
Added need_phy_for_wakeup flag to distinugush resume path and hs_phy_flags
to check connection status and set phy mode and  configure interrupts.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/core.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
 drivers/usb/dwc3/core.h |  2 ++
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a7..eb7c225 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -31,12 +31,14 @@
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
 
@@ -1627,10 +1629,36 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
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
+		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
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
@@ -1643,9 +1671,12 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
+		dwc3_set_phy_speed_flags(dwc);
 		if (!PMSG_IS_AUTO(msg)) {
-			dwc3_core_exit(dwc);
-			break;
+			if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+				dwc->need_phy_for_wakeup = true;
+			else
+				dwc->need_phy_for_wakeup = false;
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
+			if (!dwc->need_phy_for_wakeup) {
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
index 013f42a..5367d510e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1094,6 +1094,8 @@ struct dwc3 {
 	struct phy		*usb3_generic_phy;
 
 	bool			phys_ready;
+	bool                    need_phy_for_wakeup;
+	unsigned int            hs_phy_flags;
 
 	struct ulpi		*ulpi;
 	bool			ulpi_ready;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

