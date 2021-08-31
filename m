Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E12E3FC261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 08:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbhHaF7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 01:59:04 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:52736 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235078AbhHaF7B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 01:59:01 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id F335C440599;
        Tue, 31 Aug 2021 08:57:38 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] usb: dwc3: reference clock period configuration
Date:   Tue, 31 Aug 2021 08:57:30 +0300
Message-Id: <9f399bdf1ff752e31ab7497e3d5ce19bbb3ff247.1630389452.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
References: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Balaji Prakash J <bjagadee@codeaurora.org>

Set reference clock period when it differs from dwc3 default hardware
set.

We could calculate clock period based on reference clock frequency. But
this information is not always available. This is the case of PCI bus
attached USB host. For that reason we use a custom property.

Tested (USB2 only) on IPQ6010 SoC based board with 24 MHz reference
clock while hardware default is 19.2 MHz.

Nacked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
[ baruch: rewrite commit message; drop GFLADJ code; remove 'quirk-' from
  property name; mention tested hardware ]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:

  Add standard unit suffix (Rob Herring)

v2:

  Remove snps,quirk-ref-clock-adjustment; not needed for tested hardware

  Rename DT property to snps,ref-clock-period (Thinh Nguyen)

  Use FIELD_PREP() (Bjorn Andersson)
---
 drivers/usb/dwc3/core.c | 29 +++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  6 ++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ba74ad7f6995..31b8cb101a47 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -26,6 +26,7 @@
 #include <linux/acpi.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
+#include <linux/bitfield.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -351,6 +352,29 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
 	}
 }
 
+/**
+ * dwc3_ref_clk_period - Reference clock period configuration
+ *		Default reference clock period depends on hardware
+ *		configuration. For systems with reference clock that differs
+ *		from the default, this will set clock period in DWC3_GUCTL
+ *		register.
+ * @dwc: Pointer to our controller context structure
+ * @ref_clk_per: reference clock period in ns
+ */
+static void dwc3_ref_clk_period(struct dwc3 *dwc)
+{
+	u32 reg;
+
+	if (dwc->ref_clk_per == 0)
+		return;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
+	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
+	reg |=  FIELD_PREP(DWC3_GUCTL_REFCLKPER_MASK, dwc->ref_clk_per);
+	dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+}
+
+
 /**
  * dwc3_free_one_event_buffer - Frees one event buffer
  * @dwc: Pointer to our controller context structure
@@ -1011,6 +1035,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	/* Adjust Frame Length */
 	dwc3_frame_length_adjustment(dwc);
 
+	/* Adjust Reference Clock Period */
+	dwc3_ref_clk_period(dwc);
+
 	dwc3_set_incr_burst_type(dwc);
 
 	usb_phy_set_suspend(dwc->usb2_phy, 0);
@@ -1371,6 +1398,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	device_property_read_u32(dev, "snps,ref-clock-period-ns",
+				 &dwc->ref_clk_per);
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5991766239ba..1e4e21ea9d97 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -386,6 +386,10 @@
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
 
+/* Global User Control Register*/
+#define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
+#define DWC3_GUCTL_REFCLKPER_SEL		22
+
 /* Global User Control Register 2 */
 #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
 
@@ -969,6 +973,7 @@ struct dwc3_scratchpad_array {
  * @regs: base address for our registers
  * @regs_size: address space size
  * @fladj: frame length adjustment
+ * @ref_clk_per: reference clock period configuration
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1141,6 +1146,7 @@ struct dwc3 {
 	struct power_supply	*usb_psy;
 
 	u32			fladj;
+	u32			ref_clk_per;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.33.0

