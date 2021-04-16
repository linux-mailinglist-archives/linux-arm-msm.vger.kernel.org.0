Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C765361DAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242273AbhDPKC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:02:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27882 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbhDPKC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:02:57 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Apr 2021 03:02:33 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Apr 2021 03:02:31 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Apr 2021 15:32:07 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 06B403816; Fri, 16 Apr 2021 15:32:06 +0530 (IST)
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
Subject: [PATCH v6 4/5] usb: dwc3: qcom: Configure wakeup interrupts during suspend
Date:   Fri, 16 Apr 2021 15:31:52 +0530
Message-Id: <1618567313-25373-5-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure interrupts based on hs_phy_mode to avoid triggering of
interrupts during system suspend and suspend the device successfully.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 66183c6..b1e9061 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -316,22 +316,36 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 
 static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
-	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 
-	dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
 
-	dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	else {
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	}
 
 	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
-	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 
-	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
 
-	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	else {
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	}
 
 	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

