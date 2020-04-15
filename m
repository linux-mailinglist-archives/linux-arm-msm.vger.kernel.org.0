Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660B01AB31D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 23:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442218AbgDOVIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 17:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392766AbgDOVH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 17:07:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8814AC061A0F;
        Wed, 15 Apr 2020 14:07:56 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id a43so6834043edf.6;
        Wed, 15 Apr 2020 14:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pTc8JRSWWtNtM9LOngoIIk33/UGvJI3MKXhXF7M3q6g=;
        b=B4E5ICZeifSAu35ZKdrYTgiEoRrsJZdATcNfmAE1+hH63AxZkV2n8gVn8g4TmhKOzd
         wOsgxJyHDqa4oIRGduDu/tL6Zk/kqjQArVfYTWfYFuRikPf/2OcNSt08lMohKq3aUSpr
         3HMSx4ym7HpajSVe2FfdtAbeFb4gIbCoXdNPOZH1VvIBHZLA4z+aGvW4bzzj6JD0oUQ2
         aiIjfWfBkB3ERGe4UmxmpyIu38AcVaXlYJuMIH7kdPBhWAEWzls5p1i01vOCG0EQHP9I
         oabe6djJBDsXJXAQBn+L9TWwhUAN1MVCpzALXgmFtE1MUObi4KEB/tY1Rfe4VG9CMxWz
         N8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pTc8JRSWWtNtM9LOngoIIk33/UGvJI3MKXhXF7M3q6g=;
        b=A3m1WBBv0vfKC6M3cMUJs9W9V9G7ayQOOSlFFQIitzQTdfbsh1i0IhrnKOFPuxhNE5
         eMzXX6FC95Lp+0pHSi3L1LmfCU4YWmp2PBochFnhlMqRpHgR5Q7rM+JEL5jZMl4gofAv
         HjFpwGJ0Gowq5UyzgkPcZrP+sqBpW/IDd3Uz6Rc9szqEap5lnXytfAjPmuxdpCzMsudA
         Z1Y10j3TWcaFKjqlAXPMqGm271yleopKyV9Nw0a4hSGJ/6JyWJ2AnGbJ/HPkxgk1JODi
         D+pX/ASwpcSpOr1fudUjdi/cvA8nK0EivUjyFUZ4soi0kwCWHLn+ZGBEDexoLFgoLFnr
         MEfA==
X-Gm-Message-State: AGi0PuZXz8YV2VjIw4hvF+zkvzFeoFiG8m3vMwT6Yu+CiseC1Wn3Wstc
        +VYzDeONuBYH4WQD115moss=
X-Google-Smtp-Source: APiQypIBJ40FQxGD8RFVZ9eGe5xkdEF1NLJGogHbj1w41cvUtJOVhUqqBkh6torKyriK9KR1Vj9aqQ==
X-Received: by 2002:aa7:d894:: with SMTP id u20mr13846811edq.205.1586984875149;
        Wed, 15 Apr 2020 14:07:55 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host93-255-dynamic.47-79-r.retail.telecomitalia.it. [79.47.255.93])
        by smtp.googlemail.com with ESMTPSA id bu4sm1252454edb.90.2020.04.15.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 14:07:54 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Wed, 15 Apr 2020 23:07:27 +0200
Message-Id: <20200415210729.9618-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415210729.9618-1-ansuelsmth@gmail.com>
References: <20200415210729.9618-1-ansuelsmth@gmail.com>
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
v3:
* Use explicit reg instead of regmap

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 +++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 70 +++++++++++++++++++
 2 files changed, 128 insertions(+)
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
index 000000000000..29a7d3aed289
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -0,0 +1,70 @@
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
+      - "ref" Is required
+      - "xo"	Optional external reference clock
+    items:
+      - const: ref
+      - const: xo
+
+  rx_eq:
+    maxItems: 1
+    description: Override value for rx_eq. Default is 4.
+
+  tx_deamp_3_5db:
+    maxItems: 1
+    description: Override value for transmit preemphasis. Default is 23.
+
+  mpll:
+    maxItems: 1
+    description: Override value for mpll. Default is 0.
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

