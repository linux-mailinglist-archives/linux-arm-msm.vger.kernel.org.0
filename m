Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D665A7DB83D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 11:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbjJ3Kgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 06:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbjJ3Kgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 06:36:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CA7B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:36:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c54c8934abso60280941fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698662206; x=1699267006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wf35menyqr8aV3TpKLI5N9BqVbClrvYhoeEs/60fXVg=;
        b=IQxgpOGXEB925dpajeXhVE+dzrXS/OFLVcZbfiUVJymXn38WxGXLnlHc5D8q+Pr3m6
         NpV4FxXHCDezan6wPDwSK+phA3ekNCZFLKEWT29wMFfagRub4vqJ5CDR2x9C+dq8i/PK
         IVbXOQvaO6fbYnIHQ14XIuE6Z6gUq8c6ps8dxuP53m5nkKGHQBVChPSEIun0X8bawMpv
         OfFzHddR8EvICrB123tQEFmiT7+P+WJ2SiE6hL0qq6OuN/MTpPrCmH0UbGuDxoiXfxAv
         RJ6/Db7tr6wzc3VWxAJUmpl57S4g9fUqusTiIpAaLlhn3KWm0hcjlvNxrxreOI5GxqYz
         aMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698662206; x=1699267006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf35menyqr8aV3TpKLI5N9BqVbClrvYhoeEs/60fXVg=;
        b=G7mY1WXOShTCDvlB+akXtclL7IIzzi0xvrx+WoYg3V6dVoOYnswoueBvcCyeSUAKeX
         Rs8jfojA5hm4fpj/oqAifhB3r0qQLzKYwUk3uQbevnU09/ZMXT9GVemsfGDEbXwbLIsG
         lxzcp0+uuPjHgAeUyVVRyvSUWyKqLkcuX3MJPmUWplMAdgBlHnj+Z8gfqFgCOBNYEQNX
         YUbIfoSB+5cNVsiZ+qlzo41FlRzR5s+CsSYF2bJXS6Rz0sPOxCn/lYBQRJTBW3SQ5PZB
         /S4CdXTuq66dheSQHu7qkw0OoSn2BVorwmADxh4jZ91PWqWKMzSBmnn1OJjWCBusOiEa
         OzIA==
X-Gm-Message-State: AOJu0YzefIAmSYLrPJqr/g/EmGuzNGGZ2Csqb/Zj8uHsZQc8T0dSprft
        h2eS10T+00C3dgSbfRLQ71nZsw==
X-Google-Smtp-Source: AGHT+IFz6Ft90TRonvQtv8uTyisQIWRdtlOcAPkw4W4JfYAch/zI2oxf2/JzXKAbRL9M0Cns+/3X5g==
X-Received: by 2002:a2e:b617:0:b0:2c5:f54:2477 with SMTP id r23-20020a2eb617000000b002c50f542477mr6260498ljn.40.1698662206636;
        Mon, 30 Oct 2023 03:36:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 03:36:46 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 11:36:25 +0100
Subject: [PATCH v2 3/8] dt-bindings: display: msm: document the SM8650 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-3-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3954;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=x4ucVNCXjv/ys2+lExZHj2JGfBeSHaxw/qEVsQolx7Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c39C3XCIWkeUOAFhgJ5Bd6MROfRA/Dx6BZ6h92
 8CnHhu2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNwAKCRB33NvayMhJ0bmrEA
 DOUjSLVs9t8C4eF3W2kRW53G+zLQ/j0SSMY9YQqi7bm/akTFYsIjUGxCU8FsbDQsXJzqBxBWJBz+19
 GCZiDfRpRhx/ezfmHHsUL/HbV5rGP/kA1ZY0Az4LIZN88jQKbGDbgcTwdHFXxyW2oQ07cQoTNZCcwF
 /qfL/Nv3vnYY9YN4jW0yozmo+nmCPdCUT++mh+B1zM+lvelDLo/5Eg8AIdEcnnSdDlmpkztKkHsb5O
 HwvUCW8ErRbBncAw2bkvpyOYH1reOhZxUh3T+W9KDXKCgzChadSj2cib7nClGRzW6n/LtWS8/TNOOq
 kMZhVDduca+iUZHDJVE9SpkIXfNW0vYBfuhay4rjeH6MqbfFX7JNBUXICyXAZLLdbzvJA/nFTXDcqd
 jm2jyROXDhzOura1PA3wj/OxYd+XaQxn0dhyPglf0v9tJCo0vJkJb2Rx0IseeO+N/5mjscBDWZPsp7
 57kG4aCduZYlqR7rMISKEKdPQ4BGvkUSkDyXqCk5WYa8AQ/U5pRreZAYFITLuwrGarGmu6xVpCtwSC
 Rw66VkD8kdauPPkldjRUETaY84hoHHSIQUlNMbFIg+WnBfhYaMlah53DSu0P68PJGS8rJze0Lu9DyM
 k/ZCRkQJKOkzNqDfnmxfTbVtXl/l9U/gfKKhD9mZOaANI/idUuHqZxgQp6zg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the DPU Display Controller on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
new file mode 100644
index 000000000000..a01d15a03317
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Display DPU
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8650-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi
+      - description: Display MDSS ahb
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8650-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc_axi_clk>,
+                 <&dispcc_ahb_clk>,
+                 <&dispcc_mdp_lut_clk>,
+                 <&dispcc_mdp_clk>,
+                 <&dispcc_vsync_clk>;
+        clock-names = "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-325000000 {
+                opp-hz = /bits/ 64 <325000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-514000000 {
+                opp-hz = /bits/ 64 <514000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...

-- 
2.34.1

