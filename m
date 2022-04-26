Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61CF050FB88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349321AbiDZK6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348995AbiDZK6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:58:20 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463915FD8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:12 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bv19so35244295ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fsyz5ZToGmQmv6dlGuAH0sbjP/ZPOEclqu+9e81ehqc=;
        b=ZC7J8KWdlR5bBeQ7039WgFRYtdkbpOKCzBgU2rtRAHxSPj3FgqNYBHk6BtuCqIdtJr
         1tvD6JAt+hFaXNYVSEP3ZiX1REnDThd/iXruA7FY6rPPZK/9x/SOsOn6o43r3tWrBKEL
         gjrRue51CYllwKcebR7+Rgl7gjWMiv+hoIXFG3Jnlsa2k9OGR+LYOliNtwmY5fowFBDA
         Ib/Qg5pU0YJZSeF2ySU5YMTnXTRoT98n0x8Or6XYu0Q/bon+uU6QbGJIDQjQjJ9rtjyg
         HdFnkDzHO8OzITUzc6d/0KQMSM1Y1+7bMYB1EbQgiavrFJ/7+fSEEJQO0Ui/1FTQmKxR
         uSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fsyz5ZToGmQmv6dlGuAH0sbjP/ZPOEclqu+9e81ehqc=;
        b=twcz99/H6V++sHpS6uBE7ZPZYdvflvMeEeyDK4MphUHPZLqmSTuITOH5JS8grjw0BQ
         IqNh/0GGCIzrMMIJ7kzBhwSmXHKIdLNz9A3Uv1NwETGeOkSzcCdRTakE8K2tE4I51fYM
         +EJjjl9/9RuutT4Wfm63nxgFDODRwI8VZqeX8mtQgcV9Y806yLHPrfvKRdoVrpz1IJ7a
         RDvxV/PI6doSX6VvZEp6l27fFEdnX1VCNndXg5koH6+IOo1O+RWxBNYop2UAvlU7mniQ
         JXIQVLfqgOVRd7bQ39j6aB9iTMKKx93N+oTA9k5fPOjengxlfPp5YBsR8HJopqp2UaLz
         wKAw==
X-Gm-Message-State: AOAM532NeAN/6AeAhAsUKfpReiH/rd42vJaH1X95Gc1ND0q14IeRBhdS
        TrPOIooQzmZhAmR3sX5DgNvV8A==
X-Google-Smtp-Source: ABdhPJx1gFynf4wyj4NpoFYI6Ways6KwCZk65KA3ehQOfAl1BFhMBlXOsRng1brf637amrHB1t0OnQ==
X-Received: by 2002:a17:907:6eac:b0:6f0:a57:dfaf with SMTP id sh44-20020a1709076eac00b006f00a57dfafmr20749291ejc.105.1650970510790;
        Tue, 26 Apr 2022 03:55:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s5-20020a508dc5000000b004241a4abbdfsm6062843edh.45.2022.04.26.03.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 03:55:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/3] regulator: dt-bindings: qcom,rpmh: document supplies per variant
Date:   Tue, 26 Apr 2022 12:55:00 +0200
Message-Id: <20220426105501.73200-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
References: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
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

The RPMH regulator binding covers several devices with different
regulator supplies, so it uses patterns matching broad range of these
supplies.  This works fine but is not specific and might miss actual
mistakes when a wrong supply property is used for given variant.

Describe the supplies depending on the compatible, using a defs-allOf
method.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../regulator/qcom,rpmh-regulator.yaml        | 256 +++++++++++++++++-
 1 file changed, 242 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 842ccef691b8..6b99897fa404 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -95,35 +95,263 @@ properties:
   vdd-rgb-supply:
     description: Input supply phandle of rgb.
 
-  vin-lvs-1-2-supply:
-    description: Input supply phandle of one or more regulators.
-
-  vdd-bob-supply:
-    description: BOB regulator parent supply phandle.
-
   bob:
     type: object
     $ref: "regulator.yaml#"
     description: BOB regulator node.
 
 patternProperties:
-  "^vdd-s([0-9]+)-supply$":
-    description: Input supply phandle(s) of one or more regulators.
-
-  "^vdd-(l[0-9]+[-]){1,5}supply$":
-    description: Input supply phandle(s) of one or more regulators.
-
   "^(smps|ldo|lvs)[0-9]+$":
     type: object
     $ref: "regulator.yaml#"
     description: smps/ldo regulator nodes(s).
 
