Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280E95A9065
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 09:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbiIAHff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 03:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbiIAHfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 03:35:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08F0DFC2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 00:35:12 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn9so16964267ljb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NRv1MPSnJ6fbS5CRV69fk+nV0uPunEr6DOm4zVpHg7g=;
        b=RWox0HfD5FTb9ZdbRn+9qLHmNC2sSi2am9D6QhIy722T1FI2kfHuVCwDjsex0jXfnU
         3vUYrAB1xWEYkFpzWN+0kCwY7RTyrpT89DfIonIZ7T+H8hVmxdyWISSSBoThJ1QPEoGI
         CLhOelFyplFRqeI9o7Qib6uk/CQAPljVcaw4T3hX5wPOe45JJ83EFBc+CNJNORuA6SSB
         ET4E87dde8xE4mI9Qv/K9p2XVIbM5trx7YhJTCf/wDV531KTauNx/GGcUS6aCzYvtp71
         F7+z78K7WcdpfVSPUUfzG+GK4r0RFDJx48Q6yKIyWuF20Qp6ZSjp9nnpSBbyNiDog5uq
         7vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=NRv1MPSnJ6fbS5CRV69fk+nV0uPunEr6DOm4zVpHg7g=;
        b=VwdUNn6DFhHkeqsLCl9Jr6fRTACwaIkcLvsbvROe1AJ96jdCUm5wP08gi7fs1j0l9A
         ozfCPmapr6tEdYE0lwcZ6kNjJGT6fnCNQQFb1Z453ghNaYbH+7cX9Savq5SOsrMi5NuX
         C4vpSH49fY7nOglu1vyiSVVAK7wuwh3wf3g2jT/tifXN6ZWwCH8i6Ig6WYTJFoGaAgag
         M6LJwfh7/JsheXdEZ0IPVZ0sWgRC+Z+qeiZ5Lc6wRpIMyPFpiclrIB6I4rcedyLojogw
         1rbZ3HTvhHZLlz+6B8c6PzRL9hsGVDHzTEMs6dUgc+oCDhwH6n1txZovJoRewE0QxAeI
         mX2g==
X-Gm-Message-State: ACgBeo0bqGPUq1ZnH3dBY3yug7Mv9qioppgf10jU+01j1vMYJ0N0Y2RQ
        t70iJctEENmUauLvaJKykAzRhg==
X-Google-Smtp-Source: AA6agR5huUDAi+q1PzZQ2AkzAATLcYsocrwx2S4h81Ku53jzzHCOggETsBF7EUnU86PaDDPaCh4cPg==
X-Received: by 2002:a05:651c:1989:b0:268:a377:ba49 with SMTP id bx9-20020a05651c198900b00268a377ba49mr1182606ljb.443.1662017709106;
        Thu, 01 Sep 2022 00:35:09 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb55c000000b0025e2c5a12b6sm1545253ljn.129.2022.09.01.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:35:08 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8450: Add description of camera control interfaces
Date:   Thu,  1 Sep 2022 10:35:04 +0300
Message-Id: <20220901073504.3077363-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Add description of two CCI controllers found on QCOM SM8450.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 142 +++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 4978c5ba5dd0..ce634504e08b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2302,6 +2302,84 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,sm8450-cci";
+			reg = <0 0xac15000 0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,sm8450-cci";
+			reg = <0 0xac16000 0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci2_default &cci3_default>;
+			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8450-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -2379,6 +2457,70 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				/* SDA, SCL */
+				pins = "gpio110", "gpio111";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio110", "gpio111";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				/* SDA, SCL */
+				pins = "gpio112", "gpio113";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio112", "gpio113";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_default: cci2-default-state {
+				/* SDA, SCL */
+				pins = "gpio114", "gpio115";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_sleep: cci2-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio114", "gpio115";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_default: cci3-default-state {
+				/* SDA, SCL */
+				pins = "gpio208", "gpio209";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci3_sleep: cci3-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio208", "gpio209";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			pcie0_default_state: pcie0-default-state {
 				perst {
 					pins = "gpio94";
-- 
2.33.0

