Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC70177CFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgCCRMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35950 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730672AbgCCRMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id j16so5369595wrt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tOKDkyUmAMjWXMziJpbUMfDorD9PY/k8abOKzPT2TKY=;
        b=uomHMbW9ekhiV44ysS9cyvZ9tL7y1E7JYc1HMpdfBMEbT9d5Ow3RKbO/B8VpiBo/ok
         48kCLGVn+SmsTKdBNKKQxImm+QjMO4TsQsSwFmy+G9wTNd616cPPYznUNBWfAZWdcG98
         UDiYvF7+Zr6yHblKJX0HN8NFZrPNNG+pfiJ7X5M+T2PUBMAKQWGQkoHPYWFZURCg9z3y
         9/GWeSiAiAJJM+JT8N8d7OrrZZYT5KZkrpqg9BeuN6e7QX6FATpVOeI9bdnrsIT4tRq3
         CckH1Ef/gk/QRw/ooSmH1yXzfkXe+/roCqZDcRAn/68HO1z8g873SF5KuYnxsPM8tcUP
         13qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tOKDkyUmAMjWXMziJpbUMfDorD9PY/k8abOKzPT2TKY=;
        b=Gpmv2ErMgCoEoCrbzRlLUhtZwnXuOk7sJtDmEJUPaHepzFOtHT1LGq7XjhR50jq9zN
         svN7DYw35bgkLi27B7FUK3sVNcrNnbskUiQkt/pdNcrpf4u0RdehYYecX4n72L+rLCFS
         1juyvnuE0lYwvG1bSVIMdRrcqTrw0B4KIpOkWQOm2smqGm9Nd87T6WeRGawIK8RDPbFT
         k5xo7EQrK3GBapwzj/Fe+DVCzq6HzDWSpYPM2WqZXfY5n9vK14TKAS19V2OEZ7MgFbmd
         5r6Z3YYKoyj44lMuac8vvW74wGhd3/ggFhQ3xFqpyPehhVR5P64Uc+MbQIQqaMCn/IQ7
         IchA==
X-Gm-Message-State: ANhLgQ1Y5PTBZ1KTXvHEq4TEgadpaWe9h3gyp87bQclRkLPslD7npg35
        whsZ+A5WTvHIJpfhe6bRRweIrS9MNJ8=
X-Google-Smtp-Source: ADFU+vsxxytqy/j85IVjnrdfu0A9gIGsCA9PPaP2vsFxVyxsBQHwkxnO09aDb/KALLKDPd3+l8vjww==
X-Received: by 2002:adf:f504:: with SMTP id q4mr6131687wro.28.1583255524715;
        Tue, 03 Mar 2020 09:12:04 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
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
        devicetree@vger.kernel.org
Subject: [PATCH v7 10/18] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Tue,  3 Mar 2020 17:11:51 +0000
Message-Id: <20200303171159.246992-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the ability to probe and enumerate a connector based on
usb-conn-gpio.

You would use usb-conn-gpio when a regulator in your system provides VBUS
directly to the connector instead of supplying via the USB PHY.

The parent device must have the "usb-role-switch" property, so that when
the usb-conn-gpio driver calls usb_role_switch_set_role() the notification
in dwc3 will run and the block registers will be updated to match the state
detected at the connector.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 331c6e997f0c..2ec1ae30bcc5 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -538,9 +539,30 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 	return 0;
 }
+
+static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
+{
+	struct device		*dev = dwc->dev;
+	struct device_node	*np = dev->of_node, *conn_np;
+	int			ret = 0;
+
+	conn_np = of_get_child_by_name(np, "connector");
+	if (!conn_np) {
+		dev_dbg(dev, "no connector child node specified\n");
+		goto done;
+	}
+
+	if (of_device_is_compatible(conn_np, "gpio-usb-b-connector"))
+		ret = of_platform_populate(np, NULL, NULL, dev);
+done:
+	of_node_put(conn_np);
+	return ret;
+}
+
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+#define dwc3_register_gpio_usb_connector(x) 0
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -556,6 +578,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		ret = dwc3_setup_role_switch(dwc);
 		if (ret < 0)
 			return ret;
+		ret = dwc3_register_gpio_usb_connector(dwc);
+		if (ret < 0)
+			return ret;
 	} else if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-- 
2.25.1

