Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC2D62BD1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbiKPMII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbiKPMHi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:07:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA57A13DD6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:02:09 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso1454496wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbN05C9BT6tZAtjV0AabjgssOqluzF/LcGggZBdfA3Y=;
        b=cb+9zjCvhyti0UbdoOAhiW4t2osa707snQDeVl/tfgL6UKX9USosoOrRjI/KmlDMSC
         XJWdZAbBEMqKOo7D4PD7wxVSTgOVQHjqy5HxXGX6UiKh5P2lJI3gFj6qYIB3FhvByPAI
         yClbjytPUjJSLafldxrVuHs3JQg6V0tO4/dI1Eqzqcs4vntKlDQSYgx2BXZu98oe5gPu
         1rfXWgv55yhgSsujNVxmfwcbi0aKoUBDvN4wyU9KQM9S7WJxj6zUvb2dXymglW12HCc7
         prIR0QULOIV75FEzzn0W9vKRTWHjCMpH1iwfonO6eS4lZ5ks5q+4E21rHSZRhqZaORnH
         4BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbN05C9BT6tZAtjV0AabjgssOqluzF/LcGggZBdfA3Y=;
        b=zitmUTD300gcOoOMuQMWi6PMK9hKEwk6m6mkAzXv/ekrx2sRZmE3BVc6clv+/PEDQv
         msM5/tB3dopso4r6JDw2aZVoo5jxfMNS0QJlzrDlAeAT4C5hUXjG0id1451PLcdQK+l1
         KbGXhrQqQBK+XidIR1p1Nsgn5wYEyTGKR+WRrO6EZghFW32ZM8SlHtqPi2ZcfBWh+YG3
         mOiG14sZP7uwA9BADutrDi4j5ThiQpTb2qeyr9cvE+ADTIAqZvKaGQocY1vCnU01LR+H
         SgxusxX5T2ncBzbEXZ8yC/2wUlhTzsMWwJdkS3nIzEYHCt/BzOunpXWZNn1R2rPxya68
         0vZg==
X-Gm-Message-State: ANoB5pnTXmXChEEjm9U2SCrGRckVYfiGQFh/4497Njrdv4qq+w8eYSwM
        G4kd0eHnEtq5yVp5L51pPaNwdA==
X-Google-Smtp-Source: AA0mqf74aPoA9yYBiwn1d1okXUu7Mts0HlEy6QUf1H5Tar+cHcvbG7JpuIQAnQSA+WK4ip6PXwRHwA==
X-Received: by 2002:a05:600c:1d24:b0:3cf:6fd0:8168 with SMTP id l36-20020a05600c1d2400b003cf6fd08168mr1852303wms.206.1668600127891;
        Wed, 16 Nov 2022 04:02:07 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b002206203ed3dsm15120109wrx.29.2022.11.16.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:02:07 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH 06/10] dt-bindings: phy: qcom,qmp-pcie: Document SM8550 compatible
Date:   Wed, 16 Nov 2022 14:01:53 +0200
Message-Id: <20221116120157.2706810-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116120157.2706810-1-abel.vesa@linaro.org>
References: <20221116120157.2706810-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM8550 both G4 and G3 dual lane compatible strings, also add the
qref supply, the power domains, the reg entries and increase the number
of allowed clocks needed to support the mentioned platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index 62045dcfb20c..e5752ad93f0a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -32,6 +32,8 @@ properties:
       - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-gen4x2-pcie-phy
+      - qcom,sm8550-qmp-gen3x2-pcie-phy
+      - qcom,sm8550-qmp-gen4x2-pcie-phy
 
   reg:
     items:
@@ -47,11 +49,17 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 2
-    maxItems: 4
+    maxItems: 5
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
 
   resets:
     minItems: 1
@@ -65,6 +73,8 @@ properties:
 
   vdda-pll-supply: true
 
+  vdda-qref-supply: true
+
   vddp-ref-clk-supply: true
 
 patternProperties:
@@ -74,7 +84,7 @@ patternProperties:
     properties:
       reg:
         minItems: 3
-        maxItems: 6
+        maxItems: 7
 
       clocks:
         items:
@@ -206,6 +216,26 @@ allOf:
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
               - qcom,sm8450-qmp-gen4x2-pcie-phy
+              - qcom,sm8550-qmp-gen3x2-pcie-phy
+    then:
+      patternProperties:
+        "^phy@[0-9a-f]+$":
+          properties:
+            reg:
+              items:
+                - description: TX lane 1
+                - description: RX lane 1
+                - description: PCS
+                - description: TX lane 2
+                - description: RX lane 2
+                - description: PCS_MISC
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-qmp-gen4x2-pcie-phy
     then:
       patternProperties:
         "^phy@[0-9a-f]+$":
@@ -218,6 +248,8 @@ allOf:
                 - description: TX lane 2
                 - description: RX lane 2
                 - description: PCS_MISC
+                - description: LN_SHRD
+            vdda-qref-supply: true
 
   - if:
       properties:
-- 
2.34.1

