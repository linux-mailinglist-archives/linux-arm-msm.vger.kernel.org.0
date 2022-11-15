Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD7B62976E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 12:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiKOLba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 06:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiKOLb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 06:31:28 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B3517E3E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:31:26 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id h9so23768594wrt.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//f8EyB8LSqoVSjEW+GVHDxH1+750hjBFR+YGqa4pV0=;
        b=jOQPJlYPnNW9IUDitc6PpH0x42P8nRMNN76WIopGX4H6ZdAX2i+7ToPcxs9pg5AQgd
         Iyv6vdhXzotGfB9gbnJyJZfzsGK7SeVOYj4k8v0xcH2bMDB463fnj0fGgaEvACF4RjEz
         tzF6R0iDGH8rgg3wvI0Z6mQx+GUrCsFcQOuYcqKeyTOp4YQmOkQIcbq9gdTkxu6EOrL5
         G7D1JfR7dPPJWVegWKyRXag0Rc85AQPcftM8S+pLyqQyJHzKZVT0ehD7CprlRBUCFQCO
         99akSAAUFhhXELzvfLqyG+itTD6SukYvFdS+OVPE2R/Ox29nLjMr63abXVx8mUpeodhJ
         yijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//f8EyB8LSqoVSjEW+GVHDxH1+750hjBFR+YGqa4pV0=;
        b=azHBX7OgJJVie+nRjkEg6XNqBeE5AmrMT/yaEa0BocPQOPMUnIQ9aCnfm7+t3k5rjf
         RetLgSVF55HSJzg1CU9KTkMMgjrQ6MVD7kRaLtiQHNdfAJSsnVe5Jyxl/IaHXPVVBcs6
         n5kdJCBPQ9ECUCqyNM0lGsQn2jKP6hSTqyaeHYg6CDmxZUEC6iMFElGjY0J1SLxWzjXm
         HzFGkiLRBLJww4mbbbj8UwQtGem7DVaKa4kdvKF7P+VGJ1Y6tv2WKviKWDCRXi6RK2Au
         zwEvjqQdHz4IwxLdcDkcKvjw/ghKSZBR4abqya1Ga9x6JK5KLcQsYSRerYuH/t6/CQUf
         ZnVQ==
X-Gm-Message-State: ANoB5plu433brRFMc7N9VA+o9G1tOSITbR/cp/Mn5mU0PuUZE+j4m9fz
        Y4aL2PoAOefN/d+XyLKs4tB5pQ==
X-Google-Smtp-Source: AA0mqf5DtAxOcotMdQwLAmHvLj0dquk5n3MaUKK4x40Gtp7hZirmSFAT1G4XkBFw8E8GxpCQt6cCUQ==
X-Received: by 2002:adf:fac3:0:b0:22e:244d:687a with SMTP id a3-20020adffac3000000b0022e244d687amr10329018wrs.82.1668511885176;
        Tue, 15 Nov 2022 03:31:25 -0800 (PST)
Received: from zoltan.localdomain ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm12273091wrm.16.2022.11.15.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 03:31:24 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/5] dt-bindings: net: qcom,ipa: deprecate modem-init
Date:   Tue, 15 Nov 2022 05:31:15 -0600
Message-Id: <20221115113119.249893-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115113119.249893-1-elder@linaro.org>
References: <20221115113119.249893-1-elder@linaro.org>
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

GSI firmware for IPA must be loaded during initialization, either by
the AP or by the modem.  The loader is currently specified based on
whether the Boolean modem-init property is present.

Instead, use a new property with an enumerated value to indicate
explicitly how GSI firmware gets loaded.  With this in place, a
third approach can be added in an upcoming patch.

The new qcom,gsi-loader property has two defined values:
  - self:   The AP loads GSI firmware
  - modem:  The modem loads GSI firmware
The modem-init property must still be supported, but is now marked
deprecated.

Update the example so it represents the SC7180 SoC, and provide
examples for the qcom,gsi-loader, memory-region, and firmware-name
properties.

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2:  Updated description, switched example completely to SC7180.

 .../devicetree/bindings/net/qcom,ipa.yaml     | 76 ++++++++++++++-----
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e752b76192df0..d0f34763b9383 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -124,19 +124,29 @@ properties:
       - const: ipa-clock-enabled-valid
       - const: ipa-clock-enabled
 
+  qcom,gsi-loader:
+    enum:
+      - self
+      - modem
+    description:
+      Indicates how GSI firmware should be loaded.  If the AP loads
+      and validates GSI firmware, this property has value "self".
+      If the modem does this, this property has value "modem".
+
   modem-init:
+    deprecated: true
     type: boolean
     description:
-      If present, it indicates that the modem is responsible for
-      performing early IPA initialization, including loading and
-      validating firwmare used by the GSI.
+      This is the older (deprecated) way of indicating how GSI firmware
+      should be loaded.  If present, the modem loads GSI firmware; if
+      absent, the AP loads GSI firmware.
 
   memory-region:
     maxItems: 1
     description:
       If present, a phandle for a reserved memory area that holds
       the firmware passed to Trust Zone for authentication.  Required
-      when Trust Zone (not the modem) performs early initialization.
+      when the AP (not the modem) performs early initialization.
 
   firmware-name:
     $ref: /schemas/types.yaml#/definitions/string
@@ -155,15 +165,36 @@ required:
   - interconnects
   - qcom,smem-states
 
-# If modem-init is not present, the AP loads GSI firmware, and
-# memory-region must be specified
-if:
-  not:
-    required:
-      - modem-init
-then:
-  required:
-    - memory-region
+allOf:
+  # If qcom,gsi-loader is present, modem-init must not be present
+  - if:
+      required:
+        - qcom,gsi-loader
+    then:
+      properties:
+        modem-init: false
+
+      # If qcom,gsi-loader is "self", the AP loads GSI firmware, and
+      # memory-region must be specified
+      if:
+        properties:
+          qcom,gsi-loader:
+            contains:
+              const: self
+      then:
+        required:
+          - memory-region
+    else:
+      # If qcom,gsi-loader is not present, we use deprecated behavior.
+      # If modem-init is not present, the AP loads GSI firmware, and
+      # memory-region must be specified.
+      if:
+        not:
+          required:
+            - modem-init
+      then:
+        required:
+          - memory-region
 
 additionalProperties: false
 
@@ -194,14 +225,17 @@ examples:
         };
 
         ipa@1e40000 {
-                compatible = "qcom,sdm845-ipa";
+                compatible = "qcom,sc7180-ipa";
 
-                modem-init;
+                qcom,gsi-loader = "self";
+                memory-region = <&ipa_fw_mem>;
+                firmware-name = "qcom/sc7180-trogdor/modem/modem.mdt";
 
-                iommus = <&apps_smmu 0x720 0x3>;
+                iommus = <&apps_smmu 0x440 0x0>,
+                         <&apps_smmu 0x442 0x0>;
                 reg = <0x1e40000 0x7000>,
-                        <0x1e47000 0x2000>,
-                        <0x1e04000 0x2c000>;
+                      <0x1e47000 0x2000>,
+                      <0x1e04000 0x2c000>;
                 reg-names = "ipa-reg",
                             "ipa-shared",
                             "gsi";
@@ -219,9 +253,9 @@ examples:
                 clock-names = "core";
 
                 interconnects =
-                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
-                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
-                        <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
+                        <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
+                        <&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_IMEM 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
                 interconnect-names = "memory",
                                      "imem",
                                      "config";
-- 
2.34.1

