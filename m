Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4B16511DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiLSSaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbiLSSab (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:30:31 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE25A13F13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:29 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o12so9951373pjo.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp5/r4pBB7Qfe42Kb/SOy1gZ4/1fvqqZd0eC3Bvgy/g=;
        b=yZTc3yPI+5cJbX8k4KaCD8AISoWi4FSH0Y4kwm9FM5ZoS1kqwPN2JLPXjfssYJq44s
         mSArQUVe8TmJXm6H0Tj03tQZ+qZwpgWVA4TDEOSejmSBR+3HGTfRV9/VtLMW5f11vfre
         NXC2SSh/F+wa8YoBW+Jg8Zkd6ikqnhTurm2ut1bKirPNzVgToMhVmn5T7aMn0tg2Fn13
         LxkEOUjn6ndUDAyM3Z80WPmGYv8JVLPQDSXhvxi0qaXXH4bf67swLhDd4TA6zoZuIv7G
         A5v7D8TLQFQoQVMOxQvelst004zRhLhb73Z3ttS9mlPIlJG2N27szYXXgFUSAyHJnAi9
         hh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp5/r4pBB7Qfe42Kb/SOy1gZ4/1fvqqZd0eC3Bvgy/g=;
        b=jmUBUt7QbjmiGYx+1pwV7w5ap7TyNWPWnobBRxiYbsTSq3jTxXzU0DQqd22TeAFVYa
         r0zO17sIeJ0AivdYLQg4J8B4HxdA5xqDYYGZRpPz6FKaACOElrtGQUOukBHfwrkeDjLA
         pMK/OT2rxTVSwhnpGIGibXQp2jvBIHWeFu1iHCjkiu+YwBL6ItdZtqMpEleBiFihK//h
         uE+1fKawpZMZZK8x3iXZ/uENwvNupm07TNj+rMoeX6V7D9nzJWFsBDbSnPiS3JcAeKTU
         Vpf8AVsWL8Ku8DkIYNATOM+J26UZlVJJaSkHTWjVzd+VJqucXYnk3aD5m0uB+slY2pJP
         0kOg==
X-Gm-Message-State: ANoB5pmLHKWK/rJ2aFeNo8S6mZWThLhHxTQ3Sw3FtcPyrHDx9Q7Gu6rS
        AzK0LcCA0i4vLp2kdKQfLFkw
X-Google-Smtp-Source: AA0mqf5xpwQUoppAS9nUMHRN5yR/fKI3Fcu3wyMLdLyV0I6CP6nPnodkkBh6npJDFQxWZM/AiqS3gA==
X-Received: by 2002:a17:902:8ec6:b0:189:ba1f:b168 with SMTP id x6-20020a1709028ec600b00189ba1fb168mr40692944plo.1.1671474629094;
        Mon, 19 Dec 2022 10:30:29 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:30:28 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 02/15] dt-bindings: arm: msm: Fix register regions used for LLCC banks
Date:   Mon, 19 Dec 2022 23:59:45 +0530
Message-Id: <20221219182958.476231-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
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

Register regions of the LLCC banks are located at different addresses.
Currently, the binding just lists the LLCC0 base address and tries to
cover all the banks using a single size. This is entirely wrong as there
are other register regions that happen to lie inside the size covered by
the binding such as the memory controller and holes.

So this needs to be fixed by specifying the base address of individual
LLCC banks. This approach will break the existing users of this binding
as the register regions are splitted and the drivers now cannot use
LLCC0 register region for accessing rest of the banks (which is wrong
anyway).

But considering the fact that the binding was wrong from the day one and
also the device drivers going wrong by the binding, this breakage is
acceptable.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/arm/msm/qcom,llcc.yaml           | 125 ++++++++++++++++--
 1 file changed, 114 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index d1df49ffcc1b..050e21d4a03e 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -33,14 +33,12 @@ properties:
       - qcom,sm8550-llcc
 
   reg:
-    items:
-      - description: LLCC base register region
-      - description: LLCC broadcast base register region
+    minItems: 2
+    maxItems: 9
 
   reg-names:
-    items:
-      - const: llcc_base
-      - const: llcc_broadcast_base
+    minItems: 2
+    maxItems: 9
 
   interrupts:
     maxItems: 1
@@ -50,15 +48,120 @@ required:
   - reg
   - reg-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-llcc
+              - qcom,sm6350-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc_broadcast_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc_broadcast_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-llcc
+              - qcom,sc8280xp-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc_broadcast_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-llcc
+              - qcom,sm8150-llcc
+              - qcom,sm8250-llcc
+              - qcom,sm8350-llcc
+              - qcom,sm8450-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc_broadcast_base
+
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    system-cache-controller@1100000 {
-      compatible = "qcom,sdm845-llcc";
-      reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
-      reg-names = "llcc_base", "llcc_broadcast_base";
-      interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        system-cache-controller@1100000 {
+            compatible = "qcom,sdm845-llcc";
+            reg = <0 0x01100000 0 0x50000>, <0 0x01180000 0 0x50000>,
+                <0 0x01200000 0 0x50000>, <0 0x01280000 0 0x50000>,
+                <0 0x01300000 0 0x50000>;
+            reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+                "llcc3_base", "llcc_broadcast_base";
+            interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+        };
     };
-- 
2.25.1

