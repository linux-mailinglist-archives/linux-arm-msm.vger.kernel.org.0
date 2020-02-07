Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDF7155022
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgBGB7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:23 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37660 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgBGB7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so788402wru.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eyKIMuCGLMoUcPFx2IeRMuTzX/rGZ52BhRtQ7dzOvAo=;
        b=XPivzEKmIjPplCHPNq4sUXh/83PZNHieM4Sp4VpyX5ZiLOFtlTfj09ccORC/hByWpl
         Kyr0u+ZHcASryxvwrbX9bmfHC1mcMxUsqmGOgMqbP0JQ/HdcEiUgqVWMiyfBBPOnPr+G
         /r5B8LeBO6TfxVPVdmz7n87q3wZW7f2mcOPFDACaFqgNo8v6zAkjFzoBrkU/hfPuD+Tv
         r2vo+R0FObZsx0guz8VdRci8LsHF6TO/rQ/xAhfav+raOjaDS9scH+AYiaNEhStFcXGG
         6vtjLws0NGrMXAuHOIzc18PosWFHvAPos1O5VW5CMMwYtfpn/ZPQFJZnbZsFoKXhtKk+
         ZWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eyKIMuCGLMoUcPFx2IeRMuTzX/rGZ52BhRtQ7dzOvAo=;
        b=svOjWTdeS4Whoqf8KAFPDeS6+uly46dCrkbU6xA3l3pI/mdB/6fbX0zC+beple6WuM
         e1r7ZHmz2sKo0sPd2GqzrirWKJGcbzp6az19WTmyMbiZXU/plWEw0QAfQmHWvaZNpB1F
         PEdgWqacuRGRDpu2chIKVOcyJ+x45R2ZGKA91rGnUJSXfmWaPWcMBgGXHrcEfi4Bo4B/
         O1GNCfq+lZYeCBxZxIt7djBQe7SQVGdtwDofZf9/MtBn1Yxau+cHjRwvS2Q9yfKcbV/Z
         Z9yqhs33UshCSFbYnzoDxPc0i8MyBUjcLhQU4uywW6AdJvSKgB5VSMadfq8O5b990IsD
         F2jQ==
X-Gm-Message-State: APjAAAWFxTuCOsjow7AN92/p2r0W3ipctcqzNCEOm4LoXpejKh8atQhu
        O6BO0RvOCjTyKuz6YeUgn3iD2WeHh9s=
X-Google-Smtp-Source: APXvYqxwDKP6Rh33l7a131ghdSf+JnhRF31RFQgP3HFFNFmupwQ2z6ZCBVFpVIvrrallVYFbaqwYig==
X-Received: by 2002:adf:f707:: with SMTP id r7mr1192539wrp.194.1581040759891;
        Thu, 06 Feb 2020 17:59:19 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:19 -0800 (PST)
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
Subject: [PATCH v4 10/18] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Fri,  7 Feb 2020 01:58:59 +0000
Message-Id: <20200207015907.242991-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
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
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index c355166793d0..c1825fd655f6 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -537,8 +538,29 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
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
 #define dwc3_setup_role_switch(x) 0
+#define dwc3_register_gpio_usb_connector(x) 0
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -554,6 +576,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
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

