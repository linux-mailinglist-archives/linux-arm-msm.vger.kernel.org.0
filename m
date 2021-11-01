Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AC044147B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 08:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhKAH46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 03:56:58 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:49623 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231402AbhKAH4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 03:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635753261; x=1667289261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=WqegnewrNuQ3nBCJakumAYPktDzd/O0Hg//x5CeiZyI=;
  b=FEh31ZYDPvdL8YPS7jzZ8Q7ZHUd5nrQE9INTAnt+3Dm0Wue8hQp7waSp
   FeNdsRWvoBmCEvIKHa0qJNCYtNbo410XEJGhD6E4XK9y1Wry5UKE8rP/d
   O6x7e9VF7WBR5dpPuAdNw4tM2Ta6Qdl+0jOK1eC5MJx/RUg8KkN7gtajI
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Nov 2021 00:54:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 00:54:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:54:20 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:54:16 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v9 5/5] usb: dwc3: qcom: Keep power domain on to support wakeup
Date:   Mon, 1 Nov 2021 13:23:44 +0530
Message-ID: <1635753224-23975-6-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If wakeup capable devices are connected to the controller (directly
or through hubs) at suspend time keep the power domain on in order
to support wakeup from these devices.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 356f4f8..23bf2c1 100644
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
@@ -340,10 +341,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
 	int i, ret;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
 
 	if (qcom->is_suspended)
 		return 0;
 
+	if (device_may_wakeup(&dwc->xhci->dev) && dwc->xhci)
+		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+
 	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
 	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 		dev_err(qcom->dev, "HS-PHY not in L2\n");
@@ -367,10 +373,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 {
 	int ret;
 	int i;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
 
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (dwc->xhci)
+		genpd->flags &= ~GENPD_FLAG_ACTIVE_WAKEUP;
+
 	if (device_may_wakeup(qcom->dev))
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
2.7.4

