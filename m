Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3793619FAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 19:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiKDSWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 14:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbiKDSWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 14:22:02 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFF64B9B6
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 11:21:14 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id s20so3582092qkg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XdkAG3dilKY+4PvxfSDGA2DqcSYYOAUsGpHT8unyWA=;
        b=XKZBXR1ccwvkDLK2gAyQD8jTlThhJkk4LMJExUVubdSVqbS0LFnHUZkxwnf7GzMm+3
         HjMHtxjYqwI2RkLcJE0ZLs+DtBvEiU9mLWuMhDlRcFpGpotqrrwI2rd2MzPCX4nuwugU
         6OrOWV8y4hq9EesGfA7221abT23g38UGmPTOGvaewQ8uw75BKUnCCtr/sucZaKon4LZN
         3xDoRSgDp8gy0N0jGPkVfr5/nbCRJRIXCHW3wAdJ46LaKVVzEnz+RjfhUkVEklquEjq4
         If+33bzUYgw3mHKHcrTdy3inhLfeZW8/pbGpEC+wy5vwnFPPbqjWbOH2WKrY3ReQxj0h
         FdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XdkAG3dilKY+4PvxfSDGA2DqcSYYOAUsGpHT8unyWA=;
        b=LbSBYJWEMvjV0E2JX5bdx8ovCMPL3Azn5pIe8K9b++XkdNm6yuGoctGtyy12/cgGRA
         hn86zs6WBioSGct6VDSC2+mtzhmg0inAHXK9R5HJg32iy1NnQizZdCrp3vuSGHfvkfKF
         NXvgmfXU5QJOcRg3MyqDDg0y5cqxef1DNKoThY6B7kY4DdK9GVxBHZxRRL4PgJ5MFQgZ
         HZo5nyzO8PnU7RCyhPkE60IMYxYv9yli7ahG6EdZN+d5KHOIROPSx/tK8g+tErltFRP+
         wB2xSI/jBwR/BXgpEYrB7UNkwu3pYBEtmuSnljie3DdVVzt/KmticuXPe65Wxa1Y1Lba
         +8JA==
X-Gm-Message-State: ACrzQf1JE5bsK1sX2xG9xBu+GSQL8KbdCQCDr3wya0oDKnEuvAvPPdX3
        ZfkiDUvJ7BUgCMCgQWwk7ntfKw==
X-Google-Smtp-Source: AMsMyM44mo4Cb0xCcboeZdRBJmJH91asBNaSOAf6JiuRGZ+sBwVbiI5Z3iK8hvV+fNR6mz4ap7fPqg==
X-Received: by 2002:a37:c446:0:b0:6fa:5df9:6fcc with SMTP id h6-20020a37c446000000b006fa5df96fccmr11937043qkm.560.1667586074009;
        Fri, 04 Nov 2022 11:21:14 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006fa4cac54a4sm3389016qkp.133.2022.11.04.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:21:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: clock: qcom,sdm845-lpasscc: convert to dtschema
Date:   Fri,  4 Nov 2022 14:21:08 -0400
Message-Id: <20221104182108.126515-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Convert Qualcomm SDM845 LPASS clock controller bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct Bjorn's email.
---
 .../bindings/clock/qcom,lpasscc.txt           | 26 ----------
 .../bindings/clock/qcom,sdm845-lpasscc.yaml   | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
deleted file mode 100644
index b9e9787045b9..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Qualcomm LPASS Clock Controller Binding
------------------------------------------------
-
-Required properties :
-- compatible		: shall contain "qcom,sdm845-lpasscc"
-- #clock-cells		: from common clock binding, shall contain 1.
-- reg			: shall contain base register address and size,
-			  in the order
-			Index-0 maps to LPASS_CC register region
-			Index-1 maps to LPASS_QDSP6SS register region
-
-Optional properties :
-- reg-names	: register names of LPASS domain
-		 "cc", "qdsp6ss".
-
-Example:
-
-The below node has to be defined in the cases where the LPASS peripheral loader
-would bring the subsystem out of reset.
-
-	lpasscc: clock-controller@17014000 {
-		compatible = "qcom,sdm845-lpasscc";
-		reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
-		reg-names = "cc", "qdsp6ss";
-		#clock-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml
new file mode 100644
index 000000000000..a96fd837c70a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sdm845-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM845 LPASS Clock Controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm SDM845 LPASS (Low Power Audio SubSystem) Clock Controller.
+
+  See also:: include/dt-bindings/clock/qcom,lpass-sdm845.h
+
+properties:
+  compatible:
+    const: qcom,sdm845-lpasscc
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cc
+      - const: qdsp6ss
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@17014000 {
+        compatible = "qcom,sdm845-lpasscc";
+        reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
+        reg-names = "cc", "qdsp6ss";
+        #clock-cells = <1>;
+    };
-- 
2.34.1

