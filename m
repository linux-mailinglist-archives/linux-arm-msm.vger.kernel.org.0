Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8776195452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 10:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0Jo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 05:44:28 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55212 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726656AbgC0Jo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 05:44:27 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Mar 2020 15:14:18 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Mar 2020 15:13:53 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id EA1C82223; Fri, 27 Mar 2020 15:13:52 +0530 (IST)
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
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v6 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
Date:   Fri, 27 Mar 2020 15:13:21 +0530
Message-Id: <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect support in dwc3-qcom driver to vote for bus
bandwidth.

This requires for two different paths - from USB master to
DDR slave. The other is from APPS master to USB slave.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024..7e85fe6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/extcon.h>
+#include <linux/interconnect.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -43,6 +44,14 @@
 #define SDM845_QSCRATCH_SIZE			0x400
 #define SDM845_DWC3_CORE_SIZE			0xcd00
 
+/* Interconnect path bandwidths in MBps */
+#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
+#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
+#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define APPS_USB_AVG_BW 0
+#define APPS_USB_PEAK_BW MBps_to_icc(40)
+
 struct dwc3_acpi_pdata {
 	u32			qscratch_base_offset;
 	u32			qscratch_base_size;
@@ -76,8 +85,13 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	struct icc_path		*usb_ddr_icc_path;
+	struct icc_path		*apps_usb_icc_path;
 };
 
+static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom);
+static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom);
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -239,7 +253,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
-	int i;
+	int i, ret;
 
 	if (qcom->is_suspended)
 		return 0;
@@ -251,6 +265,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	for (i = qcom->num_clocks - 1; i >= 0; i--)
 		clk_disable_unprepare(qcom->clks[i]);
 
+	ret = dwc3_qcom_interconnect_disable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to disable interconnect %d\n", ret);
+
 	qcom->is_suspended = true;
 	dwc3_qcom_enable_interrupts(qcom);
 
@@ -276,6 +294,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 		}
 	}
 
+	ret = dwc3_qcom_interconnect_enable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to enable interconnect %d\n", ret);
+
 	/* Clear existing events from PHY related to L2 in/out */
 	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
 			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
@@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	return 0;
 }
 
+
+/**
+ * dwc3_qcom_interconnect_init() - Get interconnect path handles
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ */
+static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
+{
+	struct device *dev = qcom->dev;
+	int ret;
+
+	if (!device_is_bound(&qcom->dwc3->dev))
+		return -EPROBE_DEFER;
+
+	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
+	if (IS_ERR(qcom->usb_ddr_icc_path)) {
+		dev_err(dev, "Error: (%ld) failed getting usb-ddr path\n",
+			PTR_ERR(qcom->usb_ddr_icc_path));
+		return PTR_ERR(qcom->usb_ddr_icc_path);
+	}
+
+	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
+	if (IS_ERR(qcom->apps_usb_icc_path)) {
+		dev_err(dev, "Error: (%ld) failed getting apps-usb path\n",
+				PTR_ERR(qcom->apps_usb_icc_path));
+		return PTR_ERR(qcom->apps_usb_icc_path);
+	}
+
+	ret = dwc3_qcom_interconnect_enable(qcom);
+	if (ret) {
+		dev_err(dev, "failed to enable interconnect %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_interconnect_exit() - Release interconnect path handles
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ * This function is used to release interconnect path handle.
+ */
+static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
+{
+	icc_put(qcom->usb_ddr_icc_path);
+	icc_put(qcom->apps_usb_icc_path);
+}
+
+/* Currently we only use bandwidth level, so just "enable" interconnects */
+static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
+{
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	int ret;
+
+	if (dwc->maximum_speed == USB_SPEED_SUPER)
+		ret = icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
+	else
+		ret = icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
+
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(qcom->apps_usb_icc_path,
+		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
+	if (ret)
+		icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
+
+	return ret;
+}
+
+/* To disable an interconnect, we just set its bandwidth to 0 */
+static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
+	if (ret)
+		goto err_reenable_memory_path;
+
+	return 0;
+
+	/* Re-enable things in the event of an error */
+err_reenable_memory_path:
+	ret = dwc3_qcom_interconnect_enable(qcom);
+
+	return ret;
+}
+
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
@@ -648,6 +765,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto depopulate;
 	}
 
+	ret = dwc3_qcom_interconnect_init(qcom);
+	if (ret)
+		goto depopulate;
+
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
 
 	/* enable vbus override for device mode */
@@ -657,7 +778,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	/* register extcon to override sw_vbus on Vbus change later */
 	ret = dwc3_qcom_register_extcon(qcom);
 	if (ret)
-		goto depopulate;
+		goto interconnect_exit;
 
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
@@ -667,6 +788,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
+interconnect_exit:
+	dwc3_qcom_interconnect_exit(qcom);
 depopulate:
 	if (np)
 		of_platform_depopulate(&pdev->dev);
@@ -697,6 +820,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	}
 	qcom->num_clocks = 0;
 
+	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
 
 	pm_runtime_allow(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

