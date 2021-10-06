Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B5A424346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 18:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhJFQtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 12:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhJFQtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 12:49:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF5AC061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 09:47:19 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m22so10829700wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Su+mMhgdtQyUzMfFC/RU+YIiNnpBILw1YMYPYhSpL7k=;
        b=OhCP2qS3X4FkzAMQNjhZ3dozKq9ovyQR0HSWcIaV6c1L7aSf+dIv0SpM7q6mBQ7KmP
         nC2WBqD0u/nErPwz6eQwqx2ItLPYsua0puB1nJT/bRB8VUrn3ORA/dQtKlkjSOv6J6e6
         eYzhE+aBFURjEBM8YvJ4fbUX6HpPfxUfU8fhS+2Y6nj8ZCnS5LUtFT59cuMNpYONneNJ
         Eqe/pzluTs0x3RNa0Emtp6qO5TLfhyxHvc7PpMkvEyBbRqt8kqp33yQt8EsEYA58vB9Z
         6LqbY+2JMRouVSBSb0fctybWAw4AO3NEGpXM7wjBVVwyB7VOHda/KsQgsjQJmXXkFcvz
         RCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Su+mMhgdtQyUzMfFC/RU+YIiNnpBILw1YMYPYhSpL7k=;
        b=2s27Hcuw0AqpLxjOj6BcprDtGoN0uPPlD4xqhAwMBAbW/7+yshVq2DIA/O9cEmpWls
         q4Hek4a9bWk1A9xUBu1MPBPQpoMzxxL7ph40SkNKYsuxAdk6V841mEQ156EQhJ5uuLwL
         JEN3CSL86+Zh/FNBBd0xf9XJhnz0qwPGwl5VZWtvqe9CXZkhCNbsIEB91SSVq3NpjAyG
         SqWq29gh1IF3t+CjXfJEDbIkxPTd/twGbLviWSvGZdlHx209cJiWVetL5k2r/Cb+vl61
         gJ4hFevCAxZPwpf+3a5fqp6No4kEIQha07xNRdv80nLkeaZLPCMf4DtZ7RucsQ0/kodx
         VHuA==
X-Gm-Message-State: AOAM533aJXCY3Xjmzc9LssiW+JK5FDPci+Wg2XKS2tTw9OI3Y1niIXlb
        TTK0zgrT/bM5mtDFrHwSvxxE/A==
X-Google-Smtp-Source: ABdhPJxD0jCUad9aP9ROiOCECoHpgWPCimR41iu7jGDQVb38D/EVi7M/XwSY7FczQ5MNydkFehlgXA==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr11922632wrg.339.1633538837488;
        Wed, 06 Oct 2021 09:47:17 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id l21sm6785165wmg.18.2021.10.06.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:47:17 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters
Date:   Wed,  6 Oct 2021 17:47:09 +0100
Message-Id: <20211006164712.16078-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
References: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 has TX and RX macros with SoundWire Controllers to attach with
codecs like WCD938x. Add these nodes for sm8250 mtp audio use case.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8c15d9fed08f..356b530f067b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1839,6 +1839,101 @@
 			#sound-dai-cells = <1>;
 		};
 
+		rxmacro: rxmacro@3200000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&rx_swr_active>;
+			compatible = "qcom,sm8250-lpass-rx-macro";
+			reg = <0 0x3200000 0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&vamacro>;
+
+			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-frequency = <9600000>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire-controller@3210000 {
+			reg = <0 0x3210000 0 0x2000>;
+			compatible = "qcom,soundwire-v1.5.1";
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1F 0x1F 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0B 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0B 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xFF 0x03 0xFF 0xFF 0xFF>;
+			qcom,ports-hstop =		/bits/ 8 <0xFF 0x06 0xFF 0xFF 0xFF>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xFF 0xFF>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xFF 0x00 0x01 0xFF 0xFF>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: txmacro@3220000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&tx_swr_active>;
+			compatible = "qcom,sm8250-lpass-tx-macro";
+			reg = <0 0x3220000 0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+
+			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-frequency = <9600000>;
+			clock-output-names = "mclk";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#sound-dai-cells = <1>;
+		};
+
+		/* tx macro */
+		swr2: soundwire-controller@3230000 {
+			reg = <0 0x3230000 0 0x2000>;
+			compatible = "qcom,soundwire-v1.5.1";
+			interrupts-extended = <&intc GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core";
+
+			clocks = <&txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			qcom,din-ports = <5>;
+			qcom,dout-ports = <0>;
+			qcom,ports-sinterval-low =	/bits/ 8 <0xFF 0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0xFF 0x01 0x00 0x02 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xFF 0x00 0x00 0x00 0x00>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
+			qcom,ports-hstart =		/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
+			qcom,ports-hstop =		/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
+			qcom,ports-word-length =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
+			qcom,ports-lane-control =	/bits/ 8 <0xFF 0x00 0x01 0x00 0x01>;
+			qcom,port-offset = <1>;
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		aoncc: clock-controller@3380000 {
 			compatible = "qcom,sm8250-lpass-aoncc";
 			reg = <0 0x03380000 0 0x40000>;
@@ -1931,6 +2026,68 @@
 					input-enable;
 				};
 			};
+
+			rx_swr_active: rx_swr-active-pins {
+				clk {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			tx_swr_active: tx_swr-active-pins {
+				clk {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			tx_swr_sleep: tx_swr-sleep-pins {
+				clk {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					input-enable;
+					bias-pull-down;
+				};
+
+				data1 {
+					pins = "gpio1";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					input-enable;
+					bias-bus-hold;
+				};
+
+				data2 {
+					pins = "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					input-enable;
+					bias-pull-down;
+				};
+			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.21.0

