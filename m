Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE374BFB70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiBVPAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiBVPAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:20 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F83610DA78
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:50 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7ADF63FCA7
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541988;
        bh=9Z/gUO3emhqiJ98zvVrvKJB3hrfUgVCYAuQOA838jTk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Oe0U/l9MY72+vAzQWSqvHBW4WOAhDLLIw1sa0DeXjrYrBbzZMUQvrFdIxVOKggHXQ
         B+hxWVl0ROtT5msXmGMtSmYdf9BxzLBLTPLYmo/9nLj7fE9jXRCD8vFc7LTiQJih7+
         mN/0yLX2qH1iOT9cU0Fnk3KeDWrhvBVm5ck9iWB4VYzOFC69iz+axh5D/3S1pL88Xg
         Ns2EEIXswLqf5SYryfLqUsGSRsNbRL+V7YVIVDyBwP45LDHLt/zcoZlDxSJTJzGOUX
         1WVxlfKfcFi77MAhPjOP45PAdRLEMhuxkPmbErwoG7tI+QIHfpwXYYXgtWJPNIW+/J
         j6e3RPOWt8fdg==
Received: by mail-ed1-f71.google.com with SMTP id g5-20020a056402090500b0040f28e1da47so12132048edz.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Z/gUO3emhqiJ98zvVrvKJB3hrfUgVCYAuQOA838jTk=;
        b=6NGUGARdmk+Ihtx+RmsOp0hjGWM/rJP2uteuksSKWJaF8Hw1/aLn7v3rNQckPZFbH9
         y1YxF6Z8cMMrwF3NMAd9P4/Bi/sHHQWEsgxtnZCBrUUIX5a3zcFGm6Fm7uZaSYP7I+nk
         lLEmitWU5bzjmGbfXmn4iTtejUu17VYIFNv1sPACr6/KCkG3MZT1oy1JekZZaFYQnZz+
         TMp8rkczVpT9Dp/k1Nh9sVA8a6nJZ1a00UW3j41XS+NlqFSeIBaljM9yDgk9VjzzH6ej
         0FdIfJjqZDttJ9sS2XYl/qkzS7c7wG7cUF8zbI/kg7Jwps6De18dBONAbyRe7DcS8puI
         2OUQ==
X-Gm-Message-State: AOAM530qnbi0sCUT/lXG18YGAZB2oT9TiZ/vvtlrgiNm+w1tk5awf1MO
        Mb9Fk4Q+HEWRxVAzfLV+dQ77s7XuYWASMJQx5o7jG9cbcJa5HH0g2DhtdcwEWAWutdnpWXAX/Mq
        Suw1dGKqw8I+1Qu/Tdah518U/qsJCjjTJg6WEPiu5zAk=
X-Received: by 2002:a05:6402:142b:b0:413:2b86:7af2 with SMTP id c11-20020a056402142b00b004132b867af2mr1901148edx.102.1645541988118;
        Tue, 22 Feb 2022 06:59:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLoou8nQRCRNv0hciFigbFDL4utuXOvFr5Y0azz8QSvrtmGP0Fc4h2u6qFAcuNpGyebFoevw==
X-Received: by 2002:a05:6402:142b:b0:413:2b86:7af2 with SMTP id c11-20020a056402142b00b004132b867af2mr1901119edx.102.1645541987825;
        Tue, 22 Feb 2022 06:59:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/15] dt-bindings: ufs: qcom,ufs: convert to dtschema
Date:   Tue, 22 Feb 2022 15:58:44 +0100
Message-Id: <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
schema format.

