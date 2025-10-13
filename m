Return-Path: <linux-arm-msm+bounces-77068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96324BD6CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 83F084F25E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071232BF00A;
	Mon, 13 Oct 2025 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icbkfhR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2D52EB865
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399724; cv=none; b=pY/v7HF2+MP2qGqKroZoXqR7J2Ve238WiSZ0VPjek9wxW2vuUPx+Z0VM/dknPDZ9bC1ni9xAGnYK0fDSGC8qFeDjIG3wTX7rG3a8ENtdy46QDhqZI957TAy0Peh0ZjON0xjiL3tV2P/gSnHH7VM7UUscqiRzOzvcxvvZfvJnvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399724; c=relaxed/simple;
	bh=hiTahlzk92SR11RpNVlkhhd0LibfKWRra2+Chcrvxjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAqSVwozDWSk4uk00ocV1R/LwCZS5qmwDnVoemmj1Yy5sg6Ue9oSBElPsBMonjha7nhuUC7jZxYjZ7PdMP5iH3O4NcMMWM+bC/jf9FqITQWgbhJ07mIvrNF17p5MApZekArneOkoshOBZKal/j+4BftyNq5IizzgNusTMXb1j68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icbkfhR6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so789995e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760399721; x=1761004521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVDHwGcU6WIB12qKw5RBfk/jM/i7BpGX7dMdSUTlPCs=;
        b=icbkfhR6HXSUFSkqumZSC6H4lpQYxUYJ8A9C7QlgMWbLhzUGQFBJrGrGE0qITcRzu3
         FJODGivGrE3RoMACLA1/GiQ6GzxOhDQGMyjPYMDS2NjIUtN5O6omLeU+ArWZ0oudvzq2
         TiIILJDgPF5mWYFuGlTqMlzHP+DyFNMhZc//hoptb+Ut9PHK72ZHzz5dBzw0oXO82Isi
         t0JaC59Bef+YtmXC6PG0BnDwVuwqrOgGHUeW9YmsLU7evb5JAWvGj1ZzyPSYPKM8n5+5
         Sj7qXdSWSpB3OIf5wjVnyIq0QUd+JoOwER2hee6/kuTKg+w7osr6swopTy9yaj92WkkF
         Yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399721; x=1761004521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVDHwGcU6WIB12qKw5RBfk/jM/i7BpGX7dMdSUTlPCs=;
        b=BxZrSypgLR68Yz3wUa5BVr1fPYJcJJ+x3eQFStapYW0OxQTL/sXALDgdIp8QRvA+qT
         /deCo3g3g5SbkYI+sWEgXha9VWvfewcbIa/Yje+JmaWPzgRSN1BrgirhEXEm7So+igTs
         tv7KoIp2OEZA0djyj+E7D8X/BB+0mg4r3713zHV8zwFcFhh7O8RpnBgHE1OzyPd4XDSK
         mBFQKQAJkfyEtReVVMLkXZ39Y0Q9hK9JGqwjefRmSxQSanlWzkKfFEgUKXiqvHBNK0ek
         mfwMh9ydWlw3V9K4g+/s3M55Bnuy0j991/5SqP5fe0IJd7G+IuqCzMCj05NHphfCeQcN
         M0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1KdWpXI+j/NgtIVFo4y+vT5YYYaLQ1SiBUNA1AMXknRrOOHkD4vuoeGEovj/ZAKuNfqPZbejMj8xN26/B@vger.kernel.org
X-Gm-Message-State: AOJu0YwGROoCwJbXXhaaYgktAfpNiWWGMbURL+zxbgtOBRFs7TNKYnjT
	CG5yVxExWQwHPPeCpuNb6oUFSZ/4hqeDHyQb0a88vBJkbDIXOdvytBWoJ4thtZcaLEs=
X-Gm-Gg: ASbGnctIhLIuDXPiSr/HsD37gMnLEo945L/TetElLXbDC+QOGGt1bjcEdcaLmULMlBB
	/jI8l6ZpxLLGV2WKodtYmTbRW2fcH/uhZSbjI40hmnr4spblf7dZX1C2ryCP5DdSS/hvUcpgkmt
	AHlszLOkopd0JOZvMOhE+k2xePerE5UAY8m62+sxHMfFLhMUaPMpmSSitrVynAxiY68QgICqFge
	rP507LTXzVMrHIK3t1cKGu+UaE83JAKIBapEnmISFE1LcXEYZicf5uGfYyMcvYK9JortDToy7bq
	s332IgYzd1ZJya95MGpcr4+Q7GY1E02ujBdo+5bxabHPhtOB4Zaom2godyq/3eQgYD5+is6Xaar
	U5wnS8n9VLYLIsiDiqgQ734yFMYGaNbiygqAYpfC0kpaKyN3KGCdfmFQTXkzSrw291KhikSRWxj
	JQOhp5w/dP9QxgsQypBqIVdYc=
X-Google-Smtp-Source: AGHT+IGahUtoIGUB8AT3NkxZdQWN1zu2i8l2fqr/C41W26huwC3m4ZzynCCcSDyMnkOgTwR/NWdxpA==
X-Received: by 2002:a05:651c:2224:b0:36b:93b0:2a8a with SMTP id 38308e7fff4ca-37609e734bemr30688141fa.5.1760399720908;
        Mon, 13 Oct 2025 16:55:20 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm34880741fa.50.2025.10.13.16.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 16:55:20 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
Date: Tue, 14 Oct 2025 02:55:00 +0300
Message-ID: <20251013235500.1883847-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lantronix SM8550-HDK board may be equipped with a Rear Camera Card PCB
which contains:
* Samsung S3K33D time-of-fligt image sensor connected to CSIPHY0 (TOF),
* Omnivision OV64B40 image sensor connected to CSIPHY1 (uWide),
* Sony IMX766 image sensor connected to CSIPHY2 (Wide),
* Samsung S5K3M5 image sensor connected to CSIPHY3 (Tele),
* two flash leds.

The change adds support of a Samsung S5K3M5 camera image sensor and
two flash leds on the external camera card module.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +
 .../dts/qcom/sm8550-hdk-rear-camera-card.dtso | 91 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..3ae9b85c656e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -298,6 +298,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
+
+sm8550-hdk-rear-camera-card-dtbs	:= sm8550-hdk.dtb sm8550-hdk-rear-camera-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
new file mode 100644
index 000000000000..66bec0fef766
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SM8550-HDK Rear Camera Card overlay
+ *
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,sm8550-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/dts-v1/;
+/plugin/;
+
+&camss {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@3 {
+			reg = <3>;
+
+			csiphy3_ep: endpoint {
+				clock-lanes = <4>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_tele>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "samsung,s5k3m5";
+		reg = <0x10>;
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+		reset-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-names = "default";
+		afvdd-supply = <&vreg_l7n_2p96>;
+		avdd-supply = <&vreg_l4m_2p8>;
+		dovdd-supply = <&vreg_l5n_1p8>;
+		dvdd-supply = <&vreg_l2m_1p056>;
+
+		port {
+			cam_tele: endpoint {
+				link-frequencies = /bits/ 64 <602500000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
+&pm8550_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+	};
+};
-- 
2.49.0


