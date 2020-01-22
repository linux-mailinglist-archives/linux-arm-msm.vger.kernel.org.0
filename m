Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677F2145C00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 19:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgAVS5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 13:57:24 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44707 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgAVS42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 13:56:28 -0500
Received: by mail-wr1-f67.google.com with SMTP id q10so199383wrm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 10:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9vQo2BUKvTZKBqgtVFhiO/j+kUrAdD+M3634Gyofhs=;
        b=ou4EoHou7Q50fU8dOW/nqju3vqACAjSDyfHB4fbDPOH8V43OLT8om+hU83XvyTP+le
         8Ga+aDtlGOtEzYQerxanCXM61B02pcnRwaebyrw8yK8qhQ25GoEzNYBIJhICvL8g13xY
         tMVjnQLILCSGNvslPwIxiexSW1PLrNGBUxmJXrjqEOANL04wf06Wp+4l5pSu4H4qxTW0
         6EDSz/Ec3wzw4DwEIcYT1am9ahUQhJu/+ft2RPIbKGLfKBxaFTBqfm+qSipvfv/OLxbW
         cwgUdQcN7Bj+PjZTPApTYg0qyS5GHZPcgAbuH+FJzyorNqJdRW2GgMDX0Lh3kEA/+e13
         VUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9vQo2BUKvTZKBqgtVFhiO/j+kUrAdD+M3634Gyofhs=;
        b=lY4VCUA8isKE7/+Li/ZJY7jhwtGtZSa9ufUI03Zh7c7CjsCMWw+2456HB4a3/RCTgH
         UgIyzE5246eHAGnUhya4igKkC1DJ3hCjPtHYPYnwXABgcBzxQAKmn8el5kbPmg/+oulF
         0PLVa9a8jNz9z1PCCTdCAhRiLZnjMEqXm5/Q3Y2iJsNH/A6XKH/zZCnLrgTEXm3Gaszb
         S6VKV+2PqvIBoTIF8Vu0BKyaNnuic2QLKeMD+3WQew463v7vU6TquCixTX32xX72inHa
         1mcalTu/r5egxDhTrUavCQGMdjbav3MYraRo5OAPW6W1VmO8q/9U4SxNSiG4OfRMMFfe
         B4Zw==
X-Gm-Message-State: APjAAAXdx8OHhw7uePt50a+VyR/5lYwdZB2woQYHMnFbXaXxwSA9Q75z
        9cjOC8DfKaiLwmQQ8F6H5VMhS8n0JrFC1g==
X-Google-Smtp-Source: APXvYqyRdVSE2Bk2FAJK3SulqWL3IiWVNTBVBDc6bDYG8AzE+QuHsL5fOPBpnNAedk58czzb8M5YTA==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr12219049wrq.137.1579719385676;
        Wed, 22 Jan 2020 10:56:25 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:25 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 10/19] usb: dwc3: Add support for role-switch-default-mode binding
Date:   Wed, 22 Jan 2020 18:56:01 +0000
Message-Id: <20200122185610.131930-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Stultz <john.stultz@linaro.org>

Support the new role-switch-default-mode binding for configuring
the default role the controller assumes as when the usb role is
USB_ROLE_NONE

This patch was split out from a larger patch originally by
Yu Chen <chenyu56@huawei.com>

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/drd.c  | 25 ++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a99e57636172..57d549a1ad0b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -955,6 +955,8 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_switch_default_mode: default operation mode of controller while
+ *			usb role is USB_ROLE_NONE.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -1089,6 +1091,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	enum usb_dr_mode	role_switch_default_mode;
 
 	u32			fladj;
 	u32			irq_gadget;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 3b57d2ddda93..865341facece 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -491,7 +491,10 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	default:
-		mode = DWC3_GCTL_PRTCAP_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			mode = DWC3_GCTL_PRTCAP_HOST;
+		else
+			mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	}
 
@@ -517,7 +520,10 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
 		role = dwc->current_otg_role;
 		break;
 	default:
-		role = USB_ROLE_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			role = USB_ROLE_HOST;
+		else
+			role = USB_ROLE_DEVICE;
 		break;
 	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -527,6 +533,19 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
+	const char *str;
+	u32 mode;
+	int ret;
+
+	ret = device_property_read_string(dwc->dev, "role-switch-default-mode",
+					  &str);
+	if (ret >= 0  && !strncmp(str, "host", strlen("host"))) {
+		dwc->role_switch_default_mode = USB_DR_MODE_HOST;
+		mode = DWC3_GCTL_PRTCAP_HOST;
+	} else {
+		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
+		mode = DWC3_GCTL_PRTCAP_DEVICE;
+	}
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
@@ -535,7 +554,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
-	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
+	dwc3_set_mode(dwc, mode);
 	return 0;
 }
 #else
-- 
2.25.0

