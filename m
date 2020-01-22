Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC993145BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 19:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgAVS5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 13:57:23 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33482 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbgAVS42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 13:56:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so276553wrq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 10:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0F3sFz0+h3FHMff0QjQ0SHaRu2x6ApQiXqi+8cwCoc=;
        b=C+vwCnMDymtRpxwn72o5Ewdo/bwsLCteOPf+jkQ2GBhk8Qn2+0IC0hs1cWB9EVE0GI
         aT5rE3rKqiPB/RqkDseqo1Fq/ur+6LDw6LBqhc6/GyLmEwykGq5+FarpEm61/ahGhEkm
         347gbM1BJeGSTMdd6C1BxiO7dsnO5dYXnN4dsYFgjj/1dM2vX48atz5TU8hHN2p6nZ4G
         jkvNwGlil1j+D9wLsVpZqNYaocOoYESzCum5+oIMo8vMVSbopnsSGdJ4Kn2udfPDrIei
         nonZ8OvqZfiylc5v90lGq/poDg5taW1RQnHfCbk6dhrJuCU3vFNHuxObosqdeGCgBI0q
         ERQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0F3sFz0+h3FHMff0QjQ0SHaRu2x6ApQiXqi+8cwCoc=;
        b=HO+KJ+M1/4epYzmRUGoY3IijqULCAkkXlQykGbJI6Ti5mmStwd3mdlLVQSXA/gArQ3
         QtL53VFdg+CGOt4P1ELar97UBebQHddNlXHB2cgCNpPxMlQVtilw+0Hj0gTtZ6Blgv83
         mgjUN2DmmNMiDM9FU3ZdabL+8hvJOHr4kl5IphkNM/vlewbSEyn5SuyWKuKA+unG1jZx
         j/GvZJLE4bGoejasYF7T0JwSocSzEWTvFETOARSeUIIr3c1jFuD3+Rukqb+OM9eAiTRe
         zPOm/wYnmME6ZhxlIoiRCEP6QUCDcxim4LVVkjUIOF7qeBpiDbU8xpm73Ako87stkO5n
         3xUA==
X-Gm-Message-State: APjAAAV8LyJwomZJKRDrjjcmi8seDZQhbQLL3Y/LDBCujgUDwDEvRZw0
        f0Ys4djaUivTwrgRdhWOQfgwMVer9bvsOg==
X-Google-Smtp-Source: APXvYqxfIp3fzYVdC1qlDFZye4heP/NHEtW3pA2Wyi5LSX2OlDxJCt2O4BA/ZVgG6dKYLjCTtr/79Q==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr12793936wrq.206.1579719386983;
        Wed, 22 Jan 2020 10:56:26 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:26 -0800 (PST)
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
Subject: [PATCH v3 11/19] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Wed, 22 Jan 2020 18:56:02 +0000
Message-Id: <20200122185610.131930-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
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

