Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78EC64FF9FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 17:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbiDMPYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 11:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbiDMPYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 11:24:22 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4446522CD;
        Wed, 13 Apr 2022 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649863316; x=1681399316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1Cq27c9y9aIcI3AsQo3+huqwP1xiaPXyynvg3nDbUuA=;
  b=o0JUy1qu1iRXb6AyOh4Xsn/da7YDC+ONWEA/ondzbgevCQn75sxTmO9Z
   aC3lehgy348cckjMDiPafmJpdKGmEm3+RGuI8u3PESpPiJfEz9a0jMbjA
   paPBgzrqt/RA36ZwTq1B12Td1fXI7RGitVwW2PzDmlYc7PBpETlZWTFaG
   k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 13 Apr 2022 08:21:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:21:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 08:21:55 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 08:21:51 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        "Venkata Prasad Potturu" <quic_potturu@quicinc.com>
Subject: [PATCH v7 3/4] arm64: dts: qcom: sc7280: Add lpass cpu node
Date:   Wed, 13 Apr 2022 20:51:16 +0530
Message-ID: <1649863277-31615-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649863277-31615-1-git-send-email-quic_srivasam@quicinc.com>
References: <1649863277-31615-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add lpass cpu node for audio on sc7280 based platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 28 +++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 62 ++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 6004c08..cf62d06 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -273,6 +273,34 @@
 	modem-init;
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
+
+	dai-link@1 {
+		reg = <MI2S_SECONDARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@5 {
+		reg = <LPASS_DP_RX>;
+	};
+
+	dai-link@6 {
+		reg = <LPASS_CDC_DMA_RX0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_TX3>;
+	};
+
+	dai-link@25 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c0f127f..69cb78f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2102,6 +2103,67 @@
 			#sound-dai-cells = <1>;
 		};
 
+		lpass_cpu: audio@3987000 {
+			compatible = "qcom,sc7280-lpass-cpu";
+
+			reg = <0 0x03987000 0 0x68000>,
+			      <0 0x03b00000 0 0x29000>,
+			      <0 0x03260000 0 0xc000>,
+			      <0 0x03280000 0 0x29000>,
+			      <0 0x03340000 0 0x29000>,
+			      <0 0x0336c000 0 0x3000>;
+			reg-names = "lpass-hdmiif",
+				    "lpass-lpaif",
+				    "lpass-rxtx-cdc-dma-lpm",
+				    "lpass-rxtx-lpaif",
+				    "lpass-va-lpaif",
+				    "lpass-va-cdc-dma-lpm";
+
+			iommus = <&apps_smmu 0x1820 0>,
+				 <&apps_smmu 0x1821 0>,
+				 <&apps_smmu 0x1832 0>;
+
+			power-domains =	<&rpmhpd SC7280_LCX>;
+			power-domain-names = "lcx";
+			required-opps = <&rpmhpd_opp_nom>;
+
+			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
+				 <&lpass_audiocc LPASS_AUDIO_CC_EXT_MCLK0_CLK>,
+				 <&lpasscore LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
+				 <&lpasscore LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
+				 <&lpasscore LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
+				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
+				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
+				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
+				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
+				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
+			clock-names = "aon_cc_audio_hm_h",
+				      "audio_cc_ext_mclk0",
+				      "core_cc_sysnoc_mport_core",
+				      "core_cc_ext_if0_ibit",
+				      "core_cc_ext_if1_ibit",
+				      "audio_cc_codec_mem",
+				      "audio_cc_codec_mem0",
+				      "audio_cc_codec_mem1",
+				      "audio_cc_codec_mem2",
+				      "aon_cc_va_mem0";
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif",
+					  "lpass-irq-hdmi",
+					  "lpass-irq-vaif",
+					  "lpass-irq-rxtxif";
+
+			status = "disabled";
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			reg = <0 0x03c40000 0 0xf080>;
 			compatible = "qcom,sc7280-lpass-ag-noc";
-- 
2.7.4

