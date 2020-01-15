Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D4413C555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgAOONY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:13:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37987 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730097AbgAOONX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:23 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so15907674wrh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uupSatp1wSHjPtFQUOGaipgCxDGUITI3uZDbwiKKdA=;
        b=UFhBroBK623fOOHnv4hUWAelOBD5EEl7ceoSImfULI8dolkMB+xHhasMiFDPwGSYIE
         QtN15Zcg4KPJfGlLYfSu0WUWPYTmUaHfBm7TtjbLu5zHpflqnwQLrO+Mp8Aq53kY/0U0
         n7+vdXVA+Q20n7vjII7/IE38b4DhF3T0sM492xNPTBwDS2v9GuSIR3WO113is9NkaR0J
         BmXUtWz1dmXSbmRVqCa9Do65TQDEPN89g0CcJIG37KUnCi0o7KLAmLVG/d+0gTjocA9t
         WRcB82VLLqn2PJolZL4RZa2CpZx2zlzOhf8+3cg6+iH3yAY9p88tlKDaD6H8ujwL7DTo
         sQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uupSatp1wSHjPtFQUOGaipgCxDGUITI3uZDbwiKKdA=;
        b=Vz2AboLwIr6cugNEkiXI4dYR1kGAUY798PVwoR2JHeIZWtiIL0MvuSQ+6M5rcV4rfP
         BAsgoxUGKiwPwo7MYIGoJ2xYTIn6lXwepD3bhvBGsiRCcxCcmjx6penmdI4Iz7J4fl/8
         4uB+U9fJZ/883dZS1Jr74bGhGXYGILtIQkfBr2ZKTypMftltzUq7S7wjjnh5oRH+UeZd
         lpECZ68SNxs8UN0u+wQoCMIjI1z/N4/XXNWfhBoO4TLJSCKpk9+cWLI75R4H0eoNrNd6
         hiwKeXGfiwKVBEsL7isGiUAPO3kPb+cwu7Vjd+ZOzCtouxbV/jtOQxB5ZFjfPdQvdzFO
         q8vg==
X-Gm-Message-State: APjAAAV22e+OAxeu0Bk1s1UXKConnD/zCSKE+gRZC4nBzXEEEmNVd4KQ
        qpFsAT7g2/86BZxaL8pAF9xQokWOuUg=
X-Google-Smtp-Source: APXvYqy+y5/WNIlUiRygmiwuZvM1BhCHTwU0YKhbrM9Q0bpz03HYrEIConEdEnUwSo0oTxImfTY/WQ==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr32581140wrq.348.1579097600477;
        Wed, 15 Jan 2020 06:13:20 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:19 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
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
Subject: [PATCH 11/19] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Wed, 15 Jan 2020 14:13:25 +0000
Message-Id: <20200115141333.1222676-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the ability to probe and enumerate a connector based on
usb-conn-gpio. A device node label gpio_usb_connector is used to identify
a usb-conn-gpio as a child of the USB interface.

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
 drivers/usb/dwc3/drd.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 865341facece..c6bb7cb809d5 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -557,9 +558,32 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
+
+static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
+{
+	struct device		*dev = dwc->dev;
+	struct device_node	*np = dev->of_node, *con_np;
+	int			ret;
+
+	con_np = of_get_child_by_name(np, "gpio_usb_connector");
+	if (!np) {
+		dev_dbg(dev, "no usb_connector child node specified\n");
+		return 0;
+	}
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to register usb_connector - %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+#define dwc3_register_gpio_usb_connector(x) 0
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -575,6 +599,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
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
2.24.0

