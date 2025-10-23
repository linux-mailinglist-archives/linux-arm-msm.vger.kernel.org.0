Return-Path: <linux-arm-msm+bounces-78434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9BBFEF8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A056019A4F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6E922422D;
	Thu, 23 Oct 2025 02:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJmfyYBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABB22257E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761188370; cv=none; b=OUuhfphErC8WhgM58FhNhgo627EssPrvcrRJT4sIR3nQEA5nH2Rpl9WV406N4/rX/7gt2An1npGjt++0iWnqPtEDqM/Ag0K1SPGwv5bcsHFIzzsoxN/1QG1F7y6RyguD97XxIaOlCUSXL5g6oN3cCY+Ac8LoIECTzYUOCbsXvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761188370; c=relaxed/simple;
	bh=e0Z2va9HgDtL8vsI/KLfNgB7DdQA2E6nrIafT2Vkk98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nB9+zKrDSsOoho7QWWGHYUW4wU1pIbeIwY4iZDfjGnJ4klxohqOC7nhCiM70kMQeByc+4HRh/yiH3523KyZ/0BjRXEzCzPeqml3nMYlpfHZXva309Iuy7R02GADVc4fV7b/0qcG7rvDPkjz7UrdXF72S/916qHrcoz5/rjHLQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJmfyYBb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-592f0102eceso51553e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 19:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761188367; x=1761793167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAOJ88MxaBX4a3zpA9SPrM7r0XtR/n76q4YBsFSa9ME=;
        b=AJmfyYBbAi+tg9fYhAcVNXqEvMtZ02H0Ixwjxf6YEkFax20RDtJDcVFopv1poOkVwq
         69TLB5jqJhoQPb6C7PMqNhwUsOp/UXiKGTCfL5YpG1d8j3TBLYxT9Cx10vZsFAHIYi/D
         EvkeAlY0SgwnBzj3rwcN5gQXQsKe0YqORyvodd66aP8Rxf2s8KBIYOw/D2v5QzUUJSdv
         3abnGwQxFAXCdwmttaJuE3bLFJWl/60AU2YTIVV2blulSK5NndWCxhymestiQwZK4hXS
         gXiB0ArY9p4totkK5+4bRgeHRolAfJ2knxxVsIDDiZ0S3TblCvmyJrfiMpmQwkMPVG20
         p8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761188367; x=1761793167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAOJ88MxaBX4a3zpA9SPrM7r0XtR/n76q4YBsFSa9ME=;
        b=J5y10BasFlHho0elABqGDMwcsKeO8yycwt8ti6pUwxBvfCA63AkCRwfXgeloNgzOUF
         UKSMO770BR0hU2IDNG3cHAhw8fUMU1Q5KBUJeLx964K9evROke1B4Okz1FNICGloWB7c
         nzlH4FExlbpLyW2X5BcSYQExTd5W80+04Jb2RnEi/1eCEcZ3PpCIyMFFnaFdiUhaPE7u
         oz499Vt18aJVvk+L4YmHR9hhbi7ZHNuhDcEYwCPjck5EfjvkGKGIRq/6bqZiQ73yeJ9n
         Gdo4eWtEke8/0Iz6KEIivGL/V4GjkdiLi5zEBMIwa/aB3kTYZ1qsfdtUOcPOSfg3wnUX
         cZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/srpFyJRYml0k1dpQs53+BCxl2CTApf5r4IbHeFNWxF8u0GO17XcNe2Re3ZIQ0QlbUP6+VrlP2zkjTiu1@vger.kernel.org
X-Gm-Message-State: AOJu0YxupERSaca6pQaP2q7G8PFOfwghRyvBg4XLc50MHaIn2M18bID8
	8E/m/3MVl3OHwvHBNUCvN4sPuyhAXbJnuCbkzUtNSbDA0TLVmORyPW510ERMCy2nO58=
X-Gm-Gg: ASbGnct+fFwCP+jmM6nz7U2RA6gx6+zIp1vX6ZcWUz18aOZDQqLbQG5lAXlU3CJMAfG
	wI9Kl/pXZuOlkh9vuUo0A+AsrHj0BQC4G6o5cdy5eMQz5NYoCTM7ZSPMnF/7SPw4aWxYAh7NnLc
	D220y9TpAXJgRhech/JnulqHaDB52+BYOo/AZuMMS77rHg48lNrIRdvtDhImzQAsGD2TXJsPIIA
	Jtotk3eLGqJdXcIV2Jk+sRSXjFb5Kaes3yAGkVdevv+sXYOENqJPpim6DBTeoIP1HPUzo5qUyRF
	LRCXXY79+sLnuN0TDjRroIq3BoD010ZXwWa1TRqN+SYZyv3xAYcICDuP8LAkKfidk02W22OblaZ
	pp4qHp4iLtzcB2g8OX+0j/geUqKBQwVhPSq3AVwFGHXGj89vbLz7loT5cyGwAMZUEJsFQQOs+zE
	1Tb2E9uiKHZmwIFP4v4LC6CRljYKHApYimZCik3U52vlY=
X-Google-Smtp-Source: AGHT+IHo2D1EeERyLTDPHse8KK392OBUFAXVZbWm+X3mE+bPXGKq7bNbzY9W7OueIwhWC4eS+N3izw==
X-Received: by 2002:a05:6512:2352:b0:57b:517c:bf0b with SMTP id 2adb3069b0e04-591ea41930cmr2040903e87.4.1761188366575;
        Wed, 22 Oct 2025 19:59:26 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d16a15sm334471e87.58.2025.10.22.19.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:59:25 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
Date: Thu, 23 Oct 2025 05:59:13 +0300
Message-ID: <20251023025913.2421822-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To provide access to camera sensors a Rear Camera Card can be connected
to SM8650-HDK board, the camera sensors are:
* Samsung S5K33D ToF camera sensor, connected to CSI0 over MIPI D-PHY,
* Sony IMX766 Wide camera sensor, connected to CSI1 over MIPI C-PHY,
* Omnivision OV64B Ultrawide camera sensor, connected to CSI2 over MIPI C-PHY,
* Samsung S5KJN1 Tele camera sensor, connected to CSI3 over MIPI D-PHY).

Get the initial support of Samsung S5KJN1 camera sensor and two flash leds
on the Rear Camera Card board by adding a board overlay.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +
 .../dts/qcom/sm8650-hdk-rear-camera-card.dtso | 90 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..902b67dd9319 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -305,8 +305,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
 
 sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
+sm8650-hdk-display-card-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo sm8650-hdk-rear-camera-card.dtbo
+sm8650-hdk-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-rear-camera-card.dtbo
 
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso
new file mode 100644
index 000000000000..5d4b08b50f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SM8650-HDK Rear Camera Card overlay
+ *
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,sm8650-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/dts-v1/;
+/plugin/;
+
+&camss {
+	status = "okay";
+
+	vdd-csiphy35-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy35-1p2-supply = <&vreg_l3i_1p2>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@3 {
+			reg = <3>;
+
+			csiphy3_ep: endpoint {
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
+	sensor@56 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x56>;
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-names = "default";
+		afvdd-supply = <&vreg_l7m_2p96>;
+		avdd-supply = <&vreg_l4m_2p8>;
+		dovdd-supply = <&vreg_l3n_1p8>;
+		dvdd-supply = <&vreg_l2m_1p056>;
+
+		port {
+			cam_tele: endpoint {
+				link-frequencies = /bits/ 64 <700000000>;
+				data-lanes = <1 2 3 4>;
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


