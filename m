Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16126550D39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237357AbiFSV1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237344AbiFSV1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:27:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D565AE59
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so14397278lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPj7GOpWp1DSXI8ysjZP1E1qF++Mm4LPpAM6Pwa9fAw=;
        b=p36VUMyQZmMM5QmFv/oD0gU3W1PQzKVUaAmGwQVLD+1Yo5boaAc1m3A9csuIedUmT2
         gseU47oxDdVxxpcJqGL982Nb6Jt0J4MMRh/1Cn3UjHBg3ybwNYKmii7nmQKK+oqPdwz8
         iA/suavKUWGo/J2sUJ8q6ktOEmclcMek5+HxXaE8PquS8xpdHfJ1GM3YB7CFBr+6V5lC
         nxqXbXaUX7hUA5tqkdFa+h7baiY5E/eNONsIDd3/ZpdUOPheIeyzxMrDMYXcyRZm+1XE
         FgOkiJdlLB+bwvM+LC9FWv2lWqtgwJzi2vAPRjN2xcCkzYpxmJfs1aqoBQDumgqMB8Rr
         yN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPj7GOpWp1DSXI8ysjZP1E1qF++Mm4LPpAM6Pwa9fAw=;
        b=tRMe2Zjusnq34cmdq8Y8hj8rQtajYzQ/jgavXi7Y67/iJtchIsYxXHM0n9D1LIUqeo
         opBSYuVpqF7pZGY9Diuvk/Gug3b5MurrkD86quwKCi5AAFkTUoHhW5qrdtxcECRU6ZGe
         gkfFBH6fpDBVTwBEsKzy2NjMCoHuq3jnYB75Yv6jybTuQakfejCQdN2fJIP5DEbgGEEf
         RZNIT45FAqrace8+5S/1C/BOTyYBPinmkxX1vr0KcIJQKBHLyKk0igY2xkzAaYZCRMnS
         oroAulRGoR7G8G4alj0S5NwqKFgrCufMShp90MSUaAp0QVzmY6wjduxAqLmmDSwdb8b7
         oTyQ==
X-Gm-Message-State: AJIora87vf5X/RvFO+MtXM8RfYOLFReFgw9OlgfWC6JeOjqxPa3oxjoq
        UUJ6MRntkCCioP7KHCXOkYNoLcVodXpK6Tuz
X-Google-Smtp-Source: AGRyM1vG9ioIAa0CSnrVpTE1x5tZYWPSzl9n1RjYLBNpWbGwqFWGw38eQWslTIg/lprH8lnkPGmbGA==
X-Received: by 2002:a05:6512:2511:b0:479:1723:a743 with SMTP id be17-20020a056512251100b004791723a743mr11301690lfb.433.1655674058497;
        Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC device
Date:   Mon, 20 Jun 2022 00:27:30 +0300
Message-Id: <20220619212735.1244953-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
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
index 6c78df0c46a9..61b90e836b5b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -41,7 +41,6 @@ properties:
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
       - qcom,gcc-msm8660
-      - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
-- 
2.35.1

