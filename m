Return-Path: <linux-arm-msm+bounces-10657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B24851595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17E21F22D84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D583EA76;
	Mon, 12 Feb 2024 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tH9lQXWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC493EA78
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745033; cv=none; b=h+OGJnEU8g2SNbHtV+io/XWoOLwAuVMORaNJv2gwUc1S/KcqyAWX1eW34ngwTkRAyLGA/uC5XwW7T4ASwzuLVG3xrc4ZqPwHqs2MI26VZKwHtI6FzTxIaShI0FsQK2w6WliAw3xW9do/zvy5sehhJME+pWNGC6mlzX9E3OtjiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745033; c=relaxed/simple;
	bh=EabtM/lM7B9y8LnUGZv/H+KjH9qiCo4jt/n1JJW5V9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m3XIMB9HTSmh9U4LvBjnpzvWI7BMFGrhw0tc4+PKIA7csf6ZXIH7bkrwZizszqbt8E8rg4y3yPnAkqpbC1rs5/L22LcKItmxZTdd99yj6EDi8kZBDn/bCBPK+BKqNmQEhQpyldWGFdvRGDjofm5W13Mer8tr21/U5casBHub7+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tH9lQXWR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a389ea940f1so335708666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707745029; x=1708349829; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V79hha4/rxfxtxNToMm4h31PlM1pf1aXvBWpdTlosiY=;
        b=tH9lQXWRONOFb+YGAWa0BNW8g4o9yQBODjMPkhw7Ffp3wfo4/+zVnvRXjR489+JFki
         nd1FUzAKPVALWdkgaHMwWwKswu1uQckSUC1mG6oPQMD/gjNbzS357XeLwhg187c+WHwS
         btNSDm3XmJeJsr28Dbwjmv33Zggep0A0kcuGbpvoBM0QuHrt7+MGmMUCXai2sxtgPXYF
         DFlmZXscQMOkgtKpaD12+8xY7QX/YAf7Eu1qthFVO4M/8Ba1yULrsABYXZKsfv2RoEWH
         bhFLBVdpt9ucSzFRL4puIV+/cG/ozAyfvVr3uvtM5xV+Il9vo0bYgn26eWyQXiamdJDK
         uYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745029; x=1708349829;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V79hha4/rxfxtxNToMm4h31PlM1pf1aXvBWpdTlosiY=;
        b=rFXJn9ilWIETpprmIgcCDpdduIsQqr6hQTNHjIYVDwEt3WVuQ3tAddx5Y1YXU1P+wr
         PbbKtXIHUe97S7aMiDhvHGfIQhhh9IHA2ybuF6LDd7XX304ZZiuePN3SG2fjI5Z7sbvD
         cxPSoid8XeYV1kBjGuOJ36UyqEIHf9dC/GPDkUOERCfVww3Rtatll0foIbi8OY7KdyWj
         VCu6m8l8AiXJVvpmNmSAONqD3dIzamskBZkV/9R3akne3Alr3BNouG+JPq112lnO+xPp
         DSk6sjc7LM7CNuQQzABQ0iopVhqgifRtfAnOEMyQML8sVZ14UkdjUSnRmYkDhQGfrzzs
         sgtg==
X-Forwarded-Encrypted: i=1; AJvYcCXacjuCgwFuuVWSwx4+bo3curb6duufxCK0C59hwa+g7/xW/1Ogi5FRHL7HInY2EH+WNBJ0GCBSg8g2c96iOkV4D8sClehw07AekruIQg==
X-Gm-Message-State: AOJu0YwtdlY55a9E3DuAKiaE1omrSLf0xVP0Q0MReY6+UAqT60tP0cSI
	Te8lWiZFGpcGWyXiIYj2R7jU8gS6S4EQWzIseqre2N0ozFodJR9oK05GAGCUqw4VsZ0X6p0FuGy
	c
