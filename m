Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126F9312A9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 07:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhBHGRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 01:17:44 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:46224 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBHGRn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 01:17:43 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id C918F440836;
        Mon,  8 Feb 2021 08:16:58 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] usb: dwc3: reference clock configuration
Date:   Mon,  8 Feb 2021 08:00:06 +0200
Message-Id: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Balaji Prakash J <bjagadee@codeaurora.org>

DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
to control the behavior of controller with respect to SOF and ITP.
The reset values of these registers are aligned for 19.2 MHz
reference clock source. This change will add option to override
these settings for reference clock other than 19.2 MHz

Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.

Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
[ baruch: mention tested hardware ]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../devicetree/bindings/usb/dwc3.txt          |  5 ++
 drivers/usb/dwc3/core.c                       | 52 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       | 12 +++++
 3 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 1aae2b6160c1..4ffa87b697dc 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -89,6 +89,11 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields of GFLADJ
+	register for reference clock other than 19.2 MHz is used.
+ - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL. This field
+	indicates in terms of nano seconds the period of ref_clk. To calculate the
+	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
  - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
 			only. Set this and rx-max-burst-prd to a valid,
 			non-zero value 1-16 (DWC_usb31 programming guide
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 841daec70b6e..85e40ec8e23b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -325,6 +325,48 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
 	}
 }
 
+/**
+ * dwc3_ref_clk_adjustment - Reference clock settings for SOF and ITP
+ *		Default reference clock configurations are calculated assuming
+ *		19.2 MHz clock source. For other clock source, this will set
+ *		configuration in DWC3_GFLADJ register
+ * @dwc: Pointer to our controller context structure
+ */
+static void dwc3_ref_clk_adjustment(struct dwc3 *dwc)
+{
+	u32 reg;
+
+	if (dwc->ref_clk_adj == 0)
+		return;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
+	reg &= ~DWC3_GFLADJ_REFCLK_MASK;
+	reg |=  (dwc->ref_clk_adj << DWC3_GFLADJ_REFCLK_SEL);
+	dwc3_writel(dwc->regs, DWC3_GFLADJ, reg);
+}
+
+/**
+ * dwc3_ref_clk_period - Reference clock period configuration
+ *		Default reference clock period is calculated assuming
+ *		19.2 MHz as clock source. For other clock source, this
+ *		will set clock period in DWC3_GUCTL register
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
+	reg |=  (dwc->ref_clk_per << DWC3_GUCTL_REFCLKPER_SEL);
+	dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+}
+
+
 /**
  * dwc3_free_one_event_buffer - Frees one event buffer
  * @dwc: Pointer to our controller context structure
@@ -982,6 +1024,12 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	/* Adjust Frame Length */
 	dwc3_frame_length_adjustment(dwc);
 
+	/* Adjust Reference Clock Settings */
+	dwc3_ref_clk_adjustment(dwc);
+
+	/* Adjust Reference Clock Period */
+	dwc3_ref_clk_period(dwc);
+
 	dwc3_set_incr_burst_type(dwc);
 
 	usb_phy_set_suspend(dwc->usb2_phy, 0);
@@ -1351,6 +1399,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	device_property_read_u32(dev, "snps,quirk-ref-clock-adjustment",
+				 &dwc->ref_clk_adj);
+	device_property_read_u32(dev, "snps,quirk-ref-clock-period",
+				 &dwc->ref_clk_per);
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1b241f937d8f..469e94512414 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -379,6 +379,14 @@
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
 
+/* Global User Control Register*/
+#define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
+#define DWC3_GUCTL_REFCLKPER_SEL		22
+
+/* Global reference clock Adjustment Register */
+#define DWC3_GFLADJ_REFCLK_MASK			0xffffff00
+#define DWC3_GFLADJ_REFCLK_SEL			8
+
 /* Global User Control Register 2 */
 #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
 
@@ -956,6 +964,8 @@ struct dwc3_scratchpad_array {
  * @regs: base address for our registers
  * @regs_size: address space size
  * @fladj: frame length adjustment
+ * @ref_clk_adj: reference clock adjustment
+ * @ref_clk_per: reference clock period configuration
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1118,6 +1128,8 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	u32			fladj;
+	u32			ref_clk_adj;
+	u32			ref_clk_per;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.30.0

