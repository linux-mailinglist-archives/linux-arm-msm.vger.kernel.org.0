Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C64327C2A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 12:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgI2KsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 06:48:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59739 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgI2KsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 06:48:11 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Sep 2020 03:48:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Sep 2020 03:48:09 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Sep 2020 16:17:55 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 864802D57; Tue, 29 Sep 2020 16:17:54 +0530 (IST)
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
Subject: [PATCH v3 2/5] usb: dwc3: host: Add suspend_quirk for dwc3 host
Date:   Tue, 29 Sep 2020 16:17:29 +0530
Message-Id: <1601376452-31839-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding suspend quirk function for dwc3 host which will be called
during xhci suspend.
Setting hs_phy_flags, ss_phy_flags and phy mode during host suspend.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/host.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e195176..7f316fa 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -11,6 +11,13 @@
 #include <linux/platform_device.h>
 
 #include "core.h"
+#include "../host/xhci.h"
+#include "../host/xhci-plat.h"
+int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
+
+static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
+	.suspend_quirk = xhci_dwc3_suspend_quirk,
+};
 
 static int dwc3_host_get_irq(struct dwc3 *dwc)
 {
@@ -115,6 +122,13 @@ int dwc3_host_init(struct dwc3 *dwc)
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
@@ -127,6 +141,41 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return ret;
 }
 
+static void dwc3_set_phy_speed_flags(struct usb_hcd *hcd)
+{
+
+	int i, num_ports;
+	u32 reg;
+	struct device *dev = hcd->self.controller;
+	struct dwc3 *dwc = dev_get_drvdata(dev->parent);
+	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
+
+	dwc->hs_phy_flags = 0;
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
+			if (DEV_SUPERSPEED(reg))
+				dwc->ss_phy_flags |= PHY_MODE_USB_HOST_SS;
+		}
+	}
+	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
+	phy_set_mode(dwc->usb3_generic_phy, dwc->ss_phy_flags);
+}
+
+int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
+{
+	dwc3_set_phy_speed_flags(hcd);
+	return 0;
+}
+
 void dwc3_host_exit(struct dwc3 *dwc)
 {
 	platform_device_unregister(dwc->xhci);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

