Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393552EF159
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbhAHLeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 06:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbhAHLeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 06:34:06 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DE8C0612FC
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 03:32:49 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id i7so7499850pgc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 03:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=Ywk/gPajX5//7GQMshPjTj9MnHRxcL6KC4lwq7LbB2IP01fdFz7eo80k75h3ei71+s
         dAkWsmc4L5j3huT/PsV7RHFzZKPjvYb7LNrXHsjC488Cj2v8PIh2zkodRZsCbPYYxL2T
         nOmK50mMGEJc1MFKxTCdeboNZSWUmOxgQjzLmy4pwOwxlRky/a45VFJB5Y5eInlZwvNG
         ymEn5H52fFqqORtirxz7wT1cdg6AneznFMAAXXzYcfhpfqvvrS/xbXKgnzwzExtj/Kff
         oqOyygJIK8VkBuQy5Qu/cu87dTXNFcNEcHx6qSd+MM5Z40dedsrAfWREb8hs0HOIQjRP
         vYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=XXnnkXZQ117IJpY0VUxu6YcYA5x67ILjJ5l4aBySZLeT7kQwWC2llMZ1++MGCh2fWh
         JKiY4BCqtxDtHevmAjHQaKHIIprUfCFMWHMPx70NRd8VJPk2S3jwcrdXfLQsRwnoBTHW
         sCS4EC780NCDR48WL1hUUp7QljP0k84uSu9+J/augdwkfMmb/DrwdKsQ09+x73TwCvQo
         8mrRWFZaTpz4nmDSWy3ZcOUdYqvLJfkj4PmOXFRm1lWhlkXBcg9yLBSUgAUGNC5ex2kh
         Zei6CKhCpxj7gOgliyB9qXdO//1BIhNBDK+cbPkqFjRhHK+cGBDK9qMOJqg/qVkd/TVF
         qmXg==
X-Gm-Message-State: AOAM532c6r5tz3/pHHeP5nTVkVWKaQlFsyxzarR3Cgl6Mxlj3KDDoM1s
        uTN8KNOErjrX1qIrnmvYmiHx
X-Google-Smtp-Source: ABdhPJzmhADrk9TrzzhURDCX80ewl79QD8pzVmxFCkdw6jsYGG8Z7Y00xObhHbUHjvYEbx7QLiYPXg==
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca16 with SMTP id t2-20020a62d1420000b029019e62a0ca16mr3243147pfl.46.1610105569213;
        Fri, 08 Jan 2021 03:32:49 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id i25sm9261573pgb.33.2021.01.08.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:32:48 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Date:   Fri,  8 Jan 2021 17:02:29 +0530
Message-Id: <20210108113233.75418-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for SDX55 APCS GCC block. The APCS block
acts as the mailbox controller and also provides a clock output and
takes 3 clock sources (pll, aux, ref) as input.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ffd09b664ff5..3c75ea0b6040 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -27,26 +27,24 @@ properties:
       - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
       - qcom,sm8150-apss-shared
+      - qcom,sdx55-apcs-gcc
 
   reg:
     maxItems: 1
 
-  clocks:
-    description: phandles to the parent clocks of the clock driver
-    items:
-      - description: primary pll parent of the clock driver
-      - description: auxiliary parent
-
   '#mbox-cells':
     const: 1
 
   '#clock-cells':
     const: 0
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
   clock-names:
-    items:
-      - const: pll
-      - const: aux
+    minItems: 2
+    maxItems: 3
 
 required:
   - compatible
@@ -55,6 +53,49 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq6018-apcs-apps-global
+            - qcom,ipq8074-apcs-apps-global
+            - qcom,msm8916-apcs-kpss-global
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,qcs404-apcs-apps-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdx55-apcs-gcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+            - description: Reference clock
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+            - const: ref
 examples:
 
   # Example apcs with msm8996
-- 
2.25.1

