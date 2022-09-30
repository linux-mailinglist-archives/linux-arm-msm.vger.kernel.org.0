Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9485F168A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 01:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbiI3XOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 19:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiI3XOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 19:14:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A367C18F40B
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 16:14:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u26so382869lfk.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 16:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mDn1ZRVl5DD0yFM7lDUNpZLc1WYibNTj/87n0f3vqCk=;
        b=GeH2L0oiU04kbCIpcWo1GVRIdZLoKbB9QS+RRLxrZ/pPtFnOrrManGGHQ9osmR9iHV
         hlZCEiBCIV/jJBJdyqksSecWKsGbuLC9o081DEuSzMZbO/iafIFwNf7k4gBzDHAqJrS/
         t0q8LuukHG9O+QpK1cwEXD1PeTt03mr1NdAV8Hu0RSShi+vHw/ip+Cfa9o3RPcRXnmHQ
         ffsG1x3SS8PVfcokC323W32Byc65lFKGi4LOGy+wi8HUyAkMdfspGIjOXseH0TfkTXGR
         YAGs/C+mWGtNmLLlWBG5stzXCoCdib5qboo+8hIP5bVOexJptYguK6AhHeVn3ylMfmhX
         1Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mDn1ZRVl5DD0yFM7lDUNpZLc1WYibNTj/87n0f3vqCk=;
        b=oy7TkIhRDXmf2d51EwoaTATmFqHRv517Lh2z8r3fkkprWx/5XYZNYo1S+o57FyJuX5
         ck8cuodXqjcJGxZplAbew4xKnZCMLkGcEVFqsyvqAINtd9BpfiSMNXXiPGVnaPl1Mts8
         dvLdI5wIlObk8RF/nYfb0py2D//nxhGMB3Iaq5LXas37hdhXWIHturdubG3Xu5hkXKnm
         85bQyLhayorhU9isrkewwnODwQ25q9x7x7l+dnxVMu1HZ3hQ26CIDTiv0km+R0nvQaaN
         8fY1KJ/FjJWHii0MwfZQIf19yY6AyTVIG46z9cuKlwexml+GSShkmZ1k+uLvXXAOsuIp
         Ui3w==
X-Gm-Message-State: ACrzQf2hUxKdyiCFJAXOjLbkrjJHLeHNKkoroMEFVQ444jyL6wxhFg+R
        GstSTOj8tr/EUmb/V1i1kkOVsL+TaaD9kw==
X-Google-Smtp-Source: AMsMyM6WMSAXxxEllJAp3kvMd29rgDdR3Tq/RhwY+KGy/Qu12mcXZuzMLbEctS9YL/MlZGAlW9LlEA==
X-Received: by 2002:a05:6512:3d28:b0:49f:4b31:909b with SMTP id d40-20020a0565123d2800b0049f4b31909bmr3821703lfv.669.1664579657998;
        Fri, 30 Sep 2022 16:14:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020a05651c048600b0026c0f6be5dasm261666ljc.116.2022.09.30.16.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 16:14:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2 devics
Date:   Sat,  1 Oct 2022 02:14:16 +0300
Message-Id: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
compatibility of qcom,spm schema with regulator SAW2 devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
 .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
 2 files changed, 30 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
deleted file mode 100644
index c0e3c3a42bea..000000000000
--- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-SPM AVS Wrapper 2 (SAW2)
-
-The SAW2 is a wrapper around the Subsystem Power Manager (SPM) and the
-Adaptive Voltage Scaling (AVS) hardware. The SPM is a programmable
-power-controller that transitions a piece of hardware (like a processor or
-subsystem) into and out of low power modes via a direct connection to
-the PMIC. It can also be wired up to interact with other processors in the
-system, notifying them when a low power state is entered or exited.
-
-Multiple revisions of the SAW hardware are supported using these Device Nodes.
-SAW2 revisions differ in the register offset and configuration data. Also, the
-same revision of the SAW in different SoCs may have different configuration
-data due the differences in hardware capabilities. Hence the SoC name, the
-version of the SAW hardware in that SoC and the distinction between cpu (big
-or Little) or cache, may be needed to uniquely identify the SAW register
-configuration and initialization data. The compatible string is used to
-indicate this parameter.
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Must have
-			"qcom,saw2"
-		    A more specific value could be one of:
-			"qcom,apq8064-saw2-v1.1-cpu"
-			"qcom,msm8226-saw2-v2.1-cpu"
-			"qcom,msm8974-saw2-v2.1-cpu"
-			"qcom,apq8084-saw2-v2.1-cpu"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the first element specifies the base address and size of
-		    the register region. An optional second element specifies
-		    the base address and size of the alias register region.
-
-- regulator:
-	Usage: optional
-	Value type: boolean
-	Definition: Indicates that this SPM device acts as a regulator device
-			device for the core (CPU or Cache) the SPM is attached
-			to.
-
-Example 1:
-
-	power-controller@2099000 {
-		compatible = "qcom,saw2";
-		reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-		regulator;
-	};
-
-Example 2:
-	saw0: power-controller@f9089000 {
-		compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-		reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index f433e6e0a19f..8fe35fde70b8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -16,23 +16,33 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sdm660-gold-saw2-v4.1-l2
-          - qcom,sdm660-silver-saw2-v4.1-l2
-          - qcom,msm8998-gold-saw2-v4.1-l2
-          - qcom,msm8998-silver-saw2-v4.1-l2
-          - qcom,msm8909-saw2-v3.0-cpu
-          - qcom,msm8916-saw2-v3.0-cpu
-          - qcom,msm8226-saw2-v2.1-cpu
-          - qcom,msm8974-saw2-v2.1-cpu
-          - qcom,apq8084-saw2-v2.1-cpu
-          - qcom,apq8064-saw2-v1.1-cpu
+    oneOf:
       - const: qcom,saw2
+      - items:
+          - enum:
+              - qcom,sdm660-gold-saw2-v4.1-l2
+              - qcom,sdm660-silver-saw2-v4.1-l2
+              - qcom,msm8998-gold-saw2-v4.1-l2
+              - qcom,msm8998-silver-saw2-v4.1-l2
+              - qcom,msm8909-saw2-v3.0-cpu
+              - qcom,msm8916-saw2-v3.0-cpu
+              - qcom,msm8226-saw2-v2.1-cpu
+              - qcom,msm8974-saw2-v2.1-cpu
+              - qcom,apq8084-saw2-v2.1-cpu
+              - qcom,apq8064-saw2-v1.1-cpu
+          - const: qcom,saw2
 
   reg:
-    description: Base address and size of the SPM register region
-    maxItems: 1
+    description: Base address and size of the SPM register region. An optional
+      second element specifies the base address and size of the alias register
+      region.
+    minItems: 1
+    maxItems: 2
+
+  regulator:
+    type: boolean
+    description: Indicates that this SPM device acts as a regulator device
+      device for the core (CPU or Cache) the SPM is attached to.
 
 required:
   - compatible
@@ -79,4 +89,10 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    power-controller@2099000 {
+        compatible = "qcom,saw2";
+        reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
+        regulator;
+    };
 ...
-- 
2.35.1

