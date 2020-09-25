Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112E527852D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 12:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgIYKbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 06:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgIYKbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 06:31:38 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880A8C0613D8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so2729460wmm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=I2FfxD4giNKc0qMqwWrLHvtQKw37BxU5gISpC6gnZY7NLfu4SlKU5yF4Qtam+Lcr48
         uYJW4vMa07Vuazslzb/HremwAi2v1M6YutCmSyB1pXWCI3fpEOLLoXnvyPSJNKM2Trus
         h/rm1oCsWV4JGz1Cg8hZe4NFqX1zlSyaAPb/2lmK/U6Y/1Fzc6myqdzKH14bZv0xeHaI
         8kzT99e1DqxWtPKO3vPXdfHNY/Sbl/zV2fg9rnXwbMh001GuMnYzCmOSRCU5EjEpghVc
         5f4G1j7cR8x8xSQo1/ED1E96U6JiOAsGOZrzONO5LV3SuF7r9A9SaOEGdnO4HZBjHQjW
         QX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=TwwlfC7Tb2AMzoDGwNYblLyL3KHFlE19xXAl60uI56psPeWwLzvwMf+ebju+7KTA31
         NTUdv+cFfaazYRiMI6QvRzkUwb6eVamyDi/+7BM5WXjLcQULkacQt8NyG84O9V05eaBk
         XySHARv8DdUsdzdCWveTj4l7c7A0v3/9x22NVA2++Diy5vUqbPAh2lXE8DDJFQDMyJUp
         pveZzeoZqUcGjePdz+Sojr2+mLjZov0caOgXt5BePRnb+JkU2rJ0KLAz7fZuV+1OVqcd
         MUR2H7/h/FRrb/JHyHggcLfmx5PcpLEjP8pbtfT3OaG8oB9BgOcfaKPnc35R9DA9cuzU
         3rig==
X-Gm-Message-State: AOAM532w9uIraKq8tl5hYZGsLb/PUgXswsLzVZJVTozbeXwLFIdz5iAc
        L6MhJCoZA0CXhDBKQUtLre/5mQ==
X-Google-Smtp-Source: ABdhPJzfFCC6wQ6ihxNmQsKq/TD+EyO73JadzRRP7DQcdOkvu2fB+x+zWuxXgAd06dIcGLLJXTbVzg==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr2363754wmb.101.1601029894115;
        Fri, 25 Sep 2020 03:31:34 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 11sm2354907wmi.14.2020.09.25.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 03:31:33 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add support for LPASS Audio Clock Controller
Date:   Fri, 25 Sep 2020 11:31:12 +0100
Message-Id: <20200925103115.15191-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
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

