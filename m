Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D053FBB4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 19:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbhH3R4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 13:56:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61663 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238250AbhH3R4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 13:56:06 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 30 Aug 2021 10:55:12 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Aug 2021 10:55:10 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Aug 2021 23:24:41 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id A2EEF3D10; Mon, 30 Aug 2021 23:24:40 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/3] usb: dwc3: qcom: Add multi-pd support
Date:   Mon, 30 Aug 2021 23:24:32 +0530
Message-Id: <1630346073-7099-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd support to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01..777a647 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_domain.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
@@ -89,6 +90,10 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+	/* power domain for cx */
+	struct device		*pd_cx;
+	/* power domain for usb gdsc */
+	struct device		*pd_usb_gdsc;
 };
 
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
@@ -521,6 +526,46 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	return 0;
 }
 
+static int dwc3_qcom_attach_pd(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct device_link *link;
+
+	/* Do nothing when in a single power domain */
+	if (dev->pm_domain)
+		return 0;
+
+	qcom->pd_cx = dev_pm_domain_attach_by_name(dev, "cx");
+	if (IS_ERR(qcom->pd_cx))
+		return PTR_ERR(qcom->pd_cx);
+	/* Do nothing when power domain missing */
+	if (!qcom->pd_cx)
+		return 0;
+	link = device_link_add(dev, qcom->pd_cx,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+	if (!link) {
+		dev_err(dev, "Failed to add device_link to cx pd.\n");
+		return -EINVAL;
+	}
+
+	qcom->pd_usb_gdsc = dev_pm_domain_attach_by_name(dev, "usb_gdsc");
+	if (IS_ERR(qcom->pd_usb_gdsc))
+		return PTR_ERR(qcom->pd_usb_gdsc);
+
+	link = device_link_add(dev, qcom->pd_usb_gdsc,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+	if (!link) {
+		dev_err(dev, "Failed to add device_link to usb gdsc pd.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 {
 	struct device		*dev = qcom->dev;
@@ -837,6 +882,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto interconnect_exit;
 
+	ret = dwc3_qcom_attach_pd(dev);
+	if (ret)
+		goto interconnect_exit;
+
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
 	pm_runtime_set_active(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

