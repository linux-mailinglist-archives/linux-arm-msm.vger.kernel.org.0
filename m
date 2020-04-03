Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4383819CDC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 02:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390335AbgDCA02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 20:26:28 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44051 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbgDCA02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 20:26:28 -0400
Received: by mail-ed1-f65.google.com with SMTP id i16so6940516edy.11;
        Thu, 02 Apr 2020 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aPFWwf8vkXl+dFMjYxtDZrmI1dHgtdcvjjrsqN4+7bs=;
        b=WfDLwNIJOwEB3kdveRX4JnqBj/MVNHxKdfVdIlxNCIwkpBudC0cIUIyIy0XzhbPb/Q
         VaZV6qMGCgORTChI53hpWEYFWla9m57k+GdX9+SnNrAnHZnt3WAdsxK8sIguLvZULzwc
         3sfLatjzBFf7DTKXRzaI2A7QiaLAt5ah93XlCvoGHozNt2J+rB8JrXuprHu9m+zLthnp
         XDC0l+Ec657iuBG2JlYFK5ZJyC/a4I4Lw8TZcBZOpS5nH4CxkZSn3pgGtrSGQXkqo7Np
         0GTzl7+7sEiE2HoBxUb+lmaWRWG3Y10+uHdHrKSMSUvQmG2JkhR0tBifKE+qPBbnQTOU
         ptcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aPFWwf8vkXl+dFMjYxtDZrmI1dHgtdcvjjrsqN4+7bs=;
        b=gvAfK6U4gdBmuADOjcgsGjuGUUrKXA0EUjMQWuDplcBem5pzP2u3TaAslTklKsn+J1
         o79q41FuEHKAhLrGgc6jR/uqQ5icLsIqdwBSYBm9tdjnSXcXYi82GM+fewAreq52k7N1
         pEWB67duQXdcwfK21Yd56zneuthscwfhvBjD8xf3HPOLR6mVrSGfV3L7J58XDzb0XAoA
         sR8GEo3b/Ua/Cua7lHjb4f/hSGafwhR95yeJWfFDJEfoNGgwoNEAs67SMUGLbc68SVRY
         jsS5bmmTpN9c4t/rGbXG4q73wnVx6L9je/SXOKVM7DMWlTUnHl5iyQHLBOpRFgqE0CnB
         3t4g==
X-Gm-Message-State: AGi0PubEH46SXTUe7uwX3mCBxRmkc1cfeiZXpFxj6HYefZmfXo8ZQx4v
        Af1LbF7xzDPk9sfMd5mnGIs=
X-Google-Smtp-Source: APiQypIk0yqb/weeyHpGFZmyGyckJM3fIRWZ75YSeoVaCqyuqnXSfWXnBR1isSXxtFR4yIsv1JPNNw==
X-Received: by 2002:a05:6402:1ef:: with SMTP id i15mr5782942edy.0.1585873585185;
        Thu, 02 Apr 2020 17:26:25 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host133-251-dynamic.52-79-r.retail.telecomitalia.it. [79.52.251.133])
        by smtp.googlemail.com with ESMTPSA id j10sm1335981ejv.13.2020.04.02.17.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 17:26:24 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] devicetree: bindings: phy: Document dwc3 qcom phy
Date:   Fri,  3 Apr 2020 02:26:05 +0200
Message-Id: <20200403002608.946-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403002608.946-1-ansuelsmth@gmail.com>
References: <20200403002608.946-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document dwc3 qcom phy hs and ss phy bindings needed to correctly
inizialize and use usb on ipq806x SoC

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../bindings/phy/qcom,dwc3-hs-usb-phy.yaml    | 65 +++++++++++++++++++
 .../bindings/phy/qcom,dwc3-ss-usb-phy.yaml    | 65 +++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
new file mode 100644
index 000000000000..0bb59e3c2ab8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,dwc3-hs-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DWC3 HS PHY CONTROLLER
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+description:
+  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
+  controllers. Each DWC3 PHY controller should have its own node.
+
+properties:
+  compatible:
+    const: qcom,dwc3-hs-usb-phy
+
+  "#phy-cells":
+    const: 0
+
+  regmap:
+    maxItems: 1
+    description: phandle to usb3 dts definition
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    description: |
+      - "ref" Is required
+      - "xo"	Optional external reference clock
+    items:
+      - const: ref
+      - const: xo
+
+required:
+  - compatible
+  - "#phy-cells"
+  - regmap
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+
+    hs_phy_0: hs_phy_0 {
+      compatible = "qcom,dwc3-hs-usb-phy";
+      regmap = <&usb3_0>;
+      clocks = <&gcc USB30_0_UTMI_CLK>;
+      clock-names = "ref";
+      #phy-cells = <0>;
+    };
+
+    usb3_0: usb3@110f8800 {
+      compatible = "qcom,dwc3", "syscon";
+      reg = <0x110f8800 0x8000>;
+
+      /* ... */
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
new file mode 100644
index 000000000000..2f7b0d9db072
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,dwc3-ss-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DWC3 SS PHY CONTROLLER
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+description:
+  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
+  controllers. Each DWC3 PHY controller should have its own node.
+
+properties:
+  compatible:
+    const: qcom,dwc3-ss-usb-phy
+
+  "#phy-cells":
+    const: 0
+
+  regmap:
+    maxItems: 1
+    description: phandle to usb3 dts definition
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    description: |
+      - "ref" Is required
+      - "xo"	Optional external reference clock
+    items:
+      - const: ref
+      - const: xo
+
+required:
+  - compatible
+  - "#phy-cells"
+  - regmap
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+
+    ss_phy_0: ss_phy_0 {
+      compatible = "qcom,dwc3-ss-usb-phy";
+      regmap = <&usb3_0>;
+      clocks = <&gcc USB30_0_MASTER_CLK>;
+      clock-names = "ref";
+      #phy-cells = <0>;
+    };
+
+    usb3_0: usb3@110f8800 {
+      compatible = "qcom,dwc3", "syscon";
+      reg = <0x110f8800 0x8000>;
+
+      /* ... */
+    };
-- 
2.25.1

