Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437151AAB55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 17:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394079AbgDOPGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 11:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388596AbgDOPF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 11:05:57 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135E2C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:05:57 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z6so19606179wml.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuBP9KiSw+LiyttT2NfUSMQEaIQYAIyFEb6lDmiST4c=;
        b=aQpWkWrTzAUvsD7Wkh1DDjjCYMaV3utr3TO6Sl0BsOZNcb7gaDZzjUtN2e/FVX8RMZ
         44OGCA3c94cZ3ncRO5NShF6nieCD1/4EPJbt+YvibQir4SwyBqBTBFRH9Lyq2voIqdff
         XBndMyQ/BJFTGQKHpcQn6Dv808ZgFItL3naudHN+0dZ0P7e3J4IgQD11UWsCaePaCpeT
         dN1sXqXW+WYtnEEg4QjOLaYMS3X6hkj9GR14NFCnd2ng3zB4enuZO+xmC5rKETeyhSqv
         N6OiJ3veEOaaWFsarCjYLEVx/vEL5qnaELxNskVPSG2LYleksFVCf2/R4JsZf4tCUH4x
         qIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuBP9KiSw+LiyttT2NfUSMQEaIQYAIyFEb6lDmiST4c=;
        b=iiRc/zI3b/p+Y3BRt8kuPUALR1Ukb9bD7JI3G8D3b67ywulzU01ggy5riDOXWk1gNA
         +A1h8eZK5tFMFzbg67v76oKcFEWK4WMwZapT0oN88f5UOC40ef+agc+AfoUtQYVBAvoM
         HUGEEr6PQV92C1v+SQRx63EsGgcvKsWE2IY34pi79gTDdwd9/KM/R9eqJdHIFOdLWFMU
         2YgRr4ZXDdHuYUIjoBfCTolUUIwrwJnani0Dz+FwfTcvDQRgtqILTCaLRxaVKbNsk+Ud
         DqXP5WMJbrK2asHZ+B0vLSy3veFFDzJYmGxgFDNC35O3+IP2JjD8fWbIwkvsjFJHX3xp
         rkrA==
X-Gm-Message-State: AGi0PuYOsJG3wlMRXmiPmg/I33n8vSXbP26UM8IoaTICoWgI+0iT1j4M
        q+C9mBLXhFx9sM7ntPB/3XCFPxQwjSg=
X-Google-Smtp-Source: APiQypLGJ18uxlRWZ+/jU+bOu2t7wGjpYa4tfIQVEb+GudKXVy4DgdD2IfFXJ+DWDD1LRgQJ5BEY3g==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr5674184wmi.110.1586963155753;
        Wed, 15 Apr 2020 08:05:55 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-108.xnet.hr. [88.207.96.108])
        by smtp.googlemail.com with ESMTPSA id s6sm22729988wmh.17.2020.04.15.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:05:55 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3 2/3] dt-bindings: add Qualcomm IPQ4019 MDIO bindings
Date:   Wed, 15 Apr 2020 17:02:46 +0200
Message-Id: <20200415150244.2737206-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415150244.2737206-1-robert.marko@sartura.hr>
References: <20200415150244.2737206-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the binding document for the IPQ40xx MDIO driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v2 to v3:
* Remove status from example

 .../bindings/net/qcom,ipq40xx-mdio.yaml       | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
new file mode 100644
index 000000000000..8d4542ccd38c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+properties:
+  compatible:
+    const: qcom,ipq40xx-mdio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    mdio@90000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "qcom,ipq40xx-mdio";
+      reg = <0x90000 0x64>;
+
+      ethphy0: ethernet-phy@0 {
+        reg = <0>;
+      };
+
+      ethphy1: ethernet-phy@1 {
+        reg = <1>;
+      };
+
+      ethphy2: ethernet-phy@2 {
+        reg = <2>;
+      };
+
+      ethphy3: ethernet-phy@3 {
+        reg = <3>;
+      };
+
+      ethphy4: ethernet-phy@4 {
+        reg = <4>;
+      };
+    };
-- 
2.26.0

