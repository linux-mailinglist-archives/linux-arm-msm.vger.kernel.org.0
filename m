Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC73B5DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 14:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhF1ML2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 08:11:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1218 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbhF1ML0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 08:11:26 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 28 Jun 2021 05:09:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jun 2021 05:08:59 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Jun 2021 17:38:27 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 503273A48; Mon, 28 Jun 2021 17:38:26 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v8 2/6] usb: host: xhci: plat: Add suspend quirk for dwc3 controller
Date:   Mon, 28 Jun 2021 17:38:13 +0530
Message-Id: <1624882097-23265-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During suspend read the status of all port and make sure the PHYs
are in the correct mode based on current speed.
Phy interrupt masks are set based on this mode. Keep track of the mode
of the HS PHY to be able to configure wakeup properly.

Also check during suspend if any wakeup capable devices are
connected to the controller (directly or through hubs), if there
are none set a flag to indicate that the PHY should be powered
down during suspend.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/host/xhci-plat.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9..ee87923 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -24,6 +24,7 @@
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
+#include "../dwc3/core.h"
 
 static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
@@ -430,6 +431,39 @@ static int xhci_plat_remove(struct platform_device *dev)
 
 	return 0;
 }
+static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
+{
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
+
+	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+		dwc->phy_power_off = false;
+	else
+		dwc->phy_power_off = true;
+}
 
 static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
@@ -440,6 +474,10 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	ret = xhci_priv_suspend_quirk(hcd);
 	if (ret)
 		return ret;
+
+	if (of_device_is_compatible(dev->parent->of_node, "snps,dwc3"))
+		xhci_dwc3_suspend_quirk(hcd);
+
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

