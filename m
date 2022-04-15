Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D791C502DF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 18:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244570AbiDOQtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 12:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343604AbiDOQtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 12:49:31 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0BEDD966
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:47:02 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l3-20020a05600c1d0300b0038ff89c938bso1686410wms.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pNESSxAcN//8vHkk1bdnAMiTL2HqgY/iVR1wHvU0PB8=;
        b=ow4/v/R67/Fkvr649sEHGPDbopEl1yuNOiDECvMTzNhQnLXUhkoFHZBEtd+/LqlDNl
         DPAUebWTlNLK0mJ7Aa/r3wiBcaRs2U0G1M7r+162X9slxXvX1Qgo2OI5QB6gxGfD8Ljx
         fRoAOeuJ2iiu9r/GKKagfZ1myV3WfbJS9t9bRssC9rSofLhSIVftmo9anprI+r95kxuA
         Jemq6KoY/h8VmpTn3dchyHzdrqjNRxnux0EytRc2boPOfCIVVc6sSrb0A2l6vln/Brd+
         9nA7Vx+hmbTnRCwOXsRXz9NKoLCijqRusDW8Lq2b7JWpWFzXloJ3ORFJ5H2POVxxfjAy
         xuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pNESSxAcN//8vHkk1bdnAMiTL2HqgY/iVR1wHvU0PB8=;
        b=OTzHbPPnf54iJZmMh+q3scmw9nkRWLpRV7Jnsj5Dg1sFxb40RrMqWGMSyBGhjAasf2
         L9bDHM0wYBqHXJ67GtfAhgUv0At1d5VuoaHShBSiQZuyzZb1G4umemRF8pokNT+hrmAL
         GE96Os6bZRMPff/l0j2oqo07xPnpILDWfay2o1SRds+ZothJw+28aFu4G0H4ejpWRqo0
         U+7PbGg0YZs1uxrnHmVUihUiugxL8t8iDVhaSbz1947fXSFUM5Y5Lp+zSmO4DxPbu64i
         owDHI+gWenlDt9jsMOy5g+qMbBMfGyHEFZkVi4L7SfXY4OcMEUsF7HUgn2UZu+a6klbw
         seGw==
X-Gm-Message-State: AOAM532ugqZvzbfdKL1URyGkpi7mYc8bWMDZVcELkvgYfor5P7Or/Ciz
        f3RKXwQNzV0jVEEDo7cd2z4kjw==
X-Google-Smtp-Source: ABdhPJwtsURUMkLYvME4y0FUYE/3Qoy+YvGtV9HMgyOhaimebRrdO4uzDpfGW/JzyQGrO0FNgcwdQQ==
X-Received: by 2002:a1c:3584:0:b0:38e:b8ba:181e with SMTP id c126-20020a1c3584000000b0038eb8ba181emr4023092wma.181.1650041220868;
        Fri, 15 Apr 2022 09:47:00 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0038cb8b38f9fsm9180041wmq.21.2022.04.15.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 09:47:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     vladimir.zapolskiy@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
Date:   Fri, 15 Apr 2022 17:46:54 +0100
Message-Id: <20220415164655.1679628-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
References: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
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

Adds a CAMSS definition block.

Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 153 +++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 401e17f849f3..2ec9adeb2e66 100644
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
+				 <&apps_smmu 0xc00 0x400>,
+				 <&apps_smmu 0xc01 0x400>,
+				 <&apps_smmu 0xc40 0x400>,
+				 <&apps_smmu 0xc41 0x400>;
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

