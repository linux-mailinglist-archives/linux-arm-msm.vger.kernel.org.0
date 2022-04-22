Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B092150B671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 13:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447160AbiDVLvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 07:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447170AbiDVLvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 07:51:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DFC56411
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 04:48:47 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id f5so9289735ljp.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOldPYoJvPNjxsl1qgUvApjcx1oa14hxdKxXspOWvS0=;
        b=ntX1r/Fo3d4tJglBW2oAU5TvgSld00xOJNGVCaQh1DXmGpvwoM9z2PS/a8i/zp183R
         ga/pq0QMKP8eOgj0yC23uSP7BdA+kzB/TAdx8xp67GpNXul1oVQIK/tKPwVtCYNgcrOq
         UnJa/3ARqseT2W3V9+TUoXBpFSs/R68HvBj04/JldjzgoZpo4RLdoLSjBrmtbeDBCMQb
         5TFlj6cu2BnDyL7IK1FOLNUw+Yn8lNGUIocWNMWNNhYHnLerEjJLoyTxHLPjOMYXlZqu
         O+BxaA3QnD4NAEh6kA9KY30j+ziu7piTtqfBquMQ+HZ0N49ZvD91RBQaYKX8J9t3lksI
         W1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOldPYoJvPNjxsl1qgUvApjcx1oa14hxdKxXspOWvS0=;
        b=LqUmXTbnJjN84R4eUeiBj/ZzYsAjVkW/fZVtoPRKo2uNhVgg38OmGf2uyCJ4h3M7+i
         VLWE4leO8PTUnqTmetlZbQwWLjyqjhTxPYFlYRl4xP98u1kXE8Ld8mPV8MaCmi0aBjwL
         m+gA1MRM0+K9jCM5ycMTO78X+rZ7AuE5KM4tNMLw9v/8uL6QjNKrYHK1T8EUD5Aa9Dgw
         MnVO7Sbx5iAzi8HMqghV6JhSFexEo5qgOXZgMwrOAZ2chVZMLK9NKfkaiMYotdZE3gEp
         pq9ipboxMOhfB15JUrVC9kizxHR2M/tWAGclm4NmQIlbKvDXOnGBUDYO2aJsnYi9j2Dc
         XqNw==
X-Gm-Message-State: AOAM531fbVOGPLKDxwEJeBf51wKb58n+7eY3uqv3K4AxIPx8O0HOFYjb
        O16jboUM0Bq9FzIDW29eZH/v28qUT8S9bw==
X-Google-Smtp-Source: ABdhPJzEF5puEn1JZ7mB2oAtU+bwCrEkgSowvfe8hAmp4W/YKFE4/nMeZZ2FB1qSzE4rqT5GX1k71w==
X-Received: by 2002:a2e:bf1a:0:b0:249:3a3b:e90e with SMTP id c26-20020a2ebf1a000000b002493a3be90emr2618597ljr.317.1650628126066;
        Fri, 22 Apr 2022 04:48:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.65.189])
        by smtp.gmail.com with ESMTPSA id h7-20020a19ca47000000b0047014ca10f2sm200695lfj.8.2022.04.22.04.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 04:48:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: pci/qcom,pcie: add schema for sc7280 chipset
Date:   Fri, 22 Apr 2022 14:48:37 +0300
Message-Id: <20220422114841.1854138-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
References: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
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

Add support for sc7280-specific clock and reset definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 89a1021df9bc..7210057d1511 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,pcie-ipq4019
           - qcom,pcie-ipq8074
           - qcom,pcie-qcs404
+          - qcom,pcie-sc7280
           - qcom,pcie-sc8180x
           - qcom,pcie-sdm845
           - qcom,pcie-sm8250
@@ -337,6 +338,35 @@ allOf:
             - const: pipe_sticky # PIPE sticky reset
             - const: pwr # PWR reset
             - const: ahb # AHB reset
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sc7280
+    then:
+      properties:
+        clocks:
+          minItems: 11
+          maxItems: 11
+        clock-names:
+          items:
+            - const: pipe # PIPE clock
+            - const: pipe_mux # PIPE MUX
+            - const: phy_pipe # PIPE output clock
+            - const: ref # REFERENCE clock
+            - const: aux # Auxiliary clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
+            - const: slave_q2a # Slave Q2A clock
+            - const: tbu # PCIe TBU clock
+            - const: ddrss_sf_tbu # PCIe SF TBU clock
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
   - if:
       properties:
         compatible:
-- 
2.35.1

