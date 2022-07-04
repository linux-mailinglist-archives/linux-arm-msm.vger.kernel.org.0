Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FA95654E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 14:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbiGDMS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 08:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiGDMR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 08:17:57 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476E11147C
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 05:17:37 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so10920380ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E72BT4aNpnFV2BZE9vt/gl4FI2kRt+wv25cQOsjsaiA=;
        b=vZATEleU1tK5+GnmaLfZLI1wHAQdCQGe8k3gJnFuIuvAzPLMwG8RNkqB3LdUbsthA1
         7TJd9035s8ygKYSnxxhtMo/3vFp4CUT963J6DQoXWuLNKN4MVVlVCT4coFGj6tmS9Bw4
         bA7CBcpfUnVkEW7mTX6nxzBkknzOpWQjuKu0ADIx/TXFqbkCcmiLG4hTdYLoC8V8heej
         xa3Fk/K1uRsp3sq8A7W9WE7/UMfMgbZ4VANgHSnXwuCxZfu/jNTHFZVoO7O2OQG87WzC
         +j6ZFUbRspbWdi+mdKRP7lV4TmHmP5qimCy2gmbSEVz9GvwolxL7BQEoavKvPLBS7jaI
         arWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E72BT4aNpnFV2BZE9vt/gl4FI2kRt+wv25cQOsjsaiA=;
        b=Sdso6rKS+ryvVXr3R2+PWdSmxzcx4LuslEdWeLQikohCgCPTgP2GlFFUp1LQV9KZpv
         3jeW6SQwcnYpnwNipeFBXhA8oLqPa3L1yqimqKDyNsGckuQ9L1MELE69yS8f6U267wRt
         m+Nw4Rla4l/G00Y+w+44fWYPg+jjQqfWRNP7JEOKcUoEDihKS8pBlRpwJCofhz0RvGbF
         +P+RnacslNaj8g9TLckI27sYr86SXnusBAXTnXS9UZuPHUpCsb0MOWhJHZy+0WCuxS4G
         aylDrhgiE7SIqIOCO4V4MkqSqBROwFcy+u4EQcUFEudTDZ9dNhs4wyAznJ5hWqxI0HWV
         /eWA==
X-Gm-Message-State: AJIora/IydooMXimm3mB1udjyxvxWuIbBwoDKpk7FcIcTMb+sySzYquO
        KmevyyIhkJ1cw1n9e5cmiYVolQ==
X-Google-Smtp-Source: AGRyM1scdc7HyyC6fMT6oxB3Pd+CtlaRtAXxDDLj1P8rRMOLP1fQE5nEGWSaq3GN9RQTqfFjiTp/yA==
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id u18-20020a2e9f12000000b0025bad8980e8mr15202053ljk.145.1656937055651;
        Mon, 04 Jul 2022 05:17:35 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u11-20020a05651220cb00b0047faa01edd9sm5102149lfr.229.2022.07.04.05.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 05:17:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/4] dt-bindings: interconnect: qcom,msm8998-cpu-bwmon: add BWMON device
Date:   Mon,  4 Jul 2022 14:17:27 +0200
Message-Id: <20220704121730.127925-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704121730.127925-1-krzysztof.kozlowski@linaro.org>
References: <20220704121730.127925-1-krzysztof.kozlowski@linaro.org>
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

Add bindings for the Qualcomm Bandwidth Monitor device providing
performance data on interconnects.  The bindings describe only BWMON CPU
(version 4), e.g. the instance which appeared for the first on Qualcomm
MSM8998 SoC and is also used on SDM845.  This BWMON device sits between
CPU and Last Level Cache Controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Georgi Djakov <djakov@kernel.org>
---
 .../interconnect/qcom,msm8998-bwmon.yaml      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
new file mode 100644
index 000000000000..c2e697f6e6cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Interconnect Bandwidth Monitor
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description: |
+  Bandwidth Monitor measures current throughput on buses between various NoC
+  fabrics and provides information when it crosses configured thresholds.
+
+  Certain SoCs might have more than one Bandwidth Monitors, for example on SDM845::
+   - Measuring the bandwidth between CPUs and Last Level Cache Controller -
+     called just BWMON,
+   - Measuring the bandwidth between Last Level Cache Controller and memory
+     (DDR) - called LLCC BWMON.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm845-bwmon
+          - const: qcom,msm8998-bwmon
+      - const: qcom,msm8998-bwmon       # BWMON v4
+
+  interconnects:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table: true
+
+  reg:
+    # BWMON v4 (currently described) and BWMON v5 use one register address
+    # space.  BWMON v2 uses two register spaces - not yet described.
+    maxItems: 1
+
+required:
+  - compatible
+  - interconnects
+  - interrupts
+  - operating-points-v2
+  - opp-table
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmu@1436400 {
+        compatible = "qcom,sdm845-bwmon", "qcom,msm8998-bwmon";
+        reg = <0x01436400 0x600>;
+        interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_LLCC 3>;
+
+        operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+        cpu_bwmon_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-0 {
+                opp-peak-kBps = <4800000>;
+            };
+            opp-1 {
+                opp-peak-kBps = <9216000>;
+            };
+            opp-2 {
+                opp-peak-kBps = <15052800>;
+            };
+            opp-3 {
+                opp-peak-kBps = <20889600>;
+            };
+            opp-4 {
+                opp-peak-kBps = <25497600>;
+            };
+        };
+    };
-- 
2.34.1

