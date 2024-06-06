Return-Path: <linux-arm-msm+bounces-21917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCAC8FE6D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541E21F26034
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F443195B10;
	Thu,  6 Jun 2024 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTmc4ljl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B92E190697
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678228; cv=none; b=sEoSVGwz+GvocI6xMmG9/cO9sQV/9zmYL4KhwYUuYQ1KA1M87nHHDFsHjpxuPCkkb0u7DRQCdpT4relZ2Lsefr+cHwb7SAxOdgYGNOUpNYjjQm1bCnFZ5nPFTIQSloVApkHmKXayLbRajTwlVkyIYXHWhNFHQVfcyG+qF6VRrKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678228; c=relaxed/simple;
	bh=G9/EX3+57FfdUlOscWXeQJd+tO85l3+9+DymQuRBI/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rLqWDggI9C+dR5UeK9qH0RcqFCXn/GrGc9fXQy45sgNQna9XhyIzeYacaaLx6Xj2Do0aRHuhDj35As0qKeiMAVLA9ifEVDQo8bLgpfJgHtn8O36vsgx+xHr8IgoPg8FxrydemeIpTzyoArAyQBzWge2j5uRw4D8iE0d36xzpL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTmc4ljl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42155143cb0so12138045e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717678225; x=1718283025; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYihygzERCiTGhiu5LEngitXdw6rx60D9mH07NjCb/4=;
        b=eTmc4ljlmAYQfxXF9QWjCOnHlI4r14010v/iv65/UqSzXM09aIk7SYVwQuEN0z585X
         zZMH+G2Ptfq6UvZKwNLGHX7UNP7s1cMoQwm6fJ726S+Ta/4Rh84+vnjs6z26HxzEij8P
         6147HuKbBR8k6Pm1P6sAz3pqd3yA/5eef2F+KFkvWdYweIzcggHmNqnVy5tlOyZUpwRZ
         RSPAvh9cnuGzjc/FTdWsGBAQ3vtymXipFFhnT2XYc9hblt/oS2+egBWN0/ip3832qQsX
         miMLMzyvh0+9jSDiBmmCEmJOZBY8IndNE5aC25zz4lBuA6jIOrsZybWUAYmWPH8WjAnl
         SFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717678225; x=1718283025;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYihygzERCiTGhiu5LEngitXdw6rx60D9mH07NjCb/4=;
        b=tdNLSM7Vt/052sOeMJvtCGnFaaBMghV/UgV9xcNZedCmLrEY7AqGkXY4fO6KRbmFnj
         Mbd3BNhCSYnCLOc89JQXiajn592WGyZ7GmAoxePnjJhA55yUHbKsxaUrvWBLUJECX+/E
         UsU83/Tg0rCZ5+cUtz2aOIhPxwDbat663DztsoOXT/f8dYIyqa1IlgJY6WiP0O6vynAc
         41bXRglfOAszUFpt3LCNBuavQrPIuTM1tc2uBvC8H+9k42DXzG3DmCYxolRhfhdoBPY5
         VK+zRKRU1egRGa/AZ3N81ouq6f7EtENpVQLXH77o+qKXUS1WqgfiUOIU/27vInGLXECP
         7e5A==
X-Gm-Message-State: AOJu0YxPF3V8EPJfzX3YYcRUz11YkQ2qZUgKvgzVNEI8FM0XAqMOgpWK
	pXmMcLHtfgf1g1WAbMIu0+IBTkris5/9PU2/9lsONVF5V3boL/3mcPN6OP8a1sg=
X-Google-Smtp-Source: AGHT+IFXEIsQlTSTK2pgg7w6uh+Q3FgfbiLCFNldnGDduvCpt+AJyudr1dMYOx4fUbZIuBstOhA1Lw==
X-Received: by 2002:a05:600c:4692:b0:421:3901:196 with SMTP id 5b1f17b1804b1-4215633a32cmr47772525e9.27.1717678224769;
        Thu, 06 Jun 2024 05:50:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814f141sm54588255e9.42.2024.06.06.05.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:50:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 14:50:22 +0200
