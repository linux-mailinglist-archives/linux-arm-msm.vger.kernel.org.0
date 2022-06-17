Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D2354F987
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 16:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382888AbiFQOrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 10:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382892AbiFQOrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 10:47:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023FE563A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i29so7306046lfp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKNSfqs482tz3aom3PVOglBcA5rFfyneP88JdNzFj5I=;
        b=WkzeNoA/+hnbiFjzcZ11OtsNEOP6i5uug9GmPOQXRMmCUUngle5RPg9gD7bAsAp0xQ
         OGz0PvNm5xuRBj2uNb5RgsiYTwT2apZCKawrU8C0uk6/WJynUKTSeZoZwSj2cnaXX8Ff
         c+QE3SqQ2FhCU6nVYLhNnnMl3Rnx2P8gc+sO2b7XirGdz6TJJN45/yDLjis0ZnG4bMFP
         CIgoC58TqRmo7n6Hv5wcbU28iv/4lCuzyT72HSjx8UMDEnbtdpJVKIvsbFea7iynYE+3
         ShGVVUuQ++lnD6ULaX3MTCfJzk7rWfKPdiEsonoqWrfW0cqHOAiQKKnxGOy6fVc3WNTM
         n1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKNSfqs482tz3aom3PVOglBcA5rFfyneP88JdNzFj5I=;
        b=pdCxBnmm3gTy1vUISS1I4XTrVeyvalP23SBCkFQC+ZAJRPDk3dWMN6mJ/+8Heabbsu
         z7aDiVTqh6zKRbpOI3T51LToXN5PKLT1U4IN44l7HFl3dzeTE4BoTgRXzIupkoyitvdO
         XvoGOmuBa84c3Oy0EzQjlaRui3liU5X+KV3pOCsVCuxCCwcPqv+YFmPYnnyZrPGYxHSH
         kr5/XZ+UmTW1tOLUTNIrtOrDCR1e10gqIw3yF2hDPrUfqzYzwn7EE3zbRIuDo9V1Sqbl
         8Py/ZeAoYTbym4rAhBCv/fhZGJUsF5bS5KBy/rAGj4KgU0JIoOMSZy3BC1sS9SJvRLcu
         MxNQ==
X-Gm-Message-State: AJIora/cjhLZLbvfaHOy0TqgHxBL9wnBCsXczEfUpNiZYSHSEqt+kK/0
        gaG7YDV7+H5tr4+JF9E+6EzHoA==
X-Google-Smtp-Source: AGRyM1tgCJF8DH7CSqafI/BALcZVeNX7UrslxomQbPxmIkKxWz8RosmjXLMmdM/QpQwZdDlugOaJUg==
X-Received: by 2002:a05:6512:3a5:b0:47d:a3ac:3bc5 with SMTP id v5-20020a05651203a500b0047da3ac3bc5mr6058828lfp.193.1655477238104;
        Fri, 17 Jun 2022 07:47:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC device
Date:   Fri, 17 Jun 2022 17:47:09 +0300
Message-Id: <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
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

Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
clocks/clock-names properties to be used for clock links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  1 -
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
new file mode 100644
index 000000000000..564aa764b17b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8916.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8916.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8916
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: External MCLK clock
+      - description: External Primary I2S clock
+      - description: External Secondary I2S clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: ext_mclk
+      - const: ext_pri_i2s
+      - const: ext_sec_i2s
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8916";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x300000 0x90000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c45e0f85494..d3e591495b41 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -41,7 +41,6 @@ properties:
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
       - qcom,gcc-msm8660
-      - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8960
-- 
2.35.1

