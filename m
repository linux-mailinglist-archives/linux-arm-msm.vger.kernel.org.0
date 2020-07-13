Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CCB21D6C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 15:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgGMNXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 09:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729788AbgGMNXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 09:23:41 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363D0C061755;
        Mon, 13 Jul 2020 06:23:41 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dp18so17121045ejc.8;
        Mon, 13 Jul 2020 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=Nuq1x2wKN/dxYpvweyWouJRhJpyPbQSv/GCjzKI8pwH3xqY7CMSeaFKfTCXi3L/SmG
         H3sLSfWseB2LvmZzqBOE0mfAVbFMtTg0jhs6PK5y9ZTk0cPBqUyvAz+pKrGMGfSDX5ka
         NmEq94tVvkGlPWDvC/5NUnzSVil9Lf37dCLvX8jvBMqg17SlD7eGkrUSSjQjpmyMEAoi
         r9j+48efDTp5ebbzz67WQbERwncxA2p6YyZz5/p9Jun27KNEJ3L6Hmf9bLF2MEmsQDZk
         u3DY+Ch0A3t3uPOOsmUA1d76LBazPZRH6DP2Ejlu/sKPShFH/vRZEV+7e217I8EZmINQ
         oWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs4AfRAnPExeeuyiR5DGWNr9f7rEdWEHMwAyJzCVFy0=;
        b=Q0tWdjme8CyxBRAyMvRuILBzuIgXEFygfC+Rs68HJgAJXHCHbL1wbGW8QFdCuJ7Qy1
         ZTObGUQ+3lTabbDFHUB4NAR9Yo5E3cuj1gu5AQ1G/B9SJXzcIa1q7/om1oaXNOXMSwhV
         JHimoGU1S+x2yBYq8rNBqPQIx2/Pv0KFRPVWul92vdOK/YXXkAypV1nFkKM57MH1lLel
         1fPoTY7Y21cFlTpzgYQ0lSn5vu5Ibyr0j5RZLp+gPgifQMepa6BY2kdiGGOU4w6HbpbI
         79QorkCZTgqMc9rrekuXyUqkrOW3Y02tyoZw/NvmIuIjDE+WhjIF06kz1yrNFmagYETM
         9OFQ==
X-Gm-Message-State: AOAM5330k91M7vTncX2L7tp/Uf5Ktnu5+WdSCm0IcYNliBko7mCTgEo/
        yoOgoyNWwPkA385MP5uPrXU=
X-Google-Smtp-Source: ABdhPJzjylz2Jn24pET/I+hNQdp+EpccZZTnQ8tMfUhCkJzYxMXciBCfYpQ7abLrfVd/DzQemTKCJg==
X-Received: by 2002:a17:906:4447:: with SMTP id i7mr63030296ejp.191.1594646619876;
        Mon, 13 Jul 2020 06:23:39 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host-87-16-250-131.retail.telecomitalia.it. [87.16.250.131])
        by smtp.googlemail.com with ESMTPSA id h8sm11470025edq.15.2020.07.13.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:23:39 -0700 (PDT)
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
Subject: [PATCH v8 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Mon, 13 Jul 2020 15:23:07 +0200
Message-Id: <20200713132309.14353-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713132309.14353-1-ansuelsmth@gmail.com>
References: <20200713132309.14353-1-ansuelsmth@gmail.com>
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

