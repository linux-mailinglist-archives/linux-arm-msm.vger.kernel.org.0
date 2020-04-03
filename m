Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D4D19D0A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 09:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbgDCHCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 03:02:00 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34145 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbgDCHCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 03:02:00 -0400
Received: by mail-pj1-f66.google.com with SMTP id q16so666367pje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 00:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6x3raJsWJrKBOs4KmDhl3DHzaY6d4WRAbl46YPhMahs=;
        b=TvfXeIBa30JUm4/yO+K2Y3WiNj+8gvaEw+eZ/ORQgbnxUPkb/bXsI/mMkjOJ0iMZap
         sjDs170Wt4iFY6vnpwFJk4ZlRjsgIpbgfS951YM5+hjnzTxaQLf4oEyEt7j5cD+hoIcA
         8RnzuevlG/yQ6z/2g/AUIeCmb83XbuhhFDaAWdfBbL0MfwTBcr1efVYrZwzd4NJIO4Lq
         dVhaMsFnYrnC+iY5zvmtZTiUZp8c5WL5okSo7jnXcrqrJO3zUvWYmvXcr0eSE0NC39Ve
         BatwD+9kYwXyOgd0LYtTgTecHJEGesqRa/BjPyraJeYi6k+u4U9BPBIhk/E8L14s18L4
         yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6x3raJsWJrKBOs4KmDhl3DHzaY6d4WRAbl46YPhMahs=;
        b=MKnoxBlh8pcOxuAeKl0j14An0MN/yXnJd8y7JJmHVog/1C7TP+raDIr2lLC3Ncoden
         z8XLjUmkGWimnMqyk3GEGmK7jVN9Wly1YlnA2YyGt8tY2C2hWuMJWho9Wi4JIh6iSIpT
         12Aqta/3pIbbU2Y185HvXLme2bThSSfOqM8GIuoafBstte1E19oU6XGmqi+eRa8BM/YX
         0HOe+1fdAn7ODa2OUFG62kaFvwdyl3NSbr9Jkf26E7nf4261tyR4Z+UrHTqZTrDHktQW
         zP9QzvqfZwH1q7frV84GBWJe0HYrLnyYHkyVF024r0Jyd7MMrKNfl6YOC5BtxE1O9NwU
         fR3g==
X-Gm-Message-State: AGi0Pua0lhiw6ja3tMGFbKfhgw2Ykavvuh8N4HvQJV3IjF7u33lb4Qgg
        Iokolsas9oIT4ZYqBqMGfmJddg==
X-Google-Smtp-Source: APiQypLH2xma3A/qCqnkzFp+pxTjvIbI9dx5dmYQp68ewi2c/AYzvdEjeRX97EIuL2QUocN7/X37PQ==
X-Received: by 2002:a17:902:7c89:: with SMTP id y9mr6424581pll.49.1585897319187;
        Fri, 03 Apr 2020 00:01:59 -0700 (PDT)
Received: from localhost ([45.127.44.53])
        by smtp.gmail.com with ESMTPSA id a24sm5195500pfl.115.2020.04.03.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 00:01:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, lukasz.luba@arm.com, mka@chromium.org,
        daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: thermal: Add yaml bindings for thermal sensors
Date:   Fri,  3 Apr 2020 12:31:46 +0530
Message-Id: <a91b5603caea5b8854cc9f5325448e4c7228c328.1585748882.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585748882.git.amit.kucheria@linaro.org>
References: <cover.1585748882.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As part of moving the thermal bindings to YAML, split it up into 3
bindings: thermal sensors, cooling devices and thermal zones.

The property #thermal-sensor-cells is required in each device that acts
as a thermal sensor. It is used to uniquely identify the instance of the
thermal sensor inside the system.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
 .../bindings/thermal/thermal-sensor.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml

diff --git a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
new file mode 100644
index 0000000000000..fcd25a0af38c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0)
+# Copyright 2020 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/thermal-sensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Thermal sensor binding
+
+maintainers:
+  - Amit Kucheria <amitk@kernel.org>
+
+description: |
+  Thermal management is achieved in devicetree by describing the sensor hardware
+  and the software abstraction of thermal zones required to take appropriate
+  action to mitigate thermal overloads.
+
+  The following node types are used to completely describe a thermal management
+  system in devicetree:
+   - thermal-sensor: device that measures temperature, has SoC-specific bindings
+   - cooling-device: device used to dissipate heat either passively or actively
+   - thermal-zones: a container of the following node types used to describe all
+     thermal data for the platform
+
+  This binding describes the thermal-sensor.
+
+  Thermal sensor devices provide temperature sensing capabilities on thermal
+  zones. Typical devices are I2C ADC converters and bandgaps. Thermal sensor
+  devices may control one or more internal sensors.
+
+properties:
+  "#thermal-sensor-cells":
+    description:
+      Used to uniquely identify a thermal sensor instance within an IC. Will be
+      0 on sensor nodes with only a single sensor and at least 1 on nodes
+      containing several internal sensors.
+    enum: [0, 1]
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    // Example 1: SDM845 TSENS
+    soc: soc@0 {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            /* ... */
+
+            tsens0: thermal-sensor@c263000 {
+                    compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
+                    reg = <0 0x0c263000 0 0x1ff>, /* TM */
+                          <0 0x0c222000 0 0x1ff>; /* SROT */
+                    #qcom,sensors = <13>;
+                    interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                                 <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+                    interrupt-names = "uplow", "critical";
+                    #thermal-sensor-cells = <1>;
+            };
+
+            tsens1: thermal-sensor@c265000 {
+                    compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
+                    reg = <0 0x0c265000 0 0x1ff>, /* TM */
+                          <0 0x0c223000 0 0x1ff>; /* SROT */
+                    #qcom,sensors = <8>;
+                    interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                                 <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+                    interrupt-names = "uplow", "critical";
+                    #thermal-sensor-cells = <1>;
+            };
+    };
+...
-- 
2.20.1

