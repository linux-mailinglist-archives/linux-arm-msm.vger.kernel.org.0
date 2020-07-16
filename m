Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5912221D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 13:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgGPL4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 07:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgGPL4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 07:56:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627F8C08C5C0;
        Thu, 16 Jul 2020 04:56:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f18so6809871wrs.0;
        Thu, 16 Jul 2020 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=IOBC9VwP63/cdjmvOOd6YnjYshzw/J8qeWYn+1Cd3xkkl5wp9JFqZC24SxSMmtJ5zk
         iqfJnYDuEELw6Sk83huKQGRI1zSfr8z7u1VISsht6yEyM9IdR2gHiuP1zsRQuBksSO2b
         V4yBZnUAxHIBmlmu/ks14VpvhUcBPkcnAQAFKCR+MKyBk2o/12fRJOR1FIzPgl2SF1VM
         E2i/5wLW0gy1GCTS/omC1Y4BheQb8Zbg8raQHBvUmtY4IoqI0DunFV6sxqXz2doVK3Vx
         gRFc0v8+YlCoHElHqbeCJI5HM+xXKoRnc7pkarQ8hVWOf/Ctgm8F+bQ5p1/tIudIfHBC
         Mc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=IWoP9lJKXZZxl148t+JxH566HvowueakNeu9qMT22VuPj54i+nj6N9MYJEpemvGTuJ
         OOAMDNmav5DQq6ApQ+atDwZxebjNgWb/nmgJIdiVB+ZvyBczgTcxu3mEc5YpckBhCmkj
         1jppqV6ltdTq2t0cqobt3N3k6BMl0yHuTSydX/DjSBuafedNEDbZPAJEFpAFoaYL2GME
         64eSMOpPgk4NT9rYmXB4c/Baa/UH1cKf00DARoIMorI4KVaNietfP5oZzG7Gzx2simql
         JG33mIZYdhck1i7vgtuCkxjE1GY5xcqz6cACkiBAoEOAgtdipRf6ddKoOn0pipEhRRfy
         AOLw==
X-Gm-Message-State: AOAM530BCqJTjTc19/U6Ad/K/uDKPOIM6QBq9NaDFgROLMlzJulagAJG
        iUInkwQMRcVAqWhN18zHr98=
X-Google-Smtp-Source: ABdhPJz64upI91irFUhybMw7rYZAcHiJhyz+RaRl6rUrzjGpwBroG+4PHoyuz0P9cAmdzZAeBefYQg==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr4856628wrt.67.1594900558855;
        Thu, 16 Jul 2020 04:55:58 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host-87-7-31-173.retail.telecomitalia.it. [87.7.31.173])
        by smtp.googlemail.com with ESMTPSA id a4sm9553060wrg.80.2020.07.16.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:55:58 -0700 (PDT)
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
Subject: [PATCH v9 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Thu, 16 Jul 2020 13:55:46 +0200
Message-Id: <20200716115547.11903-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716115547.11903-1-ansuelsmth@gmail.com>
References: <20200716115547.11903-1-ansuelsmth@gmail.com>
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

