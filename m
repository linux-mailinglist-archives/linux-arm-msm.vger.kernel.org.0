Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492DB710C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 14:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240576AbjEYM3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 08:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241073AbjEYM3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 08:29:47 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CA0189
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:45 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-309438004a6so1355728f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017784; x=1687609784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuvRuDicrDkTpiapZ9qbY9ea3wcS797f7ELyYZDyHDI=;
        b=S/JIetgcXgA1A05nAOKXcZ9zKRE/D7BI80rlLZOkS0HH7qzevd2EASNBuHAl1QRiIR
         Z5rhHStymQH3/wRF4OhUt6QSnpULTb2HcRb8wkpsrB+LNejwEq/aG8b76PGp9BlmRCyI
         bB/o5CPJIEIm5w7Zj9B1QeasBGCkDOqTJ7Mv21FzZchz+Yi7wI1rt+oEC/UBtLyWWDib
         G02Dpy8RIJkl2iMLzqkGVXPzKYNFQK93lwIDIy6OSAPlpbScbTzrI77xfWa0NSVCs2/H
         OuU3PGH6eoqjrv//EsL9ODgMoyF5yuz9oy8dE76ZowSkatjZDetipM9P8q9ckeOBEBYk
         9W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017784; x=1687609784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuvRuDicrDkTpiapZ9qbY9ea3wcS797f7ELyYZDyHDI=;
        b=OlkeBDQ7pAm9yURaHb46iv7rlSLCuTzFTlHpGl3K2/Pmx8WuBKxYb4H/pRo/DwBHdh
         B94khcK46dHTt+mzWdWWyDGKQhOz7N6OezGugCCHCSOkvxYPQDz6AaPgVVPBrft8y9A5
         WPjmXer/jvIYHie77Qncld8IpRoKs9wadEBmbtv6QbpvNokHkC8z4EbeK12aLJY43Uiy
         HV8BWdGwZJuNZS9HLJYE1vaqqoiUVhLPW9mNc9/zQQOPlk+aPI2XmsiMvno/ucWLJ8Oa
         kDgNAIaE0ez/Xg1aU0g7Yb8oyUEi1ddEhIC28Tl5y/hf8F3JlYQXrbMzeqDcjd3ZWSiV
         cm/w==
X-Gm-Message-State: AC+VfDwpG/KcxcnjWWnzmQX9h1Qrw/EV1mE1W4w7U+vp1IJ8LXbiDbV8
        C+M+LTr3TmHaO/D0ps1AKJf2Mw==
X-Google-Smtp-Source: ACHHUZ72Waf3mTjj4DxvPqTfbM7OLB4xZcc5SXGEkcYd6A6DCBCK/qW5Y1RBp/H345W+Is77dTJlog==
X-Received: by 2002:a5d:61d0:0:b0:306:489b:3c6 with SMTP id q16-20020a5d61d0000000b00306489b03c6mr2000407wrv.58.1685017783888;
        Thu, 25 May 2023 05:29:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:43 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: Add YAML schemas for LPASSCC and reset on SC8280XP
Date:   Thu, 25 May 2023 13:29:25 +0100
Message-Id: <20230525122930.17141-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 57 +++++++++++++++++++
 .../dt-bindings/clock/qcom,lpasscc-sc8280xp.h | 12 ++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
new file mode 100644
index 000000000000..08a9ae60a365
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on SC8280XP.
+
+  See also::
+    include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+
+properties:
+  reg: true
+
+  compatible:
+    enum:
+      - qcom,sc8280xp-lpasscc
+
+  qcom,adsp-pil-mode:
+    description:
+      Indicates if the LPASS would be brought out of reset using
+      peripheral loader.
+    type: boolean
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,adsp-pil-mode
+  - '#reset-cells'
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,sc8280xp-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        qcom,adsp-pil-mode;
+        #reset-cells = <1>;
+        #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
new file mode 100644
index 000000000000..df800ea2741c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
+
+/* LPASS TCSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
+#endif
-- 
2.21.0

