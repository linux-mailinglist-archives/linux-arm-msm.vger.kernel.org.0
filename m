Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E071821FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731197AbgCKTQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:16:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51130 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731196AbgCKTO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id a5so3355839wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uJCk+HQYgUH7qWgjKQGPX8ag8V+DQkqOmcR60lBEBw=;
        b=DTDyI5/KA68gkxBsjUHDiz301KxXFfP/qTr0ceS5thjlAGXbEyqOanrRA+YnGSI5hv
         bDIQ2l44yQYfXt+dxgW+hmAl6350SbPvH+gNvQhOfblA84fbeVEGoTnaGSEzCMhwmlYF
         iDa4Xk9oOmei64zlufXXpz+UKf8O6SZ7+FRGVvgwX5+WT39VMu6zpYtMPxjbWmmeJM26
         eAM6qIAF32yIiiJG1MpfXFPFuceift9DquCEFlsWREJbPDQP/HIaMcz7IpV/1TMhox1e
         LNtcNfggHIs4Fx0NHBMIEQ1WkiywMUUVwdEZNckbS22sDwVdq1faXRc3k/4ZrCirXxxJ
         M87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uJCk+HQYgUH7qWgjKQGPX8ag8V+DQkqOmcR60lBEBw=;
        b=t6MN9KZzjqnPnSHnKlEGg4O1FVlfpSzCbeQPcSfC4R/mzP6b1bve9Irxj4xadTwZlB
         9dkpqeF6nOUO8x1v3cVVbmv1HY49WIiDh9Q11zh/WSHUrmAs05z6Ct002/HMzCH3nLDR
         qwxg994rMQQJXsEcSjP9rl12EPHXR1FtnIzILmUiUZXVW+gu53CjpNXea7hdJZ6urAYY
         iYsQDifPQuZrHrhjSJvOOtCvaWlEI1A5yjrf7cZ6lnTlnGyaFeYIyIeNHl+Aui1+ebi2
         qnBXz4Q9PzPloDqJM4UcLLEBCrl+NyV9BJSg41+QABHHcg85+L8YHIDAEwI8YpDMd9vy
         dpXg==
X-Gm-Message-State: ANhLgQ072R45rhTsoRtsTK0xTCc/O+XtgET5el1VRftL7UUOMH8x8e7B
        C95dnsUbGcrHEd3bG6gcYCOTtg==
X-Google-Smtp-Source: ADFU+vtBiBpemFTC15uMfOPHxzMFb1eqF6p+FRAbAGHExH6FcGWz6NITcSVHBIGYMbMjn3vDHo01bw==
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr218306wml.105.1583954094777;
        Wed, 11 Mar 2020 12:14:54 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
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
Subject: [PATCH 5/7] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Wed, 11 Mar 2020 19:14:59 +0000
Message-Id: <20200311191501.8165-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index ba0f6cdc4c71..2705871ec95e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -539,9 +540,30 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
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
@@ -557,6 +579,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
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

