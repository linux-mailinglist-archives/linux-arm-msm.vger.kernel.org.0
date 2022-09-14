Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04BE5B827C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiINH4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiINHzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:55:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF49E2638
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:08 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f24so14325808plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9mP9HJdXVQAxtsXYpKC+mSQmcqbaHq7yO4Fo8xLEceU=;
        b=wUYIypOhGADGriBI+bgSRel8LMXbpdGqu9/K77qWEwH64/UwapHSINwuixauatFQVk
         WMK2f7wAtaMNTmJ6LW0Z5QDYcOXpzm6SKnovPAZPUrrc+ylHK66rhmKzWDfaarZJ9rNz
         CuvtrZiYbgO3iDlkxqXAYuZGZV6d3iFjhOKokE6zrBj6Qx1S4QFOkCuBtLrQnhVjJM0S
         uU97M8xv7YoznAK8Kl+axyREUlhNamsPYT4vyAVDK1vV2TgimGoGlsXWqRG8tX4G8eYC
         YXG2hyhuDPRQbsjSG0W9FaHs4f3D07Puk0UgAJ/NEDqdRYMVToYuDCXqSjqQr8pzgwAM
         RKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9mP9HJdXVQAxtsXYpKC+mSQmcqbaHq7yO4Fo8xLEceU=;
        b=njJiylvi/+8qMsmwoxGPoparajPmKES9WAcLsRsVjv1H3gYfYKnfMAoZULz+Vk1uM4
         o326TRFc0ulrfCWuVh7h4asXOp7h33/RGQPK6SqsGr+sbk7z//J1n+c1vFViPhNoGKBa
         F1Fij93W27MUFWePAhZaZmneVWt2rzSCPwRRsxedABrJryO5XDdp4mk6zh5ZLEArkEpY
         eV9ZcJjB2J/q0BNs20gojry/0DVO/4MYwVoqphb+6CxhoqH7OcvOdudk6vcWIKzA+TR7
         TPRzSDtq4wnJvL88Opb5x69ttdyiByMTiTsXPz4hN7G0/LXtK413r5Jxv2rA+AOrAXpi
         jRwg==
X-Gm-Message-State: ACrzQf2PyhU3t1bue8oL/nl+cQ7ni3OyQdkdpuAgTwTyTQug0UL9Feqo
        5TChh+7yEomn/065EN5d7dfK
X-Google-Smtp-Source: AMsMyM40w4UYyHvFh7evE7z1F+eiJYVMfWYqChW7KmQX97jRbMwd47LDyQUEe+xCqqea0RKZyIe2Mw==
X-Received: by 2002:a17:90b:306:b0:202:b9a4:b0aa with SMTP id ay6-20020a17090b030600b00202b9a4b0aamr3467801pjb.78.1663142108381;
        Wed, 14 Sep 2022 00:55:08 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:55:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 11/12] dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC
Date:   Wed, 14 Sep 2022 13:23:49 +0530
Message-Id: <20220914075350.7992-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
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

Add devicetree bindings support for SM8450 SoC. Only the clocks are
different on this platform, rest is same as SDX55.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bb8e982e69be..977c976ea799 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sdx55-pcie-ep
+    enum:
+      - qcom,sdx55-pcie-ep
+      - qcom,sm8450-pcie-ep
 
   reg:
     items:
@@ -32,10 +34,12 @@ properties:
       - const: mmio
 
   clocks:
-    maxItems: 7
+    minItems: 7
+    maxItems: 8
 
   clock-names:
-    maxItems: 7
+    minItems: 7
+    maxItems: 8
 
   qcom,perst-regs:
     description: Reference to a syscon representing TCSR followed by the two
@@ -124,6 +128,35 @@ allOf:
             - const: sleep
             - const: ref
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8450-pcie-ep
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PCIe Auxiliary clock
+            - description: PCIe CFG AHB clock
+            - description: PCIe Master AXI clock
+            - description: PCIe Slave AXI clock
+            - description: PCIe Slave Q2A AXI clock
+            - description: PCIe Reference clock
+            - description: PCIe DDRSS SF TBU clock
+            - description: PCIe AGGRE NOC AXI clock
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg
+            - const: bus_master
+            - const: bus_slave
+            - const: slave_q2a
+            - const: ref
+            - const: ddrss_sf_tbu
+            - const: aggre_noc_axi
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

