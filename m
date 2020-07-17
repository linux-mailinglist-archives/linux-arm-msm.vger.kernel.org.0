Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4FA223C25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 15:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgGQNQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 09:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgGQNQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 09:16:49 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFD4C061755;
        Fri, 17 Jul 2020 06:16:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s10so11005272wrw.12;
        Fri, 17 Jul 2020 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=X1X650+/OJIdkuT8tYULqZ7epcSuQNC0aWmohUOFdAm4DabLoremwwlRcdAvIp7CBF
         Y15XYfiFFoT9lN+Q9SfCFQD3ihAccJLL6cEwDDtoIYKXrq5qS9+jHMSKEN5zLD4BsnTW
         sap9hRQk9LnKCRkdEi9gmojGpC2CKHl2K/ScY73WUiwn5Mc4UgOPOkObf/xZRyo729Qd
         efKiBGb+jpdd1TLT8Mi8V2MQwZ2k+oP45ywvsF/mgO/ZgTpqtvGYSQr2llxuqCTKJzLE
         IZhOAkoFNxait8ho4i4kXhyRGYEvc0V6dErp5mORYaFA44Pp3FX6ug/jn7TYfmsYoQKO
         XNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=ZWGX8w4NmBbj2N3D7hRkQieGxwhXceWtrH/mutabob9Ki40PpoNBAefd/7mLbLD0oN
         vg6u7TaNGpAwqLR5BxCFKnY+IW2pJr/seTZDoXsY87WJw/wA0UGgwXK+qJvaA5j73jRy
         bQsAeoHrW96Ci52C/V1QD0+3q8iWQJ3qoPfm9+uR3LS+M2qC6BKT2te7FHsIEGIK0dy9
         167KXZzUjNr2FZL2tc4/nMREjY9Kkuz7KjYnIH17iI64X4gY7Jo2/BgB6CR6MIag+Usw
         lMGk5b/ZfWagXFB7Otl+HrSpUnpM5WD7DBr5rO9jqSl07KWWuFud8QvGxKdATSXsyB9i
         4pBQ==
X-Gm-Message-State: AOAM530UTXxz84MOScXw0ldN8KcPXv7FtYZiP5m8HDsNL68IfCz0bbD/
        FjKBkdj4+2vZefE9LHUEX2MDjgDN
X-Google-Smtp-Source: ABdhPJyXulweRUs3+pX+8YMzfHldby1Vmk6XsWfpdOE7cWknggpCQHsBXrm55Cf7GiHPKNqz9goA7w==
X-Received: by 2002:a05:6000:1cf:: with SMTP id t15mr11049470wrx.180.1594991807586;
        Fri, 17 Jul 2020 06:16:47 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host-87-7-31-173.retail.telecomitalia.it. [87.7.31.173])
        by smtp.googlemail.com with ESMTPSA id y6sm14559922wrr.74.2020.07.17.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:16:47 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v10 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Fri, 17 Jul 2020 15:16:32 +0200
Message-Id: <20200717131635.11076-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717131635.11076-1-ansuelsmth@gmail.com>
References: <20200717131635.11076-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document dwc3 qcom phy hs and ss phy bindings needed to correctly
inizialize and use usb on ipq806x SoC.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.27.0

