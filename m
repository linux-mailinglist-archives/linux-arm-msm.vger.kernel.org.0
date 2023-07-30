Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E91D7686FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 20:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjG3SGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 14:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjG3SGr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 14:06:47 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBF8197
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 11:06:44 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9c0391749so56864631fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690740403; x=1691345203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dzrbmHbEVhd5ag+tlBmbzOjQq1RvTPpa5KnBJgy21M=;
        b=JETdiJqhB4de8+xx+6JBvzyCjgAo5w0Og0MNcV/e5wryVkE2nX4GS0OkWpJ0fv2SdY
         3BzXPNSMdhkahqZ/G1BEksl6H+1INrSOTuOta4ofgzLuuF45IPGtWeu+jQA3pPMI5CYj
         WjrQTzFmejkKYzTpckfS51lK0pczc0C1MtTvpqdZjDTOP1d9GhZXiRTpT+c99c+QpUld
         cSZKD8j1+C0pNlTuaEpu+6vVn+iXcmDR89SdB3awOA+p/4iPAKEbHYCp8U0yC9Dl34z+
         CJagqDWNP1FXw9K3u9T537IgXV2phpYpu6wXYtd5pWM5k87R7i1ijiv9pyuSq+WLxIZd
         My1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740403; x=1691345203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dzrbmHbEVhd5ag+tlBmbzOjQq1RvTPpa5KnBJgy21M=;
        b=i11qYlnE8r6QXiztUiNZ9Zj7HjalKe2w8UeNEwOcvkoXVrna7MDvDr/TNrFR6QPJQX
         Z6xY5GW9adU4SXw+s60lLGISEvQ1FI1yAV2pCVkzgB+9yWg9V6nOdwAHrE8twUlh5QAm
         tybJTY8n+LbFGVtkK9ibN8RRpq0s7CqHBkdNjE2GpiUvRGSnIPK8OVni0sjwM/e7NzO8
         W281NSChGOQBYfwARSKnwN6rPsUzjebVOPY7U9kO8GTq6kkC77XSrVrRlPGGP0heYh+r
         4QHP4XBVOJMC6f3Co/oCM5gP+iFYeEjKqhWbF7BezKdItI8mTfJ8SAjcrUyD1XLV2jf+
         dN1Q==
X-Gm-Message-State: ABy/qLYHKir7jZFXCziJUTWDolv3HQClLUToMJZQZqxMOiqca8Wjt3kK
        RqD/s+b/6X6A01JSHkrQK2e4PyXqgYgw8jv/S6c=
X-Google-Smtp-Source: APBJJlFWiDDL7R5eSDaxTZxO5N4DJbZHJkR+smUMZT2m/1d/La7jXhCVnQ0DSzySrUdcWCuPKDpqRw==
X-Received: by 2002:a05:6512:2310:b0:4fe:c4e:709f with SMTP id o16-20020a056512231000b004fe0c4e709fmr4531121lfu.20.1690740403162;
        Sun, 30 Jul 2023 11:06:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d993000000b005222aee9ef9sm4295449eds.97.2023.07.30.11.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:06:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: use defines for interrupts
