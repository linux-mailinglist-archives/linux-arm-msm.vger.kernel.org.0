Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99B452EBF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 14:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349197AbiETMUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 08:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349229AbiETMTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 08:19:45 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D3E15FE1D;
        Fri, 20 May 2022 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653049181; x=1684585181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jeR7k2g1wPFPdRUEUlSOs2hV7rMEh2pJLrJiurnWVmk=;
  b=FybqNZP1de8AoGRemuaAxMK/xSiZgU56f4cbyzS98hlzHs5qpeOq3s2e
   GGSk0DvKb43izPlmVhLuPdx4mrgCDUyFYqdRUIx6zdJr+k2TcxTa1XE82
   WWysX2TtYKNBrBNi4nSun1eaW4qNGjdTUDAHXyUIbL38OKeMnrHNmOgZG
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 May 2022 05:19:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 05:19:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 20 May 2022 05:19:41 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 20 May 2022 05:19:36 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        "Venkata Prasad Potturu" <quic_potturu@quicinc.com>
Subject: [PATCH v12 08/12] arm64: dts: qcom: sc7280: Add lpass cpu node
Date:   Fri, 20 May 2022 17:48:40 +0530
Message-ID: <1653049124-24713-9-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653049124-24713-1-git-send-email-quic_srivasam@quicinc.com>
References: <1653049124-24713-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 1b4210d..213728f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2336,6 +2337,67 @@
 			#power-domain-cells = <1>;
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
 		lpass_hm: clock-controller@3c00000 {
 			compatible = "qcom,sc7280-lpasshm";
 			reg = <0 0x3c00000 0 0x28>;
-- 
2.7.4

