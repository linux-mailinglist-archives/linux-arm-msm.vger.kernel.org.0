Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D29B5132B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 13:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345726AbiD1Loz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 07:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiD1Lor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 07:44:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E03068989
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:41:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x33so8145496lfu.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DldukvjOY2Z/KNrBxZEZWOyWwCLmTZVbU9USIroNwIc=;
        b=Hj+a8aYyo0TLSqbGyzN/tNM0mDLjXKW/dc5UU+vS6duHVG1bW/h+lHoYsf7/2SAP0E
         sBL5qQj7ozRNmlh1PZbisvvRe++8uA0pRZ6R0ktRmKEG4gXsn9hC6xap2J/PLetebPSg
         wWxsfppqJpSIG1THqr0CJzHz8tR0BpuAOC1WiTAHB1QTx+Ysy+X7wO2RBO4w2M1juytZ
         /RXe9w+ci5RBhyZEqOo0RaeGaU4W560Ff/cHEJ0r4DXo/ZvcWMAJ6E+xfsSEcbp9e3So
         FKmFz9ko8pq+/ifRVppCmaODNkt2YdJUyFt6T060O2EcCyKEkwXIjF7y8ydE6e+1kyLt
         ltlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DldukvjOY2Z/KNrBxZEZWOyWwCLmTZVbU9USIroNwIc=;
        b=jybQ6bdcbpKn+TIXZ+KwEDaUk+/sWeLImgfNxzy2dy3hBrDyjMfubbQFYukGJATYb/
         TgAbfbliGSJgbjI+1/qK4KfMyhG3k9Gb1YC6Ei5Ibo+/+S+y1sb/37fFh9VCshxyTgV5
         CQfWmJm8wnCFQPd5ta78QnSknmWE8EdS8a37qxqzJ86l/f1hcQ644HI9QqBWkj5SqXhE
         cjr+tgyFREAougCsRJgW6AipDODzrjN9knezdSpHZjOSObb9TNK+7MiCXZ7uS9l3zoEX
         QHlZTEM4AsESKLVCWeX9DMXasqZCOSzH8MiwFfb5Flj6jWzEkbaR6c5Vo7ROtKj31mDM
         fsIA==
X-Gm-Message-State: AOAM530zX8WNT4xddhCD5M2zRa2H4Os0LgM1fsCeP8jXcxjdTVvEX0DY
        RB0R1xHc6MjihrY5jrmqSZZ3yg==
X-Google-Smtp-Source: ABdhPJz+heCWYQFN3bzrObDQDuN9AC1sfcZGq7Cal9M0mgRJeX8nG6plpDlU7gs82E3nF9F1mgs8Wg==
X-Received: by 2002:a05:6512:22d2:b0:472:2970:29a9 with SMTP id g18-20020a05651222d200b00472297029a9mr6135130lfu.659.1651146078385;
        Thu, 28 Apr 2022 04:41:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu39-20020a05651216a700b004484a8cf5f8sm2338790lfb.302.2022.04.28.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 04:41:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/8] dt-bindings: pci/qcom,pcie: add schema for sc7280 chipset
Date:   Thu, 28 Apr 2022 14:41:09 +0300
Message-Id: <20220428114113.3411536-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428114113.3411536-1-dmitry.baryshkov@linaro.org>
References: <20220428114113.3411536-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index e91ae436cafe..0b69b12b849e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,pcie-ipq4019
       - qcom,pcie-ipq8074
       - qcom,pcie-qcs404
+      - qcom,pcie-sc7280
       - qcom,pcie-sc8180x
       - qcom,pcie-sdm845
       - qcom,pcie-sm8150
@@ -177,6 +178,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pcie-sc7280
               - qcom,pcie-sc8180x
               - qcom,pcie-sm8250
               - qcom,pcie-sm8450-pcie0
@@ -412,6 +414,36 @@ allOf:
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
+
   - if:
       properties:
         compatible:
-- 
2.35.1

