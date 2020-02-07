Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D300155F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgBGUR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:17:56 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37109 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbgBGURE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:17:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so400367wru.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=escQMdMChLaA5L2nhd2tLBaF0R66KZITD7/HL10B5xc=;
        b=MfPz2BfzBwP/KUCZVk4v8jzjxP/Q5t8/mJGudnix8e/RULNYvDQWhO73QSDrCE8IyV
         m1e+aXV3zbQ6FckE0PXy7ZuVkqrqQpxGxMTB16LfBBgLVNZyHYzHPidvOXg8o3PVqnsS
         cZ0lqio0Wx+nC+ZNFLa7NVngWJ4eMfQZ6Pm/ZCuCMsHo6gDkDJzK1adGDzYC3MjIX6wD
         euHmTXK27gBKaBB3Lg8wpl+5s80bGm8u8PLeZZHb7w9qkdV4wK093Yi+n/V5W63Qj7n5
         7XCtIFHiqfFG9p/5NI5eTVGSCsWltEFbYVDOIM/sxgzDz1+5wThx3rmO15+ctF/2Zzk9
         Kp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=escQMdMChLaA5L2nhd2tLBaF0R66KZITD7/HL10B5xc=;
        b=mQ8HsDBGeLYX1ZNGxdjO8kbzjyaPuMUZRex0JlNjMbW9X/Ycy1LCgJTTH/iUzTe5AC
         FHFCvdM7BFxxkdiAu21um/H9L5eDSkbtViIRfcwU0nRwwxUzKykZqYa/QHjEJ+0zUE8c
         BtY+HJ1sYt90jM4ke0mTTXrMA/btFPFd1oHW/9h/Zc+MyWid02ZYYqD4/i6U6LuiblMa
         CPOgOGa3B/Rd+hknL3975WBOk/YwBqM67GHFh8i5Xk4Pa71pbcqiA6gNMwWo/jjb+h2q
         TAy1x/Jx+gxZggfopSxuCaM0cDAl6a44eo3fddbpArloAXH5+jsewhGIHBT6wDoe68ow
         Q4wQ==
X-Gm-Message-State: APjAAAWcxYPLobGl84OAORuF4BGh+yztKXqrYv3aifeNfd4JClL31tFK
        vTl+WvgWEuJDF9qLWBLL5da7svlO03E=
X-Google-Smtp-Source: APXvYqy+eha3zbKXgThRJ4HT8Y+WlVy0Be2Z+ZxppG2V4ZG3jN7M0vCN+nY0gULQ9GOiAs65sSYL1g==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr693234wrm.89.1581106622815;
        Fri, 07 Feb 2020 12:17:02 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 11/18] usb: dwc3: Add support for a role-switch notifier
Date:   Fri,  7 Feb 2020 20:16:47 +0000
Message-Id: <20200207201654.641525-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Role-switching is a 1:1 mapping between a producer and a consumer. For DWC3
we have some vendor specific wrappers, notably the qcom wrapper that want
to toggle some PHY related bits on a USB role switch.

This patch adds a role-switch notifier to the dwc3 drd code. When the USB
role-switch set() routine runs, the notifier will fire passing the notified
mode to the consumer, thus allowing vendor specific fix-ups to toggle from
the role-switching events.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/core.h | 19 +++++++++++++++++++
 drivers/usb/dwc3/drd.c  | 17 +++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a99e57636172..c2e85f587674 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -955,6 +955,7 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_sw_nl: role switch notifier list
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -1089,6 +1090,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct raw_notifier_head role_sw_nl;
 
 	u32			fladj;
 	u32			irq_gadget;
@@ -1499,4 +1501,21 @@ static inline void dwc3_ulpi_exit(struct dwc3 *dwc)
 { }
 #endif
 
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
+int dwc3_role_switch_notifier_register(struct dwc3 *dwc,
+				       struct notifier_block *nb);
+int dwc3_role_switch_notifier_unregister(struct dwc3 *dwc,
+					 struct notifier_block *nb);
+#else
+static inline int
+dwc3_role_switch_notifier_register(struct dwc3 *dwc,
+				   struct notifier_block *nb)
+{ return 0; }
+
+static inline int
+dwc3_role_switch_notifier_unregister(struct dwc3 *dwc,
+				     struct notifier_block *nb)
+{ return 0; }
+#endif
+
 #endif /* __DRIVERS_USB_DWC3_CORE_H */
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index c1825fd655f6..8d3f1599d422 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -496,6 +496,8 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
 	}
 
 	dwc3_set_mode(dwc, mode);
+	raw_notifier_call_chain(&dwc->role_sw_nl, mode, NULL);
+
 	return 0;
 }
 
@@ -558,6 +560,18 @@ static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
 	return ret;
 }
 
+int dwc3_role_switch_notifier_register(struct dwc3 *dwc,
+				       struct notifier_block *nb)
+{
+	return raw_notifier_chain_register(&dwc->role_sw_nl, nb);
+}
+
+int dwc3_role_switch_notifier_unregister(struct dwc3 *dwc,
+					 struct notifier_block *nb)
+{
+	return raw_notifier_chain_unregister(&dwc->role_sw_nl, nb);
+}
+
 #else
 #define dwc3_setup_role_switch(x) 0
 #define dwc3_register_gpio_usb_connector(x) 0
@@ -579,6 +593,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		ret = dwc3_register_gpio_usb_connector(dwc);
 		if (ret < 0)
 			return ret;
+
+		RAW_INIT_NOTIFIER_HEAD(&dwc->role_sw_nl);
+
 	} else if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-- 
2.25.0

