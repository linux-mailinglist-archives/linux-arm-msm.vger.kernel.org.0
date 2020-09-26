Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0E627997C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgIZNDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbgIZNDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092A7C0613CE;
        Sat, 26 Sep 2020 06:03:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e16so6905409wrm.2;
        Sat, 26 Sep 2020 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Els4Jl1sayyL7AQrvZnyLZvuTkn4Bmrn2Q5P8EVgSnQ=;
        b=GBkGINvG0UDj+BqmBA1iqwDQIaKkdg8mk/poLZA87KoylwKvA5gc6PN/+i6LQ0VFJp
         1kRvJ1mXK/nhQHBGbRWjjIeR42czIajFZXrgIiwzNDe/I+n4v/qeQDgcZIr2XmzcaaRY
         qDdZzG7pUfVxuSKeu5QCzkPsQVEPgWzDZeSBaBWF6WBzscOIXHs6ccxKyhbDrpMi4450
         ApSuqAUuHMsOSp+yGEtDkjMHa6MBT351UsULEJbh/cO/LVShZ8La6EiO5/TgXTmdWOzb
         bwL5tfhgKJlg2oEis3jQKc2DS24XbI0Tc6KZachqp+hw/4uAVU0uOZ9p2AfEZ1h29Hxn
         Tr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Els4Jl1sayyL7AQrvZnyLZvuTkn4Bmrn2Q5P8EVgSnQ=;
        b=QRd1tEnLQ1hKoRmHJfVKdseqt9Yn0uv8cUTWhC0T9apUiIxoTPb0q86Ytf/ObicJG+
         bV2LF/oQvnSypzHq/FwKuUlK5o7IyEJ1J6gNqCQQcsSoMNEoxOtffHn/WTYgUBQPwSP5
         BRa/mvVO60lM43fLKUUW3Amy8WWyLlsyB0KKpi03RQ8KB9E02zdxkdHApwOQvk/uV3SV
         kC26YtMKblsdk4LCbNd7uTWvXfMkcYZ1mmFTgKdyp9SDGXD8ZUgENT1jrOtIG9xZgwHE
         wLs9+7UELKWYcCf8/26u+kDBSUDz3IM2x5KRqliLqDm8O4ivembzM5/+MYCtTx7wP6BT
         a9VQ==
X-Gm-Message-State: AOAM530wZ1dGD47+iiQUwbxf4+VVAjSifF9qG5DkludxrpPdMy5yF3RQ
        b23ZS3AHDU9nA0xa+5B8QYw=
X-Google-Smtp-Source: ABdhPJwGP6uEnzqYUfh9FpelXdiFz1gFACLaPgsKTg+Ifbh5MMONyG1/sU9QAlU7WukCxcpyXayMow==
X-Received: by 2002:adf:f245:: with SMTP id b5mr9956497wrp.288.1601125394546;
        Sat, 26 Sep 2020 06:03:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id d83sm2853213wmf.23.2020.09.26.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:14 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings
Date:   Sat, 26 Sep 2020 15:03:06 +0200
Message-Id: <20200926130306.13843-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130306.13843-1-kholk11@gmail.com>
References: <20200926130306.13843-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SDM630 and SDM660 SoCs.
---
 .../bindings/clock/qcom,sdm660-gpucc.yaml     | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
new file mode 100644
index 000000000000..dbb14b274d5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sdm660-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for SDM630 and SDM660
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on SDM630 and SDM660.
+
+  See also dt-bindings/clock/qcom,gpucc-sdm660.h.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm630-gpucc
+      - qcom,sdm660-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main gpu branch
+      - description: GPLL0 divider gpu branch
+
+  clock-names:
+    items:
+      - const: xo
+      - const: gcc_gpu_gpll0_clk
+      - const: gcc_gpu_gpll0_div_clk
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
+    #include <dt-bindings/clock/qcom,gcc-sdm660.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    clock-controller@5065000 {
+      compatible = "qcom,sdm660-gpucc";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x05065000 0x9038>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&gcc GCC_GPU_GPLL0_CLK>,
+               <&gcc GCC_GPU_GPLL0_DIV_CLK>;
+      clock-names = "xo", "gpll0";
+    };
+...
-- 
2.28.0

