Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041F76BA84B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjCOGpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjCOGo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:44:59 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14989311FA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:30 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c18so432249ple.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EYpDut5qXdF8PJg7sJ4kHxpp0TN8JiS9nsevzfwY0E=;
        b=eCyk8+NbbhTpU1DUO8u1AITD+QqN8laTO+q2FzRt7a9jk9TlRje5p1Ho+5ThIQxIRf
         2f0/j3j235f7mhjF0cf2FJT17fYyGnRXerwyA6LEQrva63pwTgRIOQqMg3zZhTNNK7ii
         KIF0tdgGtfaxQobwMJRnhrMMK3pG/vIdOwA7jK0QSqX2/VuTzlT0Fy6VjyQfCunpzBag
         /7I/N08e6Egw6CCXRLYPn4MbY5sN3atQ9Ce+sSee+2GeMWLzEAkPLA5k24jLuKia9kgS
         ArH4y/IIc8+cW4Ro3PcHij40AczDn2yz3QThliSkiWFbRb9CyXSvzvAgzgK4oQWJQV6m
         D6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EYpDut5qXdF8PJg7sJ4kHxpp0TN8JiS9nsevzfwY0E=;
        b=K1xbB6dbRMPHbVpYOJ5QmbW9IzDrbxfWda++Uv7TIZLde0Q3UYJmH/YA72Kue4UVoC
         4Fx08mnY4S8Q6zS271CNj1LQyERFlB5Q8JLYkZQlrqxhPJRNCv63Py1hk36WPgxlv9b/
         s5Wi18zL0K5ITD+8BCXyfl1QoqikUhxJpT+L7jJqum6oplRTSUHyo5jhQdHEKikhXSuf
         M0qbD2ATgevPICHPVGnLWvkTSzZH3SL0ip2G67ghzN40okKzo3p4PTU0Rxnxx8V3dB/D
         AtCp59YmPHATCuhjAvowblLlt8ymWMvsZ2ytwGvAw99sFiCy8Xch03uTNYcXSw3t4Bk4
         4b6g==
X-Gm-Message-State: AO0yUKVaDfU62gwkhvHYbmqkcR867o+8A+8NoKdh64nR9qPnG3A2xvEu
        2kfU0O5bkIRiYURsDnn5So3z
X-Google-Smtp-Source: AK7set+4380QzHY0UAb42me+uSpmOjWTVg4jjYTccUwR+gaaSF0U+9XeJc//pJLTOnt228PdGtrKyw==
X-Received: by 2002:a17:90b:1b52:b0:237:b64c:6bb3 with SMTP id nv18-20020a17090b1b5200b00237b64c6bb3mr42612193pjb.11.1678862644404;
        Tue, 14 Mar 2023 23:44:04 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a6a8400b002367325203fsm550747pjj.50.2023.03.14.23.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:44:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 14/18] dt-bindings: PCI: qcom: Add "mhi" register region to supported SoCs
Date:   Wed, 15 Mar 2023 12:12:51 +0530
Message-Id: <20230315064255.15591-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
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

