Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303135B359B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiIIKvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiIIKvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:51:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D5F13880D
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:51:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m15so1987593lfl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gbw4YPY/UE5fI4Q+qLfjeoElzvL/1uz1uKB0yEofjUA=;
        b=fyUrmttRmXy50H93vbI/2jrFZwcqcF/imFXjg6X3OTlg2ZCe8Gywr4IMJcXV4KZQxg
         ycnidsQYuzzDIYaGz1LgbXXrra3NZzPzcF5dDSe+rkUFn4iCoG/MUKVmDv/bWMHrusfD
         BRnCPhWq7uADXx1S9il5RYsNDQQceJYoc5JJdSUI9JE1sYb1a61cockNaw7G8JSfOu5b
         xxUHiqSZhlrqVLf9f7EGvOEmyUXIXItpoxRklZc2YjgR+RCAls/2JPDfpkKAF8/izM5U
         b3f3E/KF2EIcHQd+RfdZlNxWXwgYGH6lMUNDLURjOlDOEcJejLhcGdwwJ3UWlBvIjQrj
         vxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gbw4YPY/UE5fI4Q+qLfjeoElzvL/1uz1uKB0yEofjUA=;
        b=2K1pJ3b+AfzHGeFhcvdaUpC0yHAz7rbBn1DdvH1iRz2FApEz1/VcJOcw18UAx86Nts
         0Es1l0xKneA9W0b+pawmYcvRvuLunJt5As3ID27Ezy7qjBx3uCx/Z5ZrBdJpj3tmRQQz
         6hU2nCQoiV9/F4vsfpLELc2Wp+gY6cw7tDqIToaSB3w3Z1s4/QpqliIvzH8Sg9w64gJq
         vVxxLCUJgQhQNmqbo6nLCfP7k8bLxHQeX+bPB9H1yVjthe0w7qrvqbWmLwIBW6UjMyWQ
         8b4xpRjlVZYueNnQlqUapRjVK1NRUVn94/FxGIt6CU2khReIij8YwpQ3UBKAZmyx4U7s
         bgMQ==
X-Gm-Message-State: ACgBeo0kX5/APgqJ1S9kRRbeJKVh4fsI9PCka6QYmwaVJLgKJDXjrDxw
        mFVgc2QnANw1c0UtkpHQKf95GQ==
X-Google-Smtp-Source: AA6agR7cJU18sVCXp1r12IwZOfr3/Vh+0MKLCeERxNE+TNX/eKfC/+rdw6/BlMETjTMU0AOYouWm1w==
X-Received: by 2002:a05:6512:1189:b0:494:b306:c16 with SMTP id g9-20020a056512118900b00494b3060c16mr4377886lfr.452.1662720697750;
        Fri, 09 Sep 2022 03:51:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for MSM8660
Date:   Fri,  9 Sep 2022 13:51:32 +0300
Message-Id: <20220909105136.3733919-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
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

Create a separate DT bindings for Global Clock Controller on MSM8660
platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8660.yaml      | 54 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
new file mode 100644
index 000000000000..09b2ea60d356
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8660
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks and resets on
+  MSM8660
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8660.h
+  - dt-bindings/reset/qcom,gcc-msm8660.h
+
+allOf:
+  - $ref: "qcom,gcc.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8660
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pxo
+      - const: cxo
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  # Example for GCC for MSM8974:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-msm8660";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&pxo_board>, <&cxo_board>;
+      clock-names = "pxo", "cxo";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 61b90e836b5b..aae83a22b5fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -21,8 +21,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
   - dt-bindings/reset/qcom,gcc-msm8939.h
-  - dt-bindings/clock/qcom,gcc-msm8660.h
-  - dt-bindings/reset/qcom,gcc-msm8660.h
   - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -40,7 +38,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
-      - qcom,gcc-msm8660
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
-- 
2.35.1

