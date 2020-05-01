Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C46A1C2034
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 23:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgEAV6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 17:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAV6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 17:58:23 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1316BC061A0C;
        Fri,  1 May 2020 14:58:22 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n4so8609629ejs.11;
        Fri, 01 May 2020 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+dwJLdu/AUk/G86mjwzD+ysAOGq1CMd9Bn28OzWKnDA=;
        b=bzVOZs7Sy9eIjlfjP3sSyICDo5GQjI3QfRTJq+W0+jA7sz03eV6ZT/9wQ9DWelLdMa
         8wFjPxrWssw2A+z1+fHfWu+HHGmpUUJjJws5jYCFYD3VZ2jhUV1Z04gqDuXH6jsfXjvw
         +fDSdSWeI5aWeFoTV8gni6TWoKzwMG+pOyizR0ds+t0ZK3S+n9ccJZhRirErCyZOQ2G0
         EamtxIXxbfdJ9tjx2hgzqt7hAPtcxZf6n5yh06lSXF3/f3+THWAQhIWTDf3ipjlC+nkz
         6NJvUo0lVcL99ZtQ54rXT0UjhjmrLXsOIZSNise3fkCn0v5fLxcVI49n0ZQQULsZEr/E
         rmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+dwJLdu/AUk/G86mjwzD+ysAOGq1CMd9Bn28OzWKnDA=;
        b=bJsHDoOU56JjNFz5y2P0H17mdKc4PLIiMx6ZYpEgOMVOJ5fAWGkRp+ves2yGePpzR3
         UikWgvkBPTF1hz4nkZA5vibCBJl7F6ftprBa1+FLp7EqFv4iP3POErhtjBbydWqFN5G6
         IazbRjgX+Cs/w/54hW/WtpKc9PUPbVKSEr2UMatI/TPrsdrmaJ8PB23hA5vigpWK59d/
         lFQ9zqcuJY7A5PpK7xq0fPZLfVncMLNrDSwa2Q88f099HFUXKjMHWL3CKn6rQcNoxLg+
         yASwzPQoTz15zOSukMVlLmpYw7vTHzbOfs15P7T+Xv/FcSXM2cpQRpC0GfPekmiS6Mss
         D+nA==
X-Gm-Message-State: AGi0PuaAp4YU4TDC96ifKjc1z3zSP9kSwHKjCg2vsUkH6rZSB6QAuqkg
        E10eZvwdR3Rrj62NT3DsvjM=
X-Google-Smtp-Source: APiQypLHh4Na+gcbT1f57HiSPQIsGHc0U249ls5RhZMfwhSGUYhYwJW12/LWCove81eHc5QvP/7Ogw==
X-Received: by 2002:a17:906:1751:: with SMTP id d17mr5158104eje.314.1588370300668;
        Fri, 01 May 2020 14:58:20 -0700 (PDT)
Received: from Ansuel-XPS.localdomain ([79.37.253.240])
        by smtp.googlemail.com with ESMTPSA id s5sm444934ejj.77.2020.05.01.14.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:58:20 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Fri,  1 May 2020 23:58:05 +0200
Message-Id: <20200501215807.11175-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200501215807.11175-1-ansuelsmth@gmail.com>
References: <20200501215807.11175-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document dwc3 qcom phy hs and ss phy bindings needed to correctly
inizialize and use usb on ipq806x SoC.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
v5:
* Fix dt_binding_check error
v4:
* Add qcom to specific bindings
v3:
* Use explicit reg instead of regmap

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 ++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 79 +++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
new file mode 100644
index 000000000000..c019de7478e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-hs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm ipq806x usb DWC3 HS PHY CONTROLLER
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+description:
+  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
+  controllers used in ipq806x. Each DWC3 PHY controller should have its
+  own node.
+
+properties:
+  compatible:
+    const: qcom,ipq806x-usb-phy-hs
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
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
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+
+    hs_phy_0: phy@110f8800 {
+      compatible = "qcom,ipq806x-usb-phy-hs";
+      reg = <0x110f8800 0x30>;
+      clocks = <&gcc USB30_0_UTMI_CLK>;
+      clock-names = "ref";
+      #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
new file mode 100644
index 000000000000..fa10a1c51cf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-ss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm ipq806x usb DWC3 SS PHY CONTROLLER
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+description:
+  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
+  controllers used in ipq806x. Each DWC3 PHY controller should have its
+  own node.
+
+properties:
+  compatible:
+    const: qcom,ipq806x-usb-phy-ss
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    description: |
+      - "ref" Required.
+      - "xo"	Optional external reference clock.
+    items:
+      - const: ref
+      - const: xo
+
+  qcom,rx_eq:
+    maxItems: 1
+    description: Override value for rx_eq.
+    default: 4
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,tx_deamp_3_5db:
+    maxItems: 1
+    description: Override value for transmit preemphasis.
+    default: 23
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,mpll:
+    maxItems: 1
+    description: Override value for mpll.
+    default: 0
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - "#phy-cells"
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+
+    ss_phy_0: phy@110f8830 {
+      compatible = "qcom,ipq806x-usb-phy-ss";
+      reg = <0x110f8830 0x30>;
+      clocks = <&gcc USB30_0_MASTER_CLK>;
+      clock-names = "ref";
+      #phy-cells = <0>;
+    };
-- 
2.25.1

