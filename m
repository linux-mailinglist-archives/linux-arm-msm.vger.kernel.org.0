Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87C3B5DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 14:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhF1ML1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 08:11:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6161 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbhF1ML0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 08:11:26 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Jun 2021 05:09:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jun 2021 05:08:59 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Jun 2021 17:38:32 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 7B60F3A48; Mon, 28 Jun 2021 17:38:31 +0530 (IST)
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
Subject: [PATCH v8 6/6] usb: dwc3: qcom: Keep power domain on to support wakeup
Date:   Mon, 28 Jun 2021 17:38:17 +0530
Message-Id: <1624882097-23265-7-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If wakeup capable devices are connected to the controller (directly
or through hubs) at suspend time keep the power domain on in order
to support wakeup from these devices.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
Checking phy_power_off flag instead of usb_wakeup_enabled_descendants 
to keep gdsc active.

 drivers/usb/dwc3/dwc3-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 82125bc..ba31aa3 100644
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
@@ -355,9 +356,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	u32 val;
 	int i, ret;
 
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
+
 	if (qcom->is_suspended)
 		return 0;
 
+	if (!dwc->phy_power_off && dwc->xhci)
+		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+
 	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
 	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 		dev_err(qcom->dev, "HS-PHY not in L2\n");
@@ -382,9 +389,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	int ret;
 	int i;
 
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
+
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (dwc->xhci)
+		genpd->flags &= ~GENPD_FLAG_ACTIVE_WAKEUP;
+
 	if (device_may_wakeup(qcom->dev))
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

