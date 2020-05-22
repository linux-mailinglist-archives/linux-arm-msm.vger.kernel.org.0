Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480EF1DE5CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 13:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgEVLp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 07:45:56 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15206 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728413AbgEVLpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 07:45:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590147948; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ioG91ONt67Thh3+++IhEIy7PrY5ruyU1b97zWmsYRzM=; b=B4SB5rjbnIpmJ9llxlRH5aRFe2cZj5NQ7EO/r8sD1YDrG7RJTwaoD7jGzcg0dltM6GwPvnmi
 +wiVNEeUSXP2MZPDET3Gqqyb5vw1BJZhZ2t38UgHGeZJ7jtRAh3mniUhBgLPthjIPnUQwFLU
 4w2acbAJxIU7gAMKr5yea6YTIhI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ec7bb56569a62550db49ba5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 11:45:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E15D4C433C6; Fri, 22 May 2020 11:45:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 301F1C433CA;
        Fri, 22 May 2020 11:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 301F1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=manafm@codeaurora.org
From:   Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Subject: [PATCH v3 2/2] dt-bindings: thermal: tsens: Add cold interrupt support in yaml
Date:   Fri, 22 May 2020 17:14:52 +0530
Message-Id: <20200522114452.28647-3-manafm@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522114452.28647-1-manafm@codeaurora.org>
References: <20200522114452.28647-1-manafm@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add cold interrupt support for tsens in yaml.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
---
 .../bindings/thermal/qcom-tsens.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 2ddd39d96766..3592322fe172 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -52,12 +52,14 @@ properties:
     items:
       - description: Combined interrupt if upper or lower threshold crossed
       - description: Interrupt if critical threshold crossed
+      - description: Interrupt if cold threshold is crossed
 
   interrupt-names:
     minItems: 1
     items:
       - const: uplow
       - const: critical
+      - const: cold
 
   nvmem-cells:
     minItems: 1
@@ -109,8 +111,10 @@ allOf:
       properties:
         interrupts:
           minItems: 2
+          maxItems: 3
         interrupt-names:
           minItems: 2
+          maxItems: 3
 
 required:
   - compatible
@@ -174,4 +178,42 @@ examples:
            #qcom,sensors = <13>;
            #thermal-sensor-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    // Example 4 (for any platform containing v2.6+ of the TSENS IP)
+    //           (with thermal-zone):
+    tsens4: thermal-sensor@c265000 {
+           compatible = "qcom,sc7180-tsens", "qcom,tsens-v2";
+           reg = <0xc265000 0x1ff>,
+                 <0xc223000 0x1ff>;
+
+           interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+           interrupt-names = "uplow", "critical", "cold";
+
+           #qcom,sensors = <15>;
+           #thermal-sensor-cells = <1>;
+    };
+
+    thermal-zones {
+            cold_thermal: cold-thermal {
+                    polling-delay-passive = <0>;
+                    polling-delay = <0>;
+
+                    thermal-sensors = <&tsens4 128>;
+
+                    trips {
+                            cold-trip {
+                                    temperature = <1>;
+                                    hysteresis = <1>;
+                                    type = "passive";
+                            };
+                    };
+
+                    cooling-maps {
+                    };
+            };
+    };
 ...
-- 
2.26.2

