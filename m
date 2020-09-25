Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF4D27852B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 12:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgIYKbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 06:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgIYKbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 06:31:38 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BAFC0613DA
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:36 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id s13so2508984wmh.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kTQ3e0/LCgzSJvFHZrL2OGlp6ZdNfQa4Pg2C/+kTcwM=;
        b=ccC+FV4be/e/5Po5TekeLpAkwVM1euxvcfPbP70FAx2wCSw6ESROzfia0AZE2cTk2R
         APJkVFeyBykdc5ipLi5DPjb+octeugFkbWC5lvSKp7IzLewRFy3YCIur0LqydsI9qzF9
         OGvReI8/v9E4H+oOHlrWFYpKPz3cDODe2x2mxPQQMilXsfvJxoBAk51dwyBJEpC5BiFB
         z1lPvG3fW7tKuwba3Katol8XFuAcMFQakuS1lI4jBkHBEX2XXm+rBxSpvlfqIcSADyXN
         BNmsyJT2hS1zi7o9KtC0Z1N759CNs604ILUehTsffiqWHzBtUCfSijakzdlxc5mp6XCG
         J6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTQ3e0/LCgzSJvFHZrL2OGlp6ZdNfQa4Pg2C/+kTcwM=;
        b=nVrvS4+HOiQ/XPavUeVkwNRqpMfW7VZTpa/yVkAWeIv9/FlSK33HnTBZdyAEVlZXRF
         apNR5ILr9X6+hP3wU5e0t0D2lItztIDX9/7NNIGxvs94b+JXzF/ivON6OTJ4YETJKOmN
         CdXvEJgW+dcOsRBzo1efVE0cpTm1qVnwQtrg9YJV85i66J3eXC+GC8tKWHjMPcsJGkGs
         ajPMFecpce0LitwiC9PBsT/wOD+pWc+s3tch7/ffESAG0aJ6Ut6l+zlmiJl7vSAZkf7c
         bagXbfA/R069Be2hmthnbpgh/tD1arwPhiz5vMU89IM7Nc6NDGGq1BYgBf/JmK2yDJlc
         AOwQ==
X-Gm-Message-State: AOAM531mJMg7urAmHAeZ7tYfkYF8bpRPMs8nHxP4AfabQfWVdHEIAqpW
        uuAEEGpxj2Bkame6owLOP9AmHA==
X-Google-Smtp-Source: ABdhPJxErtQikbHjqQn6fHN+5dV5Wp8EDhlBXkKec0vOuPfEwXGFI7L0lw9wl7gmVe26iB/5RJ5plA==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr2496832wmb.90.1601029895413;
        Fri, 25 Sep 2020 03:31:35 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 11sm2354907wmi.14.2020.09.25.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 03:31:34 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add support for LPASS Always ON Controller
Date:   Fri, 25 Sep 2020 11:31:13 +0100
Message-Id: <20200925103115.15191-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always ON Clock controller is a block inside LPASS which controls
1 Glitch free muxes to LPASS codec Macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,aoncc-sm8250.yaml     | 58 +++++++++++++++++++
 .../clock/qcom,sm8250-lpass-aoncc.h           | 11 ++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
new file mode 100644
index 000000000000..c40a74b5d672
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,aoncc-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for LPASS Always ON Clock Controller on SM8250 SoCs
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell.
+  See include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h for the full list
+  of Audio Clock controller clock IDs.
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-aon
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
+    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    clock-controller@3800000 {
+      #clock-cells = <1>;
+      compatible = "qcom,sm8250-lpass-aon";
+      reg = <0x03380000 0x40000>;
+      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "core", "bus";
+    };
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
new file mode 100644
index 000000000000..f5a1cfac8612
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
+#define _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
+
+/* from AOCC */
+#define LPASS_CDC_VA_MCLK				0
+#define LPASS_CDC_TX_NPL				1
+#define LPASS_CDC_TX_MCLK				2
+
+#endif /* _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H */
-- 
2.21.0

