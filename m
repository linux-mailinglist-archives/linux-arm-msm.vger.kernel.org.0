Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3C762BD13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbiKPMHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiKPMHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:07:32 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6A913F98
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:02:04 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so2709883wmi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi/VS5VU4Lm5i+pPezZIpAbB2sXalMrX/FqWASjjTY4=;
        b=HTXP5c1AMiiqA6OJWfHeApmyLBRuAId/J3xeLB/MYOlCgnOXMexGuzWthoqR9fvUKM
         QRrhtaMBebFYZaqGi2ckcUshJ0Hpk9iZLYscGeBTPNEWbr0HKymHxQpVp1x+5n57bwAu
         Hd6rnN+NhuhalBfdUBqDnmKExGC2FPH+eu/fAJPTA5sWX5vd9vKdozLM2GNBdmWekLYD
         IsCVPp0zt+PLpal/pXLV4jDZ+SPuF0vLgxWEhQKt4K51LYrN8kFdxy5w7P0pmrpQL+2l
         VJyzexydDoJSq3Shz2H2R/LNNYI8AgBtgg8vKjJpyjAjGqOqUQtMj5/OM2Si6q3xNOrp
         MdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi/VS5VU4Lm5i+pPezZIpAbB2sXalMrX/FqWASjjTY4=;
        b=PH+m0nbgiVGumAHo4jHc/B4a3YaoLTi11zMcHjpt8+aNm1+vxobWoqqMlK5gzpYMQg
         A/g8ZWwikLbIhKDd/MBd86hTpEdH//+JnZhonzZOfitspqV3C+pO5QvLWHsZzWYrWwBK
         geEf8AasC1bb7BNJ4u+IWC3ZFxIJfgN5ZR+jhiI1W2YYn04kVbWcvwOYFfk0wfMUZeO2
         lfoB9oGCaxD3PWMyoWeXFA5umxU/YKyFCZWARxlz84Mmh/dpOj5aG4x2cfdq4MRzadpO
         oZCcF1CyL+Ewri7GJtMxnAAmTM5ShHbK5U7BeV3hNEz6jKwxzzBLdsWp6ScXtvEbav3D
         sr/w==
X-Gm-Message-State: ANoB5pnwUqyyV6VSEuau3vxlFtWdOdmUeBZNn6ELRJfEQMDGPb5PvGqi
        8VcUc17VhM3PHh2h2XUlUsWNOA==
X-Google-Smtp-Source: AA0mqf4fOLACjnLE9fIXpNv9sG0VipGyempsJNgg7PdnvDVWB/g2Gj9AY7m8qIWsfgVPRFGJlH2ayw==
X-Received: by 2002:a05:600c:4d24:b0:3c6:a8c7:755e with SMTP id u36-20020a05600c4d2400b003c6a8c7755emr1859789wmp.167.1668600122929;
        Wed, 16 Nov 2022 04:02:02 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b002206203ed3dsm15120109wrx.29.2022.11.16.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:02:02 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH 02/10] dt-bindings: phy: Add QMP UFS PHY comptible for SM8550
Date:   Wed, 16 Nov 2022 14:01:49 +0200
Message-Id: <20221116120157.2706810-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116120157.2706810-1-abel.vesa@linaro.org>
References: <20221116120157.2706810-1-abel.vesa@linaro.org>
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

Document the QMP UFS PHY compatible for SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
index be41acbd3b6c..1ea5fcd4a59e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8250-qmp-ufs-phy
       - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8450-qmp-ufs-phy
+      - qcom,sm8550-qmp-ufs-phy
 
   reg:
     items:
@@ -66,6 +67,9 @@ properties:
 
   vddp-ref-clk-supply: true
 
+  vdda-phy-max-microamp: true
+  vdda-pll-max-microamp: true
+
 patternProperties:
   "^phy@[0-9a-f]+$":
     type: object
@@ -141,6 +145,7 @@ allOf:
           contains:
             enum:
               - qcom,sm8450-qmp-ufs-phy
+              - qcom,sm8550-qmp-ufs-phy
     then:
       properties:
         clocks:
@@ -163,6 +168,7 @@ allOf:
               - qcom,sm8250-qmp-ufs-phy
               - qcom,sm8350-qmp-ufs-phy
               - qcom,sm8450-qmp-ufs-phy
+              - qcom,sm8550-qmp-ufs-phy
     then:
       patternProperties:
         "^phy@[0-9a-f]+$":
@@ -209,6 +215,24 @@ allOf:
                 - description: RX
                 - description: PCS
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-qmp-ufs-phy
+    then:
+      patternProperties:
+        "^phy@[0-9a-f]+$":
+          properties:
+            vdda-phy-max-microamp:
+              description:
+                Specifies max. load that can be drawn from VDDA PHY supply.
+
+            vdda-pll-max-microamp:
+              description:
+                Specifies max. load that can be drawn from VDDA PLL supply.
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sm8250.h>
-- 
2.34.1

