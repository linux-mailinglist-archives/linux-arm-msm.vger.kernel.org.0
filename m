Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF0B741345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 16:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjF1OBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 10:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjF1OA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 10:00:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAE72728
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 07:00:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f766777605so8167039e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687960853; x=1690552853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mDU0vzze/ov8lSvaXaSMAceWfhtBvQ2qAMt330k4/s=;
        b=J/nIApNP/by2XHNLQELvkjSVb3C2GyyRDm0MtS7SarCGfx9aS7iejAAERTCM3Ck9hZ
         Bl4xijgVlIfWG29VXkjCVUCXrH73JPV8U/AbXqG2a2tCPX/Z7Hf5TczCNV7fmc7/wvEe
         if7o3vohiiA2D5LwBhOICox+dthgcaR4Qmuc7oEeeDRJxBpX5XHlj4fkMLBkRe22BG7l
         YasbPFEOY1ZoFvL6QK4pnhDXNITcFK6gz9A671a8OZ2yyeszgfY4nlhuW6PBRYkrdYdd
         yVp34J8p9N1EJh1ogURSL9BHBo7OE7snTxjTcfbCmGvAlKxCsFHL3cpvpw80LpUg/Kke
         dC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687960853; x=1690552853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mDU0vzze/ov8lSvaXaSMAceWfhtBvQ2qAMt330k4/s=;
        b=kGzyH85BPDmFoIu4IxkMgcR3eIHmvoRYVrf9J3vDnbwD4Ku6dgHxLkaRT2kxd/M5oy
         wVDbqas/f04fkFebwflMajOA1++ZSeYsArstLh4bFBd6X6s4FZrPJJFgKxD7+Vtfam+p
         HbKK6aek0dN9t3DCb2JgfmqU2wHSS13hz7T8v0xiK/GC7/2B6+sQG5hjjMNzpjEj4//1
         1VvEkBylmAAFioTvEjir6YGdTPgAGwuVaS+jjjpoM4eWI2+jJlqDFrbAMRRORenVtbaE
         GAHdG/0q7T1wNgPgInDQZihRAivvLPIzJvQ45A89GPBaIB9d/02ZQmXo4wK7lO7Edfrl
         5hDA==
X-Gm-Message-State: AC+VfDyIR365GrS/S26tOdZbK37rfAl+TFjXbOfofIMqjEhh3o/yuYMt
        b5FqpLON11JpRni6r7D2CiYC0w==
X-Google-Smtp-Source: ACHHUZ5Y9el9plgPpHYM5q5yy+fFa8yb3GUgfIUJAk2wXxkMLYdIDNUI6qgiOivWt8o0FnMCmaSx0A==
X-Received: by 2002:a05:6512:3b13:b0:4fb:8bea:f5f7 with SMTP id f19-20020a0565123b1300b004fb8beaf5f7mr2968861lfv.11.1687960851584;
        Wed, 28 Jun 2023 07:00:51 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651204c200b004f8586ab633sm1941359lfq.279.2023.06.28.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:00:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 28 Jun 2023 16:00:43 +0200
Subject: [PATCH v12 04/10] dt-bindings: soc: qcom: cpr3: Add bindings for
 CPR3 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-topic-cpr3h-v12-4-1a4d050e1e67@linaro.org>
References: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
In-Reply-To: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687960842; l=10291;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XsgCikCmVAkzuppoOZcUQl3FsJV4tSEV5u46Y3qt2EA=;
 b=Vng0cZmmheRsYEyIeZN8j35/zxj1ihRaw9Smess8c+jlXUt3vLeTrIiH73Romg1/wA3LeHNWm
 +6LBCxrK9SJD7/ASryNKMqeoe5Q9icGFmgzJbcHofdAh3j/FdkTz6K3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add the bindings for the CPR3 driver to the documentation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
