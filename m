Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E863361DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242401AbhDPKDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:03:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11657 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242365AbhDPKDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:03:03 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Apr 2021 03:02:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Apr 2021 03:02:37 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Apr 2021 15:32:04 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 63E2138A5; Fri, 16 Apr 2021 15:32:03 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v6 1/5] usb: dwc3: host: Add suspend_quirk for dwc3 host
Date:   Fri, 16 Apr 2021 15:31:49 +0530
Message-Id: <1618567313-25373-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding suspend quirk function for dwc3 host which will be called
during xhci suspend.
Setting hs_phy_mode, ss_phy_mode , phy_power_off flags and phy mode
during host suspend.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/host.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6e9abfb..f409dc1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1111,6 +1111,9 @@ struct dwc3 {
 
 	bool			phys_ready;
 
+	unsigned int            hs_phy_mode;
+	bool			phy_power_off;
+
 	struct ulpi		*ulpi;
 	bool			ulpi_ready;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f29a264..527f04c 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -11,6 +11,14 @@
 #include <linux/platform_device.h>
 
 #include "core.h"
+#include "../host/xhci.h"
+#include "../host/xhci-plat.h"
+
+static int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
+
+static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
+	.suspend_quirk = xhci_dwc3_suspend_quirk,
+};
 
 static int dwc3_host_get_irq(struct dwc3 *dwc)
 {
@@ -115,6 +123,13 @@ int dwc3_host_init(struct dwc3 *dwc)
 		}
 	}
 
+	ret = platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
+			sizeof(struct xhci_plat_priv));
+	if (ret) {
+		dev_err(dwc->dev, "failed to add data to xHCI\n");
+		goto err;
+	}
+
 	ret = platform_device_add(xhci);
 	if (ret) {
 		dev_err(dwc->dev, "failed to register xHCI device\n");
@@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return ret;
 }
 
+static void dwc3_set_phy_mode(struct usb_hcd *hcd)
+{
+
+	int i, num_ports;
+	u32 reg;
+	unsigned int ss_phy_mode = 0;
+	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
+	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
+
+	dwc->hs_phy_mode = 0;
+
+	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
+	num_ports = HCS_MAX_PORTS(reg);
+
+	for (i = 0; i < num_ports; i++) {
+		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
+		if (reg & PORT_PE) {
+			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
+				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_HS;
+			else if (DEV_LOWSPEED(reg))
+				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_LS;
+
+			if (DEV_SUPERSPEED(reg))
+				ss_phy_mode |= PHY_MODE_USB_HOST_SS;
+		}
+	}
+	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_mode);
+	phy_set_mode(dwc->usb3_generic_phy, ss_phy_mode);
+}
+
+int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
+{
+	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
+
+	dwc3_set_phy_mode(hcd);
+
+	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+		dwc->phy_power_off = false;
+	else
+		dwc->phy_power_off = true;
+
+	return 0;
+}
+
 void dwc3_host_exit(struct dwc3 *dwc)
 {
 	platform_device_unregister(dwc->xhci);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

