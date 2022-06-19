Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FA7550D1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbiFSVZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiFSVZz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:25:55 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3D7A457
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:53 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b7so9947858ljr.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOBjrXoPoH1ofPIXqu96DbxIuUW2WoHytXZVgEy9tqQ=;
        b=lvogxv9Idq/1XQ/jhBkYeztDWKPgoeK8GmdHr6B0CVx0AEdUtWKn8zXTVP2/vcCYaa
         RlzhTlgN4wmjP+idNMjoE3qByReaKZVcz7lx4lF8lheVRW5swP+Fm00Fdc+k0Di2Y4Pf
         AEnAt+BNpTqhjmXLIeMMi/kOI/fboRbmLqJAgEwX5PfOBXt6jkDz9t6Q2HrOsO6XvmnC
         VwIJdEOkyzou60v9/A8wi3sEUjvNuP6misWhtSVQhnBi6bXubZZta0UZ7k3djjP60DUS
         0OI1+NqkX2DOqNOs8maUwHNE+h4qctXxKWxonE9JVwiw7yrD3tjY4DZ/zmVP3wDsm7SI
         Mp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOBjrXoPoH1ofPIXqu96DbxIuUW2WoHytXZVgEy9tqQ=;
        b=zriu076515iJgwyGNvYOMqdbwAJTixt9K+m8h2pkr+C5ckUyUvBSdERdQ2pI6UY6Is
         7BU49AeXdalt2OJGMbxlpjyVvfqC5bIWj6Ga5sG5c//W+8iT7OIZCt7eR15pSo19NI2E
         1AFFaJfbERXftX3VZ1FMECQ3yDcjlbetBLzfdjLE6p+k5GHcncIIL7EHuWzHB4yTg5VS
         WHVY/3Er57w4epCtocQ4/zwW2f9FN8c4z+HTv2HQf6KtWxVtrDQThrz2z/WWNG+zXvEW
         1lSD8wKTnw2Uwq6BpObeaoRqkpobOCAzPSgv4zs4O7kQten3E+SUTBusdmLggUovunBy
         RSRQ==
X-Gm-Message-State: AJIora9s4C8hBqOQVIrX8fGV5+Pav9hqzWAb4k/uAtfGC5/zwOtXrxA6
        2P6jFm7ass7TdvC0M+Y9oe5aBQ==
X-Google-Smtp-Source: AGRyM1vFmPy65YaLXIDy0YqN65u6szAJjgcDOfzlcgMQaLgvurkY/QMXawgkhwEhWkczU9sq7DQtsw==
X-Received: by 2002:a2e:97d0:0:b0:255:7c1c:f3ba with SMTP id m16-20020a2e97d0000000b002557c1cf3bamr10003628ljj.49.1655673951594;
        Sun, 19 Jun 2022 14:25:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 1/7] dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
Date:   Mon, 20 Jun 2022 00:25:43 +0300
Message-Id: <20220619212549.1240891-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
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

Use qcom,gcc.yaml which contains a set of properties common to most
Qualcomm GCC bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8976.yaml      | 21 +++-------------
 .../bindings/clock/qcom,gcc-msm8994.yaml      | 21 +++-------------
 .../bindings/clock/qcom,gcc-msm8996.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-msm8998.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-qcm2290.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc7180.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc7280.yaml       | 21 +++-------------
 .../bindings/clock/qcom,gcc-sc8180x.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc8280xp.yaml     | 21 +++-------------
 .../bindings/clock/qcom,gcc-sdm845.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sdx55.yaml        | 21 +++-------------
 .../bindings/clock/qcom,gcc-sdx65.yaml        | 21 +++-------------
 .../bindings/clock/qcom,gcc-sm6115.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm6125.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm6350.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8150.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8250.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8350.yaml       | 21 +++-------------
 .../bindings/clock/qcom,gcc-sm8450.yaml       | 21 +++-------------
 19 files changed, 76 insertions(+), 367 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
index f3430b159caa..4b7d69518371 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
@@ -45,29 +45,16 @@ properties:
     description:
       Phandle to voltage regulator providing power to the GX domain.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
   - vdd_gfx-supply
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
index 22e67b238bb6..7b9fef6d9b23 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -32,28 +32,15 @@ properties:
       - const: xo
       - const: sleep
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
index 5a5b2214f0ca..70f7d3101bd3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
@@ -33,30 +33,13 @@ properties:
       - const: cxo2
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 8151c0a05649..544a2335cf05 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -37,32 +37,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
index 5de9c8263138..aec37e3f5e30 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
index a404c8fbee67..e4d490e65d14 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
@@ -33,32 +33,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
index 5693b8997570..ea61367e5abc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
@@ -44,28 +44,15 @@ properties:
       - const: ufs_phy_tx_symbol_0_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
index f03ef96e57fa..30b5d1215fa8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
@@ -32,32 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index 0bcdc69c6f89..e33dea86fb9e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -56,30 +56,17 @@ properties:
       - description: First EMAC controller reference clock
       - description: Second EMAC controller reference clock
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
   protected-clocks:
     maxItems: 389
 
 required:
   - compatible
   - clocks
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index d902f137ab17..2b8a35d8739e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -37,30 +37,13 @@ properties:
       - const: pcie_0_pipe_clk
       - const: pcie_1_pipe_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   # Example for GCC for SDM845:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
index b0d1c65aa354..13ffa16e0833 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -35,28 +35,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index 16c4cdc7b4d6..8a1419c4d465 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -20,9 +20,6 @@ properties:
   compatible:
     const: qcom,gcc-sdx65
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -43,25 +40,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 5
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
index 26050da844d5..bb81a27a1b16 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
index ab12b391effc..03e84e15815c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 20926cd8293e..cbe98c01c085 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -32,32 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 12766a866625..0333ccb07d8d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -31,32 +31,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 80bd6caf5bc9..4e2a9cac0a91 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -31,32 +31,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 1122700dcc2b..3edbeca70a9c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -54,28 +54,15 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 58d98a766de6..102ce6862e24 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -46,28 +46,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.35.1

