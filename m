Return-Path: <linux-arm-msm+bounces-67221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEFB16C88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2661AA664E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 07:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5274129E0FE;
	Thu, 31 Jul 2025 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/WPactR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201B29CB5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753946169; cv=none; b=RC85dGMJRNeg64QPEhiVSmQCgR4VWDRCKmRmXgNUaqbqtZKCxVz0gmS8NE1UEJ0l5182muTtVS57sR0WouvRVsb+4JB3SzAvGKj9h4kiH5oeBFh5Jd0cl7KBE4YFh3AYIbli2KFwIpehq/msW2K56APlqVC3MFJka8AQ7wFhsjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753946169; c=relaxed/simple;
	bh=DWATRGpmVCdRKiRd0lG2PXl5S27CBC84xbHnEBOCUJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T18noPvvxL0mwLMQuGjEzXqypxoqdXzZkUR4cvMxjZeKlusCfgNqdAUHAl0KrPObU8AStT+VVaxMY483RqcWTgIEZTxpOGmJFZmaIkDQmTAhvqJ+vkE5eIq0fnLQ/mNXaSC/zF6wVc1BMRm6ZV9Xx0F8uWRSfcLnEaDgFj8tcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/WPactR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-455f151fe61so726395e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753946165; x=1754550965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH/blYqmEVgyHVpevSf4yHqXXkIVq8klI3qVIPND2+w=;
        b=j/WPactRLb4BE6GffBPIT7qcELm8VeFmNt2LINgPaQXwf1tmExt21u0FV+X6+h+qmX
         Z4tMxPdwDtijbBJpnxfyz7WC69rdX0MrxPQqHVJpo5Zc6RBD570/YyURb2x+VMLyZwKm
         V4TQSkUl71Mw4N2OwK08SwVrSXKf7Sqy8ud1g6eBsPUkdYGe0MqjEov4uaOmYW5f8m5M
         RVZvRKXn/MpCf9rTv7I4yjxcw4b7OABK7sJ//D/oGEwR3WREq6SAexB2VVbqVrv4hWZw
         NFabRptVMgYUH72cMmFRLYlKYm/7lFfSxaEIhlaBOo9m3NAVuGyBODFhSFK6g1WJ0Ud8
         S1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946165; x=1754550965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH/blYqmEVgyHVpevSf4yHqXXkIVq8klI3qVIPND2+w=;
        b=HnWziF0fkR6ynIq/A9AYvoNgwv3+7uMKgdc/FSEvgZAgbQUnMFu2OUsJu4ybyXwomT
         v/QazFgkfGQ4vBvuN3e3nkj4leWNu9xEiDwh3aKXPstogg44Ag7a9C0VGUre9A2/P/Lb
         8Ayct8BuhQjHgJ2AnHm73AW0Ja1jSupKT5v3FUo+5FuKkAEi7WyzOv8MEHXHdhMco8sU
         6ZESmwD9IZf4BRIGMqYK96hnVOKwyvCDzU6Qs0yD6MsDfxfR1dW6jQB+zat+oJMoi7ny
         4zGDpeMmfu/uRrUaglNCJ+eMJlvg39T5FZyJjgyN3FsTtHrf5QQHhF7iuS5czANuXCU0
         A5ag==
X-Gm-Message-State: AOJu0Yzcs7wCV4rqAATK04tZtbYts+ueIJAEfJUwZvMravLR3UToKDXH
	Ys8FDTPwOXoyMYSpM5fbdQaBOQaXvvbq8eKGd9yRSI5utWqV4tHPK09hLXid/7mxsn0=
