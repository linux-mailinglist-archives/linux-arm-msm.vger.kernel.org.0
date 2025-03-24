Return-Path: <linux-arm-msm+bounces-52296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 456DDA6D673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FEE73AA22D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F025D90D;
	Mon, 24 Mar 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1wV6CbPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491A25D558
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805671; cv=none; b=bDvhRBGn4eOvHVb0gYj4hLdpKZtW7X5ttEcYlPwWSK3ZdHlJptd4sRYlheWdQWX1DKSZpfIretyiAq9dRtKoLrcILzWfMSUTMVfiaky5+KfHmbaRV0wbpGzyg2KhAjaAEdgyfrvx1imddIaIWzc+ILCrlBx1Zd4y6TxKTVahEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805671; c=relaxed/simple;
	bh=KSWp37/3xJv10o3EDk7YnEOgu8qfEW3FThXTG0B1Ke4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2JSfPXRhkLK/4vuh4qnNOq80SR4FvMlCUdyvEbzfcUaLCzRve2CjpoH45FB9UbTfOe22nTbyrWC5zpn/gY4pdcimNxKHKnFCkHCHUMimSUpTUMxQXrc4YHGM3okOIhOjQ88Ps3oeivDg606rDsj0lQhxnK8GK4ZQoAzfNEMqf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1wV6CbPp; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so7560779a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805667; x=1743410467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTf80IeubbyZy4FsO7Ri7gHGg5cGJf6Y2Ngd+8a5bds=;
        b=1wV6CbPpSMk/6GcB8kJksyMwvckr6vI1RUuZLAhypK4Z8T2VepL0Ah7NQR8DZnggrT
         533SbMKy/8Olbg2lFYJOiTpEhMKThVwHvYWbPJ0/8O3RWBvc1w1XyiYbA65UUKj8Bjfa
         xIySeKGjs6LxwAXy688F78QwUqYyranSpsD1J1i/wksRHczUbrU2/HcRbGF99e/0lfB5
         bNDSWMECt0yJnFqR/ImBSQHCMKZhS8hI43m4knv9fpdiicUUpQZU9UKSbXymzIQ0dJRi
         hoXrqo18GN+u8qqVVjIQ8njwvIGgZ7R6wy/eYBy9JRUydAu76oqxF9DZrTcml9I3dzQu
         2yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805667; x=1743410467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTf80IeubbyZy4FsO7Ri7gHGg5cGJf6Y2Ngd+8a5bds=;
        b=Am9vySrdZCXw7cxs1xd68LkB5EZM8R3F60UF0Dv/KdryUS+mLweM1Uj0REyFI4ijZ9
         y/IXKWWdlHwt2RLWlN/qKpnvik/Uhd0GparypHb5unoGbN3rmzezMuUak9mVmQUKVUc0
         2hZmN7JIKEFfjHs3AQEe6tP9000S0uByqxi8okzTD1ZQ4sKcpg7PgOKGNfgnWQ6js1wB
         uem2AKg4Lipnl049Pey0C7qVJ9m4Y1oykKAM9c6BkzdrRRw/gVYNCqhrHAtSdjAkDCWy
         pshY6aGXyaVze+xcpm2mSLjcFlt4wSbifEgztRLD1aB9KYxjj5axVD858mO/5jY9eFz7
         mj5w==
X-Forwarded-Encrypted: i=1; AJvYcCUlx8N++ndXA+73Ble0kBffbLG1DjPNIi5WO2YBGdouc2qyuWB4yKm5IObhbCtaeTyfWeRzcf5xooEQKt8M@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYqt2k1vHLpKOHp0u1VuErUT4rf+HN5Vn2FbosXyM4ULdipsd
	Faf4YCwAWAnoC2ut644lkSMgHMPhKp6XC6Zv9OT0ZUvk4S3xZ+9y0Mwu8kJI0EU=
