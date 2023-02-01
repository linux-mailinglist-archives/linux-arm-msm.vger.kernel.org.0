Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680B4686120
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 09:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjBAIDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 03:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjBAID3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 03:03:29 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04831BAE0
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 00:03:20 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id g9so12032026pfo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 00:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RtQMOuLPUu9y14QU5PWL+7La4FpScoZwnwss15ZtdRI=;
        b=Xepeu3O83s4uTvCuSV3OO+telBNV8kPanlT4gGCqWkY7eV5b1+zB2vcLHz/LSkovlj
         LBo5/1f5zHAzrsIvMJNWZEQYugTe3D300/zr5mP9CUYSrWHA5SRFmeAoMVUiNjLj7dg/
         8Ff51hnOlz1/faWYDGh/IxSxY7+FK4RWFl2CYzRUDhjlSXLK/1FT41WUqCqrDW9WDvL4
         xfcoi3uyxKw9RrpYGRcaMQW+958XCjgRGO0nXGr8rN4I/ejo76AU3sr8x3OpL67u2LZJ
         ENkp+ovUWpPQHqI+oA4eagesFJbYDOyWsNFfc4eOeAlpMu671FGGQv9pkEaV5IKmO38N
         v6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtQMOuLPUu9y14QU5PWL+7La4FpScoZwnwss15ZtdRI=;
        b=1j/bC6yRQYDlqIb7x1j9EIz9zfo6SRhiYEtWdn9NLI14qauG+/tD/khSNf95e4yhG7
         biNVm1X6GoNbyDDN7clbOQzy1ZazxrB72EUjYo9GnpahFZzWOerFqN78v9cZAAu/edya
         xU5Ks4sOmmq+NZIMRlM094J+/SyRghp/RuKdRlsruRRZybquTe7driw0l+ZQo4x8xjyM
         LqlZ33hut8xnGUgO98Mu8UPNeUxFOYXXVpATpOQfp46BSmf3WatghQVnLEbFfSUe6qsx
         vu+sySc27ylcezSsFThtNsL+MGdvmFuPh8CL2sUHBZCePIRg//X2cyoDOXTmuKr1r51h
         OVOw==
X-Gm-Message-State: AO0yUKVPQgqTUqeLhW5VsloFsBNnyTs4XHcs2fJyzINF3VEdMAW7uc4W
        KW9L1Ke+xqQaur2YZNePjVw75A==
X-Google-Smtp-Source: AK7set+OFG6fQlO2ibvtOffuh+zjSAy6ksInAd3moynI9d7JOfSmqP/FSK1GsxO/35VgsqsuVqBirg==
X-Received: by 2002:aa7:96e1:0:b0:593:d46b:ab73 with SMTP id i1-20020aa796e1000000b00593d46bab73mr1308055pfq.29.1675238599923;
        Wed, 01 Feb 2023 00:03:19 -0800 (PST)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id dc6-20020a056a0035c600b005897f5436c0sm10961814pfb.118.2023.02.01.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 00:03:19 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com
Cc:     bryan.odonoghue@linaro.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/2] dt-bindings: interconnect: Add Qualcomm CCI dt-bindings
Date:   Wed,  1 Feb 2023 16:02:26 +0800
Message-Id: <20230201080227.473547-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add devicetree binding of Qualcomm CCI on MSM8939.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/interconnect/qcom,cci.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,cci.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,cci.yaml b/Documentation/devicetree/bindings/interconnect/qcom,cci.yaml
new file mode 100644
index 000000000000..100c440ba220
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,cci.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Cache Coherent Interconnect (CCI) frequency and voltage scaling
+
+maintainers:
+  - Jun Nie <jun.nie@linaro.org>
+
+description: |
+  Qualcomm Cache Coherent Interconnect (CCI) is a hardware engine used by
+  MSM8939. The driver is to scale its frequency and adjust the voltage in
+  hardware accordingly. The voltage provider is modeled as power domain on
+  MSM8939, so power domain dts node is required.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8939-cci
+
+  clocks:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - clocks
+  - operating-points-v2
+  - nvmem-cells
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    cci: cci {
+        compatible = "qcom,msm8939-cci";
+	clocks = <&apcs2>;
+	operating-points-v2 = <&cci_opp_table>;
+	power-domains = <&cpr>;
+	nvmem-cells = <&cpr_efuse_speedbin_pvs>;
+    };
+
+    cci_opp_table: cci-opp-table {
+	compatible = "operating-points-v2";
+
+	cci_opp1: opp-200000000 {
+	       opp-hz = /bits/ 64 <200000000>;
+	       opp-supported-hw = <0x3f>;
+	       required-opps = <&cpr_opp3>;
+	};
+
+	cci_opp2: opp-297600000 {
+	       opp-hz = /bits/ 64 <297600000>;
+	       opp-supported-hw = <0x3f>;
+	       required-opps = <&cpr_opp12>;
+	};
+
+	cci_opp3: opp-400000000 {
+	       opp-hz = /bits/ 64 <400000000>;
+	       opp-supported-hw = <0x1>;
+	       required-opps = <&cpr_opp14>;
+	};
+
+	cci_opp4: opp-400000000 {
+	       opp-hz = /bits/ 64 <400000000>;
+	       opp-supported-hw = <0x3e>;
+	       required-opps = <&cpr_opp15>;
+	};
+
+	cci_opp5: opp-595200000 {
+	       opp-hz = /bits/ 64 <595200000>;
+	       opp-supported-hw = <0x3f>;
+	       required-opps = <&cpr_opp17>;
+	};
+    };
-- 
2.34.1

