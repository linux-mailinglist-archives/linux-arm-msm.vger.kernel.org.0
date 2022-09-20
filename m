Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1865BF032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiITWdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiITWdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:33:42 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EFE2EF3D;
        Tue, 20 Sep 2022 15:33:41 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id v128so3581636ioe.12;
        Tue, 20 Sep 2022 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7dW6VpENbb1lICYD4oA1HcN6j82dt3EkdyA3uGV6oeg=;
        b=VtTCe4x1mUaWHXXa1DsES0m0BPWYhBSSFBlc3YHeliahrtR+ROABm4r9Boc8UibSMe
         LmTZJrvYFEtyxubXuwI0g6W5/cqo0h5jWaGbj3XVRR/Ehnc85ZrRGtX6LiFlBeX8zwAG
         TOC6mtxDEtjNY36YZ3In0m7pPw1rUVDwxMwCI9XZmnCVSHxgaKNAhCMw8Mp7B79qh9et
         gwHmctXNt4MrDGd+NIQtnDxyamUqPeHgSnRp8hCLfCaCph49ERf7XDoGtbdGzz3Kfi8P
         xx4U00DTEdGqWh7Apa4Yj30+NiK0eUr8nBNahDqZatS/vsjaqKVC6zBkOrnaAXHUmOJ+
         QyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7dW6VpENbb1lICYD4oA1HcN6j82dt3EkdyA3uGV6oeg=;
        b=s/pZMOi1wJ4UMci25jKLLh8kSgZQbNXBYjBEUGwk3cxDLzjgvdGLKldQ6fRswiYzF5
         YvxTT9JKgzM7nJoStgnpmu+RR/JUDuq6iGjvSaVONl87jDSGKfs/2romUVD37EgvETsr
         I6xVNg6Ov0Gh8qLtksySSDj3/dw9rDEf+Ynlf5qhKjqGvYWOupsTeT9tQ35gBUg216X3
         OCQ4ekbBwu0rQ0wTQn42VWqdtTeDQwWmjBod69/7BLYvUxEiOx8sNORSoD1+sniBFUtg
         pXSn7o+rs1KJODVED2zgindq3Dl99Pp6UI4HM4W5YbAxa8XdU1urw5EiSPo/KsupO29C
         ON7w==
X-Gm-Message-State: ACrzQf3/wpMtOefxaOJKHbKLtEzHNgOHh6zKDInUdOR988TldM23j3fd
        VIsPV8Vq6Gv1ycnbnNZV0+DeDrIWD+g=
X-Google-Smtp-Source: AA6agR7RiA8RKpIrEodH6UeuVVbsIKItjIf7kKsXP+8oTbvACMmUcyMxeW68GHrx7+mM7jizjljm8A==
X-Received: by 2002:a02:c054:0:b0:358:3902:2305 with SMTP id u20-20020a02c054000000b0035839022305mr11313420jam.98.1663713220553;
        Tue, 20 Sep 2022 15:33:40 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id m21-20020a026d15000000b00355d1d555b6sm367503jac.116.2022.09.20.15.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:33:40 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: regulator: qcom,rpmh: add pm660 and pm660l pmics
Date:   Tue, 20 Sep 2022 18:33:30 -0400
Message-Id: <20220920223331.150635-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223331.150635-1-mailingradian@gmail.com>
References: <20220920223331.150635-1-mailingradian@gmail.com>
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

