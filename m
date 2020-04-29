Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA4D1BE9BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 23:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgD2VTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 17:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726481AbgD2VTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 17:19:51 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5ACC03C1AE;
        Wed, 29 Apr 2020 14:19:50 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r7so2755022edo.11;
        Wed, 29 Apr 2020 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9tkGPetufBDIyv7Bpgp9xufFAlQJ4PqRxpqoco+qEM=;
        b=fSmKrsYV4lX5YFbhO2FGHeMyCjA+JpDcylTDKDKfCDvKluFS4SVwl/m0vTEJyGkZaj
         PytAthMgtSSsT6Nlcx/NJNeUAkB3L0r3tk1KiJIQ3QaMWxsJFb2vTF9TsyYgOTGKqCUM
         YsYpOH3XEsHB64diwNGXrnCbtrquULAX0XuVsNKmXHJBZc8W15wWMvoQltjR1W8+O5q+
         eXbME6B7paPJCtX6jcG9298sk7SK6vNVBeEzlrsFkgB2EhjB34OO9RjXgHRQ6Dnhjq1A
         7FHZCmHj3NeXigU3ssUtzTMe/UJPdTq2lzfx1jc2fmQVwCh4T3+wUGu96KXP9vQjMYrF
         hDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9tkGPetufBDIyv7Bpgp9xufFAlQJ4PqRxpqoco+qEM=;
        b=kL6OOzoYL3g5fpfNAOUO36o8L/1C7gs2HKarASjgLHK36hg3nn3Ax+qaXgq5MXOJc+
         YzmFjWDul/0xBUumGCK7yjXO4Ej+M6ZS4MmXDBKolrEha106o7GQl7iqBjJECRYk4hJa
         38L5JuKDNHZDxp5YFtl+IXVD0N3/GeSvzbEE2fz4tfOvn/DeKq/62JZcz9t/Eg/Mynqn
         0lUz2rTuy3+yRyv4LfX3NsR2GtcCd4xnoR8sJxf705AVn/hCcCYawcurftJaPhzF1E2B
         NcvbUoKRzRhut7Y3c/w5XyC1obalhK2T4R3NmWaL47sF9JdDLC4yfrpByoIX+uZX2kJV
         X/iw==
X-Gm-Message-State: AGi0Pubg/L1+u78a07eTPdSqQ4dxBSF2hR7WphLubM+9vAIT708KhJWA
        Ghbn7S4qQAbXpaDWnG3+rEU=
X-Google-Smtp-Source: APiQypKQXPo9aNdubq0r9onWQaI7ZalK21Al5xQaYP7WKwciXwITF5OL5PukhUDRh27xtNkrlA3k0w==
X-Received: by 2002:aa7:c5d1:: with SMTP id h17mr4335986eds.109.1588195188893;
        Wed, 29 Apr 2020 14:19:48 -0700 (PDT)
Received: from Ansuel-XPS.localdomain ([79.37.253.240])
        by smtp.googlemail.com with ESMTPSA id b13sm898230eje.13.2020.04.29.14.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 14:19:48 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Wed, 29 Apr 2020 23:19:25 +0200
Message-Id: <20200429211926.4952-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200429211926.4952-1-ansuelsmth@gmail.com>
References: <20200429211926.4952-1-ansuelsmth@gmail.com>
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
v4:
* Add qcom to specific bindings
v3:
* Use explicit reg instead of regmap

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 +++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 73 +++++++++++++++++++
 2 files changed, 131 insertions(+)
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
index 000000000000..5d71a532d991
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -0,0 +1,73 @@
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
+
+  qcom,tx_deamp_3_5db:
+    maxItems: 1
+    description: Override value for transmit preemphasis.
+    default: 23
+
+  qcom,mpll:
+    maxItems: 1
+    description: Override value for mpll.
+    default: 0
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

