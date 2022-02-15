Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C739C4B7759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244063AbiBOURE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 15:17:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240454AbiBOUPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 15:15:53 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0737AEB169
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:43 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b38so125603ljr.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6GT01Bt5rwCOjSLQQeIHh7n+6HZ2KwW6Q5RymmBrtD0=;
        b=f6iP67siNjcx4yf58aS3d+F/7nqamMQ2Iv7Kh7Vgbpv2r5Q+9GKaajMbWxgruvrZE4
         TqQ0Kk2KDAtlddqhBnQvKeevoTL/MtmDEvjs422N7FtzwtMdLeEAujye4R/QwbKP0Yr9
         +bJKuCae7HBTp/U9v3AyGY3ILnQLMkNnIGu18Y0K1gxL1VlCLn4IRrMaaiXFzQOtvB6r
         qeLXC0RRiJHuWajGSOARzYciIH1tFm5QhpS/QQLmeEyF3QNM46h1QEKbCcQYouBvPd0E
         4ouxj8aMjaVa/tWL2MPIR96Man72HZi/YbcqGaSJIY9XK53o0/E6AECsrcQ5HvxnjguB
         7aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GT01Bt5rwCOjSLQQeIHh7n+6HZ2KwW6Q5RymmBrtD0=;
        b=oK1RQ1G6iQZK8uFTJW0iOzSghvjDmljxKkF5QNQbdXphmkZEpZT3rZ6sbu9ZwskRa7
         +FPV6LswKsgwt4anL6HFciegvKqQ3T3qtUwr43TrojUuNCFjwyBjfRUxHEZjo7vF07/d
         D1btlgAmuUiQf3WQ6pIHgvNKUpOsacn7XbvJzQ2QIsVxH9XZ2BsiMjCNoQS58gEyHuGZ
         3ieLUIUQbnX0ldMnVZfbHoqgcVRk1k+pnwgTk+s+mOdP+ePMEM9PhTh/yDKTRzYqjNqr
         iAtdWpRDyW64c2RHkbPXo8CN0BaUVLZ6sdm1dLPbxbtUHX9D/cD/0ejzKFDngF/Qr/nM
         4w9w==
X-Gm-Message-State: AOAM531MKlT6ZvK2KvL/Hnz1lm5mnzvC0wd9sJo8iscjfgq/BIWifD3B
        LhY/PihdCBIOa+JnxOeVXUxBpg==
X-Google-Smtp-Source: ABdhPJxH77Emm6xQMmIH2ZeTSqzn+PQxjFppSlngq/qMnP22VuzonAHWZrrMyjop5tWdjKU6LntBkg==
X-Received: by 2002:a2e:bf1b:: with SMTP id c27mr505719ljr.67.1644956141367;
        Tue, 15 Feb 2022 12:15:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
Date:   Tue, 15 Feb 2022 23:15:35 +0300
Message-Id: <20220215201539.3970459-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
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

Convert clock/qcom,camcc.txt to clock/qcom,sdm845-camcc.yaml.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,camcc.txt  | 18 ------
 .../bindings/clock/qcom,sdm845-camcc.yaml     | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc.txt b/Documentation/devicetree/bindings/clock/qcom,camcc.txt
deleted file mode 100644
index c5eb6694fda9..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,camcc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Qualcomm Camera Clock & Reset Controller Binding
-------------------------------------------------
-
-Required properties :
-- compatible : shall contain "qcom,sdm845-camcc".
-- reg : shall contain base register location and length.
-- #clock-cells : from common clock binding, shall contain 1.
-- #reset-cells : from common reset binding, shall contain 1.
-- #power-domain-cells : from generic power domain binding, shall contain 1.
-
-Example:
-	camcc: clock-controller@ad00000 {
-		compatible = "qcom,sdm845-camcc";
-		reg = <0xad00000 0x10000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
new file mode 100644
index 000000000000..c61314caf692
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sdm845-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller Binding for SDM845
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Qualcomm camera clock control module which supports the clocks, resets and
+  power domains on SDM845.
+
+  See also dt-bindings/clock/qcom,camcc-sm845.h
+
+properties:
+  compatible:
+    const: qcom,sdm845-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,sdm845-camcc";
+      reg = <0x0ad00000 0x10000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
-- 
2.34.1

