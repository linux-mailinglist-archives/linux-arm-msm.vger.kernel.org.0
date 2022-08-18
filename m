Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D049599033
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiHRWIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbiHRWIx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:08:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B438067C93;
        Thu, 18 Aug 2022 15:08:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x21so3549843edd.3;
        Thu, 18 Aug 2022 15:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lMkwOm7mWtrtXUll5KTQ55LOAdRpd/t46mKz83pxDuc=;
        b=k5C1aO5I2qAdOgimiLeFEBHmqWDKbz3N+z2JFjidSiNDwMezEic0qMiYizhk2Z8UiJ
         ri8el/ij7mEa+o7K+X4sUIz86sGFzCnRY2IpDuANMSl1QzX9yaccTVR1GZmbQoJOzMto
         Ghwh+sHuhehTotlxeVCL6rOTOxAhvt7rYjdpMu3itU84I8mWlLy9E+ZABCChRtHh7K1a
         YhDValMT6ETZmMHUTnvVX9hSXRkni5KeZrMTviPG7+jP4tkkzHDsPBZr/PvI6leF1MwT
         aMHdv3TlhH0WG6GA9TmGGNHEnoJTsIetykkodwAWAqMwSB0ChXmWgZATD2vwLZd8r/g9
         IqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lMkwOm7mWtrtXUll5KTQ55LOAdRpd/t46mKz83pxDuc=;
        b=Bi9tKLxWNrBPbfeAH5YYViUYP6nZxH9xnE6Xx6uBEhqHcdD7DX+Ruwu17NrUvRgwR4
         IcDdSazkKxtMUPAtl448LzNJ4zmoB/8Hq/B0rtHePM9oIdVvnz+EZkxDCu3pFACywv1o
         ZeTSYZ4uV4ZawWJiVreCyXdbjNES1Frh7oRaC3crtqmmYdoVSeH/nTzg35FVKRWx9JkO
         9a49VJupMGl+OhE3LThF5IwLHZkxht70ZbK1a77RfiokLIQEf3t8zRMguj1XtcuKDHoF
         bMHNIyw4UsOxAP/giexIBAiUqOh8eVgQ+iq+WjuTAhvBQFdAsslWil+1XKzZ/628BfTt
         T7qQ==
X-Gm-Message-State: ACgBeo3IiD6sWczQCEn0l0PkELn5hApiIqvnBklK10JBJFYwQYdnaGlN
        VvoCjitxzgUtHW2DM0bY4waTSmAFMb0=
X-Google-Smtp-Source: AA6agR4jCbxmPFKxhU9Jh25GxHxo4xQCIQxQPILxu4V5+IPUV0/7VsmoMJenuHjsyWRgPT38XXBPfA==
X-Received: by 2002:a50:fd83:0:b0:43c:bca0:bdd1 with SMTP id o3-20020a50fd83000000b0043cbca0bdd1mr3748597edt.360.1660860531335;
        Thu, 18 Aug 2022 15:08:51 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-74.zg.cable.xnet.hr. [94.253.165.74])
        by smtp.googlemail.com with ESMTPSA id j9-20020a17090643c900b00730b61d8a5esm1385022ejn.61.2022.08.18.15.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 15:08:50 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     Robert Marko <robimarko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/4] dt-bindings: mailbox: qcom: set correct #clock-cells
Date:   Fri, 19 Aug 2022 00:08:46 +0200
Message-Id: <20220818220849.339732-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.2
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

IPQ6018 and IPQ8074 require #clock-cells to be set to 1 as their APSS
clock driver provides multiple clock outputs.

So allow setting 1 as #clock-cells and check that its set to 1 for IPQ6018
and IPQ8074, check others for 0 as its currently.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
* Drop not needed blank line

Changes in v2:
* Correct subject name
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f504652fc0ea..982bcdebba4c 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -54,7 +54,7 @@ properties:
     const: 1
 
   '#clock-cells':
-    const: 0
+    enum: [0, 1]
 
   clock-names:
     minItems: 2
@@ -100,6 +100,21 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq6018-apcs-apps-global
+            - qcom,ipq8074-apcs-apps-global
+    then:
+      properties:
+        '#clock-cells':
+          const: 1
+    else:
+      properties:
+        '#clock-cells':
+          const: 0
+
 examples:
 
   # Example apcs with msm8996
-- 
2.37.2

