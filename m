Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0776B655F57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 04:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiLZDLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 22:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbiLZDLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 22:11:07 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C553884
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 19:11:02 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x37so3500243ljq.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 19:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoziaF3+JG1vdH+ZGDVTm5fAOdEswU4poKDpL3BeKds=;
        b=KeVdeFAleANwajo1Cftf1wg1iX2zrzHvtlSR0xe3FcXZHgvLjJ4S8I0eg6SaXzBsnz
         8GOrE0iMfUHs6mp9MYKU+dfMgZVOm7+x2rYBA9Von/Ad2Fgl44Kf3tU2tAjuTS7mT2Oh
         MhDLm6kBiVV8AZaLpVHRTguGBQro61LLzwXvXTl7XlDFLm+lIhexRPUKRgx6AinndcjR
         KPuR7dMitmhKgDNDAHVO5b9Yk8/DnRa6RVR0T5hr+E8Uf1N5ha3nW+TSCi2XtdS8Cvil
         ldoKyRoVBE6RtUaimxuzhHk24vwQnXsLxNvq6/cSWmJTyd9Gn9xUXgnmbJ9Ct53PhFOs
         dP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoziaF3+JG1vdH+ZGDVTm5fAOdEswU4poKDpL3BeKds=;
        b=3ipBuUVyZC9/X64bIRTEsgRgnL2bOhbDB1I4LNT945UySGZqRH3XIjlP/oJF8QHUvS
         j7VLl8zL1EVo+VPRgw1Q3ybW7C9K2QwvLI9EWNXaLgZ4uF7CnKmUE7z27aK/AZa0WkSD
         XmOrImOUe9W9x4bI3zRp1DGbeOctnZw0R5S63GHjMO1vk8s48YulDlfTQvrxDDDvDx+Y
         /Ixbc+dr5/KElzI4lF0s4lgl42xnVP+kO5Y4oLxn78iL75G+jqlahj5DtqIqfR7aQhGX
         xA2Os6JPS2fuRBi+BEw7+5zZRIBmDNZU+ZRKI3zbLMuq3+0xrKK6qWXXrEZI6yT8FHCb
         0SuA==
X-Gm-Message-State: AFqh2koYjXAfXletiiEeuJVTZEXqATIocid+dnsOxYaH7BnMyIVIu7gL
        gGwPRWwReVrzn1HD333RyD/347eOaohp7ZO2HnMhSg==
X-Google-Smtp-Source: AMrXdXvnSiGapyHJLfrnI/KvG+XBOvgt4oh+HNf2lHZ1Wgmt+amf6CEPryuzzpYQCU+6XBBzvBALAw==
X-Received: by 2002:a2e:60a:0:b0:27f:b41f:602a with SMTP id 10-20020a2e060a000000b0027fb41f602amr3102372ljg.30.1672024261054;
        Sun, 25 Dec 2022 19:11:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020a2e860c000000b0027f770526ebsm1165388lji.75.2022.12.25.19.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 19:11:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,pcie2-phy: convert to YAML format
Date:   Mon, 26 Dec 2022 05:10:57 +0200
Message-Id: <20221226031059.2563165-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
References: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
from the text description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,pcie2-phy.yaml          | 87 +++++++++++++++++++
 .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
 2 files changed, 87 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
new file mode 100644
index 000000000000..672035199c19
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,pcie2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PCIe2 PHY controller
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
+  platforms.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcs404-pcie2-phy
+      - const: qcom,pcie2-phy
+
+  reg:
+    items:
+      - description: PHY register set
+
+  clocks:
+    items:
+      - description: a clock-specifier pair for the "pipe" clock
+
+  clock-output-names:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  "#phy-cells":
+    const: 0
+
+  vdda-vp-supply:
+    description: low voltage regulator
+
+  vdda-vph-supply:
+    description: high voltage regulator
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy
+      - const: pipe
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-output-names
+  - "#clock-cells"
+  - "#phy-cells"
+  - vdda-vp-supply
+  - vdda-vph-supply
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    phy@7786000 {
+      compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
+      reg = <0x07786000 0xb8>;
+
+      clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+      resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
+               <&gcc GCC_PCIE_0_PIPE_ARES>;
+      reset-names = "phy", "pipe";
+
+      vdda-vp-supply = <&vreg_l3_1p05>;
+      vdda-vph-supply = <&vreg_l5_1p8>;
+
+      clock-output-names = "pcie_0_pipe_clk";
+      #clock-cells = <0>;
+      #phy-cells = <0>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
deleted file mode 100644
index 30064253f290..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Qualcomm PCIe2 PHY controller
-=============================
-
-The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
-platforms.
-
-Required properties:
- - compatible: compatible list, should be:
-	       "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy"
-
- - reg: offset and length of the PHY register set.
- - #phy-cells: must be 0.
-
- - clocks: a clock-specifier pair for the "pipe" clock
-
- - vdda-vp-supply: phandle to low voltage regulator
- - vdda-vph-supply: phandle to high voltage regulator
-
- - resets: reset-specifier pairs for the "phy" and "pipe" resets
- - reset-names: list of resets, should contain:
-		"phy" and "pipe"
-
- - clock-output-names: name of the outgoing clock signal from the PHY PLL
- - #clock-cells: must be 0
-
-Example:
- phy@7786000 {
-	compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
-	reg = <0x07786000 0xb8>;
-
-	clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-	resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
-	         <&gcc GCC_PCIE_0_PIPE_ARES>;
-	reset-names = "phy", "pipe";
-
-	vdda-vp-supply = <&vreg_l3_1p05>;
-	vdda-vph-supply = <&vreg_l5_1p8>;
-
-	clock-output-names = "pcie_0_pipe_clk";
-	#clock-cells = <0>;
-	#phy-cells = <0>;
- };
-- 
2.35.1

