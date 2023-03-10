Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204C56B3565
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 05:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjCJELu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 23:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjCJEKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 23:10:44 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70378103EC0
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 20:09:39 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso4003625pjs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 20:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678421371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EYpDut5qXdF8PJg7sJ4kHxpp0TN8JiS9nsevzfwY0E=;
        b=wmdZ32gSVCiRRr4O74cEm3Ao939vIeHxhN/ziyCMfrkXbpPhBdLtJUdythTAweA6DD
         lzD5zCJSJxMNaEn2OgIxRKYJ7Wk83k1gPLuqZaWFvjhxoipHk0nHHtnpqSMjuIpL30o9
         seqvgpIs+kTIKUE4a0pfFNCNe2+X7O9x/MCeM3+EjqpdWD3YVtH5ctOXA/CvREeH33Xy
         ZAmWpXN1pZhD9NcnGHQuOJ1TWy55ZTMq0k2Q7B5kLfRjJDeZT/AC9+zgm0Eib3STTaqm
         OHjDHD7Ul70Nk8ol1Dp5IFHX0bpTFVnlKVtknSjaHiuVLtSqqQ3ZadiI6m4E+ASI8qpA
         Oimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EYpDut5qXdF8PJg7sJ4kHxpp0TN8JiS9nsevzfwY0E=;
        b=TfcE40owy0Z6LfpjvmU1staoFs3LPykc/f4AisMrWVqPzALepRG262y0lEdwd5+WQl
         1Yk7qQAvgyojeQKt8v/Wl22dZnFmg5nw1Kc7ijOXH3lj/ZHNFFGVINfMI68AUBrotIom
         zSGcKUByUfo2hqfBSkZ/OPtWPe4plF5rLELVnYhf1c0rHMx4qroc8xh0CrPxyHR6g73T
         wbaNE1XcaHYSDzraEckll/fc9VtAivXnJ0vOgz5jX3W995AMsidRBqv/gtAkCX1XmSmJ
         L6V4F9IDM8NfyfwLnC7uUtGZFJPnwIabqbE2pg7V5x01R9DR9ob+T9BYofZmahJ8Oefu
         6MOA==
X-Gm-Message-State: AO0yUKUEm4XTyXIDHZmCSMbINY1ZfaF1cVggkzeOy2kr5h8UvS7Q/EHW
        Pdj2f5QoFQPTpQgbTbJY13+v
X-Google-Smtp-Source: AK7set8Da+sUDoPNrA/+teqxKRYeDApb/rtZKlq0rNJspnYoM+1fmc3DV3JzR24tG7XwwqJTDaCTTg==
X-Received: by 2002:a05:6a20:a8a5:b0:cb:a64b:6e1b with SMTP id ca37-20020a056a20a8a500b000cba64b6e1bmr19814986pzb.58.1678421371170;
        Thu, 09 Mar 2023 20:09:31 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.67])
        by smtp.gmail.com with ESMTPSA id y26-20020aa7855a000000b0058d92d6e4ddsm361846pfn.5.2023.03.09.20.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:09:30 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 14/19] dt-bindings: PCI: qcom: Add "mhi" register region to supported SoCs
Date:   Fri, 10 Mar 2023 09:38:11 +0530
Message-Id: <20230310040816.22094-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310040816.22094-1-manivannan.sadhasivam@linaro.org>
References: <20230310040816.22094-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"mhi" register region contains the MHI registers that could be used by
the PCIe controller drivers to get debug information like PCIe link
transition counts on newer SoCs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index fb32c43dd12d..ecbb0f9efa21 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -44,11 +44,11 @@ properties:
 
   reg:
     minItems: 4
-    maxItems: 5
+    maxItems: 6
 
   reg-names:
     minItems: 4
-    maxItems: 5
+    maxItems: 6
 
   interrupts:
     minItems: 1
@@ -185,13 +185,15 @@ allOf:
       properties:
         reg:
           minItems: 4
-          maxItems: 4
+          maxItems: 5
         reg-names:
+          minItems: 4
           items:
             - const: parf # Qualcomm specific registers
             - const: dbi # DesignWare PCIe registers
             - const: elbi # External local bus interface registers
             - const: config # PCIe configuration space
+            - const: mhi # MHI registers
 
   - if:
       properties:
@@ -209,14 +211,16 @@ allOf:
       properties:
         reg:
           minItems: 5
-          maxItems: 5
+          maxItems: 6
         reg-names:
+          minItems: 5
           items:
             - const: parf # Qualcomm specific registers
             - const: dbi # DesignWare PCIe registers
             - const: elbi # External local bus interface registers
             - const: atu # ATU address space
             - const: config # PCIe configuration space
+            - const: mhi # MHI registers
 
   - if:
       properties:
-- 
2.25.1