X-Gm-Gg: ASbGncvL7twXiJFJW4BVh2YrWdd4tv2sJiIxy/aKdK6mUji94uzaTZEk6DXmiIRh82D
	pkizNiJgPFuuLYoC8iC6nGSb/t0JfEDDtG59n7kWO4gyXn3/olluIsp2a9TmlpGI4fo1YSfHGWl
	HU36E2E6eqghYi58IDg5OfBICkIL5FYfNY14iLewZUe2JQwTyan01UpIfTDfaUqwfO/F3YB3oGT
	debTsT9vzx8J0k9BClyha0GSCmOy2MG0yDlrGsb4NO2G27y7GjUaRrGlecYq1Zp7QvC5cEFREqz
	JWSrB24W82hfLt+AChVeXfJgOMY3oJbwleXgCNpcyP3POyXf0OiSJgNsSFJ/0Nx1maEzHeVhcdQ
	G8VwgdhPKza9eQufikIW/TBtTUCoQ+TGzCqI5Nds=
X-Google-Smtp-Source: AGHT+IFLPqxILWm2ARius50epbZtelxoWQTY8esShSoLqo0Jl6xi8DHVVVPLLc3/Y9ZZUcG3AocAaw==
X-Received: by 2002:a05:600c:3b95:b0:451:df07:f41e with SMTP id 5b1f17b1804b1-45892d02123mr22028235e9.1.1753946164719;
        Thu, 31 Jul 2025 00:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm1353483f8f.61.2025.07.31.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 00:16:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 31 Jul 2025 09:15:53 +0200
Subject: [PATCH v2 2/3] dt-bindings: ufs: qcom: Split SC7180 and similar
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-bindings-ufs-qcom-v2-2-53bb634bf95a@linaro.org>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12129;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DWATRGpmVCdRKiRd0lG2PXl5S27CBC84xbHnEBOCUJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoixgu97oO+PBeE20WiIRjTvGkvJNTRNYOVNVRP
 YS60uP9gViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIsYLgAKCRDBN2bmhouD
 1zlKD/0e1yIMtTzmLbB5Xx5zoGTPaO6CjklFxKHU8NVPewem18TmxopSTVqsalXKrwMg5vKMij3
 2gqhsYF4LVYt3Fc8LBxpoaDXOO4j0cMiwLBCbqS5w6Lad7T3UdlkUQFQ8+Z/ixiWWEZ9+HEiPo3
 ThkD542oyLs/ZUMhAEwsYtztqYWWbaeTv+eGyOP9xHZBtmLy7p1DqEZi5wakws5HEmGMhsCxqiV
 OeQgXnz0Anw/8sygRu+b1zkhgmnoAbn21sG4ptfWV6o0tyIScpvcVN1EYvFAkvJTp5lRkGoUabH
 yNg1Dp2dOa1IaRhoUdY7YbmEZx7FUT5JAgQhHpXNSW5OIJGtq+jo8JJ2E7WZJPtI+3pAoBFS/O5
 xcIRUlmEY2OqKTvu2t/yeLxDOJFUQRQ9+auk00tgC1AVMXFRbqTMKDpBBpA055TPUfTuuIowxVf
 KrBkKABIfMLRBPjmaRt9XcKmMQxNE50wyxkWum0Oo2cyzE1GKgK+2U0Ijce4CGI4QP4uyONR8OW
 CFYW36n9WbRDkURBKr+BUmYMRMJd6RQUq8KicCAFBEehY4TRo4YEimT8Uh/g6xukbmy/UA9hDK2
 /9mtSvCD8n4VGboDdZUPfdpiorlNND119tj3X0c2yxjGuZEF5cdSOqaRizbRn3l9Oiq6WFSU7qg
 IqwLfl9yW136oAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The binding for Qualcomm SoC UFS controllers grew and it will grow
further.  Split SC7180 and several other devices which:
1. Do not reference ICE as IO address space, but as a phandle,
2. Have same order of clocks (SC7180 has one clock less than SC7280 and
   other variants in split binding).

