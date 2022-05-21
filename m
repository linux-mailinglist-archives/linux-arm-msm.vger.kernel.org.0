Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E5252FD8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355333AbiEUPIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353713AbiEUPIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:08:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0B593450
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:08:39 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id l13so12104790lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtwAokPU2B1Ue8VZ+Mhso521LTdtryIMRvjLLTgDQ7k=;
        b=RlLTuHzO2gTmE1gbkptXbHFtUPAtK4t1BM2+R8gdycRnAgzXtoOiAebc7rxiHFU9bN
         1vrWiUZh6FLPbtbWFO2M1n/u0HZqMvV0VVenj4JxgG36yzEgJ4j+Wmu9EQWaokqHQmt5
         nmaG2DQsVE2R2EKwK4octPVVbHG4uxEa2VlnpcnmDq5g+vvOsJnUtzgGr/78Huczvln2
         wtnfv+P2r6qzL9usdac9sf+DwR2AJGI9APL384z7r2ng5UEJndNiWcFwf6CAK0XDglLD
         UC6wZkQTITNmYaGeAY0ldqNhfYRamRn9CQj1Y3mBUj9zgwveWCFFRcHn8x3AYyhBJjK6
         BF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtwAokPU2B1Ue8VZ+Mhso521LTdtryIMRvjLLTgDQ7k=;
        b=7GtIEXzu/I/HrwmyUYxSN7RXaOaUSJIVZ+mvDydjPjc9xLWu0CPXaYaKZt/Xe9ryib
         153yuDGM/DaklWp6xRMUpJpFALpnFCaBECyzRSCZ3IS5HGxJHJ9ELKTpbSXZyvqKchmS
         9wxXrOER1PdP1F3HJ7PCwdStkpg+eI3biGHCWkfj//RfNBxNSdD4LC1Ne2Fz29J8+wBB
         Uavb2v61DRnpIOcT56UOXyrLIFH5QuTBIe21mqZzKbY6H7JIYLLeowKuNaWbTc7srBTJ
         zUHk4aLxMneKZt+qrpvFQsLrqWez8OqWlGUykPg4NP6/TnoRmo/MsDkAvnHkYFCTmtmZ
         8iVA==
X-Gm-Message-State: AOAM5339jzjlD5CuTB0tq5fG4h3Rmy9meNWi4NUP2zo5WwpfS1B3Xf6j
        dG1Rq0eKm5RAAzW1VKa+bMhO7A==
X-Google-Smtp-Source: ABdhPJxQ0cM7CyZksNaxeqRisfVWsfpHm6NfqH0j7jaFAXhta4K5PcpVK+WKhvCl6G75z7ddl216wQ==
X-Received: by 2002:ac2:4c54:0:b0:473:a414:1768 with SMTP id o20-20020ac24c54000000b00473a4141768mr10329423lfk.537.1653145717565;
        Sat, 21 May 2022 08:08:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id a4-20020ac25204000000b00477a1b603basm1087709lfl.98.2022.05.21.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:08:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: gcc-apq8084: merge to gcc-other.yaml
Date:   Sat, 21 May 2022 18:08:35 +0300
Message-Id: <20220521150835.1488683-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

There is no need to have separate bindings file for the
qcom,gcc-apq8084, merge it to qcom,gcc-other.yaml.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 42 -------------------
 .../bindings/clock/qcom,gcc-other.yaml        |  3 ++
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
deleted file mode 100644
index 397fb918e032..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
+++ /dev/null
@@ -1,42 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,gcc-apq8084.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Global Clock & Reset Controller Binding for APQ8084
-
-maintainers:
-  - Stephen Boyd <sboyd@kernel.org>
-  - Taniya Das <quic_tdas@quicinc.com>
-
-description: |
-  Qualcomm global clock control module which supports the clocks, resets and
-  power domains on APQ8084.
-
-  See also::
-  - dt-bindings/clock/qcom,gcc-apq8084.h
-  - dt-bindings/reset/qcom,gcc-apq8084.h
-
-allOf:
-  - $ref: qcom,gcc.yaml#
-
-properties:
-  compatible:
-    const: qcom,gcc-apq8084
-
-required:
-  - compatible
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    clock-controller@fc400000 {
-        compatible = "qcom,gcc-apq8084";
-        reg = <0xfc400000 0x4000>;
-        #clock-cells = <1>;
-        #reset-cells = <1>;
-        #power-domain-cells = <1>;
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c45e0f85494..142402f29d98 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -15,6 +15,8 @@ description: |
   power domains.
 
   See also:
+  - dt-bindings/clock/qcom,gcc-apq8084.h
+  - dt-bindings/reset/qcom,gcc-apq8084.h
   - dt-bindings/clock/qcom,gcc-ipq4019.h
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
@@ -36,6 +38,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,gcc-apq8084
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
-- 
2.35.1

