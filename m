Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EA052746F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 00:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiENWBa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 18:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiENWB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 18:01:29 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7E91838E
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 15:01:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cx11-20020a17090afd8b00b001d9fe5965b3so13892082pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 15:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oToXy3xTNS1Xrlo3K8Yhkv5IIUrt6R7QFCfNOmXO068=;
        b=hjeD0JtTu9HCloDomo5gifGQAVoohwAocHqR920GXizM89MPN9ge1mJE8jU+9rZ2GB
         M/hpqIq23MiIafYD/YfrA7Cs+1+gMvxYqNXaWAsh3ePiJ0HW6KK53y2j2hTHcSbxGlwy
         f7FM1Eh0r3czgCMRBCznkQgi2epcSmx9EePLr5z0r6yOCMyFoegq39iK9srq6FJLULkX
         YJQwgK2ptpud+kC/DDVypZNvOOeQhhHcBtNTcjF8fL0fKbx0k0tlfgj/37nnXvJSYE71
         nk0o9xurlIVtqyo13z4/v9z5WPVbCRLRv3CNqbCy0WHLU1xa22SWVYXXkr0wBztSyKH3
         79Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oToXy3xTNS1Xrlo3K8Yhkv5IIUrt6R7QFCfNOmXO068=;
        b=f35CpAa6eEnRPKZO/RtIkWgZy7VD3YbBGGT/9WWRg9KbmHtZ3pDJLJxjF9+Uhb2Jf7
         JPGjr5si0N+0pJSRH3w7LCqqN6RNFOfZ4gt5/e0jLHPk89CDiP6g1kb4rRllAPQhZzf5
         hfwiqFiFlxIZws6YViJDX917442R0gBxBAyg4Ul4Xmp3f/zDSbIFRN9DwA1d8Opi6VLN
         NBNW39HfYR/b2LEQZ0ysPz2Ch6mqSZR8E2M27x4k2shT2T9/UR25I9g610u+PEokK6Br
         7WpJdhBJRHqVNs3UbZQhy1+eX0q/B+NDpV7cQawTB1SbMY6h3myU5lMjACfnpSGqzjkd
         paDg==
X-Gm-Message-State: AOAM53156GX0rwrd4CXl8ovR1qhSUXfOg1keFo5CbFSHydFp5VnK4FQr
        S7xIMS9xw8gI3yon87PDo+cNgxzlqzmfDw==
X-Google-Smtp-Source: ABdhPJwMzMsk5EaUHlAcCFYDsjNMwZ0Yrz6icmcDXUfxRWu8x/NjA52gzS/Diw9yGGEC4NqDW1LSfA==
X-Received: by 2002:a17:903:182:b0:15e:8de0:2859 with SMTP id z2-20020a170903018200b0015e8de02859mr11081752plg.124.1652565687467;
        Sat, 14 May 2022 15:01:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id x27-20020aa79a5b000000b00512eb1de5c6sm3257303pfj.194.2022.05.14.15.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 15:01:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-mmc@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org
Subject: [PATCH 1/1] dt-bindings: mmc: sdhci-msm: Fix issues in yaml bindings
Date:   Sun, 15 May 2022 03:31:16 +0530
Message-Id: <20220514220116.1008254-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rob pointed some remaining issues in the sdhci-msm yaml
bindings (via [1]).

Fix the same by first using the 'mmc-controller.yaml' as
'ref' and thereafter also fix the issues reported by
'make dtbs_check' check.

[1]. https://lore.kernel.org/linux-arm-msm/YnLmNCwNfoqZln12@robh.at.kernel.org/

Fixes: a45537723f4b ("dt-bindings: mmc: sdhci-msm: Convert bindings to yaml")
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
-> This patch uses the dts changes sent (here: https://lore.kernel.org/linux-arm-msm/20220514215424.1007718-1-bhupesh.sharma@linaro.org/), for fixing the dtbs_check errors.
-> This patch is rebased on 'linux-next/master'

 .../devicetree/bindings/mmc/sdhci-msm.yaml    | 52 ++++++++++++++++---
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index e4236334e748..31a3ce208e1a 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -17,6 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,sdhci-msm-v4
+        deprecated: true
       - items:
           - enum:
               - qcom,apq8084-sdhci
@@ -27,6 +30,9 @@ properties:
               - qcom,msm8992-sdhci
               - qcom,msm8994-sdhci
               - qcom,msm8996-sdhci
+          - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
+      - items:
+          - enum:
               - qcom,qcs404-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci
@@ -38,12 +44,7 @@ properties:
               - qcom,sm6350-sdhci
               - qcom,sm8150-sdhci
               - qcom,sm8250-sdhci
-          - enum:
-              - qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
-              - qcom,sdhci-msm-v5 # for sdcc version 5.0
-      - items:
-          - const: qcom,sdhci-msm-v4 # Deprecated (only for backward compatibility)
-                                     # for sdcc versions less than 5.0
+          - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
 
   reg:
     minItems: 1
@@ -53,6 +54,28 @@ properties:
       - description: CQE register map
       - description: Inline Crypto Engine register map
 
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    oneOf:
+      - items:
+          - const: hc_mem
+      - items:
+          - const: hc_mem
+          - const: core_mem
+      - items:
+          - const: hc_mem
+          - const: cqe_mem
+      - items:
+          - const: hc_mem
+          - const: cqe_mem
+          - const: ice_mem
+      - items:
+          - const: hc_mem
+          - const: core_mem
+          - const: cqe_mem
+          - const: ice_mem
+
   clocks:
     minItems: 3
     items:
@@ -121,6 +144,16 @@ properties:
     description: A phandle to sdhci power domain node
     maxItems: 1
 
+  mmc-ddr-1_8v: true
+
+  mmc-hs200-1_8v: true
+
+  mmc-hs400-1_8v: true
+
+  bus-width: true
+
+  max-frequency: true
+
 patternProperties:
   '^opp-table(-[a-z0-9]+)?$':
     if:
@@ -140,7 +173,10 @@ required:
   - clock-names
   - interrupts
 
-additionalProperties: true
+allOf:
+  - $ref: mmc-controller.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -149,7 +185,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    sdhc_2: sdhci@8804000 {
+    sdhc_2: mmc@8804000 {
       compatible = "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5";
       reg = <0 0x08804000 0 0x1000>;
 
-- 
2.35.3