The split allows easier review and maintenance of the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 167 +++++++++++++++++++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 104 +++++--------
 2 files changed, 202 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d94ef4e6b85a404c0a1f3c6cfcc10d3da857ce98
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7180 and Other SoCs UFS Controllers
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,msm8998-ufshc
+          - qcom,qcs8300-ufshc
+          - qcom,sa8775p-ufshc
+          - qcom,sc7180-ufshc
+          - qcom,sc7280-ufshc
+          - qcom,sc8180x-ufshc
+          - qcom,sc8280xp-ufshc
+          - qcom,sm8250-ufshc
+          - qcom,sm8350-ufshc
+          - qcom,sm8450-ufshc
+          - qcom,sm8550-ufshc
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,msm8998-ufshc
+          - qcom,qcs8300-ufshc
+          - qcom,sa8775p-ufshc
+          - qcom,sc7180-ufshc
+          - qcom,sc7280-ufshc
+          - qcom,sc8180x-ufshc
+          - qcom,sc8280xp-ufshc
+          - qcom,sm8250-ufshc
+          - qcom,sm8350-ufshc
+          - qcom,sm8450-ufshc
+          - qcom,sm8550-ufshc
+      - const: qcom,ufshc
+      - const: jedec,ufs-2.0
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: std
+
+  clocks:
+    minItems: 7
+    maxItems: 8
+
+  clock-names:
+    minItems: 7
+    items:
+      - const: core_clk
+      - const: bus_aggr_clk
+      - const: iface_clk
+      - const: core_clk_unipro
+      - const: ref_clk
+      - const: tx_lane0_sync_clk
+      - const: rx_lane0_sync_clk
+      - const: rx_lane1_sync_clk
+
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Inline Crypto Engine node
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: qcom,ufs-common.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-ufshc
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          maxItems: 7
+    else:
+      properties:
+        clocks:
+          minItems: 8
+        clock-names:
+          minItems: 8
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,sm8450.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufs@1d84000 {
+            compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
+                         "jedec,ufs-2.0";
+            reg = <0x0 0x01d84000 0x0 0x3000>;
+            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+            phys = <&ufs_mem_phy_lanes>;
+            phy-names = "ufsphy";
+            lanes-per-direction = <2>;
+            #reset-cells = <1>;
+            resets = <&gcc GCC_UFS_PHY_BCR>;
+            reset-names = "rst";
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+            vcc-supply = <&vreg_l7b_2p5>;
+            vcc-max-microamp = <1100000>;
+            vccq-supply = <&vreg_l9b_1p2>;
+            vccq-max-microamp = <1200000>;
+
+            power-domains = <&gcc UFS_PHY_GDSC>;
+            iommus = <&apps_smmu 0xe0 0x0>;
+            interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
+                            <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
+            interconnect-names = "ufs-ddr", "cpu-ufs";
+
+            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_UFS_PHY_AHB_CLK>,
+                     <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+            clock-names = "core_clk",
+                          "bus_aggr_clk",
+                          "iface_clk",
+                          "core_clk_unipro",
+                          "ref_clk",
+                          "tx_lane0_sync_clk",
+                          "rx_lane0_sync_clk",
+                          "rx_lane1_sync_clk";
+            freq-table-hz = <75000000 300000000>,
+                            <0 0>,
+                            <0 0>,
+                            <75000000 300000000>,
+                            <75000000 300000000>,
+                            <0 0>,
+                            <0 0>,
+                            <0 0>;
+            qcom,ice = <&ice>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index fc0f7b8d1cd1c4a2168f29cffcc0c2ff660424df..191b88120d139a47632e3dce3d3f3a37d7a55c72 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -15,7 +15,17 @@ select:
   properties:
     compatible:
       contains:
-        const: qcom,ufshc
+        enum:
+          - qcom,msm8994-ufshc
+          - qcom,msm8996-ufshc
+          - qcom,qcs615-ufshc
+          - qcom,sdm845-ufshc
+          - qcom,sm6115-ufshc
+          - qcom,sm6125-ufshc
+          - qcom,sm6350-ufshc
+          - qcom,sm8150-ufshc
+          - qcom,sm8650-ufshc
+          - qcom,sm8750-ufshc
   required:
     - compatible
 
@@ -25,23 +35,12 @@ properties:
       - enum:
           - qcom,msm8994-ufshc
           - qcom,msm8996-ufshc
-          - qcom,msm8998-ufshc
           - qcom,qcs615-ufshc
-          - qcom,qcs8300-ufshc
-          - qcom,sa8775p-ufshc
-          - qcom,sc7180-ufshc
-          - qcom,sc7280-ufshc
-          - qcom,sc8180x-ufshc
-          - qcom,sc8280xp-ufshc
           - qcom,sdm845-ufshc
           - qcom,sm6115-ufshc
           - qcom,sm6125-ufshc
           - qcom,sm6350-ufshc
           - qcom,sm8150-ufshc
-          - qcom,sm8250-ufshc
-          - qcom,sm8350-ufshc
-          - qcom,sm8450-ufshc
-          - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -72,41 +71,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc7180-ufshc
-    then:
-      properties:
-        clocks:
-          minItems: 7
-          maxItems: 7
-        clock-names:
-          items:
-            - const: core_clk
-            - const: bus_aggr_clk
-            - const: iface_clk
-            - const: core_clk_unipro
-            - const: ref_clk
-            - const: tx_lane0_sync_clk
-            - const: rx_lane0_sync_clk
-        reg:
-          maxItems: 1
-        reg-names:
-          maxItems: 1
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8998-ufshc
-              - qcom,qcs8300-ufshc
-              - qcom,sa8775p-ufshc
-              - qcom,sc7280-ufshc
-              - qcom,sc8180x-ufshc
-              - qcom,sc8280xp-ufshc
-              - qcom,sm8250-ufshc
-              - qcom,sm8350-ufshc
-              - qcom,sm8450-ufshc
-              - qcom,sm8550-ufshc
               - qcom,sm8650-ufshc
               - qcom,sm8750-ufshc
     then:
@@ -246,10 +210,10 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/interconnect/qcom,sm8450.h>
+    #include <dt-bindings/interconnect/qcom,sm8150.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     soc {
@@ -257,9 +221,12 @@ examples:
         #size-cells = <2>;
 
         ufs@1d84000 {
-            compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
+            compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
                          "jedec,ufs-2.0";
-            reg = <0 0x01d84000 0 0x3000>;
+            reg = <0x0 0x01d84000 0x0 0x2500>,
+                  <0x0 0x01d90000 0x0 0x8000>;
+            reg-names = "std", "ice";
+
             interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
             phys = <&ufs_mem_phy_lanes>;
             phy-names = "ufsphy";
@@ -275,19 +242,8 @@ examples:
             vccq-max-microamp = <1200000>;
 
             power-domains = <&gcc UFS_PHY_GDSC>;
-            iommus = <&apps_smmu 0xe0 0x0>;
-            interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
-                            <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
-            interconnect-names = "ufs-ddr", "cpu-ufs";
+            iommus = <&apps_smmu 0x300 0>;
 
-            clock-names = "core_clk",
-                          "bus_aggr_clk",
-                          "iface_clk",
-                          "core_clk_unipro",
-                          "ref_clk",
-                          "tx_lane0_sync_clk",
-                          "rx_lane0_sync_clk",
-                          "rx_lane1_sync_clk";
             clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -295,15 +251,25 @@ examples:
                      <&rpmhcc RPMH_CXO_CLK>,
                      <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
                      <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-            freq-table-hz = <75000000 300000000>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+                     <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+            clock-names = "core_clk",
+                          "bus_aggr_clk",
+                          "iface_clk",
+                          "core_clk_unipro",
+                          "ref_clk",
+                          "tx_lane0_sync_clk",
+                          "rx_lane0_sync_clk",
+                          "rx_lane1_sync_clk",
+                          "ice_core_clk";
+            freq-table-hz = <37500000 300000000>,
                             <0 0>,
                             <0 0>,
-                            <75000000 300000000>,
-                            <75000000 300000000>,
+                            <37500000 300000000>,
                             <0 0>,
                             <0 0>,
-                            <0 0>;
-            qcom,ice = <&ice>;
+                            <0 0>,
+                            <0 0>,
+                            <0 300000000>;
         };
     };

-- 
2.48.1


