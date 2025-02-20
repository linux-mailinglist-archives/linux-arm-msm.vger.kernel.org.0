Return-Path: <linux-arm-msm+bounces-48615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0747A3D39E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D06E0176213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AC01EE003;
	Thu, 20 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyMXikya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D51EBFE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041391; cv=none; b=VfLe2Me5coTZjWIFnDoe2ZBr3JMSl4a/5OvIgLUJUx+V7lef/JhLgUOO5hWOH1tbl1lkPpFrDAe5a87pfvty8J6EI0vlSpivnUG1ZnyZkGP/0eS/r6Jb5Q0qTFi8QEu+gUXXyv+YAHcfkyfmm+YFq+1yqbh1vhd5DxXPgqSu/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041391; c=relaxed/simple;
	bh=oIEpkFO3mHiOM749oMbThmV4zx+BHTgXoHKM9va4Rvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfKRRBJApbRBnJtDSkO8ni6OQLm3hA8806F+b6/TDXvASbcKMIEQ7Jn5sz4uFw+LrC2wuta3ETvXcYG/G/9gxij+nkHYcHjm3HrQ1mLIu8Wq5tdDQ4CIWM3SoOXGUKd89jVxjGrbCwNHRL7CbpWjb8Fu9B05E825OIDwAn/stP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyMXikya; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43935d1321aso1014295e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 00:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740041388; x=1740646188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgXSGmb40cnn/Wte+vvky3H9UloXdWL/W5NqJ8VO7Sg=;
        b=TyMXikyaggIceubM+qPMjOyv+y0QOAIjQbJMuk6xFaXYK8MUbGQnwCHSb94QO3QbIF
         TXC8Dyr07NwyoRy6xP4TADPo2BifTM9ZSR9KYWdsH/uU7RvmIWKoAU/OcX/LS7kdgHYP
         Okp/G5rMO501nKnHrh5rL9EJ+5j7RCGFJLQ8bC3N6u/x/4PG8gPwcrnX99s76u5AaiLV
         esvZsen+fzL7FRXvwUe/gexh9GTnDZ+ZVpDfd5kiyh1kBnQCdBlsxmaM37mLOg1Hqjti
         OjTRdkPxO2mfDOQO5QrokYJ/Pkn9RwNejVBt14/DZglN7YeDAkxzKOFVJYDseYGqxg+n
         PNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041388; x=1740646188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgXSGmb40cnn/Wte+vvky3H9UloXdWL/W5NqJ8VO7Sg=;
        b=NoC5fg8/axoYZB9chgu+jWJdTqovDcGlbnvk2f8pUNf3gR18n+WaaVETA6RY3Ahd9y
         BNkSuOIF1DSIf0dHNWpr+Abj5EjA0GZ+UJs8E5hb76zyLRt0yu43aom/uOhfAAmQr7Ff
         QLUko7G4Qy/mtC21l/ZIWg9rD0ONXVVlbPmAyFwXaZ/kyVSku1rj1RxVgq9ZY+oPuQeB
         PXPiFNIaNU/9/MKTJvFlAGTvi8soUp39RK45d40kivhJ2b6jMvuI5+4mfF7hwG/fje8G
         l0vOXe2ppvgq1kDwqX1YyufWV6XVS87gpmCRwABNxfA7QcOHAw+rrfP2GhW7g/8sXFyu
         nrPA==
X-Gm-Message-State: AOJu0YzeQcWlg8Krz/RBwIFmMjpY5sbKNUp8DlY01QNY0Z48Yet1TxMU
	40XSlFHYRyOMDPVOx6TZ4pIO15Xx6VTgzaKVjZIkNbnMAO9lMhtvdJc4mVXWtAE=
X-Gm-Gg: ASbGnctqAbGG60LaI2HLKFmkWfZk4UwupmMX4Y/lLYkBL+mGynAJnJVnbzF+d+fmk1p
	/Ppq9S8zBPOozJLU/v3XzKDRW1tObGPuN05z6n3rIdkk3M9Bk+NBHdtMUQcC7KspSb6eTOBeJGm
	d34vLTO7rR1hjALd9JBeQlhnVo7CuhEFScCcNM3fAL1+pT704UCWzHTtcN8igUMAcx5O0NTSfax
	+noXojyBwHEIEqoAquzLotFU9WAK7YkNdgIi4TjRN8hOBFWN5g1Eeh7+hAnavbYF+2wfWLoRWWk
	eEqpWOeVOnzZddIhSJbp6E2TVEhHVwlUD2cZbEnwQK7EYY5fu5f7lddZBRVNvrxc
X-Google-Smtp-Source: AGHT+IHPLi9TshjXaDQnLix+0zf6uiIbOoGCWhdONvF3GjDIg86AxGUYOt4CLf3NTGSeOandmVT8FA==
X-Received: by 2002:a05:600c:3b99:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-4399a5ad55dmr22657515e9.2.1740041387725;
        Thu, 20 Feb 2025 00:49:47 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm234417565e9.36.2025.02.20.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:49:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Feb 2025 09:49:41 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Add LPASS macro codecs
 and pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-sm8750-audio-v2-2-fbe243c4afc3@linaro.org>
References: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
In-Reply-To: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm SM8750
for proper sound support.  These are fully compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 683dd5529f02c8b446e704106294bd68d55d65dc..55668ee979a465aa0149ff9317d2cbc733e9c27b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2072,6 +2073,74 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_wsa2macro: codec@6aa0000 {
+			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06aa0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_rxmacro: codec@6ac0000 {
+			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0x0 0x06ac0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_txmacro: codec@6ae0000 {
+			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0x0 0x06ae0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,sm8750-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -2093,6 +2162,139 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,sm8750-lpass-lpi-pinctrl",
+				     "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
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
+					pins = "gpio1", "gpio2", "gpio14";
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
+			dmic23_default: dmic23-default-state {
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
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.43.0


