Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9616D641ADF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 06:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiLDF7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 00:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiLDF7P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 00:59:15 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6465A1A38C
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 21:59:14 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id bn5so9974797ljb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 21:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTqBDcIzCyOlJwne6be0zTOYqV05a/fh0syDUdWY8ks=;
        b=yz7dPKG44LIjeBVNE8wwOiU0PTC2GnVMTB7ZnO04gQmRN0UoKckyGOw6Jb278GUD//
         F4vt/a9oEj6O9HivfEkobTwZPOyobznakNyk7uioU8mYx6n4aCVXXcaJ9anin2Gx7Kx2
         iqsanCUuY1s+WEXPHuN1NDcM2gsVHxNgfUQqPMQOJSsUsyS1ZfJnhjTnBKry4CilhLk9
         T5e5+oTkMrBo8k9iTukljIikETWNyqLvAa9KJ9iGKqNLzEvdrt/iZaXdg06d5ZzkscS7
         eM4BLpj6iyqfYdx0XApLfQlX+SKqNLLa//za/R6ukUwk6zy+mXCV0/0sdL5wNPeB5qbO
         BhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTqBDcIzCyOlJwne6be0zTOYqV05a/fh0syDUdWY8ks=;
        b=dOxQPMbQEJ3OJzFSZNnJXXvG9v/o4UpoJ5RzhEaabGcrvpj6SLIzol37DWFZ2x8rNm
         qJduEcQRCVum6AyEYAVTRtxHnIS6oiQ6N1yIKJLz1XPNmjhggrGUzFcUAAw84QTk3G6t
         u68gaN1WIVVkhtnLTkBQkqT2hKQK/9lJsBu9/oKjrpxZ3F4SYjuB3N2HsraXz5dyUoqj
         OwwV6iyBamklLeQEN+z8NrJaMeyPWa66ogvQBWwLnmnZODu+HJqVJcGmRq8lvzmhBMwX
         GzDKcjw+CPSNlKkSUj7gas3vv1/PjsfCup7wbfjCLauwkRXJWO81MEofjQUJR2yl+RHt
         +foA==
X-Gm-Message-State: ANoB5pm/LoXNbuMDPADoLdnJ8zeTZILcDqGFYngF7SO2mvquXDzpJas9
        zp2SRaF7g3psA/PBab4ejL9VZw==
X-Google-Smtp-Source: AA0mqf5FAOOi/ONzrFHV4L2qcNfsqtnrtKD1VjNTLg9d2N/KEXQGDjYmZT1PYV3xEEzYbj/9Siq9mw==
X-Received: by 2002:a05:651c:1721:b0:277:2600:9ce1 with SMTP id be33-20020a05651c172100b0027726009ce1mr19632565ljb.233.1670133552756;
        Sat, 03 Dec 2022 21:59:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004917a30c82bsm1650028lfo.153.2022.12.03.21.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 21:59:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/15] dt-bindings: thermal: tsens: support per-sensor calibration cells
Date:   Sun,  4 Dec 2022 07:58:56 +0200
Message-Id: <20221204055909.1351895-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
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

Allow specifying the exact calibration mode and calibration data as nvmem
cells, rather than specifying just a single calibration data blob.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/thermal/qcom-tsens.yaml          | 64 ++++++++++++++++---
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 1a5928cce133..f14713fd3a99 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -78,18 +78,62 @@ properties:
       - const: critical
 
   nvmem-cells:
-    minItems: 1
-    maxItems: 2
-    description:
-      Reference to an nvmem node for the calibration data
+    oneOf:
+      - minItems: 1
+        maxItems: 2
+        description:
+          Reference to an nvmem node for the calibration data
+      - minItems: 5
+        maxItems: 35
+        description: |
+          Reference to nvmem cells for the calibration mode, two calibration
+          bases and two cells per each sensor
 
   nvmem-cell-names:
-    minItems: 1
-    items:
-      - const: calib
-      - enum:
-          - calib_backup
-          - calib_sel
+    oneOf:
+      - minItems: 1
+        items:
+          - const: calib
+          - enum:
+              - calib_backup
+              - calib_sel
+      - minItems: 5
+        items:
+          - const: mode
+          - const: base1
+          - const: base2
+          - const: s0_p1
+          - const: s0_p2
+          - const: s1_p1
+          - const: s1_p2
+          - const: s2_p1
+          - const: s2_p2
+          - const: s3_p1
+          - const: s3_p2
+          - const: s4_p1
+          - const: s4_p2
+          - const: s5_p1
+          - const: s5_p2
+          - const: s6_p1
+          - const: s6_p2
+          - const: s7_p1
+          - const: s7_p2
+          - const: s8_p1
+          - const: s8_p2
+          - const: s9_p1
+          - const: s9_p2
+          - const: s10_p1
+          - const: s10_p2
+          - const: s11_p1
+          - const: s11_p2
+          - const: s12_p1
+          - const: s12_p2
+          - const: s13_p1
+          - const: s13_p2
+          - const: s14_p1
+          - const: s14_p2
+          - const: s15_p1
+          - const: s15_p2
 
   "#qcom,sensors":
     description:
-- 
2.35.1

