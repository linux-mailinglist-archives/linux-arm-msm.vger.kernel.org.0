Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D32D5EDF73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbiI1PA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbiI1PAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:08 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DE12ED54
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j24so14643955lja.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qzCxOTmp+gxnMgVdAJunjjkZh8T2GclSG/MzKsGIiUY=;
        b=NIQb8EfBe92SnYRtXYZjYgO8aXOfamVx2hYlMg6azG7W5+C8LsZJNRbxSmyrhF47w9
         kgpf+KO+5Jp7Ve6+VMgVYkGNCjYDfFqpSyTt/8R5a4O7f0jcFI0IMvEQvtrKLZjSUvL+
         ziqRbFHB4++sG6ybw2a8pQY4EWEEyTHCaxJ4MZAQkOHfzEmytscTV//Flh8zc5RCWvb0
         C2wYnuGzyFRaC5Xg4MLQa67fOfmxUzKr+9SA+/FdeVWN3pph5Khsq1fCYeqC0AinsgP2
         cstQFHZfiaaeBIa9uIOeUGUQJjcyxnpihAyP1HeFuVet2cquF4dLFShI4r74MEB9HiEy
         ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qzCxOTmp+gxnMgVdAJunjjkZh8T2GclSG/MzKsGIiUY=;
        b=YASWXxSZhMBCKzils4Rs7hXtAfcH64RgpXPfxbBNK2wEwx87/8rQgN9pxwO0mIluqo
         SOtnxjlpewKNd6qkabt48bCfC8cgzSPSUrB7sNBwfOV9jh/PKzV7XLcLuBmNvhGTInKG
         HftlaxkA4aVW7/iplg5AlvHjkvMl+gX8joSQY2fojh3FoWUHzY5Oxtk6glOWnVabzVtR
         hZnYF2vUNX9iPX7fj+R9BM0nNBU7fXCz4C3Eq8zVpf2WT+4cJwF0oWkUpntQ0LAuFLMU
         iJ5eQ4msmTdz/tgaC/fuG134C0V7Z9vzy3WphEhSnnUejCj6l0Q90h52osudfaxg9TG/
         kdOA==
X-Gm-Message-State: ACrzQf3GXpBtIs/3OxAxQfK2fcbd3gXE+vYveLJ6YSbwPU2mGeIPdxOW
        Ptf96KURR+1XGFacIupO+2JBuQ==
X-Google-Smtp-Source: AMsMyM5ruvrENEeGdlBxYOCN0yHTNa3cSP7FoEJE2ODTWDxMM7xcWr29/rJcssZ5L8edv984J8KOZw==
X-Received: by 2002:a2e:a4db:0:b0:26c:784f:e513 with SMTP id p27-20020a2ea4db000000b0026c784fe513mr10896154ljm.310.1664377200547;
        Wed, 28 Sep 2022 08:00:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:00 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate file
Date:   Wed, 28 Sep 2022 17:59:48 +0300
Message-Id: <20220928145958.376288-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
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

Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
file to be able to define device-specific clock properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8974.yaml      | 65 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
 2 files changed, 66 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
new file mode 100644
index 000000000000..72e8f54d0e0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8974.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8226 and
+  MSM8974, including Pro variants
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SDM630, SDM636 and SDM660
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
+  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
+
+$ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8226
+      - qcom,gcc-msm8974
+      - qcom,gcc-msm8974pro
+      - qcom,gcc-msm8974pro-ac
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  # Example for GCC for SDM660:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@fc400000 {
+        compatible = "qcom,gcc-msm8974";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        reg = <0x00100000 0x94000>;
+
+        clock-names = "xo", "sleep_clk";
+        clocks = <&xo_board>,
+                 <&sleep_clk>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 35fc22a19000..0ec8ff215007 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -19,8 +19,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
-  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
-  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
@@ -34,11 +32,7 @@ properties:
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
-      - qcom,gcc-msm8226
       - qcom,gcc-msm8953
-      - qcom,gcc-msm8974
-      - qcom,gcc-msm8974pro
-      - qcom,gcc-msm8974pro-ac
       - qcom,gcc-mdm9615
 
 required:
@@ -47,10 +41,9 @@ required:
 unevaluatedProperties: false
 
 examples:
-  # Example for GCC for MSM8974:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-msm8974";
+      compatible = "qcom,gcc-mdm9607";
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.35.1