Subject: [PATCH v6] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-sm8650-upstream-hdk-v6-1-fb034fe864cc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI2wYWYC/43OwW7DIAyA4VepOI8JbCBkp73H1AMD06CtSQRZ1
 KnKu4/0kk2Roh1/S/7sOyuUExX2crqzTHMqaehrmKcT853rL8RTqM1AgBIAyKdhTJ6XqzVa8K+
 xTJnclXfhgxNIH4OJMpBldX/MFNPtYb+da3epTEP+fpya5Tr9jzpLLrj33hmlfWiFfP1MvcvD8
 5AvbGVn2CiU9oiCSr0bdDoo7RqrdhT+okAfUVgpFdHo0LQILu4otVEK4IhS61eIbYvkHJDdUXq
 jjDBHlOaS62AbG1GohvAPtSzLDwW9stfvAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7380;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=G9/EX3+57FfdUlOscWXeQJd+tO85l3+9+DymQuRBI/M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYbCPIkApLPdMmjAT+VZidsoFpVoa3+1OPJz0Awf7
 tV2qvaOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmGwjwAKCRB33NvayMhJ0ZTGD/
 4vEDc+iHjoMry3socH7kycn40I+gvtVkDdokgOK/biJXF1gy7Z7NRdxd8KRFykMOxfaucqYZBJSXFI
 crTLUHR/s0E/BzYY/Uby/joCsR4vMDCDIFfxNKLAXF5ZQUnGlUmNGN+vRNeSMrPid0qZ9itR+WXz37
 ZdnZv/jRRs7uHM0Lcmo4oaInCdRCK734gvDAWCI/n8k5lUYjYDRQCIuN3kdkUIj//2KAcVKk/h0p2I
 JQ/TY/wx4My6bLKLKSD1Hn4R2K2a61t/+69qgf6AKG9rzd0jddWltESL9b38V2xeqmUC6wZv5IOZt8
 xRNVgV1GFJYeIV1k6+1Gz6ACkA6cqhadJuIcAML9WcgmE0hNeXQA1fBqPZQZrYPKIqaoRyVaRZUxwR
 eGYQK0WGkjs6RCtDIel5k6v0zwiy4tgHP5shv/Z/ZuDnawxyJhwyhipnQ647u46CyFtRBsobEroViM
 qw65acX+YNwROtcCyoEbES/c10UGi7AS2JgjVaBuQ3MKHW4Mx6CCJWlkeUuPAi1KxS6kSolAitMV5w
 dtYm56k/H6YuV6/PEZhACnQob4vqvofdCHPkWLWzYGcTxs7ik0lXZChoBOY2mog8zTPp3BnhMEXA8/
 v68l5+GL0Cc1nxpBfIlCJWQGyNRTWGcpehoTXQ35F990iij+imjGj+/Fz8ew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

With the SM8650-HDK, a Display Card kit can be connected to provide
a VTDR6130 display with Goodix Berlin Touch controller.

In order to route the DSI lanes to the connector for the Display
Card kit, a switch must be changed on the board.

The HDMI nodes are disabled since the DSI lanes are shared with
the DSI to HDMI transceiver.

Add support for this card as an overlay and apply it it at
build-time to the sm8650-hdk dtb.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
The SM8650-HDK is an embedded development platforms for the
Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
- Qualcomm SM8650 SoC
- 16GiB On-board LPDDR5
- On-board WiFi 7 + Bluetooth 5.3/BLE
- On-board UFS4.0
- M.2 Key B+M Gen3x2 PCIe Slot
- HDMI Output
- USB-C Connector with DP Almode & Audio Accessory mode
- Micro-SDCard Slot
- Audio Jack with Playback and Microphone
- 2 On-board Analog microphones
- 2 On-board Speakers
- 96Boards Compatible Low-Speed and High-Speed connectors [1]
- For Camera, Sensors and external Display cards
- Compatible with the Linaro Debug board [2]
- SIM Slot for Modem
- Debug connectors
- 6x On-Board LEDs

An optional Display Card kit can be connected on top,
an overlay is handled to add support for the DSI Display
and Touch Controller.

Product Page: [3]

Dependencies: None

[1] https://www.96boards.org/specifications/
[2] https://git.codelinaro.org/linaro/qcomlt/debugboard
[3] https://www.lantronix.com/products/snapdragon-8-gen-3-mobile-hardware-development-kit/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Changes in v6:
- added comment explaining why we disable nodes
- removed useles comment on why we add the port/endpoint/address/size-cells
- added Konrad's review
- Link to v5: https://lore.kernel.org/r/20240606-topic-sm8650-upstream-hdk-v5-1-5d878f3047e3@linaro.org

Changes in v5:
- Resend the display card overlay now the I2C crash is fixed
- Link to v4: https://lore.kernel.org/r/20240422-topic-sm8650-upstream-hdk-v4-0-b33993eaa2e8@linaro.org

Changes in v4:
- Rebased on next and fixed the apply failures
- Link to v3: https://lore.kernel.org/r/20240325-topic-sm8650-upstream-hdk-v3-0-4f365d7932af@linaro.org

Changes in v3:
- fixed regulator node name to fix ordering
- deleted pcie_1_phy_aux clock
- removed undeeded mdss_mdp status okay
- collected revied & tested tags
- Link to v2: https://lore.kernel.org/r/20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org

Changes in v2:
- Fixed commit messages with links, and recently added product page URL
- Swapped i2c3/i2c6 nodes
- Moved pcie_1_phy_aux_clk under pcie1_phy
- Removed duplicate mdp_vsync pinctrl state
- Collected review & tested tags
- Link to v1: https://lore.kernel.org/r/20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     | 141 +++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 56992fc3fc59..0c1cebd16649 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -250,6 +250,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
+
+sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
new file mode 100644
index 000000000000..cb102535838d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+/*
+ * Display Card kit overlay
+ * This requires S5702 Switch 7 to be turned to OFF to route DSI0 to the display panel
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+
+&i2c6 {
+	status = "disabled";
+};
+
+&lt9611_1v2 {
+	status = "disabled";
+};
+
+&lt9611_3v3 {
+	status = "disabled";
+};
+
+&vreg_bob_3v3 {
+	status = "disabled";
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p2>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mdss_dsi0_out: endpoint {
+				remote-endpoint = <&panel0_in>;
+			};
+		};
+	};
+};
+
+&spi4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "goodix,gt9916";
+		reg = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14b_3p2>;
+
+		spi-max-frequency = <1000000>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2400>;
+
+		pinctrl-0 = <&ts_irq>, <&ts_reset>;
+		pinctrl-names = "default";
+	};
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_irq: ts-irq-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+		output-disable;
+	};
+
+	ts_reset: ts-reset-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};

---
base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
change-id: 20240223-topic-sm8650-upstream-hdk-e21cfd6f1de8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


