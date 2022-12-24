Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6488655A8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 16:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiLXPmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 10:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbiLXPme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 10:42:34 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B874DECD
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:42:30 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z26so10704451lfu.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJqi/1NfJw5LwmQrgbx8SfjaLOZbl6rNXmEOBkpmpe8=;
        b=wUUm02cnXMPlt2wsPdE3aMA2yBXTJM2VCaWmwwqZJrw3xAXSIGYwmq1jxaG0rXOYKE
         pzioV0tukf8viXwELdkDqkNEpYMvEFEshPpkbNHzbfy0lrVU+cZaEAftFOBkTVPxl3GR
         Rg7n/u37E97Uc4n0itbD/nmCsF/FHRVNLJOf+zspSgk1VmkG8sbPOqzyKiAucSB5cqZ1
         YVpD0IySp44WMQR+giw+N88E13sqO472wa0pCukxj/oYxWZ7W3B4vSJouQd0C0kWzOeO
         koGYyJziLfTOz2NkPujTsjY3aHk/YkDSiULt5DlodvFeTjE+eNw6Osye0pON7pPSkGAB
         /48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJqi/1NfJw5LwmQrgbx8SfjaLOZbl6rNXmEOBkpmpe8=;
        b=gifl/Hv/p0JYRclEWPowQds4ptfWo64ZEWRinS5ALeYa08In1kvrEDmI39H1h2yLXi
         xkUY0C0AVlQlNDrAT/UloX9qn7aYZ6IY+GheYybpUQrz09shd61qxK78i3uSw0a5ojNW
         iL80zuxiJATxrnK7S9ULUZUm3yftSIuXMPYQgQdZQ9y7ZoisA43wesaF0hkBflbGjliC
         HZHXmpNvaUc6l2N4ikTz28Ldl6UvpOEXTsCPNR2elaJ7SsNFpb8AkidXUBrfrqV0dDkG
         GCAxvq1b3/PZ8WFvoIN22nMy6HTyqW+JhZlnbB2ASofVhZHJ2m6TxQR0fmIJFdITGceG
         jUbg==
X-Gm-Message-State: AFqh2kqtTtN2uKp2hmzy1y+9c1M67wPMw0stnU4ax2pxSmtjwo4R0T8X
        WKJ50e0BTq2yZ8mmD1yaLD1ILQ==
X-Google-Smtp-Source: AMrXdXtxRWvo/hNKLsncTNLOdWGWw0VPar3rFmWqe8f8wqB2p0eEuNC5Pu/kpr5/kkvzuhjNN/QIUw==
X-Received: by 2002:a05:6512:3984:b0:4a4:68b8:c2dd with SMTP id j4-20020a056512398400b004a468b8c2ddmr4191249lfu.52.1671896548741;
        Sat, 24 Dec 2022 07:42:28 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm979918lfa.297.2022.12.24.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 07:42:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: phy: qcom,qusb2: do not define properties in "if" block
Date:   Sat, 24 Dec 2022 16:42:26 +0100
Message-Id: <20221224154226.43417-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is more readable to define properties in top-level "properties:" and
restrict them (if needed) per compatible in the "if" block.  Defining
properties in "if" block  does not work correctly with
additionalProperties:false:

  sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value',
    'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/qcom,qusb2-phy.yaml          | 160 ++++++++++--------
 1 file changed, 85 insertions(+), 75 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 636ea430fbff..7f403e77f320 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -82,81 +82,74 @@ properties:
       Phandle to TCSR syscon register region.
     $ref: /schemas/types.yaml#/definitions/phandle
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: qcom,qusb2-v2-phy
-then:
-  properties:
-    qcom,imp-res-offset-value:
-      description:
-        It is a 6 bit value that specifies offset to be
-        added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
-        tuning parameter that may vary for different boards of same SOC.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 63
-      default: 0
-
-    qcom,bias-ctrl-value:
-      description:
-        It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
-        tuning parameter that may vary for different boards of same SOC.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 63
-      default: 32
-
-    qcom,charge-ctrl-value:
-      description:
-        It is a 2 bit value that specifies charge-ctrl-value. It is a PHY
-        tuning parameter that may vary for different boards of same SOC.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 3
-      default: 0
-
-    qcom,hstx-trim-value:
-      description:
-        It is a 4 bit value that specifies tuning for HSTX
-        output current.
-        Possible range is - 15mA to 24mA (stepsize of 600 uA).
-        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 15
-      default: 3
-
-    qcom,preemphasis-level:
-      description:
-        It is a 2 bit value that specifies pre-emphasis level.
-        Possible range is 0 to 15% (stepsize of 5%).
-        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 3
-      default: 2
-
-    qcom,preemphasis-width:
-      description:
-        It is a 1 bit value that specifies how long the HSTX
-        pre-emphasis (specified using qcom,preemphasis-level) must be in
-        effect. Duration could be half-bit of full-bit.
-        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 1
-      default: 0
-
-    qcom,hsdisc-trim-value:
-      description:
-        It is a 2 bit value tuning parameter that control disconnect
-        threshold and may vary for different boards of same SOC.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      minimum: 0
-      maximum: 3
-      default: 0
+  qcom,imp-res-offset-value:
+    description:
+      It is a 6 bit value that specifies offset to be
+      added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
+      tuning parameter that may vary for different boards of same SOC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+
+  qcom,bias-ctrl-value:
+    description:
+      It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
+      tuning parameter that may vary for different boards of same SOC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 32
+
+  qcom,charge-ctrl-value:
+    description:
+      It is a 2 bit value that specifies charge-ctrl-value. It is a PHY
+      tuning parameter that may vary for different boards of same SOC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+
+  qcom,hstx-trim-value:
+    description:
+      It is a 4 bit value that specifies tuning for HSTX
+      output current.
+      Possible range is - 15mA to 24mA (stepsize of 600 uA).
+      See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 3
+
+  qcom,preemphasis-level:
+    description:
+      It is a 2 bit value that specifies pre-emphasis level.
+      Possible range is 0 to 15% (stepsize of 5%).
+      See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 2
+
+  qcom,preemphasis-width:
+    description:
+      It is a 1 bit value that specifies how long the HSTX
+      pre-emphasis (specified using qcom,preemphasis-level) must be in
+      effect. Duration could be half-bit of full-bit.
+      See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+    default: 0
+
+  qcom,hsdisc-trim-value:
+    description:
+      It is a 2 bit value tuning parameter that control disconnect
+      threshold and may vary for different boards of same SOC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
 
 required:
   - compatible
@@ -169,6 +162,23 @@ required:
   - vdda-phy-dpdm-supply
   - resets
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,qusb2-v2-phy
+    then:
+      properties:
+        qcom,imp-res-offset-value: false
+        qcom,bias-ctrl-value: false
+        qcom,charge-ctrl-value: false
+        qcom,hstx-trim-value: false
+        qcom,preemphasis-level: false
+        qcom,preemphasis-width: false
+        qcom,hsdisc-trim-value: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

