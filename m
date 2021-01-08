Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5CA2EF160
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 12:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbhAHLeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 06:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbhAHLeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 06:34:21 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0043FC0612A1
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 03:32:59 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id i5so7524456pgo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=fJy7+QGBqAxxSegOAf62IGmG6rSwcILXGWqlg3Xvw5g+u56K0xj8AiR+FERB5y8EZg
         XwEI3JPeS19Um/yvQZPCDUXuQVYSOSqLRpOmLsBLWxMlNFu1PP6OU8pa6C3I8j16ghzu
         qVR5es2wVQDm/y1cVJo2kvler0i4tbLGrKkk60ZvkSI0GO2o3gFK04rT13OY8hR66V8N
         tbeW8tN2JzmM5QIngmQFn4o85XlQSryucmI7XWswoHJ1iz7C0kK1kvv0td1hIiuwCfxQ
         g2J8WksgoGlV04L61JOgjSYLmd4PntXgD7FYgTjmDheRF9Exj/plgGTeHC7cYm7Mp15l
         KKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=KraMdLLf35iB1UAonQK/QbIM+Sg1ak7Ld6XmPPInlXgZxcog4KDcU4TLShJmviVNS0
         lJN5vVSoFAlUeBaqD8RWeDDxsOz8kssk0XBxbaWo0WSWoQSw7JE+4VIdYrQhdnKpw5zb
         oEh2sPR2exqTzxT84BQU5NO9bttapKKC9hY3lzTlcKeWliH3qZi72CGmNayk6JlJqiLB
         S0hIgQPDc7inPw+gQkU5t0k6v29c0OpS19accoyuiuF4tAabLYvmvfzU5sntITlFWRrU
         Kpquns+zbzcWipJ9MLa+f5V4K6OHehxee6T+dId6W0/y1K5wey9aDFh4Gn8rV7NnaGfg
         XkfA==
X-Gm-Message-State: AOAM530Gr5K8CwuOqzv+3iaDo6TCmMarGohbDmSk8/5LEEfJ+QkaZh+O
        IQ8p8b03WGrM2EZacYnvXbA7
X-Google-Smtp-Source: ABdhPJwWOldoMw4h2aza5aaKvwjvJUmGJC7vRbeUobUvqk2/cnv1Fsioy0ztzWfw8kH9BRR4k0YOLg==
X-Received: by 2002:a63:101d:: with SMTP id f29mr6576907pgl.165.1610105579458;
        Fri, 08 Jan 2021 03:32:59 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id i25sm9261573pgb.33.2021.01.08.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:32:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Date:   Fri,  8 Jan 2021 17:02:31 +0530
Message-Id: <20210108113233.75418-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
new file mode 100644
index 000000000000..8666e995725f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,a7pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm A7 PLL Binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
+  frequency clock to the CPU.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdx55-a7pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    items:
+      - description: board XO clock
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    a7pll: clock@17808000 {
+        compatible = "qcom,sdx55-a7pll";
+        reg = <0x17808000 0x1000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "bi_tcxo";
+        #clock-cells = <0>;
+    };
-- 
2.25.1

