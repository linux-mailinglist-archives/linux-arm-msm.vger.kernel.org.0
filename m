Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220B95BDA11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiITCXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiITCW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:22:59 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D0D27FD5;
        Mon, 19 Sep 2022 19:22:58 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id q83so1135943iod.7;
        Mon, 19 Sep 2022 19:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7dW6VpENbb1lICYD4oA1HcN6j82dt3EkdyA3uGV6oeg=;
        b=YcXNI59uj7Oh4U2GXLfezpHNMxu1yWLDkELOXi75g3bMLyAxOuARuYTeEasv7uQ/Z2
         XRVAz80ITzVfWAF5pJ7IKA2SD9UcLKsf4zljRsIozAr90SmMDZIWHLBCjExQPmH6rARY
         AWvhmNMgI5D8rIGfwAcHkXJSKmuSTtBG/BTty+RF6K1lV0e6ah/ntvxNrB+tZY5Yu+dq
         B8zzb/oA3fgiavkUa2isYWd7zUNtX/u3I7wuLw1VthvhJl3jXJcy1EgeGVJYQKBOHylk
         VEiGwYTAU01iMf9GBltrLEG5zSV/5ey9/RMaF+2cJeb8X++Xg5dT9Tssa0+NByKyN2ix
         idWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7dW6VpENbb1lICYD4oA1HcN6j82dt3EkdyA3uGV6oeg=;
        b=bGRWmPogZ8XnD0M+W2dvFWJ8N42YdCBPvOVu49IJ5vJwJlFryAw9qMJU4mqksf/EOU
         vNLvwc6FRlwfLY5ghZz7kRd9OEankTV4PuTUctqqQgvp6JMOu952DJZt5/eA4psirVJ0
         vy/h9CHsy6JgmIEG5m/l5pdYZr13QEK1CcoOXhiomDceJ+ztZwtvNdprnplA8VCfvFm/
         eYvnhoUQyiGBQU17yLfPxs1Bw6qORr+HdTWIdaiuxcNO9nTQQ728o1a0hJ6tcRPBUgTw
         P5jN5V3SlhAGTLAABLnmyUMKNZQG7xxlB0HEniSn2sEA5xEelxS0qE9yV+DybG38IJ4j
         rqVA==
X-Gm-Message-State: ACrzQf2RKNMvNk68xvVXAmaVzkJAc3SgdbP6iOhKpFqtAduMLaF5Rgps
        aNNcrswY5jwlrrP+g/zhx2XueZ62QGY=
X-Google-Smtp-Source: AMsMyM48VBzf1cUR6Rtz1xX1z9VkXONog/nhTQHKtfRF1naKcKFjCpJGc77EC90ZrFMUnJwkhCZxlA==
X-Received: by 2002:a05:6638:3d09:b0:357:34bc:7ec8 with SMTP id cl9-20020a0566383d0900b0035734bc7ec8mr9570732jab.238.1663640577359;
        Mon, 19 Sep 2022 19:22:57 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id r18-20020a92c5b2000000b002de7ceafb4esm189031ilt.20.2022.09.19.19.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:22:56 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,rpmh: add pm660 and pm660l pmics
Date:   Mon, 19 Sep 2022 22:22:50 -0400
Message-Id: <20220920022251.3073-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920022251.3073-1-mailingradian@gmail.com>
References: <20220920022251.3073-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM670 uses RPMh for managing the PM660 and PM660L. Document RPMh
support for the PMIC.

Link: https://android.googlesource.com/kernel/msm/+/58064f13c0a436a82c35f2e3b5a122d874ae5846%5E%21/#F0
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../regulator/qcom,rpmh-regulator.yaml        | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 92ff4d59ba20..90c3bda31c23 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -37,6 +37,8 @@ description: |
       For PM6150, smps1 - smps5, ldo1 - ldo19
       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
       For PM6350, smps1 - smps5, ldo1 - ldo22
+      For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
+      For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
       For PM7325, smps1 - smps8, ldo1 - ldo19
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
@@ -57,6 +59,8 @@ properties:
       - qcom,pm6150-rpmh-regulators
       - qcom,pm6150l-rpmh-regulators
       - qcom,pm6350-rpmh-regulators
+      - qcom,pm660-rpmh-regulators
+      - qcom,pm660l-rpmh-regulators
       - qcom,pm7325-rpmh-regulators
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
@@ -148,6 +152,38 @@ allOf:
       patternProperties:
         "^vdd-s[1-8]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm660-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l6-l7-supply: true
+        vdd-l2-l3-supply: true
+        vdd-l5-supply: true
+        vdd-l8-l9-l10-l11-l12-l13-l14-supply: true
+        vdd-l15-l16-l17-l18-l19-supply: true
+      patternProperties:
+        "^vdd-s[1-6]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm660l-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l1-l9-l10-supply: true
+        vdd-l2-supply: true
+        vdd-l3-l5-l7-l8-supply: true
+        vdd-l4-l6-supply: true
+        vdd-s3-s4-supply: true
+      patternProperties:
+        "^vdd-s[125]-supply$": true
+
   - if:
       properties:
         compatible:
-- 
2.37.3

