Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF83B529A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240630AbiEQHCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240513AbiEQHB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004502CDC5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dk23so32796176ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tfEGYpn75JZIAXykbEZSrC/6uLUKdiFuaaBfUgP96o4=;
        b=aqrzdFHaxxIHJsOHHTRhp9XZBr3FCIznH3IAP/kCztIGY9IGSvhOU3TiqNp4osPaKn
         5fGzy04VbBQ7ONevNZGOOx1IWMaN/CSTza9okBZfdEklrRSqAh1F7YfFVUsdXy9Rmusn
         cva08ShLCkekAIzsxQytWi26XN5lomrL5Pq0FFtCRx5Xf+IVT822bnlXOEiWaHttKSza
         LC6Lrte5DbeqISmg76YBdsa95O3zyX6PpLZ4fJ4k379pHdkSGNF4OZUVRKSoTFVMQONq
         uMm5Y4JMMcaUp1O5M94mtQimsQ9zTbt0x4wFPspRwM9Lv+XQnEXWu6lsZCpTLXiiW3Iz
         FQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tfEGYpn75JZIAXykbEZSrC/6uLUKdiFuaaBfUgP96o4=;
        b=70KtsiELUeUnAy9rkIInFhc/y+pq4gJVQ8RIp+KGNAdB/B87QMYlcq0i/A4vf6MtWF
         Z2pdrNfpMZIfC7XKfx7j9ONvR7bdawX1t8WeJbOGWz4ud2BEfM8bLvlGwvB23Y1Kd8KV
         PBhtpce91Bjlx40NZ6kwdVA+fI5213oG5ESS3aEACgcPz0fX7xghLstZ0jrvsUdF0B3T
         qQPNx/64o/ht0MfQPvDJ2wlvCMOFkGmDAxSRE3NufqXrSx1by4W608bm+RiTMFeYIDXj
         g1RDTVIgMbOvxrJuZ1JURgJvLaT29Xsj9OhjYP2eMfg/DdI2WXPfXQ/SPvC1JP+kM8BE
         JdCQ==
X-Gm-Message-State: AOAM533ig7EtG22TYScx6Ex6oyZ5ebOQlr+egCvVhDZa2//1ZFUiL1uy
        zhb5dUObuBl+9l5sRfIx10x2dA==
X-Google-Smtp-Source: ABdhPJwU7YfLmQb69S3WYBqzwSble4j7A+5uNz0HWOjwom95/MqGo5I2jvhB/XOFIR4Oxu+aEhGzKQ==
X-Received: by 2002:a17:907:1c21:b0:6f4:7a8a:d6a2 with SMTP id nc33-20020a1709071c2100b006f47a8ad6a2mr18490102ejc.288.1652770880298;
        Tue, 17 May 2022 00:01:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/12] dt-bindings: remoteproc: remove unneeded ref for names
Date:   Tue, 17 May 2022 09:01:03 +0200
Message-Id: <20220517070113.18023-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
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

The core schema already sets a 'ref' for properties ending with 'names'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml    | 1 -
 .../devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml   | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml   | 3 +--
 .../devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml   | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 947f94548d0e..810ef9d2bcc1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -116,7 +116,6 @@ properties:
       - description: Stop the modem
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description: The names of the state bits used for SMP2P output
     items:
       - const: stop
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
index 31413cfe10db..06f5f93f62a9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
@@ -90,7 +90,6 @@ properties:
       - description: Stop the modem
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string
     description: The names of the state bits used for SMP2P output
     items:
       - const: stop
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index d99a729d2710..ade932468c38 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -76,7 +76,7 @@ properties:
       - const: pdc_sync
 
   memory-region:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
@@ -102,7 +102,6 @@ properties:
       - description: Stop the modem
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string
     description: The names of the state bits used for SMP2P output
     const: stop
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
index 1535bbbe25da..20df83a96ef3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
@@ -90,7 +90,6 @@ properties:
       - description: Stop the modem
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string
     description: The names of the state bits used for SMP2P output
     items:
       - const: stop
-- 
2.32.0

