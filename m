Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4E4142FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 17:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbgATQcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 11:32:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34158 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729462AbgATQbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 11:31:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so133229wrr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0F3sFz0+h3FHMff0QjQ0SHaRu2x6ApQiXqi+8cwCoc=;
        b=B/hlEJlTL+fIjLXMxKm3nVoYjnT4XT5RXh4Fr/mW9OuLB4LHCwI0SgJmzOo2Xb9RcI
         ManBCVKlAOW/t3qYFFZWNYjcv7t2lK95GsZ9YW60qHQ4netbjr3LLyD6EnXvFhPsfdAy
         FUbUeMPkXIYRSsKkKa9qZ/G5d8bq3VK43txAwJT0tu4agoIQmBjE7LTfc1KpXwgPwrZ1
         naJtf1gYVc1u5vbY5qtMmukR/pSdLJMBfQmSk3fhcFz42IBsmX9VXB9QELxFZIK3BehO
         HMmxb8KNcdH7NaQi4H33/1YYo8AdC6/SWwE6AEE+MTIjhVnnfyftxViXoWWcGibDS3TJ
         CiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0F3sFz0+h3FHMff0QjQ0SHaRu2x6ApQiXqi+8cwCoc=;
        b=kXPTSWBglTkYwEbsc8Pg4JUjITWdBfciSsj6+NHo2+1EQ+0J8w5Ls2+gBSyfi88XIx
         hm0OO14Mx0obiVudal1gcO77ncchrtlUrpJHv2Tkmz3tcmv82db9uoZTgUCkh6Z+uGdA
         3fP486BCZfbYrOZ9MfipSzMsGADObfUWZy1Cifa1vrq5fZQPuozxU8DEzBypj71dDHs5
         8mLlPZ65w2J4GTE480jL8AriZee9cmsNXH//xg5EO3RbKc7+bFm9lFdKVA5/5B5oeure
         5J4DPrxuL1ytq291yKGousKAzjBvQMVYt4nDlIiVSAFhkEFR4c8zCLqqL+FbK3wa9TBb
         /sow==
X-Gm-Message-State: APjAAAX0nU0VMGS3/Mbw867dZ5fr9CrNzkyuIKYAgkfm6jupXi4mXkyT
        HTzR2EBHEM4q8lZAYCY49p7Dsxw2Vwg=
X-Google-Smtp-Source: APXvYqyNOqDmnv+8BSB1QXFOi3u33eA+uNslImQyu/Uo/GPAvsDSs41AmYIyKFKLifk+xQD6vA/j0g==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr371782wrj.68.1579537860898;
        Mon, 20 Jan 2020 08:31:00 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:00 -0800 (PST)
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
Subject: [PATCH v2 11/19] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Mon, 20 Jan 2020 16:31:08 +0000
Message-Id: <20200120163116.1197682-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
2.25.0

