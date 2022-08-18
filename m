Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9384859902D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242473AbiHRWI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbiHRWIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:08:55 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA1E696E0;
        Thu, 18 Aug 2022 15:08:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z20so3516524edb.9;
        Thu, 18 Aug 2022 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/+Xzgtqyjpf0bxywlg9y8nGdpmWVYev076qjkdvwa1A=;
        b=MY//JHwwO1YpltNDwPhaQxlJjdzftbOOHfhrEPFV9K3/tH6HcCR3wgliWwLmwFHSWx
         Yeh8CNusSePTDjz//iqA7ZajsjX24hcTB8KEWpRWBAszBNpGg26l0TFAQ2zRAFNUVBJC
         WRHd0HRhw0ayo456nQxaPNbd5ufZaYfhEr9wqkY8dUy1GxUrVcLqJUepzYCQJxBVTYRY
         29l72wwrj80AfretwbCmIZh+BcbMi2MfTwH7DqK6o4H8Z3DyimDHaqoNbr1NE/bKnKF8
         UUJ3CRIcNErKGkMCuDlJlU67I3KQn1iEjcRvo8N0MjMSEB6M/AHpl/s3kgKvhqP9m7Pb
         EiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/+Xzgtqyjpf0bxywlg9y8nGdpmWVYev076qjkdvwa1A=;
        b=WsETs+QjrM1+6tiiNPwwgUk6KNNDplJCi8ne1cpWXsOdI4Asp8t4DNW4zmwEH23AEC
         OFQ/h6Sf1id+qPHFoMOBS9IuZpnC7sy5Q/kez7fuMyt1uU4Z20cAbq0NceLAHdn198oo
         4X0iazw7Yu5YgENd3F/avTReEXrnIorBA9vsUD9AeKP+/yht075e73lxZVRPomy/g5Zo
         +5pJ04v7Tkn+25YkbJrum/dS/+KJuFRc9q2jluHw9O9jtWf90MZZnNlnPjbgT4A4vsnf
         GRSkgCtg+nskAGnsUPXfaX4aSdCGjVA+GAu2vjAFyifGAKQk157JQjoyetYjup91kI0q
         IyRA==
X-Gm-Message-State: ACgBeo0JU9v+8FAZ1wz/J+OH3QkCeVaiKds9y1qXLNlzwYfy1BjZTW7G
        ryT3tiHtih6h1306m3FjskQ=
X-Google-Smtp-Source: AA6agR69AmzTEY0+Kwvzc58NlTH9muOxazd4Ll5IOveIWTHGW657knLfuRJAFFBxHDVENOjQMtdGmQ==
X-Received: by 2002:a05:6402:5488:b0:443:39c5:5347 with SMTP id fg8-20020a056402548800b0044339c55347mr3739678edb.204.1660860532383;
        Thu, 18 Aug 2022 15:08:52 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-74.zg.cable.xnet.hr. [94.253.165.74])
        by smtp.googlemail.com with ESMTPSA id j9-20020a17090643c900b00730b61d8a5esm1385022ejn.61.2022.08.18.15.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 15:08:52 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     Robert Marko <robimarko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 2/4] dt-bindings: mailbox: qcom: correct clocks for IPQ6018 and IPQ8074
Date:   Fri, 19 Aug 2022 00:08:47 +0200
Message-Id: <20220818220849.339732-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818220849.339732-1-robimarko@gmail.com>
References: <20220818220849.339732-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 APSS driver is registered by APCS as they share the same register
space, and it uses "pll" and "xo" as inputs.

Correct the allowed clocks for IPQ6018 and IPQ8074 as they share the same
driver to allow "pll" and "xo" as clock-names.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v8:
* Add maxItems to clocks and clock-names
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 46 ++++++++++++++-----
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 982bcdebba4c..f24fd84b4b05 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -45,10 +45,7 @@ properties:
   clocks:
     description: phandles to the parent clocks of the clock driver
     minItems: 2
-    items:
-      - description: primary pll parent of the clock driver
-      - description: auxiliary parent
-      - description: reference clock
+    maxItems: 3
 
   '#mbox-cells':
     const: 1
@@ -58,10 +55,7 @@ properties:
 
   clock-names:
     minItems: 2
-    items:
-      - const: pll
-      - const: aux
-      - const: ref
+    maxItems: 3
 
 required:
   - compatible
@@ -75,8 +69,6 @@ allOf:
       properties:
         compatible:
           enum:
-            - qcom,ipq6018-apcs-apps-global
-            - qcom,ipq8074-apcs-apps-global
             - qcom,msm8916-apcs-kpss-global
             - qcom,msm8994-apcs-kpss-global
             - qcom,msm8996-apcs-hmss-global
@@ -90,7 +82,13 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 2
+          items:
+            - description: primary pll parent of the clock driver
+            - description: auxiliary parent
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
   - if:
       properties:
         compatible:
@@ -99,7 +97,31 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 3
+          items:
+            - description: primary pll parent of the clock driver
+            - description: auxiliary parent
+            - description: reference clock
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+            - const: ref
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq6018-apcs-apps-global
+            - qcom,ipq8074-apcs-apps-global
+    then:
+      properties:
+        clocks:
+          items:
+            - description: primary pll parent of the clock driver
+            - description: XO clock
+        clock-names:
+          items:
+            - const: pll
+            - const: xo
   - if:
       properties:
         compatible:
-- 
2.37.2

