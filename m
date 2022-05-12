Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E516D5249B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352389AbiELKAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352399AbiELKAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:00:23 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6538A22EA53
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id p18so5596520edr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnjZ2W7biyTRSy36TvcNQNrq8PNzrb9bYrBeKPi7Su4=;
        b=Z5iwoaPM6rL1j2X7HbtrL7czX1HTAytDrmszpbDvVUrYGaoY9U/cHw/JiKldDkNRBj
         Q0ry8heNd5xIMJBlGm/TtvzGTitsCGY5c+DGl3/+m5zZ8ZVS9NCHyuJ+Rw+tOOaaxG7X
         2Q9BQd31cdXrYmlUfsvuHUneCRoeCATS+qO/qTrqMVPitEFKqJSWr7EJL+Sz3rNuVuan
         lwMjzdkZKPExkZFic96AA+iBQm1Sy40xhR3DJW7wvvkWuvCB1waEmtneTnrKK2bLn9rj
         65MtnOWZvzluCT7njY4ji5A4x3z+jY3gMB7CHlCDmDIkW9bdqFUCuaskRXPJwi0rCe5p
         wg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnjZ2W7biyTRSy36TvcNQNrq8PNzrb9bYrBeKPi7Su4=;
        b=eDhTb4B0yzbe/MAE/xAA1Bk0ApbiWNprgVak0KgXz+OR57S/phn5dT7TOm4t/hdhAg
         kKo+qKmZ4mAt52RtEIIKyqiVECX2GmYpUz3gwU+lz0r2uiQB8Ru2lExzBFdm5p3NUrxF
         R31XSCgmvb4sdp32HtGEth//7JWPNYUPVARSyVf8VViu51OdzYW4Avxnx6db5cZ5NZ3o
         ZTSlbQ0mh2SSsU2vvVDfo++YqhSn9gpiO6OQHFO7P6WHsUXjEUDD8NUNs2Co+uB2Bic9
         BMpjh/MCdSTkmm3Q2QWJZLdLtnBiPW41P6/1Rt8dQv5nNupPvlmB3Jev4tUd5yV2toeD
         s26g==
X-Gm-Message-State: AOAM530XMGe8wIdqEOkBBoQmVvNnWAvIRg3IsLEBA47BuvkIgK/58xX6
        sHIA9mCeC+KcFYR65+/yKHp8OhmH8DEfD/DA
X-Google-Smtp-Source: ABdhPJzBfunhSRNAFcVuJ/UI4w37vC4SezpGAV8dBNR3VH9Sllkn1nubo8lhDA7x3UcT1OcYaPulyQ==
X-Received: by 2002:a05:6402:5205:b0:427:b431:e0ed with SMTP id s5-20020a056402520500b00427b431e0edmr34760222edd.186.1652349618627;
        Thu, 12 May 2022 03:00:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] dt-bindings: remoteproc: remove unneeded ref for names
Date:   Thu, 12 May 2022 11:59:56 +0200
Message-Id: <20220512100006.99695-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
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

The core schema already sets a 'ref' for properties ending with 'names'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

