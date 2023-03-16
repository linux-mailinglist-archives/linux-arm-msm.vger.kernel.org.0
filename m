Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDE46BC8A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 09:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjCPIOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 04:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjCPINU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 04:13:20 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FC1B482F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:12:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso4550340pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678954359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa5+j+q0lCIAbc8JmC9mNr+0xopel6ew7V5dLkcdAME=;
        b=MDlVi+hX4yIa61hBzu4Po7iIK1TKUYMwQKEVnr45vuMN2m+uN8NHLb+uSlC1Prxz4B
         wO2zbA2l7hIg+iFAD2EjN/F76XqTgmM5LHGiDbILv4T1NubwS23jCozb1jFnoGasR+8F
         X/Go61rmLfrbB+u9/JwKqUoMxGAYgIjXUamvL8XVZhKJmJlMC61naSy3m8hF7UkP/TDL
         rLtiRrx3WTX355J/9dhJAebbRfLl+JwfdbFMadc/Ap15qLwN/V07cBl1Xke8txUjKUlg
         WH1FjTTsouXQYsjxkrq9Fw55M09GRo/MiQCEhSdwhHKCIhytzfHl+VE3Z3hXPNNIF29J
         mcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa5+j+q0lCIAbc8JmC9mNr+0xopel6ew7V5dLkcdAME=;
        b=Q5WWHoyaalrTKKe4OOhoJrsI/LpKVVc9EfBv5hQKkK5EmU1ClfRIBklJcvO3DkudnJ
         iaRnDCo96Y+ERRf5tB5uS1F/HBUjFvz626SHK/p09+U1Tv1Z1RqYxEDSblUHye8D4awR
         2I5XAlq/2pO/r1yZ/P13OnGFVfxOmEP0pXuJh216qLKojXh055vverxi/zB0rp978QxH
         6M6Y7+8NV0FlOrwsaKxdsnPQg6rFgeBNgkmcwTvxGV3V5+0sLNNyhk32EaRFI+9+kMNQ
         ndVn7vtfy3iwNb2y/L2SGqEn0tI6vJVTusWeCoROK34aTmOlfmnw+foahRyUZSFgsjHH
         j/Xg==
X-Gm-Message-State: AO0yUKVRdgxZZWZpdGSWY7S0RavKCe/lEO3YeTo9uy1DWQbUaBgKhsTr
        wjDwuZHoB7UY+fOIibFmtMHX
X-Google-Smtp-Source: AK7set8BeO+fRDR0c5emkkdmsSXdfiYHELh8ectMRFABlsxc4jd7Vrco9adoXo9i3JO9cYerDAs5Jw==
X-Received: by 2002:a05:6a20:1582:b0:cb:c266:3f6b with SMTP id h2-20020a056a20158200b000cbc2663f6bmr3271138pzj.12.1678954359174;
        Thu, 16 Mar 2023 01:12:39 -0700 (PDT)
Received: from localhost.localdomain ([117.207.30.24])
        by smtp.gmail.com with ESMTPSA id 13-20020aa7910d000000b005d9984a947bsm4804422pfh.139.2023.03.16.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:12:38 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 15/19] dt-bindings: PCI: qcom: Add "mhi" register region to supported SoCs
Date:   Thu, 16 Mar 2023 13:41:13 +0530
Message-Id: <20230316081117.14288-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316081117.14288-1-manivannan.sadhasivam@linaro.org>
References: <20230316081117.14288-1-manivannan.sadhasivam@linaro.org>
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

"mhi" register region contains the MHI registers that could be used by
the PCIe controller drivers to get debug information like PCIe link
transition counts on newer SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

