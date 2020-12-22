Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43C52E103E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 23:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgLVW2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 17:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgLVW2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 17:28:06 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC92C0611CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 14:26:49 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id jx16so20263015ejb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HGR7XuRKi+UsAvawQlx4lVfTU/tQTKAn1RMTwnMZr4=;
        b=iL7TX9bismYaadq0nnq7TKBz5Hw7lmWiSSkglnJsHwCe1VBC1cvKJMd5gj6RHI73J3
         TEXe9zfCqEkRqiGR38HKtf0E+2W5OaT9SFq9sXG9zhHiIWn0Ucz4CmefNgraD0f/uP2C
         xsoOjrWHxUQQpKlC7QsenTE8PhyQkVtkM+jlZkVBCkc4roRAxmhQv7iQA/wWF4HD1g1u
         V8TL7SXF2FK2fuPi+H0U0PXDc3qv5guX3puJwaUuFzysEWcbwH5y50qwZBtMstMp0Rcp
         Oa7OBEn3W6g8Ze6wEDetbILl2aXGGNibiVASB7zXAKkbSgulrH1Y813bROCdD4/I7z9L
         79Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HGR7XuRKi+UsAvawQlx4lVfTU/tQTKAn1RMTwnMZr4=;
        b=oOpWrB+Wsoe/keeAvoYSz33QrLzUuGuPOIV9IlQfgUZMPeyhLn9J8qKG3H1hYAa8Yh
         NnB+boVuVddA0DGai+m6Ol2FuXiUIKisRCytOjUdANovSJCb4t2EYWK158xjUQ3BoJwN
         LFNxcOmTqprN20bccHHh6pDofd47PvYH2moavEvJ5Luu/shCxBtd6JI+6/D3XNWqC+5o
         lbsx5pObwYnlpK01NrX+shV1//czYSziBKYESvADpk6V99HkcqM9xfadKTfRal8FwoXh
         Je/yWKUGayWz3i9dvqMzrtmEvGJbwn3QxdstFTg3FQMBk4/D5z7TUq5c7T6ze2roGfAe
         R4kw==
X-Gm-Message-State: AOAM5312W1qswnzmKrfFlswJwdQAGr+DWorVLoduZC3k5bJ9IW4x8euD
        yULP53/Vs2XLb4Oz9Xvqw6UO3w==
X-Google-Smtp-Source: ABdhPJzHd+CNmHs2AodU37hklyfIy8MPPx1BJoHP2s0s36+epoytyytm2M4JQUPQUMRjNNE1yXtR4Q==
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr21728125ejd.160.1608676007937;
        Tue, 22 Dec 2020 14:26:47 -0800 (PST)
Received: from localhost.localdomain (dh207-99-167.xnet.hr. [88.207.99.167])
        by smtp.googlemail.com with ESMTPSA id c23sm30515385eds.88.2020.12.22.14.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 14:26:47 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, andrew@lunn.ch, linux@armlinux.org.uk
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 2/4] dt-bindings: net: Add bindings for Qualcomm QCA807x
Date:   Tue, 22 Dec 2020 23:26:35 +0100
Message-Id: <20201222222637.3204929-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222222637.3204929-1-robert.marko@sartura.hr>
References: <20201222222637.3204929-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT bindings for Qualcomm QCA807x PHYs.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../devicetree/bindings/net/qcom,qca807x.yaml | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..87e093ad4193
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,88 @@
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
+  qcom,single-led-1000:
+    description: |
+      If present, then dedicated 1000 Mbit will light up for 1000Base-T.
+      This is a workround for boards with a single LED instead of two.
+    type: boolean
+
+  qcom,single-led-100:
+    description: |
+      If present, then dedicated 1000 Mbit will light up for 100Base-TX.
+      This is a workround for boards with a single LED instead of two.
+    type: boolean
+
+  qcom,single-led-10:
+    description: |
+      If present, then dedicated 1000 Mbit will light up for 10Base-Te.
+      This is a workround for boards with a single LED instead of two.
+    type: boolean
+
+  qcom,tx-driver-strength:
+    description: PSGMII/QSGMII TX driver strength control.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
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

