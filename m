Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1B2906EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408660AbgJPONA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 10:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406163AbgJPOM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 10:12:58 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049A7C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:12:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z22so1683922wmi.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=ERMd+nbjjHaN7RaIuVgDuyH1YiLlpP4VXA/JN0jvQOmKrKRXymFiIGTtcbfVVPYDMe
         aRtGls32X/9FB1Y8U8GsPR8WLeGEVhiemPNRB6X7BTPnLEYSjvGpnSyQ8e45dcT0VeyG
         ztuSqhcwcYoch8Vx+7fbh42e1YZbNjFkRksdntzQK3qiQ6c9cjDKeGh/sv2VHTVAC4lC
         VubE/ACyEvbsf8AzEsT+GihjCVi59qoYuUI82uh8ty6taQg+mF+zNgXuGwJvV5W7nkrQ
         hSBiiBpvWuigr/doO/rP7mmT9qGr+hlyE0UehC3p2NE4fg9gXgHTJ9FbzUykgpdWLhie
         cBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=bmDnr96t/Hhe2hAw3G9FESi/zynJMQ1Vdwem2Ftd4ea6amTY5FAG2GEwDQdLnabjo6
         ZuiGmaJO8P0zR4rv9n45vYvkmHh7qkUD7p/vTVlEWZPecV1KoIhn4jkgu8S+Z+gcXxNr
         Sm2qzf9pD2C88nZkSaUpGdObaVYzwpb7/ayTRy/9zgDz1NuHJ7s0JYs0Iibykpklxswd
         AGXgy0ZL0atGrfolt7+HyroUMtU3Kt7GCCCniJ2c3lSMHd4+2OGB3tLqybsGewJilY9f
         Du7O7eV93wTkKfq5nzDGkysOZw4JcyW1bQEiiprS4+Clths55plxO1gm8PzujSaQjJpD
         l2lg==
X-Gm-Message-State: AOAM5333v3IJzwwMYK+snjdbsLJEJ/k2NhoOUobxcJyPhwAnKcKUYlVr
        l0xyvzmzeK6qat0S2U7d2KtMMg==
X-Google-Smtp-Source: ABdhPJwVQJZQJMq5vQn3HTmXWOjVuMOg5eOEEISr0a/F4Pw5f0GKeN+EZ1jzyVtTbos26Z7Vd+ELLQ==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr4263781wma.133.1602857575769;
        Fri, 16 Oct 2020 07:12:55 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id p9sm2982284wma.12.2020.10.16.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:12:54 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: clock: Add support for LPASS Audio Clock Controller
Date:   Fri, 16 Oct 2020 15:12:38 +0100
Message-Id: <20201016141241.5839-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Audio Clock controller is a block inside LPASS which controls
2 Glitch free muxes to LPASS codec Macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,audiocc-sm8250.yaml   | 58 +++++++++++++++++++
 .../clock/qcom,sm8250-lpass-audiocc.h         | 13 +++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
new file mode 100644
index 000000000000..915d76206ad0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,audiocc-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for LPASS Audio Clock Controller on SM8250 SoCs
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell.
+  See include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h for the full list
+  of Audio Clock controller clock IDs.
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-audiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: Glitch Free Mux register clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    clock-controller@3300000 {
+      #clock-cells = <1>;
+      compatible = "qcom,sm8250-lpass-audiocc";
+      reg = <0x03300000 0x30000>;
+      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "core", "bus";
+    };
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
new file mode 100644
index 000000000000..a1aa6cb5d840
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
+#define _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
+
+/* From AudioCC */
+#define LPASS_CDC_WSA_NPL				0
+#define LPASS_CDC_WSA_MCLK				1
+#define LPASS_CDC_RX_MCLK				2
+#define LPASS_CDC_RX_NPL				3
+#define LPASS_CDC_RX_MCLK_MCLK2				4
+
+#endif /* _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H */
-- 
2.21.0

