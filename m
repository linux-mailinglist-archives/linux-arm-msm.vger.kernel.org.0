Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B0B65FC8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 09:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjAFIMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 03:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbjAFIMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 03:12:24 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D262280AC2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 00:12:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d17so604082wrs.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 00:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1QoLzMOwe4AZxi9U3T/FZRHP0XNIyItt/D85y2F9MY=;
        b=whzZnFxo6DiH/HlnkcVjioHYv5v+sIIEbFDhANNVgsxyPeyJBpB9xUGV7DHvqmC5je
         q7VcVUkcBiorpj7FuRysgU7dp1DciDh5SJcV142kT7OGufRIinutj4zyGet9UWC5rl+G
         Q24VA7CwBcNDBnhGdlbl38ZZh2IO7f+nFsKzcblsYnf3PSS8nJhIeHlxib7Ci65RUuTG
         VJd6LoV0ZgZqOdJt7ru69UMGNEuqAmrfSFAA/eCKm4JJiClSFK6NDWURycNUEcr969VE
         LqXzVefPBGq91ZpOOarcVVr7E47SCWnoZf6p7CUmmRkb+zOz0Cu4oUee3tkQpz9mLn3f
         WxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1QoLzMOwe4AZxi9U3T/FZRHP0XNIyItt/D85y2F9MY=;
        b=VKCkHrfW80CUr1JhSsuF5QqdLt9phVWckGLDpVc+KlgXzFBFieNc1sYTfUNx/UX6zM
         oYghXkICedttqjr/fdQDx/vC+GcHwD2SDLJnEJC4ogjWH/6mRSQgAoeXiRC7tFzIl5Jl
         ocdOofjjxJLcbTq49ysDMWbXUwMKApvwXOY3KxkQ9EeVR8quxzheXzRfgSbI02o5im9P
         BBbWegoJ7asqEfNom826FQbrDhB8BpZ24k9N/G9ztYPoNMTLSRz9yHhgP/bHfVkY0XPc
         rdSesmR7kDOx3e5hBZkeNd0XPAusDT+gaHHdLw4EzZs0J/aVe5VneAkbFKt9sIcufFvV
         v0hg==
X-Gm-Message-State: AFqh2kqcsJsisiJ8NPmp5zzM9CNuADUK/Rj6rE0I4hbK5ZjKP7GA83Nd
        Vo7cX1JjTkCkCA3cbr5tBxcL0w==
X-Google-Smtp-Source: AMrXdXsp705xAwNuVdwj4Kh6M/JyhI3AU0ZYTpvRreD62AS2PurFl+XtRc6ZXmNJ2R4akJEQXymK0g==
X-Received: by 2002:a5d:51c9:0:b0:29c:73e2:68f1 with SMTP id n9-20020a5d51c9000000b0029c73e268f1mr9394453wrv.54.1672992732402;
        Fri, 06 Jan 2023 00:12:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t19-20020a0560001a5300b002362f6fcaf5sm451545wry.48.2023.01.06.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:12:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] dt-bindings: PCI: qcom: unify clock order between MSM8996 and MSM8998
Date:   Fri,  6 Jan 2023 09:12:03 +0100
Message-Id: <20230106081203.14118-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106081203.14118-1-krzysztof.kozlowski@linaro.org>
References: <20230106081203.14118-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8996 and MSM8998 use the same clocks, so use one order to make the
binding simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. None
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 612feec05267..680502de2764 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -316,27 +316,17 @@ allOf:
             enum:
               - qcom,pcie-msm8996
     then:
-      oneOf:
-        - properties:
-            clock-names:
-              items:
-                - const: pipe # Pipe Clock driving internal logic
-                - const: aux # Auxiliary (AUX) clock
-                - const: cfg # Configuration clock
-                - const: bus_master # Master AXI clock
-                - const: bus_slave # Slave AXI clock
-        - properties:
-            clock-names:
-              items:
-                - const: pipe # Pipe Clock driving internal logic
-                - const: bus_master # Master AXI clock
-                - const: bus_slave # Slave AXI clock
-                - const: cfg # Configuration clock
-                - const: aux # Auxiliary (AUX) clock
       properties:
         clocks:
           minItems: 5
           maxItems: 5
+        clock-names:
+          items:
+            - const: pipe # Pipe Clock driving internal logic
+            - const: aux # Auxiliary (AUX) clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
         resets: false
         reset-names: false
 
-- 
2.34.1

