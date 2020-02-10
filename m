Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A29D1573EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgBJMHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51480 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbgBJMHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:37 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so9673494wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vOm1LXNJhnwimlbtOdMQ8AqBayT1JjO4KI+XVXsMbQ=;
        b=DstRwno7OIow9npa/S6cUSzmuRfag4D5sbzBWRr52oJU4qzkmEylrcVxUUbm8kK0yW
         cIQG3YFigAvPSWuUkgu5yMp47LlCCcaCXgDeVlEPBdX4mG2l3vlJCB6sSr9Vln1yHjKI
         +ETx6MLn5ci64wesmMAqCNWq4Okn2gCEZrqOYT90OrtybWcKPkhO/4rb02Wxo/u6ItzJ
         4FQbU7D075RVk9BqHoyuait4YVPRoySsCF2JWzHhTqpVBbeBG/mOhGaIojhLxkYWgUGo
         ndb0BGy0PleRFd01kG/+peRtgFY7sNn8JGkpBDZZ2vmsJqS0LOguw5VTJXmJWkYfPm3N
         BZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vOm1LXNJhnwimlbtOdMQ8AqBayT1JjO4KI+XVXsMbQ=;
        b=DnlaaWRByyFsvUtIq7AZoCG14j2ZGApWC+1ATjuBN6aJEx23RZ3UpQun3sWF9LWuk8
         9PrEW1gatjip1e+tRGiTTDmugPEDX5N6l691D7ZPw9RSc8ydKfz8pwBNAhEbQn+IYMYC
         XOr0pC5k+4Fg7SxpESNSjEcbbUdMSztafMO1D31x6FLrsS2cx4mHLzaZoMwjTetxKG7+
         /d7JDteQdAwRBWG9DMLI545tH156hBqRQu7kpKWsXbtLo2PmTVD998etCqrj0eARmH/w
         a9fXrYbUMSUKg2cUS4tHTNYwHWfaRUcEYnc3SpjT15x3BGvgd/kbGQe1lTsbsOeEcUkh
         DyjA==
X-Gm-Message-State: APjAAAW+sKvIwlpZ/pJpaAXsfW/Lx3irEXfEIbYiHedMA3J75c51B+kw
        EPl1zo6kf49nzc1TeP8qsDqnYKSaeGg=
X-Google-Smtp-Source: APXvYqxVz2NduFqOu6Xoek9DmJXj5G4kqgPzif1jy60dxYAHvwA5tzhcO1ime/S130QX1FfCZICn8g==
X-Received: by 2002:a05:600c:21c5:: with SMTP id x5mr15575520wmj.72.1581336454143;
        Mon, 10 Feb 2020 04:07:34 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:33 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 11/18] usb: dwc3: Add support for a role-switch notifier
Date:   Mon, 10 Feb 2020 12:07:16 +0000
Message-Id: <20200210120723.91794-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Jack Pham <jackp@codeaurora.org>
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

