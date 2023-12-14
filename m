Return-Path: <linux-arm-msm+bounces-4768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D78130FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 921CDB2170E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E6541224;
	Thu, 14 Dec 2023 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6Dn4Nbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA09118
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:10:24 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so7563675a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559423; x=1703164223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkPjyOsSUhY6dxE7NSMeG9MG/tOgoWLSmdJD8Lb9JH4=;
        b=d6Dn4NbbLduEbBf3tZmaQN6gYTrh7UMdEIhoaZpzyvz8F8NwC/N/jXQU+YtoXT2/Ge
         rPWXORcQVq0CEeYVUzAuI9r4aie+nlhN7QMCAf/3Yc8gUd6C6Flf2SgGoFMP+radGWF4
         GbfPa+EW83brexc4wceg7r9fRRTpM19NdiCCB4NQX8BXC7dmU+n4+joejvmnyzwdS6RP
         JuCT5T+3F1lAUSmXWJhyAO+YsaS8rcSsfjnUSSghOemZsHfmjly+jlrwj+J+m8YuNGw8
         fIknQDpW9OKcVdfUS82wcKQFoQh9zhuwDi93tXMdlRM/U7WLgrKO9v8CPMFbDq93YQAl
         QrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559423; x=1703164223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkPjyOsSUhY6dxE7NSMeG9MG/tOgoWLSmdJD8Lb9JH4=;
        b=VCDxQFMLval5dzmyl1Mt5T3h/d0GKcXwuOjxIAXGwQDhAdq8W9owaEGVCQdQTPtI1Q
         IZoral9kXwyLm/OTmX3WIj9VhSxzcmFJErSPx2YWPweKrId3zD5q5xQj09QTP2/B9lH7
         d9yqO0xNV++H2E1lUOGrTpKzaA5x6tKrTISmtI6cNdlSb4e0dfTG8I0w0hS6PzqdqtF2
         WVNPARNt2DIdTf/U6o4MtYJukSAn0VwFyyShII5n8JBSQgHB0r+pZCOu4ynexP5NmRWI
         w2AY8+hvPRIUlsyz/4Nokb8Be21kq6YmKMbNz1Y89bWDSoeYZmVR5vso9NmW+5OYi+zK
         In3Q==
X-Gm-Message-State: AOJu0YwpOm6PIzBSJx0TgdoLowpwQ4GCPLFXqG/6xt2sa97KJvdJFCuX
	ceEwnIIj28ZiJ7iDqjTDJ0jC5A==
X-Google-Smtp-Source: AGHT+IEFHXXYgoqipM/5rt4EspAmID/okCklXrRpwYK6KijcoyztanaEmv4kfCE6cVXTxExfOcXj/w==
X-Received: by 2002:a17:906:498:b0:a1f:6c1c:2016 with SMTP id f24-20020a170906049800b00a1f6c1c2016mr5117549eja.89.1702559423091;
        Thu, 14 Dec 2023 05:10:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vq2-20020a170907a4c200b00a22faee6649sm2547776ejc.117.2023.12.14.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:10:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: x1e80100: add Soundwire controllers
Date: Thu, 14 Dec 2023 14:10:14 +0100
Message-Id: <20231214131016.30502-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214131016.30502-1-krzysztof.kozlowski@linaro.org>
References: <20231214131016.30502-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for LPASS Soundwire v2.0.0 controllers.  Difference against
SM8550:
1. Update port configs to match reference implementation,
2. LPASS TLMM GPIO14 is not used as WCD_SR_TX_DATA2 pin but as GPIO
   (camera).

Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 226 +++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 8bc6e544bbc9..262ff4700194 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2999,6 +2999,36 @@ lpass_wsa2macro: codec@6aa0000 {
 			sound-name-prefix = "WSA2";
 		};
 
+		swr3: soundwire@6ab0000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ab0000 0 0x10000>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_rxmacro: codec@6ac0000 {
 			compatible = "qcom,x1e80100-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
 			reg = <0 0x06ac0000 0 0x1000>;
@@ -3016,6 +3046,36 @@ lpass_rxmacro: codec@6ac0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr1: soundwire@6ad0000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ad0000 0 0x10000>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0x0f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_txmacro: codec@6ae0000 {
 			compatible = "qcom,x1e80100-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
 			reg = <0 0x06ae0000 0 0x1000>;
@@ -3051,6 +3111,68 @@ lpass_wsamacro: codec@6b00000 {
 			sound-name-prefix = "WSA";
 		};
 
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06b10000 0 0x10000>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		swr2: soundwire@6d30000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06d30000 0 0x10000>;
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <1>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x00 0x00 0x01 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_vamacro: codec@6d44000 {
 			compatible = "qcom,x1e80100-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0 0x06d44000 0 0x1000>;
@@ -3078,6 +3200,110 @@ lpass_tlmm: pinctrl@6e80000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic02_default: dmic02-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			wsa2_swr_active: wsa2-swr-active-state {
+				clk-pins {
+					pins = "gpio15";
+					function = "wsa2_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio16";
+					function = "wsa2_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		lpass_ag_noc: interconnect@7e40000 {
-- 
2.34.1


