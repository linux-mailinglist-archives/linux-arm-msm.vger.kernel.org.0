Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB91417A5CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 13:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCEM4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 07:56:54 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37961 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgCEM4y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 07:56:54 -0500
Received: by mail-pf1-f194.google.com with SMTP id g21so82668pfb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 04:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dP34NIY3vUcrPIJjDeu/Blhnqm3Xgj1V/x7fdPviNVM=;
        b=x/GCpm+r1h1NoS7Eud+OL0RUercw7svJlacWGmfEqgaDRzhtpKleikRLx7oJb0+4NX
         63XT1bn1EE1MPiLj1eAkPqpPSWjsKw1VjNep3qZToeZvkig3l5dcbPrc6LPyMyVIaswj
         OuhiETItkz1V2Jz50M/7N5ROtoerhySQ8tuU0MygcECub83bxBWOgSE58OXGA1DlLgec
         p0v3tRQUnoQ9gsZ/VjNwr4JuRdD8Yo8w5fmIM/y+QlcZw4O7He4iIHXu1tY6bWoBmIBc
         eBKlThF/7rGYpksUFIdxHwd/Cq8G5Yq/qzZkCjp6GKFgrY7VJ2nf6FxMA4mfZbOUuF5z
         FJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dP34NIY3vUcrPIJjDeu/Blhnqm3Xgj1V/x7fdPviNVM=;
        b=WKmK0umDtHHYK/HGPrtnugkCL2JnnsFLK7MNTnPRNpNssk3cma7eAqUXbuqJPIY7Qj
         MCO3X9fR93DKdurCE46MSF+Ha/32fwwlToVGHAl89kcVbuvYFQcUmM6ue51lBOeau16V
         TGdYJ6tPCVl+QHpsHUKnBXX4+Z/5SlTZ+zlcCmbzYP7QEy7BkICUGAqo/LOkEtxKhJ1s
         CC2wqu++pzktHPo4DKO/N0KpmBZ1ZxcEKv5ialQMg9IpEELGiSfmoeKAJCXgA2Y5XAYx
         3jmZQK4eob37eia95khGHynabb0kzTtXhqkYnYBgyVonXp3DrgJTVsQf8H1W07P7CN2J
         15cw==
X-Gm-Message-State: ANhLgQ0K/RyCgfaUzwPenvaDIPoCrHxbJ+M5dJNW4binH8ST7GYQ5EMS
        8o9HMAtDv0Ixem5DHWs8HWm5mQ==
X-Google-Smtp-Source: ADFU+vuoCqdaiaMQfZ9881Jq92A8L39XbWt2O3FasIp11VKMI8ZgvI/QGHj3wFpE7kQHPwy2HudSOw==
X-Received: by 2002:a62:7890:: with SMTP id t138mr8314473pfc.8.1583413012677;
        Thu, 05 Mar 2020 04:56:52 -0800 (PST)
Received: from localhost ([103.195.202.216])
        by smtp.gmail.com with ESMTPSA id j12sm16697389pga.78.2020.03.05.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 04:56:51 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: thermal: Add yaml bindings for thermal sensors
Date:   Thu,  5 Mar 2020 18:26:41 +0530
Message-Id: <93466e6c031c0084de09bd6b448556a6c5080880.1583412540.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583412540.git.amit.kucheria@linaro.org>
References: <cover.1583412540.git.amit.kucheria@linaro.org>
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
---
 .../bindings/thermal/thermal-sensor.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml

diff --git a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
new file mode 100644
index 0000000000000..920ee7667591d
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
+   - cooling-device: device used to dissipate heat either passively or artively
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

