Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9E1ED0B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 15:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgFCNWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 09:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgFCNWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 09:22:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8735C08C5C0;
        Wed,  3 Jun 2020 06:22:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y13so2160308eju.2;
        Wed, 03 Jun 2020 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j7nBUX2AbyeE4VfB2fMjhar+8GJPqk6Hyrot3NHjwPE=;
        b=oT5JVC7V6e3fRVd7frNu82uXHNq5VwVm9wXoNN2rUv5DZ6SUeBjU808U6R+WOXlaub
         NyKZmeHiol4ZWVamjzwsfjnv/gmOjr1pGKx6RUW0sx2UaBZgek7QKWconhVLwJxpY+MX
         RJdRxS+ZIJvcUgK7wi9ej946t2r5DBnGwn4VUUlDaGuaJD8sN7R0+f/FFDgfW3J7b2c0
         ERnfGLmqUYeSKkyUONaM5B9hhJ9XniJj799MXOVTccxel+PgAjNzW9eIxfentTm/HTSP
         hsML47LOlSXM6tz9gEcGwdHvYWMe024N6uXPhxXuBZRRjyLx6ANZBWhO9JXSvOw8k+/t
         riog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j7nBUX2AbyeE4VfB2fMjhar+8GJPqk6Hyrot3NHjwPE=;
        b=JZkQei71pvDaVgnz7kZuIdreryucP+QPj3bPCUUl0jF8ZkWKFVvPdikOOQHh1CswZ9
         b7BWHz/TKnKzYX4U/12pbaq1QnValm8NgmjqjIUSPGmUUri1qihlCEL5DOPVDzEcmzY9
         kmuBTgYSsWgjx53MEa080Vg6woemHLVr2yX661tXyq784bTo76xw6MHy1PSMuOZFkc+r
         Tg3RwgTHVPTvku61iaVnld+O0yr+YvcZKjcwDdRHge22BX0Zq2XIuNHOUE6/cTOhJS/j
         L1k3ELUERdJfIbdx2Qxm4xxUbIDAFjyjwEQEtrcI3rcaGBL9Br+YejJ6YJNyLF7AMtwN
         +/lg==
X-Gm-Message-State: AOAM532Yn0F61BmoZutyeyEN7NGpjnnuUl2ipMIdj8S4uK+127pCGLiU
        KaS1r65BpHB0K+9Qg4MlHB0=
X-Google-Smtp-Source: ABdhPJz4YiYTo05+bsr3d0i5Rns2lGKyW2+pCMdMn6OshcYga7MfowRfhrpOjZOhTy+OAjd8q6TREA==
X-Received: by 2002:a17:906:924c:: with SMTP id c12mr2882960ejx.457.1591190572383;
        Wed, 03 Jun 2020 06:22:52 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host189-12-dynamic.45-213-r.retail.telecomitalia.it. [213.45.12.189])
        by smtp.googlemail.com with ESMTPSA id h9sm1073859ejc.96.2020.06.03.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 06:22:51 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Wed,  3 Jun 2020 15:22:35 +0200
Message-Id: <20200603132237.6036-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603132237.6036-1-ansuelsmth@gmail.com>
References: <20200603132237.6036-1-ansuelsmth@gmail.com>
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
v6:
* Add maximum value
v5:
* Fix dt_binding_check error
v4:
* Add qcom to specific bindings
v3:
* Use explicit reg instead of regmap

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 ++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 76 +++++++++++++++++++
 2 files changed, 134 insertions(+)
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
index 000000000000..3696a8d7a5c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -0,0 +1,76 @@
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
+    description: Override value for rx_eq.
+    default: 4
+    maximum: 7
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,tx-deamp-3_5db:
+    description: Override value for transmit preemphasis.
+    default: 23
+    maximum: 63
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,mpll:
+    description: Override value for mpll.
+    default: 0
+    maximum: 7
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