Except the conversion, add also properties already present in DTS:
iommus, interconnects and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 2 files changed, 241 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
new file mode 100644
index 000000000000..356217124222
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Yaniv Gardi <ygardi@codeaurora.org>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,ufshc
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,msm8994-ufshc
+          - qcom,msm8996-ufshc
+          - qcom,msm8998-ufshc
+          - qcom,sdm845-ufshc
+          - qcom,sm8150-ufshc
+          - qcom,sm8250-ufshc
+          - qcom,sm8350-ufshc
+          - qcom,sm8450-ufshc
+      - const: qcom,ufshc
+      - const: jedec,ufs-2.0
+
+  clocks:
+    minItems: 8
+    maxItems: 11
+
+  clock-names:
+    minItems: 8
+    maxItems: 11
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ufs-ddr
+      - const: cpu-ufs
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: ufsphy
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  reset-names:
+    items:
+      - const: rst
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the RESET pin of the UFS memory device.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: ufs-common.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-ufshc
+              - qcom,sm8250-ufshc
+              - qcom,sm8350-ufshc
+              - qcom,sm8450-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: core_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+            - const: rx_lane1_sync_clk
+        reg:
+          minItems: 1
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-ufshc
+              - qcom,sm8150-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 9
+          maxItems: 9
+        clock-names:
+          items:
+            - const: core_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+            - const: rx_lane1_sync_clk
+            - const: ice_core_clk
+        reg:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 11
+          maxItems: 11
+        clock-names:
+          items:
+            - const: core_clk_src
+            - const: core_clk
+            - const: bus_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro_src
+            - const: core_clk_unipro
+            - const: core_clk_ice
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+        reg:
+          minItems: 1
+          maxItems: 1
+
+    # TODO: define clock bindings for qcom,msm8994-ufshc
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
+            reg = <0 0x01d84000 0 0x3000>;
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
+            clock-names = "core_clk",
+                          "bus_aggr_clk",
+                          "iface_clk",
+                          "core_clk_unipro",
+                          "ref_clk",
+                          "tx_lane0_sync_clk",
+                          "rx_lane0_sync_clk",
+                          "rx_lane1_sync_clk";
+            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_UFS_PHY_AHB_CLK>,
+                     <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+            freq-table = <75000000 300000000>,
+                         <0 0>,
+                         <0 0>,
+                         <75000000 300000000>,
+                         <75000000 300000000>,
+                         <0 0>,
+                         <0 0>,
+                         <0 0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
deleted file mode 100644
index d0fee78e6203..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-* Universal Flash Storage (UFS) Host Controller
-
-UFSHC nodes are defined to describe on-chip UFS host controllers.
-Each UFS controller instance should have its own node.
-
-Required properties:
-- compatible		: must contain "jedec,ufs-1.1" or "jedec,ufs-2.0"
-
-			  For Qualcomm SoCs must contain, as below, an
-			  SoC-specific compatible along with "qcom,ufshc" and
-			  the appropriate jedec string:
-			    "qcom,msm8994-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8450-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-- interrupts        : <interrupt mapping for UFS host controller IRQ>
-- reg               : <registers mapping>
-
-Optional properties:
-- phys                  : phandle to UFS PHY node
-- phy-names             : the string "ufsphy" when is found in a node, along
-                          with "phys" attribute, provides phandle to UFS PHY node
-- vdd-hba-supply        : phandle to UFS host controller supply regulator node
-- vcc-supply            : phandle to VCC supply regulator node
-- vccq-supply           : phandle to VCCQ supply regulator node
-- vccq2-supply          : phandle to VCCQ2 supply regulator node
-- vcc-supply-1p8        : For embedded UFS devices, valid VCC range is 1.7-1.95V
-                          or 2.7-3.6V. This boolean property when set, specifies
-			  to use low voltage range of 1.7-1.95V. Note for external
-			  UFS cards this property is invalid and valid VCC range is
-			  always 2.7-3.6V.
-- vcc-max-microamp      : specifies max. load that can be drawn from vcc supply
-- vccq-max-microamp     : specifies max. load that can be drawn from vccq supply
-- vccq2-max-microamp    : specifies max. load that can be drawn from vccq2 supply
-
-- clocks                : List of phandle and clock specifier pairs
-- clock-names           : List of clock input name strings sorted in the same
-                          order as the clocks property.
-			  "ref_clk" indicates reference clock frequency.
-			  UFS host supplies reference clock to UFS device and UFS device
-			  specification allows host to provide one of the 4 frequencies (19.2 MHz,
-			  26 MHz, 38.4 MHz, 52MHz) for reference clock. This "ref_clk" entry is
-			  parsed and used to update the reference clock setting in device.
-			  Defaults to 26 MHz(as per specification) if not specified by host.
-- freq-table-hz		: Array of <min max> operating frequencies stored in the same
-                          order as the clocks property. If this property is not
-			  defined or a value in the array is "0" then it is assumed
-			  that the frequency is set by the parent clock or a
-			  fixed rate clock source.
--lanes-per-direction	: number of lanes available per direction - either 1 or 2.
-			  Note that it is assume same number of lanes is used both
-			  directions at once. If not specified, default is 2 lanes per direction.
-- #reset-cells		: Must be <1> for Qualcomm UFS controllers that expose
-			  PHY reset from the UFS controller.
-- resets            : reset node register
-- reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
-- reset-gpios       : A phandle and gpio specifier denoting the GPIO connected
-		      to the RESET pin of the UFS memory device.
-
-Note: If above properties are not defined it can be assumed that the supply
-regulators or clocks are always on.
-
-Example:
-	ufshc@fc598000 {
-		compatible = "jedec,ufs-1.1";
-		reg = <0xfc598000 0x800>;
-		interrupts = <0 28 0>;
-
-		vdd-hba-supply = <&xxx_reg0>;
-		vcc-supply = <&xxx_reg1>;
-		vcc-supply-1p8;
-		vccq-supply = <&xxx_reg2>;
-		vccq2-supply = <&xxx_reg3>;
-		vcc-max-microamp = 500000;
-		vccq-max-microamp = 200000;
-		vccq2-max-microamp = 200000;
-
-		clocks = <&core 0>, <&ref 0>, <&phy 0>, <&iface 0>;
-		clock-names = "core_clk", "ref_clk", "phy_clk", "iface_clk";
-		freq-table-hz = <100000000 200000000>, <0 0>, <0 0>, <0 0>;
-		resets = <&reset 0 1>;
-		reset-names = "rst";
-		phys = <&ufsphy1>;
-		phy-names = "ufsphy";
-		#reset-cells = <1>;
-	};
-- 
2.32.0

