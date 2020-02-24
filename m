Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF3EC169F0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 08:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgBXHUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 02:20:42 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43169 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgBXHUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 02:20:41 -0500
Received: by mail-pf1-f194.google.com with SMTP id s1so4876622pfh.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2020 23:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d17BUbT9BeIhozRgLya99QrlVVsu5JDoV05HFzpYDyI=;
        b=tX4PPsoAZ93qYdTGJqfLDnzMCWiEL3N5LumrMh2+TNF6m+7oLL1F/EyrLxp8necb50
         lRiepTn9LHb9aWKxBomyH/Iaa5/v51oKIB//XnqfstKAsBTut8pSKd8fdWs8xwQHuUzg
         8o8wlUgtf2HJvHwcJejj/aPFf+g3iMDcY0O67nMuaj7aUtWswClNLW6mdlG5ThzeAwGH
         0hDVabld3B5XHbNQebcc4dJ/nHLD0T+lP0B+OHv/3fY0gKFH+tcRw0zKkySPCCZ5OM9d
         f8Z8PibHVvKo9ab7zuC/u8JhdzJ33I3KimAGvdJenvKTatQ6EbleVbIYNofJR8XYYF1O
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d17BUbT9BeIhozRgLya99QrlVVsu5JDoV05HFzpYDyI=;
        b=kYpb8KCbAjHARDKOPeWgqJQxk2W7c1045u5hbmtaxSophsSVMAS9pdgG1MzzRmeb3e
         YreaQUZlSx8P2nugl8z8FvYaF+oIv5LLhssifVX4KMHT3XRd6d+9c9t4ly89swMsDy0U
         t6xXCzgP/HTxC8pqp+wB+gDrU87ltbMWMdq3VTBOE0EmLfYvePJDylR/tfA8D9I0o08T
         p2ONq7SNn9wTA5Tp3fKVecusJUImpkhH27F6cvpW0NDI71L00+J2Di54nhNuopxc66vy
         hDoAsxt14fzRoTvG9rRKIOilY3vNY9pnjYw3OhpuH9EGTmFgPnbcH47EALkMzMAVCo23
         4ZDw==
X-Gm-Message-State: APjAAAWzlXBx+VLqXzfROZWWmm8cp1uimUmNCcpC8l8/vLTQW05aNpI6
        CRouIQwhnbHv7pNK27WxawOThw==
X-Google-Smtp-Source: APXvYqzkJT+9NfIMSJwyBdAUhvFLgxMSJMdeZTpH6ySLbj3mVts+tjLm4Pji5DqLD/oefGUw4ie0hg==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr50096222pfo.45.1582528839386;
        Sun, 23 Feb 2020 23:20:39 -0800 (PST)
Received: from localhost ([45.127.44.57])
        by smtp.gmail.com with ESMTPSA id p24sm11375421pff.69.2020.02.23.23.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 23:20:38 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH v5 2/3] dt-bindings: thermal: Add yaml bindings for thermal cooling-devices
Date:   Mon, 24 Feb 2020 12:50:26 +0530
Message-Id: <aec68dc9afc15785397ade1c9da8365349cc1516.1582527752.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582527752.git.amit.kucheria@linaro.org>
References: <cover.1582527752.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As part of moving the thermal bindings to YAML, split it up into 3
bindings: thermal sensors, cooling devices and thermal zones.

The property #cooling-cells is required in each device that acts as a
cooling device - whether active or passive. So any device that can
throttle its performance to passively reduce heat dissipation (e.g.
cpus, gpus) and any device that can actively dissipate heat at different
levels (e.g. fans) will contain this property.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 .../thermal/thermal-cooling-devices.yaml      | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml

diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
new file mode 100644
index 000000000000..6aafca25af9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+# Copyright 2020 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/thermal-cooling-devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Thermal cooling device binding
+
+maintainers:
+  - Amit Kucheria <amitk@kernel.org>
+
+description: |
+  Thermal management is achieved in devicetree by describing the sensor hardware
+  and the software abstraction of cooling devices and thermal zones required to
+  take appropriate action to mitigate thermal overload.
+
+  The following node types are used to completely describe a thermal management
+  system in devicetree:
+   - thermal-sensor: device that measures temperature, has SoC-specific bindings
+   - cooling-device: device used to dissipate heat either passively or artively
+   - thermal-zones: a container of the following node types used to describe all
+     thermal data for the platform
+
+  This binding describes the cooling devices.
+
+  There are essentially two ways to provide control on power dissipation:
+    - Passive cooling: by means of regulating device performance. A typical
+      passive cooling mechanism is a CPU that has dynamic voltage and frequency
+      scaling (DVFS), and uses lower frequencies as cooling states.
+    - Active cooling: by means of activating devices in order to remove the
+      dissipated heat, e.g. regulating fan speeds.
+
+  Any cooling device has a range of cooling states (i.e. different levels of
+  heat dissipation). They also have a way to determine the state of cooling in
+  which the device is. For example, a fan's cooling states correspond to the
+  different fan speeds possible. Cooling states are referred to by single
+  unsigned integers, where larger numbers mean greater heat dissipation. The
+  precise set of cooling states associated with a device should be defined in
+  a particular device's binding.
+
+properties:
+  "#cooling-cells":
+    description:
+        Must be 2, in order to specify minimum and maximum cooling state used in
+        the cooling-maps reference. The first cell is the minimum cooling state
+        and the second cell is the maximum cooling state requested.
+    const: 2
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/thermal/thermal.h>
+
+    // Example 1: Cpufreq cooling device on CPU0
+    cpus {
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            CPU0: cpu@0 {
+                    device_type = "cpu";
+                    compatible = "qcom,kryo385";
+                    reg = <0x0 0x0>;
+                    enable-method = "psci";
+                    cpu-idle-states = <&LITTLE_CPU_SLEEP_0
+                                       &LITTLE_CPU_SLEEP_1
+                                       &CLUSTER_SLEEP_0>;
+                    capacity-dmips-mhz = <607>;
+                    dynamic-power-coefficient = <100>;
+                    qcom,freq-domain = <&cpufreq_hw 0>;
+                    #cooling-cells = <2>;
+                    next-level-cache = <&L2_0>;
+                    L2_0: l2-cache {
+                            compatible = "cache";
+                            next-level-cache = <&L3_0>;
+                            L3_0: l3-cache {
+                                    compatible = "cache";
+                            };
+                    };
+          };
+
+          /* ... */
+
+    };
+
+    /* ... */
+
+    thermal-zones {
+            cpu0-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+
+                    thermal-sensors = <&tsens0 1>;
+
+                    trips {
+                            cpu0_alert0: trip-point0 {
+                                    temperature = <90000>;
+                                    hysteresis = <2000>;
+                                    type = "passive";
+                            };
+                    };
+
+                    cooling-maps {
+                            map0 {
+                                    trip = <&cpu0_alert0>;
+                                    cooling-device = <&CPU0 THERMAL_NO_LIMIT
+                                                            THERMAL_NO_LIMIT>;
+                            };
+                    };
+            };
+
+            /* ... */
+    };
+...
-- 
2.20.1

