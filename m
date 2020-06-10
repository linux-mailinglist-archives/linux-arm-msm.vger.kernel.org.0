Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2431F5D86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 23:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgFJVIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 17:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgFJVIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 17:08:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008B4C03E96B;
        Wed, 10 Jun 2020 14:08:43 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so2433564edq.0;
        Wed, 10 Jun 2020 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LDa+04Be/xlCMfl0fRh8XBQFwebwbi4UUBkBIjXXdhY=;
        b=tfW3BqMgxOGoNHOtq6wNnV+dWJ7lIVsgFQBkk8q4OFmvc4nrEhf9ls3WIPNOI8srjr
         LOOkR8oMCsxICKk8BKQUNrge2BP42ZuKQI5o/qO8wWISR+3Fp4NtBYz5pwEVKl1qC5xO
         16U7Uo9cC6D9peDBjYTwxicOlR0hDY2ZN8px5ws3+94rv8tTly2eZ3xjxVOBG8jtzPcD
         7NGgOdsDYTS7e+dn64TnIDcJCiKAeA3ljp0AaNTg25djsZihTQ3cHxPP44gvUQ5XZmWE
         3OoJFx7M1yve0WYYZFPHu0O6jXH6GBh+qPvX/Oe3fWyrZR6BxzujHMnsegrTjvXWZAhX
         tTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDa+04Be/xlCMfl0fRh8XBQFwebwbi4UUBkBIjXXdhY=;
        b=Hy8aWDYwt6EbXYu5VA0Zthfodz23YLua+WUfTaAKPWLc1kg1PJt+gPMGBiVih7ZI1b
         wfWOZXDbxSdZ+i6TlJctySWh0qs9Ww4VDFA9aNptkuWAyoEg60R1gxogr6a3ePZMojE7
         OpmHk6J0am+9vhYP8NeaiQqk6HIsPvNuA6BgsWOuayMzBL/uHHn35pm5xj4lLnl3TXOO
         lKvX9P/JbMIDL9EIB37vL9+AsxDpkjAYIoaJ9iKUxc+cl0jI+4eAdNT8U1xDOBV4/AsQ
         fDnrYIpJtHSiFHFOiOeWnAM22xkJHg/QXJ6UTIdzk8erXs01eGs+QnyhJ9mLPulPiF5Q
         sQ1Q==
X-Gm-Message-State: AOAM530gXHWn1iaGzhy4/4nRlsZWGaQihHWSLk6sXtKMq8/sUL7aLUwC
        sNBsF5+mfdmXUmjugHeSuuQ=
X-Google-Smtp-Source: ABdhPJy+4If6yEOZisi9V/FzhrsqnnGvzWEyL4PSQ5FMAykVZ3YmMobTTp6D/KCwQRdXL9nsJlMGiQ==
X-Received: by 2002:a05:6402:17f9:: with SMTP id t25mr4231696edy.134.1591823322548;
        Wed, 10 Jun 2020 14:08:42 -0700 (PDT)
Received: from Ansuel-XPS.localdomain ([80.180.205.145])
        by smtp.googlemail.com with ESMTPSA id g25sm447448edq.34.2020.06.10.14.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:08:42 -0700 (PDT)
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
Subject: [PATCH v7 2/2] devicetree: bindings: phy: Document ipq806x dwc3 qcom phy
Date:   Wed, 10 Jun 2020 23:08:25 +0200
Message-Id: <20200610210828.13297-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610210828.13297-1-ansuelsmth@gmail.com>
References: <20200610210828.13297-1-ansuelsmth@gmail.com>
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

