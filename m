Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AA9666444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236061AbjAKUAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239497AbjAKUAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:00:11 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8991643A1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:57:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m6so25171641lfj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht3zSGSj2eFqzl5LX1pgp8D+J5K5Oiem2nBvVfvaaLM=;
        b=R02ddUuuE8GyNN6RR7c78iWWVUtiS7JIMVEcf7h6nCPPgKDws8JNnQrd57A5Q1JIFH
         zQevyUoIhr9bWjyaFFUg+mzaThKObrhZnXze+pgfcgJweiivbUwzszy45Pg7C+ldFboS
         O+XRxLcb7S2Ojh3Q6HtfMLgjHAL1f5NGkPOyjGDd4SP1Hhe7YwbpJyzCNHLUNiwCXNPX
         UZ/d1YnqpnuBEus/DZg6XxCnU0fq8eqkd7zt3Aox0sx7YGtwlYR/2dmV6vY0pPWHo79W
         GamzYeQ+RnCoJj6KYrprbiKRmybI3LS0uANgCxyozZeBR00FVaykpOmpcC5pzFH5EU91
         m1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht3zSGSj2eFqzl5LX1pgp8D+J5K5Oiem2nBvVfvaaLM=;
        b=cKnRngueZ4zkwLnqjVZiysXeIHVz5LbLvtmDe5l3QD3UNrzV0vUd0MdQH0BYf5cbPO
         MS58QQNDastm7Rxwivvmgl99F1Lrf3s2JQ8t6KKRef54VaWmRqae+HyfYqZz+ARD01Au
         o1C2YxPaHcGnJoAplrSjrAnJHBHdqo0s0AoePc1nWK/FFl9JLiNZp0zD3jKN1VxsjRz5
         dAb3YV66VReqYU9CiEV8Q5ZPHgYhzt6L+KyjM9VoLFClcuHBuOI8tt8L5OBKvjeRVgIo
         EW8f/VZ75FdrZ8WE97lsrRmZCvYBJS1nz7nQe/9HgoQc8GCiYzQb/A7N+sCpkh6Nu48l
         nouQ==
X-Gm-Message-State: AFqh2kqUBvDhQZWntBhdEG4VdEFJN+hZwlRU2Pi9y4gr8jH64tPNZgEF
        RQwIAethscWjuu2SSefWhw6ZlA==
X-Google-Smtp-Source: AMrXdXvosVgXGRsH5lXQ6JZGffvDwcuGo5qCLEUF1HFL6FDNHSi6pqZDdhxgTrk57dreIuECxo+l6g==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr20954698lfb.41.1673467076743;
        Wed, 11 Jan 2023 11:57:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock controller
Date:   Wed, 11 Jan 2023 22:57:50 +0300
Message-Id: <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
between two CPU clusters. The CBF clock should follow the CPU
frequencies to provide enough bandwidth between clusters. Thus a single
driver implements both a clock and an interconnect to set the clock
rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
new file mode 100644
index 000000000000..2080e1743b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-cbf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8996 Core Bus Fabric (CBF) clock controller
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: >
+  The clock controller for the Qualcomm MSM8996 CBF clock, which drives the
+  interconnect between two CPU clusters.
+
+properties:
+  compatible:
+    const: qcom,msm8996-cbf
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO source
+      - description: SYS APCS AUX clock
+
+  '#clock-cells':
+    const: 0
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@9a11000 {
+        compatible = "qcom,msm8996-cbf";
+        reg = <0x09a11000 0x10000>;
+        clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+        #clock-cells = <0>;
+        #interconnect-cells = <1>;
+    };
+...
-- 
2.30.2

