Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6870327C29D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 12:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgI2KsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 06:48:08 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59739 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgI2KsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 06:48:08 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Sep 2020 03:48:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Sep 2020 03:48:05 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Sep 2020 16:17:48 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id B2C002D57; Tue, 29 Sep 2020 16:17:46 +0530 (IST)
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
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 1/5] usb: dwc3: core: Host wake up support from system suspend
Date:   Tue, 29 Sep 2020 16:17:28 +0530
Message-Id: <1601376452-31839-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode so that it can be wake up by devices.
Added hs_phy_flags and ss_phy_flags to check connection status and
set phy mode and configure interrupts.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/core.c | 14 +++-----------
 drivers/usb/dwc3/core.h |  3 +++
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 385262f..c32ed10 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1663,10 +1663,6 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg)) {
-			dwc3_core_exit(dwc);
-			break;
-		}
 
 		/* Let controller to suspend HSPHY before PHY driver suspends */
 		if (dwc->dis_u2_susphy_quirk ||
@@ -1724,13 +1720,9 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg)) {
-			ret = dwc3_core_init_for_resume(dwc);
-			if (ret)
-				return ret;
-			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
-			break;
-		}
+
+		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
+
 		/* Restore GUSB2PHYCFG bits that were modified in suspend */
 		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
 		if (dwc->dis_u2_susphy_quirk)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 83b6c87..cd385a8 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1096,6 +1096,9 @@ struct dwc3 {
 
 	bool			phys_ready;
 
+	unsigned int            hs_phy_flags;
+	unsigned int            ss_phy_flags;
+
 	struct ulpi		*ulpi;
 	bool			ulpi_ready;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