[Konrad: Make binding check pass; update AGdR's email]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,cpr3.yaml    | 289 +++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
new file mode 100644
index 000000000000..46b94dffaf85
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
@@ -0,0 +1,289 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,cpr3.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Core Power Reduction v3/v4/Hardened (CPR3, CPR4, CPRh)
+
+description:
+  CPR (Core Power Reduction) is a technology to reduce core power of a CPU
+  (or another device). Each OPP of a device corresponds to a "corner" that
+  has a range of valid voltages for a particular frequency.
+  The CPR monitors dynamic factors such as temperature, etc. and suggests
+  or (in the CPR-hardened case) applies voltage adjustments to save power
+  and meet silicon characteristic requirements for a given chip unit.
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: CPRv3 controller
+        items:
+          - const: qcom,cpr3
+      - description: CPRv4 controller
+        items:
+          - const: qcom,cpr4
+      - description: CPRv4-Hardened controller
+        items:
+          - enum:
+              - qcom,msm8998-cprh
+              - qcom,sdm630-cprh
+          - const: qcom,cprh
+
+  reg:
+    description: Base address and size of the CPR controller(s)
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: CPR reference clock
+
+  vdd-supply:
+    description: Autonomous Phase Control (APC) or other power supply
+
+  '#power-domain-cells':
+    const: 1
+
+  qcom,acc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to syscon for writing ACC settings
+
+  nvmem-cells:
+    description: Cells containing the fuse corners and revision data
+    maxItems: 32
+
+  nvmem-cell-names:
+    maxItems: 32
+
+  operating-points-v2: true
+
+  power-domains: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - operating-points-v2
+  - "#power-domain-cells"
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-cprh
+    then:
+      properties:
+        nvmem-cell-names:
+          items:
+            - const: cpr_speed_bin
+            - const: cpr_fuse_revision
+            - const: cpr0_quotient1
+            - const: cpr0_quotient2
+            - const: cpr0_quotient3
+            - const: cpr0_quotient4
+            - const: cpr0_quotient_offset2
+            - const: cpr0_quotient_offset3
+            - const: cpr0_quotient_offset4
+            - const: cpr0_init_voltage1
+            - const: cpr0_init_voltage2
+            - const: cpr0_init_voltage3
+            - const: cpr0_init_voltage4
+            - const: cpr0_ring_osc1
+            - const: cpr0_ring_osc2
+            - const: cpr0_ring_osc3
+            - const: cpr0_ring_osc4
+            - const: cpr1_quotient1
+            - const: cpr1_quotient2
+            - const: cpr1_quotient3
+            - const: cpr1_quotient4
+            - const: cpr1_quotient_offset2
+            - const: cpr1_quotient_offset3
+            - const: cpr1_quotient_offset4
+            - const: cpr1_init_voltage1
+            - const: cpr1_init_voltage2
+            - const: cpr1_init_voltage3
+            - const: cpr1_init_voltage4
+            - const: cpr1_ring_osc1
+            - const: cpr1_ring_osc2
+            - const: cpr1_ring_osc3
+            - const: cpr1_ring_osc4
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cpus {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "qcom,kryo280";
+            device_type = "cpu";
+            reg = <0x0 0x0>;
+            operating-points-v2 = <&cpu0_opp_table>;
+            power-domains = <&apc_cprh 0>;
+            power-domain-names = "cprh";
+        };
+
+        cpu@100 {
+            compatible = "qcom,kryo280";
+            device_type = "cpu";
+            reg = <0x0 0x100>;
+            operating-points-v2 = <&cpu4_opp_table>;
+            power-domains = <&apc_cprh 1>;
+            power-domain-names = "cprh";
+        };
+    };
+
+    cpu0_opp_table: opp-table-cpu0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1843200000 {
+            opp-hz = /bits/ 64 <1843200000>;
+            required-opps = <&cprh_opp3>;
+        };
+
+        opp-1094400000 {
+            opp-hz = /bits/ 64 <1094400000>;
+            required-opps = <&cprh_opp2>;
+        };
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&cprh_opp1>;
+        };
+    };
+
+    cpu4_opp_table: opp-table-cpu4 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-2208000000 {
+            opp-hz = /bits/ 64 <2208000000>;
+            required-opps = <&cprh_opp3>;
+        };
+
+        opp-1113600000 {
+            opp-hz = /bits/ 64 <1113600000>;
+            required-opps = <&cprh_opp2>;
+        };
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&cprh_opp1>;
+        };
+    };
+
+    cprh_opp_table: opp-table-cprh {
+        compatible = "operating-points-v2-qcom-level";
+
+        cprh_opp1: opp-1 {
+            opp-level = <1>;
+            qcom,opp-fuse-level = <1>;
+            qcom,opp-cloop-vadj = <0>;
+            qcom,opp-oloop-vadj = <0>;
+        };
+
+        cprh_opp2: opp-2 {
+            opp-level = <2>;
+            qcom,opp-fuse-level = <2>;
+            qcom,opp-cloop-vadj = <0>;
+            qcom,opp-oloop-vadj = <0>;
+        };
+
+        cprh_opp3: opp-3 {
+            opp-level = <3>;
+            qcom,opp-fuse-level = <2 3>;
+            qcom,opp-cloop-vadj = <0>;
+            qcom,opp-oloop-vadj = <0>;
+        };
+    };
+
+    apc_cprh: power-controller@179c8000 {
+        compatible = "qcom,msm8998-cprh", "qcom,cprh";
+        reg = <0x0179c8000 0x4000>, <0x0179c4000 0x4000>;
+        clocks = <&gcc GCC_HMSS_RBCPR_CLK>;
+
+        operating-points-v2 = <&cprh_opp_table>;
+        #power-domain-cells = <1>;
+
+        nvmem-cells = <&cpr_efuse_speedbin>,
+                      <&cpr_fuse_revision>,
+                      <&cpr_quot0_pwrcl>,
+                      <&cpr_quot1_pwrcl>,
+                      <&cpr_quot2_pwrcl>,
+                      <&cpr_quot3_pwrcl>,
+                      <&cpr_quot_offset1_pwrcl>,
+                      <&cpr_quot_offset2_pwrcl>,
+                      <&cpr_quot_offset3_pwrcl>,
+                      <&cpr_init_voltage0_pwrcl>,
+                      <&cpr_init_voltage1_pwrcl>,
+                      <&cpr_init_voltage2_pwrcl>,
+                      <&cpr_init_voltage3_pwrcl>,
+                      <&cpr_ro_sel0_pwrcl>,
+                      <&cpr_ro_sel1_pwrcl>,
+                      <&cpr_ro_sel2_pwrcl>,
+                      <&cpr_ro_sel3_pwrcl>,
+                      <&cpr_quot0_perfcl>,
+                      <&cpr_quot1_perfcl>,
+                      <&cpr_quot2_perfcl>,
+                      <&cpr_quot3_perfcl>,
+                      <&cpr_quot_offset1_perfcl>,
+                      <&cpr_quot_offset2_perfcl>,
+                      <&cpr_quot_offset3_perfcl>,
+                      <&cpr_init_voltage0_perfcl>,
+                      <&cpr_init_voltage1_perfcl>,
+                      <&cpr_init_voltage2_perfcl>,
+                      <&cpr_init_voltage3_perfcl>,
+                      <&cpr_ro_sel0_perfcl>,
+                      <&cpr_ro_sel1_perfcl>,
+                      <&cpr_ro_sel2_perfcl>,
+                      <&cpr_ro_sel3_perfcl>;
+        nvmem-cell-names = "cpr_speed_bin",
+                           "cpr_fuse_revision",
+                           "cpr0_quotient1",
+                           "cpr0_quotient2",
+                           "cpr0_quotient3",
+                           "cpr0_quotient4",
+                           "cpr0_quotient_offset2",
+                           "cpr0_quotient_offset3",
+                           "cpr0_quotient_offset4",
+                           "cpr0_init_voltage1",
+                           "cpr0_init_voltage2",
+                           "cpr0_init_voltage3",
+                           "cpr0_init_voltage4",
+                           "cpr0_ring_osc1",
+                           "cpr0_ring_osc2",
+                           "cpr0_ring_osc3",
+                           "cpr0_ring_osc4",
+                           "cpr1_quotient1",
+                           "cpr1_quotient2",
+                           "cpr1_quotient3",
+                           "cpr1_quotient4",
+                           "cpr1_quotient_offset2",
+                           "cpr1_quotient_offset3",
+                           "cpr1_quotient_offset4",
+                           "cpr1_init_voltage1",
+                           "cpr1_init_voltage2",
+                           "cpr1_init_voltage3",
+                           "cpr1_init_voltage4",
+                           "cpr1_ring_osc1",
+                           "cpr1_ring_osc2",
+                           "cpr1_ring_osc3",
+                           "cpr1_ring_osc4";
+    };
+...

-- 
2.41.0

