Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418E96BBC19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 19:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCOSck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 14:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjCOScj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 14:32:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5548C97A
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 11:32:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j11so25421914lfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 11:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678905155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUa8//lyKnSdOFUjOl9afhkYQARVR2uYtRvHFtnhi3o=;
        b=eKFUyQaNYExzyKv2KyBxlWlFlntkR3/ausD8bBmO1R162fNhYqgy6EvoyyBXfU1yTG
         rUUc8nN1cfP9Qg4Vn26/KLh2rkK3bM8zcTOX5aJN1LajWV6ai+QM2INZFXK+P5nnP9xP
         oJUpO8aJE7hqqh2jdHYOAYAHB6jqtOiFzK2rkdtpvDUt/wHp7cSol30MNdiVaNpQudom
         RC2r95g0EqBL2e7TOCcVczzlU8tx4WqZWiBDxGArLvL0tbJm9VrZycctKGzGaWF6wWe+
         t6VX/sCQTiocGjflq/IOz0gREie/gtiaTFoiok4MuJzLRnrbDnNCYOtNwSiBY4KHp4BL
         YaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678905155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUa8//lyKnSdOFUjOl9afhkYQARVR2uYtRvHFtnhi3o=;
        b=U/wxWNoh4G6PY4k36QNXMcpUrFJBN4rGUjFbm81DiuGbWwgfOJqLUiI+1OWfObthwz
         dQTRYiw5qmYX7ORRuygwGS+P2FlpnktqJX4SvNAJcIjZhdfPTBF6rhZgHPOCBwpyXCRd
         37bthoZRRFtRaS2nNkvv+GIYP343wa5jnxE+vC9vdmTqqfF8ieLevHn9dkt3xy3LOsSi
         ip9Bf2GF9hjVVdGVGBsNhjdB9f9V2YkODaVLlGsEphhhdUcDgfdFaoiVP+TOYbJAlmIK
         l17JrTJS7hoRx0O7LPo+3gfqM1RMKS58mlXc9gW05c+iuub7a+p+l5ZeL/Y74cXsFpQY
         qnyA==
X-Gm-Message-State: AO0yUKUhqiGsl/NiI6IHMs7HjKz5zNv2CbCZov6KDF0XAdutGFeCJup/
        LQgDUFvLQ4VU2w+MmRYZhs8EckOdHWebLDs2RVk=
X-Google-Smtp-Source: AK7set/J+tOaVF7js9psDTI0PrQjsCzzhIunhHjs7+U0fO5D3KKmiLApCLY1PjhSfTHqjx4pOZ8beQ==
X-Received: by 2002:a05:6512:408:b0:4db:3877:817a with SMTP id u8-20020a056512040800b004db3877817amr2558622lfk.28.1678905155551;
        Wed, 15 Mar 2023 11:32:35 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i10-20020a056512006a00b004d0b1327b75sm911033lfo.61.2023.03.15.11.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 11:32:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: remoteproc: qcom: sm6115-pas: Add QCM2290
Date:   Wed, 15 Mar 2023 19:32:31 +0100
Message-Id: <20230315183231.3562580-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 is more or less a fork of the same design that SM6115 is based
on. As a result, the ADSP and modem found on it are identical.

Add compatibles for the QCM2290 with SM6115 fallbacks so as not to
require any driver changes. Change the allOf:if:properties clauses
to look for the presence of SM6115 compatibles and not an exact match.

Note that QCM2290 lacks a CDSP.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/remoteproc/qcom,sm6115-pas.yaml  | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..95a76b98f693 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -15,10 +15,19 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sm6115-adsp-pas
-      - qcom,sm6115-cdsp-pas
-      - qcom,sm6115-mpss-pas
+    oneOf:
+      - enum:
+          - qcom,sm6115-adsp-pas
+          - qcom,sm6115-cdsp-pas
+          - qcom,sm6115-mpss-pas
+
+      - items:
+          - const: qcom,qcm2290-adsp-pas
+          - const: qcom,sm6115-adsp-pas
+
+      - items:
+          - const: qcom,qcm2290-mpss-pas
+          - const: qcom,sm6115-mpss-pas
 
   reg:
     maxItems: 1
@@ -50,9 +59,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm6115-adsp-pas
-            - qcom,sm6115-cdsp-pas
+          contains:
+            enum:
+              - qcom,sm6115-adsp-pas
+              - qcom,sm6115-cdsp-pas
     then:
       properties:
         interrupts:
@@ -69,9 +79,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm6115-cdsp-pas
-            - qcom,sm6115-mpss-pas
+          contains:
+            enum:
+              - qcom,sm6115-cdsp-pas
+              - qcom,sm6115-mpss-pas
     then:
       properties:
         power-domains:
@@ -84,8 +95,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm6115-adsp-pas
+          contains:
+            enum:
+              - qcom,sm6115-adsp-pas
     then:
       properties:
         power-domains:
-- 
2.39.2

