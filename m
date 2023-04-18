Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1B46E5A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 09:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjDRHRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 03:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjDRHRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 03:17:41 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CCE1FE4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:17:39 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kt6so32489029ejb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681802257; x=1684394257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C+6PsgFBtmyPYaIe0XZckdwjOSZ48NdXVpZVusKrTfc=;
        b=vh6iI2tS4ojXw0MIXA6w9eDsxCgsy/4aBR0Kh1uvuAXcAU3O+n5zQowfHQs2oP2tEX
         hG9IydbRVFcFYUkWwPrgOxUUZCUlAV0KCo3kVr3O5MJ0K8DMvc28xF9x2g7/ThWKNyse
         /mgPB644ZzyrwSPYHxDuhRTVtDrw6DNj8OYq9HZax4jaS5xVcDJEfQG7KWrwQ3L/yDQM
         A7S/CKFcowsAJZYwY7cGp+SIACozLTD/RAWC0FGWCoO9gS2GPr10MAfR/uH9HzLXFPci
         fNjnj6FJQscnrzrpZvNbyPx5ec+2btJCq05M04rB9/IN53Gv6MP5f9VQyb2g56OBpzZs
         fyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681802257; x=1684394257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+6PsgFBtmyPYaIe0XZckdwjOSZ48NdXVpZVusKrTfc=;
        b=VRckmEbEprBKJbqagCEs/cFNXj/fnEiDupsaOZJVzMXNWtct3ayHZepn3vswHeBGYc
         YnUm40f8NiaDrP2WTBrxrjxRtch/GVaF7visQw6yysA9MrdLWnaL0QDKAr+j/OToyIwj
         9/8hpz2izCLbz3+CdjZFZloUQPNesoJ/1EXekaLNJF1DYPCx0vc6/oJchHKD+R841gWZ
         VVTFJ9lMaPtUAFI3Gzaqd9e8+1TtvJ/+0aJK628648QzGtrqU6X/oSUZs1WBnsPnQ1xP
         5QEt0HWo6Zz5s0xH+Pud6lY9218sTpb9b//ad8QhaozJt7Gh1HOJglp/PWyePPZdJG8L
         iRGQ==
X-Gm-Message-State: AAQBX9f0zr0XSheqaPOj53fvGQJy5PIbgRMA3a66DppgvfEFqubdZHic
        C56IABlpWax1m+uar0dcaSDmxA==
X-Google-Smtp-Source: AKy350ZivXzRdJZcpojlARNjZs9Qe41S0IfKv/saw9jPQIExwEZD8rBQvFdVgIFe7ATV0aWwZm1tBA==
X-Received: by 2002:a17:906:fcac:b0:930:7d8f:15a4 with SMTP id qw12-20020a170906fcac00b009307d8f15a4mr9384333ejb.53.1681802257666;
        Tue, 18 Apr 2023 00:17:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id j19-20020a50ed13000000b00504ecc4fa96sm6641814eds.95.2023.04.18.00.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:17:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Correct PM8550 family supplies
Date:   Tue, 18 Apr 2023 09:17:33 +0200
Message-Id: <20230418071734.5706-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8550 is different than PM8550VE/VS, because the latter has much
smaller amount of supplies (l1-3 and s1-6) and regulators.  The PM8550
has on the other hand one pin for vdd-l1-l4-l10 supplies.  Correct the
if:then: clause with their supplies.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Resending rebased patch. No other changes, except context.
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml  | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index f879ccbb3767..5f9ae89a220d 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -329,19 +329,29 @@ allOf:
         compatible:
           enum:
             - qcom,pm8550-rpmh-regulators
-            - qcom,pm8550ve-rpmh-regulators
-            - qcom,pm8550vs-rpmh-regulators
     then:
       properties:
+        vdd-l1-l4-l10-supply: true
         vdd-l2-l13-l14-supply: true
         vdd-l5-l16-supply: true
         vdd-l6-l7-supply: true
         vdd-l8-l9-supply: true
       patternProperties:
-        "^vdd-l([1-4]|1[0-7])-supply$": true
+        "^vdd-l(3|1[1-7])-supply$": true
         "^vdd-s[1-6]-supply$": true
         "^vdd-bob[1-2]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8550ve-rpmh-regulators
+            - qcom,pm8550vs-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-l[1-3]-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
   - if:
       properties:
         compatible:
-- 
2.34.1

