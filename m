Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61E3316738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 13:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhBJM4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 07:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhBJM4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 07:56:10 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66C7C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 04:55:34 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id jj19so4011006ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 04:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2pR7GHtK2D/n+G2R92gU7IY+vciRBprFSrIu2y8jqQ=;
        b=WslFAuX+r5eNLy3aXOBoL0GU98/EoUPq2zxD0CU3YakcUF4V+Dbh+rIM8LT+Y/NZFt
         r30eVO8OkS/PnaMN0+P+D/7LGo0bQ64S6U72ik4nmpZ8z3G9calBQfksAriS+kBWD6Be
         Vkijvz/G+ZkA8oNACGzE95SROw/+WhW8QOYcQC0R/MzHvL2JvGLfS80AVFDM79XaFOun
         8ewt8EMwnR3BiEyNEp5hGKkPiQqIznAGA6PN42f+9Qm7o6MeZAxJxcTfgyDCuCtv6hkj
         pRr2Rby2Tpd45ghShLBKoyvERynA+JIVS+VhBiECqaCk03ucGxqAJafW3zuY1CCmqHY2
         JoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2pR7GHtK2D/n+G2R92gU7IY+vciRBprFSrIu2y8jqQ=;
        b=sOIjyrv/SPLeNVdj3QVWi6U7GhAFALP+rzjr8ghw1DEwp0Q3vIGYKI1kReZ8pqzYD5
         aY96tKbCAPmm8opwMZt4GxvatyhHA7U8ob74JT4eS2wSrhKRL5sq3QptTrs13/99HIvf
         u+lOhyiw3I/kjAf4bGXcpmJMp4R2po1p3Td2vKH0cmdATAHeOcbg2x2jBczuQ1ruvBYM
         kwA2Bi0P162H4kkx9dYX+gzO8QMjCTnUlJtGof/kfa4FKaa+CJSSq7BvKhqDkjoZ/xhT
         cvNsVgfu8UiFPUqHsR3CeXX9k4QL0dposy771oXhVP5Z8mxOmtyCNruRyPR8B40jdnaw
         RB+w==
X-Gm-Message-State: AOAM533ckB2skUXdHnGroNOZNHRQi5jRNRqya+YB8oTjfyzaG7NYoixr
        BqvlptnvO1q6NzIGJdn8/CHgLQ==
X-Google-Smtp-Source: ABdhPJx+cbffJtH/oYQNj2WBZy9er7kIC5vD6i5EoJcwf8fbm03n2PHzuHv1N5sFqvqdWOJGYNCDPQ==
X-Received: by 2002:a17:906:4013:: with SMTP id v19mr2822228ejj.5.1612961733706;
        Wed, 10 Feb 2021 04:55:33 -0800 (PST)
Received: from localhost.localdomain (dh207-97-164.xnet.hr. [88.207.97.164])
        by smtp.googlemail.com with ESMTPSA id u5sm1084900edc.29.2021.02.10.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:55:33 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 net-next 2/4] dt-bindings: net: Add bindings for Qualcomm QCA807x
Date:   Wed, 10 Feb 2021 13:55:21 +0100
Message-Id: <20210210125523.2146352-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210125523.2146352-1-robert.marko@sartura.hr>
References: <20210210125523.2146352-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT bindings for Qualcomm QCA807x PHYs.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v2:
* Drop LED properties
* Directly define PSGMII/QSGMII SerDes driver values

 .../devicetree/bindings/net/qcom,qca807x.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..0867f5e698cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,qca807x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA807x PHY
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Bindings for Qualcomm QCA807x PHYs
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+
+  qcom,fiber-enable:
+    description: |
+      If present, then PHYs combo port is configured to operate in combo
+      mode. In combo mode autodetection of copper and fiber media is
+      used in order to support both of them.
+      Combo mode can be strapped as well, if not strapped this property
+      will set combo support anyway.
+    type: boolean
+
+  qcom,psgmii-az:
+    description: |
+      If present, then PSMGII PHY will advertise 802.3-az support to
+      the MAC.
+    type: boolean
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  qcom,tx-driver-strength:
+    description: PSGMII/QSGMII SerDes TX driver strength control in mV.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 400, 500, 600]
+
+  qcom,control-dac:
+    description: Analog MDI driver amplitude and bias current.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+required:
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/net/qcom-qca807x.h>
+
+    mdio {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ethphy0: ethernet-phy@0 {
+        compatible = "ethernet-phy-ieee802.3-c22";
+        reg = <0>;
+
+        qcom,control-dac = <QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS>;
+      };
+    };
-- 
2.29.2

