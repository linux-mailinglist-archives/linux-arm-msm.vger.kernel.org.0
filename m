Return-Path: <linux-arm-msm+bounces-3447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1F805365
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A42E1C20A87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C17959E25;
	Tue,  5 Dec 2023 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="NnBFjljv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5A4113;
	Tue,  5 Dec 2023 03:49:09 -0800 (PST)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 4372742C13;
	Tue,  5 Dec 2023 16:49:02 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1701776942; bh=2YlEH17x0fXPJQGFbxpn1F9mXGkbqkQe722jCjLtYlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NnBFjljv2PALU/9IV+T5k+t1o3Gelj+dZGkA1GXrN/OgGPjqzzNjwWdvDUO1CtjSr
	 KMikRWAhjrmYwAEuhaaAx1tkHbmdDpR0+506H06Pot3VeyP3QMX1yyyavF7J4UKWNX
	 7GSWWl/ih10U7VWTDEFeEqY+kjqmECPR4TCkFtzUTUrJ9rdOn2L67h+5rN5ZddepqW
	 SBCBMC8OJciCLSRT8XB3A4yFL5VV6VcXHJMfu1WJ9ny4/CZj0BsPQQsB5npgYGUiPA
	 FeYPKnvMhCzr7lcYCaCltUeeDPv1F0ae0NtYsgndkdKwyoebSkX5DhxY3DRpQDiehz
	 FZHpasiZqxynQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Tue, 05 Dec 2023 16:48:12 +0500
Subject: [PATCH v2 3/3] arm64: dts: qcom: acer-aspire1: Add sound
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-aspire1-sound-v2-3-443b7ac0a06f@trvn.ru>
References: <20231205-aspire1-sound-v2-0-443b7ac0a06f@trvn.ru>
In-Reply-To: <20231205-aspire1-sound-v2-0-443b7ac0a06f@trvn.ru>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=2YlEH17x0fXPJQGFbxpn1F9mXGkbqkQe722jCjLtYlw=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBlbw4sE8TzyTJM+HH5EZDQVLp9W5ULqH1EIdFep
 U/ZinB2YS2JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZW8OLAAKCRBDHOzuKBm/
 dWZfD/999H6Mw3B3dvjxDLvGJXyUFRz37yZeN4sd99k/gmbo6CC6tcWGynpw1CSsl86u79cthmF
 RwqR85vi1GvG5uT1vt6muskltUc16NOpr3Sr/BZw8OFE7KLIqgfmdL3bhPEZcsGVRFmCttqIrWs
 R1dhtqH6N151wThTyUUHEahoVSgNK/QbvXTw6WOqIuXW/VAigy2YtauMHvWljk6JuqZYibnTyDs
 mZIRw4nnGjLLLbT7rQoaKFgu16cGuZrGaEBJSTabYLOhC8zW/35xD44IfpKSkuS4dsZP7FajuGE
 EXw729E6+d6GEdvf/y3SRJd+KCIAwvp5MMd2X20uQ54YzrsxNBu6Wv/TPZNeBzqS6Bch5au0ed7
 3MfxOjfkb5nrNEyMZLX9CVXnJJWLlS3ND++tsdz9WWlrYVj9K5FYYZqAYlEnhz8e4SZEQl7Jvzp
 BE65HyzQvNuq3WPuok6XXLKUwkD2L9bw6d4OHi9q/80kvQiB8w9UZ8/x2MuxQEH0njqKqDOf2Y0
 rDdpeqlsa8WC3Dk83gFbxzk3RldWFsYTyTm9Od/KEL8L0dusD82XE2wmppV8nPuG9u6VxgrIVVj
 6U6GxuACCctZps8FMdNT9It1olK/0roP0bVSLpV64mVbDZ0BXzFt+Yspyzi/UdYprJEKG8AtdFi
 X8gEVXk/uW+3GBw==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

This laptop has two i2s speakers; an i2s audio codec for the headset
jack; two DMIC microphones in the lid and the displayport audio channel.

This commit adds the audio node that describes all of the above with the
exception of the DMICs that require in-SoC digital codec to be brought
up, which will be done later.

Note that the displayport channel is connected here for completeness,
but the displayport can't be used yet since the HPD signal is created by
the embedded controller, which will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 153 +++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 00b442696618..5afcb8212f49 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc7180.dtsi"
@@ -129,6 +130,113 @@ reg_lcm_3p3: panel-regulator {
 		pinctrl-names = "default";
 	};
 
+	sound: sound {
+		compatible = "qcom,sc7180-qdsp6-sndcard";
+		pinctrl-0 = <&pri_mi2s_active>, <&pri_mi2s_mclk_active>, <&ter_mi2s_active>;
+		pinctrl-names = "default";
+		model = "Acer-Aspire-1";
+
+		audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR";
+
+		multimedia1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		multimedia2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		multimedia3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		multimedia4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		primary-rx-dai-link {
+			link-name = "Primary MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&alc5682 0>;
+			};
+		};
+
+		primary-tx-dai-link {
+			link-name = "Primary MI2S Capture";
+
+			cpu {
+				sound-dai = <&q6afedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&alc5682 0>;
+			};
+		};
+
+		tertiary-rx-dai-link {
+			link-name = "Tertiary MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+		};
+
+		displayport-rx-dai-link {
+			link-name = "DisplayPort Playback";
+
+			cpu {
+				sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp>;
+			};
+		};
+	};
+
 	reg_tp_3p3: touchpad-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "tp_3p3";
@@ -368,6 +476,45 @@ &pm6150_rtc {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		qcom,sd-lines = <1>;
+	};
+
+	dai@17 {
+		reg = <PRIMARY_MI2S_TX>;
+		qcom,sd-lines = <0>;
+	};
+
+	dai@20 {
+		reg = <TERTIARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+
+	dai@104 {
+		reg = <DISPLAY_PORT_RX>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+
+	dai@3 {
+		reg = <3>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -376,6 +523,12 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	memory-region = <&adsp_mem>;
+	firmware-name = "qcom/sc7180/acer/aspire1/qcadsp7180.mbn";
+	status = "okay";
+};
+
 &remoteproc_mpss {
 	firmware-name = "qcom/sc7180/acer/aspire1/qcmpss7180_nm.mbn";
 	status = "okay";

-- 
2.43.0