X-Gm-Gg: ASbGncuThHH9FtJQI53h2qkGcgwg544eEG4r1U1wkApAxXDnGeQZzxLj7CQFxNbzMgV
	SPIR9z2Pc42L4BsnkQy58TVd1wJO6/S+MX+J/50PHC0v9AytYvAuOKyGY9/NyCqTXBKtJB7yCIK
	Uo2ybyv7ylUzBlisV6YoK2v+vUmQ4fh0jqyLHOsxFs4Fxnetxn+HLmh3PiZuDT+41A16iYmQYcT
	LGpF9nl8s01xI0o4TZ7sfzrmFme1C6fZ9cOXNa/GZl7FZ6iC7eyRnH8qra7lelp5fjdyUvhX7tT
	tShby1P7ueqkn9EUZgZtoIG42FEhFnBqLKX1fg3c3Yzlaw6P0DSwc1sqcZGpiP0G+eXxv62AcYI
	2gah3wyfUA99utDp69A==
X-Google-Smtp-Source: AGHT+IFI+ZH2iXneGqqmdv18ffHQieyQpfjvA4aVjvSf6dTYNSsZRs7FMsBV7igF7uZjzeOrJuMDfA==
X-Received: by 2002:a05:6402:500e:b0:5ec:92c3:58c5 with SMTP id 4fb4d7f45d1cf-5ec92c35a94mr3833830a12.29.1742805666879;
        Mon, 24 Mar 2025 01:41:06 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 24 Mar 2025 09:41:01 +0100
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm6350: Align reg properties with
 latest style
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

While in the past the 'reg' properties were often written using decimal
'0' for #address-cells = <2> & #size-cells = <2>, nowadays the style is
to use hexadecimal '0x0' instead.

