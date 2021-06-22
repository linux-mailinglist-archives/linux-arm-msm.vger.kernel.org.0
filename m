Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE703B070C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhFVONu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 10:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhFVONt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 10:13:49 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFBCC0617AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 07:11:30 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5D3C11FAB6;
        Tue, 22 Jun 2021 16:11:28 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com,
        jami.kettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        robh+dt@kernel.org, stephan@gerhold.net,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v7 5/5] dt-bindings: soc: qcom: spm: Document SDM660 and MSM8998 compatibles
Date:   Tue, 22 Jun 2021 16:11:17 +0200
Message-Id: <20210622141117.358893-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141117.358893-1-angelogioacchino.delregno@somainline.org>
References: <20210622141117.358893-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver was updated to add SAW2 v4.1 support for new SoCs: document
the new compatibles.
---
 .../bindings/soc/qcom/qcom,spm.yaml           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index 4aaa319b2932..0faf52700dec 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -17,6 +17,10 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sdm660-gold-saw2-v4.1-l2
+      - qcom,sdm660-silver-saw2-v4.1-l2
+      - qcom,msm8998-gold-saw2-v4.1-l2
+      - qcom,msm8998-silver-saw2-v4.1-l2
       - qcom,msm8974-saw2-v2.1-cpu
       - qcom,apq8084-saw2-v2.1-cpu
       - qcom,apq8064-saw2-v1.1-cpu
@@ -33,6 +37,8 @@ additionalProperties: false
 
 examples:
   - |
+
+    /* Example 1: SoC using SAW2 and kpss-acc-v2 CPUIdle */
     cpus {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -52,4 +58,19 @@ examples:
         reg = <0xf9089000 0x1000>;
     };
 
+  - |
+
+    /* Example 2: New-gen multi cluster SoC using SAW only for L2;
+     * This does not require any cpuidle driver, nor any cpu phandle.
+     */
+    power-controller@17812000 {
+        compatible = "qcom,msm8998-gold-saw2-v4.1-l2", "qcom,saw2";
+        reg = <0x17812000 0x1000>;
+    };
+
+    power-controller@17912000 {
+        compatible = "qcom,msm8998-silver-saw2-v4.1-l2", "qcom,saw2";
+        reg = <0x17912000 0x1000>;
+    };
+
 ...
-- 
2.32.0

