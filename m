Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED2C1FA213
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 22:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731677AbgFOUxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 16:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731674AbgFOUxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 16:53:44 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21311C061A0E;
        Mon, 15 Jun 2020 13:53:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o15so18912984ejm.12;
        Mon, 15 Jun 2020 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LDa+04Be/xlCMfl0fRh8XBQFwebwbi4UUBkBIjXXdhY=;
        b=PGRXvuMIFyIyF0h7nvwdA9KxzYRPeJd6LCvKVzfgb7pdPBPrsn8zxeQcLcklnQmz8D
         YtDv6vLtJ4f+usnGazC1HDWUsJE8WFMZWCqrV5ovlUX27WOjlvxuE8QRFU/w7oPkp3u5
         VYw9FDFcLiYXJt3xIxTvb936e6YjpMPpjM4fZV7Tinyl0y5c1UN7tJlT7wL9fI2paqNU
         8xpuI9pU/TcB2OWWfM3aPZXNyHgzh9OiAyJYKd2EDIV1jwVVCFQbraCHLCrNmi0QncP1
         6dTfBylyDtKKO8P2UTGFsIpu8gyVAC3gqCYi5Z+i7Xm9XJLoQEv70YfhyNMwDB3J81+p
         wyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDa+04Be/xlCMfl0fRh8XBQFwebwbi4UUBkBIjXXdhY=;
        b=OyX2fFwvU3dWmZL8IFTu2B/OWhPGZgv4vnk8aQiuMutoz41Tp1vwQi1g+dOHgrGZpJ
         4hiFdweeb849uFY5cmR1KTE0HH/64LOnvYNuSj5/DnR7eMWnbEz0Hjt2MJTrEuzvil/U
         VQZjiYE+7ptclZEnk9h1iRzhdOh0hKzhquagFg4lTf5HJXeWGFYKjH0vcVRXMm+PaMfk
         V42wSCM4gF60zKwbCFhpgXBDnY9OyJYpglqZrt+jvLkErzcnYs3BgIWCLj4Go2awSiXo
         LIhTCU1NsQWg2j7CZGDBLv+JWNJGRQl2Mc+Dlcp3sVTiLXizl0nIIqs8UfJveTLQ44ut
         gB0g==
X-Gm-Message-State: AOAM532kgnWzuYaBW+aIDtoQP6eBNxsNKJjePgq902CUxsn58xBkd1jh
        si48igviRUbcqEYqOAW3veM=
X-Google-Smtp-Source: ABdhPJyvgvddV2Am6iMRQU4f+LdnBjLu14NU9cgIVBN7HODprFfy3to/JBy7qUDrKUviQJd70jZljA==
X-Received: by 2002:a17:906:470a:: with SMTP id y10mr28676692ejq.535.1592254421834;
        Mon, 15 Jun 2020 13:53:41 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host-95-238-254-39.retail.telecomitalia.it. [95.238.254.39])
        by smtp.googlemail.com with ESMTPSA id u13sm9738503ejf.60.2020.06.15.13.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 13:53:41 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RESEND PATCH v7 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Mon, 15 Jun 2020 22:53:27 +0200
Message-Id: <20200615205333.20747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200615205333.20747-1-ansuelsmth@gmail.com>
References: <20200615205333.20747-1-ansuelsmth@gmail.com>
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
v7:
* Drop useless AllOf 
v6:
* Add maximum value
v5:
* Fix dt_binding_check error
v4:
* Add qcom to specific bindings
v3:
* Use explicit reg instead of regmap

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 55 ++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 73 +++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
new file mode 100644
index 000000000000..23887ebe08fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -0,0 +1,55 @@
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
index 000000000000..fa30c24b4405
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
+    items:
+      - const: ref
+      - const: xo
+
+  qcom,rx-eq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Override value for rx_eq.
+    default: 4
+    maximum: 7
+
+  qcom,tx-deamp-3_5db:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Override value for transmit preemphasis.
+    default: 23
+    maximum: 63
+
+  qcom,mpll:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Override value for mpll.
+    default: 0
+    maximum: 7
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