Align this dtsi file to the new style to make it consistent, and don't
use mixed 0x0 and 0 anymore.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 204 +++++++++++++++++------------------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -566,114 +566,114 @@ reserved_memory: reserved-memory {
 		ranges;
 
 		hyp_mem: memory@80000000 {
-			reg = <0 0x80000000 0 0x600000>;
+			reg = <0x0 0x80000000 0x0 0x600000>;
 			no-map;
 		};
 
 		xbl_aop_mem: memory@80700000 {
-			reg = <0 0x80700000 0 0x160000>;
+			reg = <0x0 0x80700000 0x0 0x160000>;
 			no-map;
 		};
 
 		cmd_db: memory@80860000 {
 			compatible = "qcom,cmd-db";
-			reg = <0 0x80860000 0 0x20000>;
+			reg = <0x0 0x80860000 0x0 0x20000>;
 			no-map;
 		};
 
 		sec_apps_mem: memory@808ff000 {
-			reg = <0 0x808ff000 0 0x1000>;
+			reg = <0x0 0x808ff000 0x0 0x1000>;
 			no-map;
 		};
 
 		smem_mem: memory@80900000 {
-			reg = <0 0x80900000 0 0x200000>;
+			reg = <0x0 0x80900000 0x0 0x200000>;
 			no-map;
 		};
 
 		cdsp_sec_mem: memory@80b00000 {
-			reg = <0 0x80b00000 0 0x1e00000>;
+			reg = <0x0 0x80b00000 0x0 0x1e00000>;
 			no-map;
 		};
 
 		pil_camera_mem: memory@86000000 {
-			reg = <0 0x86000000 0 0x500000>;
+			reg = <0x0 0x86000000 0x0 0x500000>;
 			no-map;
 		};
 
 		pil_npu_mem: memory@86500000 {
-			reg = <0 0x86500000 0 0x500000>;
+			reg = <0x0 0x86500000 0x0 0x500000>;
 			no-map;
 		};
 
 		pil_video_mem: memory@86a00000 {
-			reg = <0 0x86a00000 0 0x500000>;
+			reg = <0x0 0x86a00000 0x0 0x500000>;
 			no-map;
 		};
 
 		pil_cdsp_mem: memory@86f00000 {
-			reg = <0 0x86f00000 0 0x1e00000>;
+			reg = <0x0 0x86f00000 0x0 0x1e00000>;
 			no-map;
 		};
 
 		pil_adsp_mem: memory@88d00000 {
-			reg = <0 0x88d00000 0 0x2800000>;
+			reg = <0x0 0x88d00000 0x0 0x2800000>;
 			no-map;
 		};
 
 		wlan_fw_mem: memory@8b500000 {
-			reg = <0 0x8b500000 0 0x200000>;
+			reg = <0x0 0x8b500000 0x0 0x200000>;
 			no-map;
 		};
 
 		pil_ipa_fw_mem: memory@8b700000 {
-			reg = <0 0x8b700000 0 0x10000>;
+			reg = <0x0 0x8b700000 0x0 0x10000>;
 			no-map;
 		};
 
 		pil_ipa_gsi_mem: memory@8b710000 {
-			reg = <0 0x8b710000 0 0x5400>;
+			reg = <0x0 0x8b710000 0x0 0x5400>;
 			no-map;
 		};
 
 		pil_modem_mem: memory@8b800000 {
-			reg = <0 0x8b800000 0 0xf800000>;
+			reg = <0x0 0x8b800000 0x0 0xf800000>;
 			no-map;
 		};
 
 		cont_splash_memory: memory@a0000000 {
-			reg = <0 0xa0000000 0 0x2300000>;
+			reg = <0x0 0xa0000000 0x0 0x2300000>;
 			no-map;
 		};
 
 		dfps_data_memory: memory@a2300000 {
-			reg = <0 0xa2300000 0 0x100000>;
+			reg = <0x0 0xa2300000 0x0 0x100000>;
 			no-map;
 		};
 
 		removed_region: memory@c0000000 {
-			reg = <0 0xc0000000 0 0x3900000>;
+			reg = <0x0 0xc0000000 0x0 0x3900000>;
 			no-map;
 		};
 
 		pil_gpu_mem: memory@f0d00000 {
-			reg = <0 0xf0d00000 0 0x1000>;
+			reg = <0x0 0xf0d00000 0x0 0x1000>;
 			no-map;
 		};
 
 		debug_region: memory@ffb00000 {
-			reg = <0 0xffb00000 0 0xc0000>;
+			reg = <0x0 0xffb00000 0x0 0xc0000>;
 			no-map;
 		};
 
 		last_log_region: memory@ffbc0000 {
-			reg = <0 0xffbc0000 0 0x40000>;
+			reg = <0x0 0xffbc0000 0x0 0x40000>;
 			no-map;
 		};
 
 		ramoops: ramoops@ffc00000 {
 			compatible = "ramoops";
-			reg = <0 0xffc00000 0 0x100000>;
+			reg = <0x0 0xffc00000 0x0 0x100000>;
 			record-size = <0x1000>;
 			console-size = <0x40000>;
 			pmsg-size = <0x20000>;
@@ -682,7 +682,7 @@ ramoops: ramoops@ffc00000 {
 		};
 
 		cmdline_region: memory@ffd00000 {
-			reg = <0 0xffd00000 0 0x1000>;
+			reg = <0x0 0xffd00000 0x0 0x1000>;
 			no-map;
 		};
 	};
@@ -786,7 +786,7 @@ soc: soc@0 {
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sm6350";
-			reg = <0 0x00100000 0 0x1f0000>;
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -800,7 +800,7 @@ gcc: clock-controller@100000 {
 
 		ipcc: mailbox@408000 {
 			compatible = "qcom,sm6350-ipcc", "qcom,ipcc";
-			reg = <0 0x00408000 0 0x1000>;
+			reg = <0x0 0x00408000 0x0 0x1000>;
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -809,7 +809,7 @@ ipcc: mailbox@408000 {
 
 		qfprom: qfprom@784000 {
 			compatible = "qcom,sm6350-qfprom", "qcom,qfprom";
-			reg = <0 0x00784000 0 0x3000>;
+			reg = <0x0 0x00784000 0x0 0x3000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
@@ -821,16 +821,16 @@ gpu_speed_bin: gpu-speed-bin@2015 {
 
 		rng: rng@793000 {
 			compatible = "qcom,prng-ee";
-			reg = <0 0x00793000 0 0x1000>;
+			reg = <0x0 0x00793000 0x0 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
 		};
 
 		sdhc_1: mmc@7c4000 {
 			compatible = "qcom,sm6350-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0 0x007c4000 0 0x1000>,
-				<0 0x007c5000 0 0x1000>,
-				<0 0x007c8000 0 0x8000>;
+			reg = <0x0 0x007c4000 0x0 0x1000>,
+			      <0x0 0x007c5000 0x0 0x1000>,
+			      <0x0 0x007c8000 0x0 0x8000>;
 			reg-names = "hc", "cqhci", "ice";
 
 			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
@@ -875,7 +875,7 @@ opp-384000000 {
 
 		gpi_dma0: dma-controller@800000 {
 			compatible = "qcom,sm6350-gpi-dma";
-			reg = <0 0x00800000 0 0x60000>;
+			reg = <0x0 0x00800000 0x0 0x60000>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
@@ -907,7 +907,7 @@ qupv3_id_0: geniqup@8c0000 {
 
 			i2c0: i2c@880000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00880000 0 0x4000>;
+				reg = <0x0 0x00880000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				pinctrl-names = "default";
@@ -927,7 +927,7 @@ i2c0: i2c@880000 {
 
 			uart1: serial@884000 {
 				compatible = "qcom,geni-uart";
-				reg = <0 0x00884000 0 0x4000>;
+				reg = <0x0 0x00884000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				pinctrl-names = "default";
@@ -943,7 +943,7 @@ uart1: serial@884000 {
 
 			i2c2: i2c@888000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00888000 0 0x4000>;
+				reg = <0x0 0x00888000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				pinctrl-names = "default";
@@ -964,7 +964,7 @@ i2c2: i2c@888000 {
 
 		gpi_dma1: dma-controller@900000 {
 			compatible = "qcom,sm6350-gpi-dma";
-			reg = <0 0x00900000 0 0x60000>;
+			reg = <0x0 0x00900000 0x0 0x60000>;
 			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
@@ -996,7 +996,7 @@ qupv3_id_1: geniqup@9c0000 {
 
 			i2c6: i2c@980000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00980000 0 0x4000>;
+				reg = <0x0 0x00980000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				pinctrl-names = "default";
@@ -1016,7 +1016,7 @@ i2c6: i2c@980000 {
 
 			i2c7: i2c@984000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00984000 0 0x4000>;
+				reg = <0x0 0x00984000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				pinctrl-names = "default";
@@ -1036,7 +1036,7 @@ i2c7: i2c@984000 {
 
 			i2c8: i2c@988000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00988000 0 0x4000>;
+				reg = <0x0 0x00988000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				pinctrl-names = "default";
@@ -1056,7 +1056,7 @@ i2c8: i2c@988000 {
 
 			uart9: serial@98c000 {
 				compatible = "qcom,geni-debug-uart";
-				reg = <0 0x0098c000 0 0x4000>;
+				reg = <0x0 0x0098c000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				pinctrl-names = "default";
@@ -1070,7 +1070,7 @@ uart9: serial@98c000 {
 
 			i2c10: i2c@990000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0x00990000 0 0x4000>;
+				reg = <0x0 0x00990000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				pinctrl-names = "default";
@@ -1091,14 +1091,14 @@ i2c10: i2c@990000 {
 
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm6350-config-noc";
-			reg = <0 0x01500000 0 0x28000>;
+			reg = <0x0 0x01500000 0x0 0x28000>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		system_noc: interconnect@1620000 {
 			compatible = "qcom,sm6350-system-noc";
-			reg = <0 0x01620000 0 0x17080>;
+			reg = <0x0 0x01620000 0x0 0x17080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -1111,14 +1111,14 @@ clk_virt: interconnect-clk-virt {
 
 		aggre1_noc: interconnect@16e0000 {
 			compatible = "qcom,sm6350-aggre1-noc";
-			reg = <0 0x016e0000 0 0x15080>;
+			reg = <0x0 0x016e0000 0x0 0x15080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
 			compatible = "qcom,sm6350-aggre2-noc";
-			reg = <0 0x01700000 0 0x1f880>;
+			reg = <0x0 0x01700000 0x0 0x1f880>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -1131,7 +1131,7 @@ compute_noc: interconnect-compute-noc {
 
 		mmss_noc: interconnect@1740000 {
 			compatible = "qcom,sm6350-mmss-noc";
-			reg = <0 0x01740000 0 0x1c100>;
+			reg = <0x0 0x01740000 0x0 0x1c100>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
@@ -1139,8 +1139,8 @@ mmss_noc: interconnect@1740000 {
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm6350-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>,
-			      <0 0x01d90000 0 0x8000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01d90000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy>;
@@ -1188,7 +1188,7 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm6350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1000>;
+			reg = <0x0 0x01d87000 0x0 0x1000>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -1209,7 +1209,7 @@ ufs_mem_phy: phy@1d87000 {
 
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
-			reg = <0 0x01dc4000 0 0x24000>;
+			reg = <0x0 0x01dc4000 0x0 0x24000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
@@ -1225,7 +1225,7 @@ cryptobam: dma-controller@1dc4000 {
 
 		crypto: crypto@1dfa000 {
 			compatible = "qcom,sm6350-qce", "qcom,sm8150-qce", "qcom,qce";
-			reg = <0 0x01dfa000 0 0x6000>;
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
 			iommus = <&apps_smmu 0x426 0x11>,
@@ -1243,9 +1243,9 @@ ipa: ipa@1e40000 {
 
 			iommus = <&apps_smmu 0x440 0x0>,
 				 <&apps_smmu 0x442 0x0>;
-			reg = <0 0x01e40000 0 0x8000>,
-			      <0 0x01e50000 0 0x3000>,
-			      <0 0x01e04000 0 0x23000>;
+			reg = <0x0 0x01e40000 0x0 0x8000>,
+			      <0x0 0x01e50000 0x0 0x3000>,
+			      <0x0 0x01e04000 0x0 0x23000>;
 			reg-names = "ipa-reg",
 				    "ipa-shared",
 				    "gsi";
@@ -1351,8 +1351,8 @@ compute-cb@5 {
 
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
-			reg = <0 0x03d00000 0 0x40000>,
-			      <0 0x03d9e000 0 0x1000>;
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
@@ -1419,7 +1419,7 @@ opp-253000000 {
 
 		adreno_smmu: iommu@3d40000 {
 			compatible = "qcom,sm6350-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
-			reg = <0 0x03d40000 0 0x10000>;
+			reg = <0x0 0x03d40000 0x0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
 			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
@@ -1445,9 +1445,9 @@ adreno_smmu: iommu@3d40000 {
 
 		gmu: gmu@3d6a000 {
 			compatible = "qcom,adreno-gmu-619.0", "qcom,adreno-gmu";
-			reg = <0 0x03d6a000 0 0x31000>,
-			      <0 0x0b290000 0 0x10000>,
-			      <0 0x0b490000 0 0x10000>;
+			reg = <0x0 0x03d6a000 0x0 0x31000>,
+			      <0x0 0x0b290000 0x0 0x10000>,
+			      <0x0 0x0b490000 0x0 0x10000>;
 			reg-names = "gmu",
 				    "gmu_pdc",
 				    "gmu_pdc_seq";
@@ -1489,7 +1489,7 @@ opp-200000000 {
 
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sm6350-gpucc";
-			reg = <0 0x03d90000 0 0x9000>;
+			reg = <0x0 0x03d90000 0x0 0x9000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_GPU_GPLL0_CLK>,
 				 <&gcc GCC_GPU_GPLL0_DIV_CLK>;
@@ -1543,7 +1543,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 		cdsp: remoteproc@8300000 {
 			compatible = "qcom,sm6350-cdsp-pas";
-			reg = <0 0x08300000 0 0x10000>;
+			reg = <0x0 0x08300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -1642,7 +1642,7 @@ compute-cb@8 {
 
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm6350-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0 0x08804000 0 0x1000>;
+			reg = <0x0 0x08804000 0x0 0x1000>;
 
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
@@ -1691,7 +1691,7 @@ opp-202000000 {
 
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm6350-qusb2-phy", "qcom,qusb2-v2-phy";
-			reg = <0 0x088e3000 0 0x400>;
+			reg = <0x0 0x088e3000 0x0 0x400>;
 			status = "disabled";
 			#phy-cells = <0>;
 
@@ -1703,7 +1703,7 @@ usb_1_hsphy: phy@88e3000 {
 
 		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm6350-qmp-usb3-dp-phy";
-			reg = <0 0x088e8000 0 0x3000>;
+			reg = <0x0 0x088e8000 0x0 0x3000>;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
@@ -1754,27 +1754,27 @@ usb_1_qmpphy_dp_in: endpoint {
 
 		dc_noc: interconnect@9160000 {
 			compatible = "qcom,sm6350-dc-noc";
-			reg = <0 0x09160000 0 0x3200>;
+			reg = <0x0 0x09160000 0x0 0x3200>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm6350-llcc";
-			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
+			reg = <0x0 0x09200000 0x0 0x50000>, <0x0 0x09600000 0x0 0x50000>;
 			reg-names = "llcc0_base", "llcc_broadcast_base";
 		};
 
 		gem_noc: interconnect@9680000 {
 			compatible = "qcom,sm6350-gem-noc";
-			reg = <0 0x09680000 0 0x3e200>;
+			reg = <0x0 0x09680000 0x0 0x3e200>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		npu_noc: interconnect@9990000 {
 			compatible = "qcom,sm6350-npu-noc";
-			reg = <0 0x09990000 0 0x1600>;
+			reg = <0x0 0x09990000 0x0 0x1600>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
@@ -1878,7 +1878,7 @@ opp-10 {
 
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm6350-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
 			status = "disabled";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -1916,7 +1916,7 @@ usb_1: usb@a6f8800 {
 
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
+				reg = <0x0 0x0a600000 0x0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x540 0x0>;
 				snps,dis_u2_susphy_quirk;
@@ -1954,7 +1954,7 @@ usb_1_dwc3_ss_out: endpoint {
 
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
-			reg = <0 0x0ac4a000 0 0x1000>;
+			reg = <0x0 0x0ac4a000 0x0 0x1000>;
 			interrupts = <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
@@ -2001,7 +2001,7 @@ cci0_i2c1: i2c-bus@1 {
 
 		cci1: cci@ac4b000 {
 			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
-			reg = <0 0x0ac4b000 0 0x1000>;
+			reg = <0x0 0x0ac4b000 0x0 0x1000>;
 			interrupts = <GIC_SPI 462 IRQ_TYPE_EDGE_RISING>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
@@ -2043,7 +2043,7 @@ cci1_i2c0: i2c-bus@0 {
 
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
-			reg = <0 0x0ad00000 0 0x16000>;
+			reg = <0x0 0x0ad00000 0x0 0x16000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2052,7 +2052,7 @@ camcc: clock-controller@ad00000 {
 
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm6350-mdss";
-			reg = <0 0x0ae00000 0 0x1000>;
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
 			reg-names = "mdss";
 
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -2084,8 +2084,8 @@ &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm6350-dpu";
-				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
 				reg-names = "mdp", "vbif";
 
 				interrupt-parent = <&mdss>;
@@ -2168,11 +2168,11 @@ opp-560000000 {
 
 			mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
-				reg = <0 0xae90000 0 0x200>,
-				      <0 0xae90200 0 0x200>,
-				      <0 0xae90400 0 0x600>,
-				      <0 0xae91000 0 0x400>,
-				      <0 0xae91400 0 0x400>;
+				reg = <0x0 0xae90000 0x0 0x200>,
+				      <0x0 0xae90200 0x0 0x200>,
+				      <0x0 0xae90400 0x0 0x600>,
+				      <0x0 0xae91000 0x0 0x400>,
+				      <0x0 0xae91400 0x0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
@@ -2248,7 +2248,7 @@ opp-810000000 {
 
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
-				reg = <0 0x0ae94000 0 0x400>;
+				reg = <0x0 0x0ae94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
@@ -2324,9 +2324,9 @@ opp-358000000 {
 
 			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
-				reg = <0 0x0ae94400 0 0x200>,
-				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94a00 0 0x1e0>;
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94a00 0x0 0x1e0>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
@@ -2344,7 +2344,7 @@ mdss_dsi0_phy: phy@ae94400 {
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm6350-dispcc";
-			reg = <0 0x0af00000 0 0x20000>;
+			reg = <0x0 0x0af00000 0x0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK>,
 				 <&mdss_dsi0_phy 0>,
@@ -2364,7 +2364,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 655 12>, <138 139 15>;
 			#interrupt-cells = <2>;
@@ -2374,8 +2374,8 @@ pdc: interrupt-controller@b220000 {
 
 		tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sm6350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c263000 0 0x1ff>, /* TM */
-			      <0 0x0c222000 0 0x8>; /* SROT */
+			reg = <0x0 0x0c263000 0x0 0x1ff>, /* TM */
+			      <0x0 0x0c222000 0x0 0x8>; /* SROT */
 			#qcom,sensors = <16>;
 			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
 				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
@@ -2385,8 +2385,8 @@ tsens0: thermal-sensor@c263000 {
 
 		tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sm6350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c265000 0 0x1ff>, /* TM */
-			      <0 0x0c223000 0 0x8>; /* SROT */
+			reg = <0x0 0x0c265000 0x0 0x1ff>, /* TM */
+			      <0x0 0x0c223000 0x0 0x8>; /* SROT */
 			#qcom,sensors = <16>;
 			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
 				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
@@ -2396,7 +2396,7 @@ tsens1: thermal-sensor@c265000 {
 
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,sm6350-aoss-qmp", "qcom,aoss-qmp";
-			reg = <0 0x0c300000 0 0x1000>;
+			reg = <0x0 0x0c300000 0x0 0x1000>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
 						     IRQ_TYPE_EDGE_RISING>;
 			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
@@ -2406,11 +2406,11 @@ aoss_qmp: power-management@c300000 {
 
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
-			reg = <0 0x0c440000 0 0x1100>,
-			      <0 0x0c600000 0 0x2000000>,
-			      <0 0x0e600000 0 0x100000>,
-			      <0 0x0e700000 0 0xa0000>,
-			      <0 0x0c40a000 0 0x26000>;
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -2424,7 +2424,7 @@ spmi_bus: spmi@c440000 {
 
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm6350-tlmm";
-			reg = <0 0x0f100000 0 0x300000>;
+			reg = <0x0 0x0f100000 0x0 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
@@ -2603,7 +2603,7 @@ qup_uart1_tx: qup-uart1-tx-default-state {
 
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm6350-smmu-500", "arm,mmu-500";
-			reg = <0 0x15000000 0 0x100000>;
+			reg = <0x0 0x15000000 0x0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
@@ -2701,7 +2701,7 @@ intc: interrupt-controller@17a00000 {
 
 		watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sm6350", "qcom,kpss-wdt";
-			reg = <0 0x17c10000 0 0x1000>;
+			reg = <0x0 0x17c10000 0x0 0x1000>;
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
@@ -2855,7 +2855,7 @@ osm_l3: interconnect@18321000 {
 
 		cpufreq_hw: cpufreq@18323000 {
 			compatible = "qcom,sm6350-cpufreq-hw", "qcom,cpufreq-hw";
-			reg = <0 0x18323000 0 0x1000>, <0 0x18325800 0 0x1000>;
+			reg = <0x0 0x18323000 0x0 0x1000>, <0x0 0x18325800 0x0 0x1000>;
 			reg-names = "freq-domain0", "freq-domain1";
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
 			clock-names = "xo", "alternate";
@@ -2866,7 +2866,7 @@ cpufreq_hw: cpufreq@18323000 {
 
 		wifi: wifi@18800000 {
 			compatible = "qcom,wcn3990-wifi";
-			reg = <0 0x18800000 0 0x800000>;
+			reg = <0x0 0x18800000 0x0 0x800000>;
 			reg-names = "membase";
 			memory-region = <&wlan_fw_mem>;
 			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.49.0


