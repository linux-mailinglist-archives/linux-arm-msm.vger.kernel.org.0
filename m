Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95CC1821CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731218AbgCKTO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:14:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40341 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731202AbgCKTO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id e26so3381659wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KqQ/iZ6acHWZPAsba1wMPoMpaq5MjC2qoVJ8NSKI8L8=;
        b=lmDi33sfyV2lemto8JmDdDcxVVlGb8yGDuHRCaRPUq/zqOKfIjYh902Z2pQMCid9+W
         cFEx3O3r0u3Dx3+jp1YZYEqPAin0p0LZfaZg8UgZME3kk3jyKtyCnVyHsdKvOKys2zdR
         E6cSVcNuGeaQcdqjBgUYGAM83/hrW+1jXvOp9cJYX5dNynb7VyAwTHWp0AFba6wcrPkw
         IzR9ZhGO5yryG7phjjEcUi1N/J0QbdgoxLwDC7tlqTGfZCy7+Zff2FUil5oJhXz/kgqa
         43Vt5ghZJrQJiIZVQAVZN3SukMpx24dTiOoUjMIo47/2Gc0SbGDtlx38kSXIW5q5KegA
         pjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqQ/iZ6acHWZPAsba1wMPoMpaq5MjC2qoVJ8NSKI8L8=;
        b=o0aOMf/WQm2iYmXtvVKzZ7G9TUxSOvwwAfRQSuzoC9QSI0miLVm7WY78NlaAdycZla
         qHF6MmQSL0NZ0GUENJ1rLtBfcum/If4eOZdwlnxh5gnAJzFuWq1BkYlvmDy5Jr/sXX/v
         gytINz876sa7lAS/62yQIcUvMcUcy9hh+zCzIlh/k9y9n2CcLtKkQlLqxdil8U3TGhjZ
         fuxUhY/SdsW0Ju1G38Ijglq8w8cHoeXdrvDpqxdoUNB5cKzxOQQVi4JAYuELn6u6AFOD
         bmlJ+Kqq6B5zVatALKSpM30c/xWIXsmEwFprkHCIWcy1gnTDboZ+apSYVo6GS5qVuL2h
         +uLg==
X-Gm-Message-State: ANhLgQ1+fUquJSs/wPr3QRaHHXOe89mMjx2t8iONLa4zCfYYfTW6kN0J
        MfW4SC/CBTKBwdeIrO33O4Q9gQ==
X-Google-Smtp-Source: ADFU+vv5yioG/fvOMHKjmJf0DJLZbsaNh8WOn0Q5e9U7tmu4Mgr2zIiaOVjLo3TO7YwNUgDOQ9aTNA==
X-Received: by 2002:a7b:cb12:: with SMTP id u18mr199688wmj.153.1583954095797;
        Wed, 11 Mar 2020 12:14:55 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 6/7] usb: dwc3: Add support for a role-switch notifier
Date:   Wed, 11 Mar 2020 19:15:00 +0000
Message-Id: <20200311191501.8165-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
index 2705871ec95e..789e93dd93b4 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -497,6 +497,8 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw, enum usb_role ro
 	}
 
 	dwc3_set_mode(dwc, mode);
+	raw_notifier_call_chain(&dwc->role_sw_nl, mode, NULL);
+
 	return 0;
 }
 
@@ -560,6 +562,18 @@ static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
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
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
@@ -582,6 +596,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
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
2.25.1

