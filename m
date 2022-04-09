Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B0A4FA9B5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 18:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242768AbiDIQsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 12:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242759AbiDIQsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 12:48:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F24B1DD3FC
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 09:46:02 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z1so17161178wrg.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3DHNTPVag9ET45Lzerrw8DiaFCn90jHaL+dVhOW+2Q=;
        b=bWShnnzgTU6y5lnE620OcKKIQRhKd0KrPezHWaXBnZYi5ICF0ectEpwJ/nnMZNZDcJ
         cGjYWtQYHWcsZz61J4uJ88N/3abCgPj3qDRf2H2tsb+6UOvBIjO7mMf3mf7P5M6wG7JK
         naL6E5wGkeC1X+xeMy8wigneAF/gjRmq8zcrBnqGWVLvwjLV+xL7dRd4pxFh+FaQe6Do
         pxgrnbpBWYlTekhA8z+/TlHODpZIbF/X7s6Do+2P2p0Ddguf2/R9mqH6Cr9XkHInKTCU
         MM7OWgXJG/QxYTnOfKycjYgrxnRHXIRZhLDhROO/RaFRi1uJA8Ypi0yNwGA/JZ3BI/lF
         PQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3DHNTPVag9ET45Lzerrw8DiaFCn90jHaL+dVhOW+2Q=;
        b=df2nl3ES40zWm2c5TlhsEWUFzFzk1YoP6RzUJSzUF1qqrULjgez9iFnO3KLT2QLCk1
         t4U6D8UuTmkKPBmSKh0x7/NKEcAQ+lsQrrC0Y2euLEePdy3YOZE/r3bBMW6L6TPMiLOk
         TSGxPIhYI7vP1Q7DEa/k3YMrTvb0CgaVoS0uMxoszAnyYCujfLlpNCjZzoLzyak5okTP
         ta5K8p9vXJjcQgzZE+f5SOS70ewMpjTzmSTo9uNZRSB8+n49sKPtWqQXjFMzfo3SIinP
         6u3n61gys68qOHun4Blxl2inXkgUF8JlQeeWV/UBLw8sanLPzRGHuunHgVX901cGj56V
         xobQ==
X-Gm-Message-State: AOAM531jqZXeW+AeFfijdqbjhFm/7ZCBFHiivbzqAlFkj1yjCCtplsT5
        p10LtyQ/8d05zCe8KJrM5cHLtQ==
X-Google-Smtp-Source: ABdhPJxutyI3PHyQ+V+O7XTA6fJOfWxotOITmF/aOsgOMrf9oJF/XWzRNZdRoEihUvXp/EIDhSK32g==
X-Received: by 2002:adf:fe43:0:b0:207:a2af:dfa6 with SMTP id m3-20020adffe43000000b00207a2afdfa6mr615501wrs.208.1649522760597;
        Sat, 09 Apr 2022 09:46:00 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j3-20020adfd203000000b0020616cddfd5sm13901357wrh.7.2022.04.09.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:46:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 2/4] arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
Date:   Sat,  9 Apr 2022 17:45:54 +0100
Message-Id: <20220409164556.2832782-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a CAMSS definition block.

Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 153 +++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 906bc8ed25b7..3d6c617de045 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3150,6 +3150,159 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: camss@ac6a000 {
+			compatible = "qcom,sm8250-camss";
+			status = "disabled";
+
+			reg = <0 0xac6a000 0 0x2000>,
+			      <0 0xac6c000 0 0x2000>,
+			      <0 0xac6e000 0 0x1000>,
+			      <0 0xac70000 0 0x1000>,
+			      <0 0xac72000 0 0x1000>,
+			      <0 0xac74000 0 0x1000>,
+			      <0 0xacb4000 0 0xd000>,
+			      <0 0xacc3000 0 0xd000>,
+			      <0 0xacd9000 0 0x2200>,
+			      <0 0xacdb200 0 0x2200>;
+			reg-names = "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid3",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IFE_1_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_AREG_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "cam_ahb_clk",
+				      "cam_hf_axi",
+				      "cam_sf_axi",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "slow_ahb_src",
+				      "vfe0_ahb",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe0_areg",
+				      "vfe1_ahb",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe1_areg",
+				      "vfe_lite_ahb",
+				      "vfe_lite_axi",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			iommus = <&apps_smmu 0x800 0x400>,
+				 <&apps_smmu 0x801 0x400>,
+				 <&apps_smmu 0x840 0x400>,
+				 <&apps_smmu 0x841 0x400>,
+				 <&apps_smmu 0xC00 0x400>,
+				 <&apps_smmu 0xC01 0x400>,
+				 <&apps_smmu 0xC40 0x400>,
+				 <&apps_smmu 0xC41 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_CAMERA_CFG>,
+					<&mmss_noc MASTER_CAMNOC_HF &mc_virt SLAVE_EBI_CH0>,
+					<&mmss_noc MASTER_CAMNOC_SF &mc_virt SLAVE_EBI_CH0>,
+					<&mmss_noc MASTER_CAMNOC_ICP &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm8250-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.35.1

