Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9E419E170
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2020 01:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgDCX0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 19:26:13 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:34281 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgDCX0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 19:26:12 -0400
Received: by mail-ed1-f53.google.com with SMTP id o1so11341736edv.1;
        Fri, 03 Apr 2020 16:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sBEYU6dVbdfEFyer1fcNa3qb5j21cZVbtVGi72NYCaA=;
        b=jYjbsCofi20e2JE9P2PqSwBGP821zDzxShm7OKPvv7o4Iw+7QorL3h6G0b7lwfZTkz
         ezh7KJQgltU1Zl2pAyeeg7msiaGlxN80BFit4yTcobHYHKUZmgH14aafqKWyxa+PDGDr
         ol3zxsrprBD5ax2hiT15jK+wPPXpwxMY4JXGe64MSUlhNmxgng80MUbXzs7SlSbND3wv
         +kFojSvHbEutYmDJgHnz07GQGKcJpisV5BWZwCV01jmueBA+bkZxcUjX4GlWM8Cf3K70
         MwY1UPntqa1WD2mEcxXVrplTdaFvZczuPTsEuI76MZINGfmwWkvADts6OebE1mEULlVq
         mjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sBEYU6dVbdfEFyer1fcNa3qb5j21cZVbtVGi72NYCaA=;
        b=tV3zPotIq4l5oWa7yEwmLPeE2f7luF4LekHFUAPsLK1aLjLQ9f/7G4UUAnKcfuOvY4
         Tty5g29U1Ptvi2Q7V+qEESULrKe+NNVquD/rPuloWZH+fGNXfe/AwZpjF/rKFH6awOkA
         1Q/mr+/RKDpO+t9/QwpVhQQHNoAPO8NYECOYtkg0aTpCwDnbtDsGlCg2b6CJVxjGMKSO
         MkqcV8M+DJHbFyNNZBc69/l39vfnAd298hJOhMssp4qNXeRbWgHR6MeuY2Xip5+cA5mj
         k/RIW/iLcb2HgSZoMYJbMc0sZNBW0mgOKospe1C2izcVaRa8nG+vfnuXi9K+rByrs60K
         7kNA==
X-Gm-Message-State: AGi0Pubp3RaqOKeAk4TUd0qQ60nfl+Pt9V3dPH3HLGTyiGIFmzBayphx
        0QnE8eZSFPxUNNs+1KqM47I=
X-Google-Smtp-Source: APiQypK9y1LZRxyHO71Blj7cAf/YO9PLFj9WyABrfO30MPRaK2n91iyn2VAk7GNLH/85ljMJyhgigA==
X-Received: by 2002:a17:906:4e45:: with SMTP id g5mr4816707ejw.295.1585956370201;
        Fri, 03 Apr 2020 16:26:10 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host133-251-dynamic.52-79-r.retail.telecomitalia.it. [79.52.251.133])
        by smtp.googlemail.com with ESMTPSA id o27sm517717ejc.23.2020.04.03.16.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:26:09 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Sat,  4 Apr 2020 01:25:57 +0200
Message-Id: <20200403232559.25716-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403232559.25716-1-ansuelsmth@gmail.com>
References: <20200403232559.25716-1-ansuelsmth@gmail.com>
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
 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 66 ++++++++++++++++
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 78 +++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
new file mode 100644
index 000000000000..c1d690ce646b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -0,0 +1,66 @@
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
+      compatible = "qcom,ipq806x-usb-phy-hs";
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
diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
new file mode 100644
index 000000000000..53a07b35c3e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -0,0 +1,78 @@
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
+  - regmap
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+
+    ss_phy_0: ss_phy_0 {
+      compatible = "qcom,ipq806x-usb-phy-ss";
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