Date:   Sun, 30 Jul 2023 20:06:38 +0200
Message-Id: <20230730180638.23539-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Replace hard-coded interrupt parts (GIC, flags) with standard defines
for readability.  No changes in resulting DTBs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Replace defines in few more files (msm8976.dtsi, msm8994.dtsi,
   msm8996.dtsi, msm8998.dtsi, one more in sdm630.dtsi,
   sdm845-shift-axolotl.dts)
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi          | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8998.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi           | 18 +++++++++---------
 .../boot/dts/qcom/sdm845-shift-axolotl.dts     |  2 +-
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index af6d644a5d38..6e24f0f2374f 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1975,7 +1975,7 @@ wcnss_iris: iris {
 			};
 
 			smd-edge {
-				interrupts = <GIC_SPI 142 1>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
 				qcom,ipc = <&apcs1_mbox 8 17>;
 				qcom,smd-edge = <6>;
 				qcom,remote-pid = <4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index ab76806317a7..f9f5afbcc52b 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -439,7 +439,7 @@ apps_smsm: apps@0 {
 
 		hexagon_smsm: hexagon@1 {
 			reg = <1>;
-			interrupts = <0 290 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_EDGE_RISING>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 4324bd2bfe76..8295bf1b219d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -456,7 +456,7 @@ usb3: usb@f92f8800 {
 			usb@f9200000 {
 				compatible = "snps,dwc3";
 				reg = <0xf9200000 0xcc00>;
-				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				maximum-speed = "high-speed";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 70a58e7e0a75..a8d63eef6e6d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -589,7 +589,7 @@ smp2p-adsp {
 		compatible = "qcom,smp2p";
 		qcom,smem = <443>, <429>;
 
-		interrupts = <0 158 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
 
 		mboxes = <&apcs_glb 10>;
 
@@ -1264,7 +1264,7 @@ gpu: gpu@b00000 {
 			reg = <0x00b00000 0x3f000>;
 			reg-names = "kgsl_3d0_reg_memory";
 
-			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&mmcc GPU_GX_GFX3D_CLK>,
 				<&mmcc GPU_AHB_CLK>,
@@ -3047,7 +3047,7 @@ usb3: usb@6af8800 {
 			usb3_dwc3: usb@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
-				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
@@ -3405,7 +3405,7 @@ usb2: usb@76f8800 {
 			usb2_dwc3: usb@7600000 {
 				compatible = "snps,dwc3";
 				reg = <0x07600000 0xcc00>;
-				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy2>;
 				phy-names = "usb2-phy";
 				maximum-speed = "high-speed";
@@ -3419,7 +3419,7 @@ slimbam: dma-controller@9184000 {
 			qcom,controlled-remotely;
 			reg = <0x09184000 0x32000>;
 			num-channels = <31>;
-			interrupts = <0 164 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <1>;
 			qcom,num-ees = <2>;
@@ -3428,7 +3428,7 @@ slimbam: dma-controller@9184000 {
 		slim_msm: slim-ngd@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2c000>;
-			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&slimbam 3>, <&slimbam 4>;
 			dma-names = "rx", "tx";
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d0af22fa63f2..5b0e700b5a65 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1484,7 +1484,7 @@ adreno_gpu: gpu@5000000 {
 				"rbcpr",
 				"core";
 
-			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&rpmpd MSM8998_VDDMX>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 25124acf705f..3981dd49b655 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1034,7 +1034,7 @@ adreno_gpu: gpu@5000000 {
 			reg = <0x05000000 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";
 
-			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
 				<&gpucc GPUCC_RBBMTIMER_CLK>,
@@ -2290,50 +2290,50 @@ timer@17920000 {
 
 			frame@17921000 {
 				frame-number = <0>;
-				interrupts = <0 8 0x4>,
-						<0 7 0x4>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17921000 0x1000>,
 					<0x17922000 0x1000>;
 			};
 
 			frame@17923000 {
 				frame-number = <1>;
-				interrupts = <0 9 0x4>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17923000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@17924000 {
 				frame-number = <2>;
-				interrupts = <0 10 0x4>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17924000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@17925000 {
 				frame-number = <3>;
-				interrupts = <0 11 0x4>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17925000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@17926000 {
 				frame-number = <4>;
-				interrupts = <0 12 0x4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17926000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@17927000 {
 				frame-number = <5>;
-				interrupts = <0 13 0x4>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17927000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@17928000 {
 				frame-number = <6>;
-				interrupts = <0 14 0x4>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17928000 0x1000>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index dce0141f3719..fbb8655653fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -440,7 +440,7 @@ touchscreen@38 {
 		reg = <0x38>;
 		wakeup-source;
 		interrupt-parent = <&tlmm>;
-		interrupts = <125 0x2>;
+		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
 		vdd-supply = <&vreg_l28a_3p0>;
 		vcc-i2c-supply = <&vreg_l14a_1p88>;
 
-- 
2.34.1

