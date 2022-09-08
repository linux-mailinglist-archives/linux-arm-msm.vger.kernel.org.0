Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1DF5B1654
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiIHIIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiIHIIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:08:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B592D5727
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:08:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bt10so26444387lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JIBPCNWbj9cecXNvDfnBoFCAPIFUTWEJI8WrfdBbKVU=;
        b=UrCBknrwrTHwgWophVsI98zOBga4gi+3YsN7Z2zV+Oc0+SuKLG82NTPefcX8+qUvui
         QU6HoGw7CvuTahJsK8W2W5UuMza7QmvnoUOZZWdhmACFGaRMU7E4q/bx/YL3wV3DBXlw
         27byq1k9c1S3315n7UArdhTPLGXZIhrYX4nvWzDcb1vS3aBKnWrax/Ccuxvk3zFwBTD0
         qSuWQzL6VceU/+wdM7UXi+QyQYUvYAPCZkpf4rypvzBGxCHNrTQXJh8XbK8LKXOlB8Lf
         lnXGDG8paiMLub41lowMmt/4TP5wZXkOvKxzsr7q4myRCZEmmBK0YfNVUIHPuwAXlxXh
         Gubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JIBPCNWbj9cecXNvDfnBoFCAPIFUTWEJI8WrfdBbKVU=;
        b=KxpWm5Qlvp3iKiu412kFaHmBr7pjCxcvH4XPWcQx6Y/E2QxjCBuLQft8GoOOg2kua8
         75JuQZ9wlMACuA9IMOPhpqe3/E/rbOYbYfIRsg5o2vprvwHh7PxpLpQxStAsmD0zVnzd
         jzdO3pJi8HWkPg75YRrULCRnEi1PGq9qxe06gaWo3CSQIgQrlY5dfHpRMWBtHrYbcukK
         gDeF+0dubwzGd+tGphsLD+dkGHCWdPLeXGPab+u49ceju79YSSg0AeS/EmmXHwvZyDuz
         tn0MCeTaBW4nljG8bM1BdjTVKr+j61xaoxBydZXZX7atou6xK3RjK/ngrPmbOWY++nQN
         +aJw==
X-Gm-Message-State: ACgBeo2vkRiSHQnJeusyOD+R3O0RJA8UNL00SKv/hqq3gWJAO6wLaFYn
        aXAFnBImTki7AhRxfyKUk243PA==
X-Google-Smtp-Source: AA6agR6LQp3G0Ji01d4/4I46poA8KDS6PNPUtwbNDKYMLC9OEywqbMo59AYcHMc/WhEaBDt8qLuL4g==
X-Received: by 2002:a05:6512:3b09:b0:48b:394e:6b3b with SMTP id f9-20020a0565123b0900b0048b394e6b3bmr2170567lfv.567.1662624483732;
        Thu, 08 Sep 2022 01:08:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c02c100b0026ab83298d6sm1425265ljo.77.2022.09.08.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:08:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-mpp: make compatible fallbacks specific
Date:   Thu,  8 Sep 2022 10:07:59 +0200
Message-Id: <20220908080801.28910-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of allowing compatibles followed by any fallback (for SPMI or
SSBI PMICs), make the list specific.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
index df79274d0ec3..72cce38bc1ce 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -15,28 +15,29 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm8018-mpp
-          - qcom,pm8019-mpp
-          - qcom,pm8038-mpp
-          - qcom,pm8058-mpp
-          - qcom,pm8226-mpp
-          - qcom,pm8821-mpp
-          - qcom,pm8841-mpp
-          - qcom,pm8916-mpp
-          - qcom,pm8917-mpp
-          - qcom,pm8921-mpp
-          - qcom,pm8941-mpp
-          - qcom,pm8950-mpp
-          - qcom,pmi8950-mpp
-          - qcom,pm8994-mpp
-          - qcom,pma8084-mpp
-          - qcom,pmi8994-mpp
-
-      - enum:
-          - qcom,spmi-mpp
-          - qcom,ssbi-mpp
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm8019-mpp
+              - qcom,pm8226-mpp
+              - qcom,pm8841-mpp
+              - qcom,pm8916-mpp
+              - qcom,pm8941-mpp
+              - qcom,pm8950-mpp
+              - qcom,pmi8950-mpp
+              - qcom,pm8994-mpp
+              - qcom,pma8084-mpp
+              - qcom,pmi8994-mpp
+          - const: qcom,spmi-mpp
+      - items:
+          - enum:
+              - qcom,pm8018-mpp
+              - qcom,pm8038-mpp
+              - qcom,pm8058-mpp
+              - qcom,pm8821-mpp
+              - qcom,pm8917-mpp
+              - qcom,pm8921-mpp
+          - const: qcom,ssbi-mpp
 
   reg:
     maxItems: 1
-- 
2.34.1