-additionalProperties: false
-
 required:
   - compatible
   - qcom,pmic-id
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm6150-rpmh-regulators
+    then:
+      properties:
+        vdd-l2-l3-supply: true
+        vdd-l4-l7-l8-supply: true
+        vdd-l5-l16-l17-l18-l19-supply: true
+        vdd-l10-l14-l15-supply: true
+        vdd-l11-l12-l13-supply: true
+      patternProperties:
+        "^vdd-l[169]-supply$": true
+        "^vdd-s[1-5]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm6150l-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l1-l8-supply: true
+        vdd-l2-l3-supply: true
+        vdd-l4-l5-l6-supply: true
+        vdd-l7-l11-supply: true
+        vdd-l9-l10-supply: true
+      patternProperties:
+        "^vdd-s[1-8]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm7325-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l4-l12-l15-supply: true
+        vdd-l2-l7-supply: true
+        vdd-l6-l9-l10-supply: true
+        vdd-l11-l17-l18-l19-supply: true
+        vdd-l13-supply: true
+        vdd-l14-l16-supply: true
+      patternProperties:
+        "^vdd-l[358]-supply$": true
+        "^vdd-s[1-8]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8005-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-s[1-4]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8009-rpmh-regulators
+            - qcom,pm8009-1-rpmh-regulators
+    then:
+      properties:
+        vdd-l5-l6-supply: true
+      patternProperties:
+        "^vdd-l[1-47]-supply$": true
+        "^vdd-s[1-2]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8150-rpmh-regulators
+            - qcom,pmm8155au-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l8-l11-supply: true
+        vdd-l2-l10-supply: true
+        vdd-l3-l4-l5-l18-supply: true
+        vdd-l6-l9-supply: true
+        vdd-l7-l12-l14-l15-supply: true
+        vdd-l13-l16-l17-supply: true
+      patternProperties:
+        "^vdd-s([1-9]|10)-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8150l-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l1-l8-supply: true
+        vdd-l2-l3-supply: true
+        vdd-l4-l5-l6-supply: true
+        vdd-l7-l11-supply: true
+        vdd-l9-l10-supply: true
+      patternProperties:
+        "^vdd-s[1-8]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8350-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l4-supply: true
+        vdd-l2-l7-supply: true
+        vdd-l3-l5-supply: true
+        vdd-l6-l9-l10-supply: true
+        vdd-l8-supply: true
+      patternProperties:
+        "^vdd-s([1-9]|1[0-2])-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8350c-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l1-l12-supply: true
+        vdd-l2-l8-supply: true
+        vdd-l3-l4-l5-l7-l13-supply: true
+        vdd-l6-l9-l11-supply: true
+        vdd-l10-supply: true
+      patternProperties:
+        "^vdd-s([1-9]|10)-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8450-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-l[1-4]-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8998-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l27-supply: true
+        vdd-l2-l8-l17-supply: true
+        vdd-l3-l11-supply: true
+        vdd-l4-l5-supply: true
+        vdd-l6-supply: true
+        vdd-l7-l12-l14-l15-supply: true
+        vdd-l9-supply: true
+        vdd-l10-l23-l25-supply: true
+        vdd-l13-l19-l21-supply: true
+        vdd-l16-l28-supply: true
+        vdd-l18-l22-supply: true
+        vdd-l20-l24-supply: true
+        vdd-l26-supply: true
+        vin-lvs-1-2-supply: true
+      patternProperties:
+        "^vdd-s([1-9]|1[0-3])-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmg1110-rpmh-regulators
+    then:
+      properties:
+        vdd-s1-supply: true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmi8998-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmr735a-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-supply: true
+        vdd-l3-supply: true
+        vdd-l4-supply: true
+        vdd-l5-l6-supply: true
+      patternProperties:
+        "^vdd-s[1-3]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmx55-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-supply: true
+        vdd-l3-l9-supply: true
+        vdd-l4-l12-supply: true
+        vdd-l5-l6-supply: true
+        vdd-l7-l8-supply: true
+        vdd-l10-l11-l13-supply: true
+      patternProperties:
+        "^vdd-l1[4-6]-supply$": true
+        "^vdd-s[1-7]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmx65-rpmh-regulators
+    then:
+      properties:
+        vdd-l2-l18-supply: true
+        vdd-l5-l6-l16-supply: true
+        vdd-l8-l9-supply: true
+        vdd-l11-l13-supply: true
+      patternProperties:
+        "^vdd-l[1347]-supply$": true
+        "^vdd-l1[0245789]-supply$": true
+        "^vdd-l2[01]-supply$": true
+        "^vdd-s[1-8]-supply$": true
+
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-- 
2.32.0

