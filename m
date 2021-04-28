Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C15436D18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 07:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbhD1FNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 01:13:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34420 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbhD1FNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 01:13:16 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 27 Apr 2021 22:12:32 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Apr 2021 22:12:31 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 Apr 2021 10:42:04 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0686139A6; Wed, 28 Apr 2021 10:42:02 +0530 (IST)
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
Subject: [PATCH v7 5/5] usb: dwc3: qcom: Keep power domain on to support wakeup
Date:   Wed, 28 Apr 2021 10:41:56 +0530
Message-Id: <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If wakeup capable devices are connected to the controller (directly
or through hubs) at suspend time keep the power domain on in order
to support wakeup from these devices.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 82125bc..1e220af 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -17,9 +17,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_domain.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 
@@ -354,10 +356,19 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
 	int i, ret;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct usb_hcd  *hcd;
+	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
 
 	if (qcom->is_suspended)
 		return 0;
 
+	if (dwc->xhci) {
+		hcd = platform_get_drvdata(dwc->xhci);
+		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+	}
+
 	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
 	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 		dev_err(qcom->dev, "HS-PHY not in L2\n");
@@ -382,9 +393,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
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

