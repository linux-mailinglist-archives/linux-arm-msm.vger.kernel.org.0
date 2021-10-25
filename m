Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC19439203
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 11:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhJYJKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 05:10:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36225 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhJYJKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 05:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635152891; x=1666688891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=CjAdXMnakyluZbjWl5Xa5MqruQNYhsEtDiz/4+GVDDg=;
  b=R6xGrtl5N29z+JxIgjZMB63H8QmRD8AoI2Zw6LW0cU+CUBblnq+NjLur
   DyBOdcKJXAY/UiJF50KSYv7gXsCokE7n6aV4pHq7HgfvVypbUbkUAu4ke
   CjrzIjU+vMjQ7kINJJFG9JJPPZfqP2Q9zasKLoFU4kxLuQ64XDIXqfhxP
   4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 02:08:11 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 02:08:10 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 02:08:04 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v2 2/3] usb: dwc3: qcom: Add multi-pd support
Date:   Mon, 25 Oct 2021 14:37:30 +0530
Message-ID: <1635152851-23660-3-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd support to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
v2:
Added error handling and detach function.Used attach_by_id function.

 drivers/usb/dwc3/dwc3-qcom.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01..efbd34a 100644
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
@@ -89,6 +90,14 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+
+	/* power domain for cx */
+	struct device		*pd_cx;
+	struct device_link	*pd_link_cx;
+
+	/* power domain for usb gdsc */
+	struct device		*pd_usb_gdsc;
+	struct device_link	*pd_link_usb_gdsc;
 };
 
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
@@ -521,6 +530,79 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	return 0;
 }
 
+static int dwc3_qcom_attach_pd(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	int ret;
+
+	/* Do nothing when in a single power domain */
+	if (dev->pm_domain)
+		return 0;
+
+	qcom->pd_cx = dev_pm_domain_attach_by_id(dev, 0);
+	if (IS_ERR_OR_NULL(qcom->pd_cx)) {
+		dev_err(dev, "Failed to attach cx pd.\n");
+
+		if (!qcom->pd_cx)
+			return -EINVAL;
+		else
+			return PTR_ERR(qcom->pd_cx);
+	}
+
+	qcom->pd_link_cx = device_link_add(dev, qcom->pd_cx,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+	if (!qcom->pd_link_cx) {
+		dev_err(dev, "Failed to add device_link to cx pd.\n");
+		ret = -EINVAL;
+		goto detach_cx_pd;
+	}
+
+	qcom->pd_usb_gdsc = dev_pm_domain_attach_by_id(dev, 1);
+	if (IS_ERR_OR_NULL(qcom->pd_usb_gdsc)) {
+		dev_err(dev, "Failed to attach usb gdsc pd.\n");
+		if (!qcom->pd_usb_gdsc)
+			ret = -EINVAL;
+		else
+			ret = PTR_ERR(qcom->pd_usb_gdsc);
+		goto del_cx_link;
+	}
+
+	qcom->pd_link_usb_gdsc = device_link_add(dev, qcom->pd_usb_gdsc,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+	if (!qcom->pd_link_usb_gdsc) {
+		dev_err(dev, "Failed to add device_link to usb gdsc pd.\n");
+		ret = -EINVAL;
+		goto detach_gdsc_pd;
+	}
+
+	return 0;
+
+detach_gdsc_pd:
+	dev_pm_domain_detach(qcom->pd_usb_gdsc, true);
+del_cx_link:
+	device_link_del(qcom->pd_link_cx);
+detach_cx_pd:
+	dev_pm_domain_detach(qcom->pd_cx, true);
+	return ret;
+}
+
+static void dwc3_qcom_detach_pd(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+
+	if (dev->pm_domain)
+		return;
+
+	device_link_del(qcom->pd_link_usb_gdsc);
+	dev_pm_domain_detach(qcom->pd_usb_gdsc, true);
+	device_link_del(qcom->pd_link_cx);
+	dev_pm_domain_detach(qcom->pd_cx, true);
+}
+
 static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 {
 	struct device		*dev = qcom->dev;
@@ -837,6 +919,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto interconnect_exit;
 
+	ret = dwc3_qcom_attach_pd(dev);
+	if (ret)
+		goto interconnect_exit;
+
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
 	pm_runtime_set_active(dev);
@@ -878,6 +964,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	}
 	qcom->num_clocks = 0;
 
+	dwc3_qcom_detach_pd(dev);
 	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
 
-- 
2.7.4