X-Google-Smtp-Source: AGHT+IGAjvUAMeKyidVeXVi18QPToU+9JBqAD02+uCdTuuvdTYN23BWqJj7iOjEX+0sErkOjQzRiJA==
X-Received: by 2002:a17:906:b259:b0:a3c:6052:2f53 with SMTP id ce25-20020a170906b25900b00a3c60522f53mr3043573ejb.37.1707745029624;
        Mon, 12 Feb 2024 05:37:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyzMnDGLin32E472hDHaMUv9aaM/W91vsxYNAH+H7s6LDyYgmU9ezmMG+JiA8Rwg6I9qrN4ad6birgjIV2atCWSlfBh8iMPUXvnEKiBCFF6WWkyRtMy4BjOasFGg+TIR6pK6iQS2YY3HweRvNVjscs/pI9TOfzINsOCQ/FgtWAMIKzu/Fz+7n20xznu3tLCr4WZhxyBtw4c62lXvmLCe/2TTJno/7fiSuJ0776d/QZnmsbJ1qJZ/9dSziAvCJ3BGjmuCDaIoxjGiJYXYrKhSDxGfBRFspEe04QeKHOjTc0PgGoyP7Yy0S492A=
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cu3-20020a170906ba8300b00a3cb30d6271sm217431ejd.143.2024.02.12.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:37:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:37:04 +0100
Subject: [PATCH] arm64: dts: qcom: sm6115p-j606f: Add some peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-j606f_periphs-v1-1-5dcacd483e28@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP8eymUC/x3N0QrCMAyF4VcZuTbQdrpNX0WGdG22RkZXGhVh7
 N0NXv4HPs4OQpVJ4NbsUOnDwlvWsKcGQvJ5IeSoDc64s3HW4WsrHPDZmW5+FLUlCQ59jMO1JWs
 uAVROXgin6nNIavN7XXUslWb+/q/u43H8ABFukWt6AAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707745028; l=4159;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EabtM/lM7B9y8LnUGZv/H+KjH9qiCo4jt/n1JJW5V9Y=;
 b=AxcNsfocdW3cjHaT9tRn3AFmT3pFhiw1Ozv0R4vN3BuzAIfh6DJ0Q5L1Sz5KlKapEDeccluT4
 mAq3zsYz48AAzZTxBGO96b85ue0ueFZhff2987JNOk1Ab/k9Z8Z9ayT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This tablet features quite a bunch of I2C-connected devices, such as
a Richtek RT1715 USB-C controller, a MM8013 fuel gauge, FSA4480 Type-C
audio mux, TPS65132 regulator and some more.

Add the aforementioned ones and document others.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi              |   7 ++
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 103 +++++++++++++++++++++-
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index ee65ab073ba6..7df7b2045b71 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1676,6 +1676,13 @@ usb_dwc3_ss: endpoint {
 							remote-endpoint = <&usb_qmpphy_usb_ss_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						usb_dwc3_sbu: endpoint {
+						};
+					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index 54da053a8042..eb65c2806345 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -73,6 +73,81 @@ zap-shader {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* Some devices use FUSB302(@22) instead of the RT1715. */
+
+	rt1715: typec-portc@4e {
+		compatible = "richtek,rt1715";
+		reg = <0x4e>;
+		interrupts-extended = <&tlmm 97 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&typec_int>;
+		pinctrl-names = "default";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+
+			/* TODO: Add a proper PD setup */
+			typec-power-opmode = "default";
+			try-power-role = "sink";
+			power-role = "dual";
+			pd-disable;
+
+			port {
+				rt1715_hs_ep: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+		};
+	};
+
+	fuel-gauge@55 {
+		compatible = "mitsumi,mm8013";
+		reg = <0x55>;
+	};
+
+	/* AW882xx speaker amp @ 34, 35, 36, 37 (CHIP_ID = 0x1852) */
+	/* HID-over-I2C for the touchpad on keyboard folio @ 60 */
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	tps65132@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+	};
+
+	fsa4480: typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+		interrupts-extended = <&tlmm 89 IRQ_TYPE_LEVEL_LOW>;
+		orientation-switch;
+		mode-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&usb_dwc3_sbu>;
+			};
+		};
+	};
+
+	/* PM8008 @ 8, 9 */
+	/* SMB1355 @ c */
+	/* SGM37604A WLED driver @ 36 */
+	/* ES7210 audio ADC @ 40 */
+	/* HID-over-I2C for the keyboard on keyboard folio @ 61 */
+};
+
 &mdss {
 	status = "okay";
 };
@@ -129,6 +204,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sm6115/LENOVO/J606F/adsp.mbn";
 	status = "okay";
@@ -309,6 +388,12 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&spi2 {
+	status = "okay";
+
+	/* HIMAX83102P or NT36523W touchscreen */
+};
+
 &tlmm {
 	gpio-reserved-ranges = <14 4>;
 
@@ -337,6 +422,14 @@ mdss_dsi_active: dsi-active-state {
 		drive-strength = <8>;
 		bias-disable;
 	};
+
+	typec_int: typec-int-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		input-enable;
+	};
 };
 
 &ufs_mem_hc {
@@ -360,12 +453,20 @@ &usb {
 
 &usb_dwc3 {
 	maximum-speed = "high-speed";
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 
 	phys = <&usb_hsphy>;
 	phy-names = "usb2-phy";
 };
 
+&usb_dwc3_hs {
+	remote-endpoint = <&rt1715_hs_ep>;
+};
+
+&usb_dwc3_sbu {
+	remote-endpoint = <&fsa4480_sbu_mux>;
+};
+
 &usb_hsphy {
 	vdd-supply = <&pm6125_l4>;
 	vdda-pll-supply = <&pm6125_l12>;

---
base-commit: ae00c445390b349e070a64dc62f08aa878db7248
change-id: 20240212-topic-j606f_periphs-87dd893e105c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


