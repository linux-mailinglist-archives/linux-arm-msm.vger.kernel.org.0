Return-Path: <linux-arm-msm+bounces-21864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 177888FE0B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B41C1F2525F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 08:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281B82C853;
	Thu,  6 Jun 2024 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvh6CiGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBD1C6A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717661778; cv=none; b=bAEXcFi7Ke5ulTr1I9j/Nfb4E/E+YHgkQaGAf0XkK3nd38NeunQbW+3u4fFKa2LpapnbhOXXuLNf0jjoK/NNCnz7Je4omkp1QOHT9B/fn3GbjxfKDB+2hxGvPtvCR1PaWKn0ZU+cYkXpk7DScgsd9ZPuHhndq8RZ3U9OeIWIdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717661778; c=relaxed/simple;
	bh=kM/bjj5O2UUkmYWJrTcjakHI24Xz7EzFZDN0sBNz54w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kczERS9+x5o1kdBQgjoroRkc2PVCBm9Et5CX/I5zbFba37RrrnCMp1UKw5vTG/spU3lHoHfGgcq75IP7gK1Gf7ODWZ8pBMaa44gkyhz0O1J9gIk1BT59FSegTLDh7Oiu8d5N/G0QRfFA6RPLOI1ddOyUI/Bvy9P1bhwiNrA6jTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvh6CiGR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35e0f4e1821so506576f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717661774; x=1718266574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi7diHHEiAXsWLzePfVdifFaiIYhvEtSV6AAoaq6/Mc=;
        b=fvh6CiGR9OnG0z2I8RDyyVGmdwC4x9r1IlYWE0P6eLNYbsJwzQyDYPoVN+Efa2aOy0
         Vu2QfTl0sXlbQnCrmmgiIdiT9LpiBW/lArYNhH5ByXeLnsL0j46pf0wK/4+x0xIVFV6T
         1kzVzI53p410NHp3IytB4sNFSqLEC01LhC7YQj3ZQ7CTccpgcVhXz3Cbg/g5/EUghVPQ
         yNnjfjch3K6LmP8CbsX7gk7ebee51sACjOEK0sCa/d9l31nXiHHRtA/NuGMWaWcmRSqp
         Wmf/OFzxkyZEorxX6i04ckJJfggGvTv2feJyohIq+asGA3aez201F9mL5OlBxH+3cIpf
         4zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717661774; x=1718266574;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi7diHHEiAXsWLzePfVdifFaiIYhvEtSV6AAoaq6/Mc=;
        b=OvDfenFd8lUGOzvMrG1WtusXA2xnjfUP89J9dO+hgPDbGMAwmJGLrXoWO4yUIoSvGE
         iSrBA5Tg5DzVb5fXJEr9mtiu/tSgXjH5TRKHBXN0DcGYz9D1qR46VPpJ+B6L+TNPGEJD
         eI229MLBa1HFiY0H9C8cBbR3SQ5pcdEyupF9+AZv0Cm4i8oY+Psrpq/WMpoMWNXQEQ/q
         Pz5BfSuDNwlbe5W7kVgJt5Py+bNLXnnBI7oTFPtNdDrSK7SWr1bVurmxji+BYPf451uK
         /vUPTs4CFPorCP5N3iVxDth1cqL62Hajhhwir6KmVpLRGdctxO1ovCb9ZUvGs2qT88pA
         9bZQ==
X-Gm-Message-State: AOJu0YzrmiYLUbSqyQRIjk291jj+JrjQRK+F85UwRwrUEHRea9fWsv8g
	9JqlK+ppRu07QzjOr/Bg8IWW92e9RxxcJwlEnQ01g8cV4RWfdXamvx7hhG/RmGc=
X-Google-Smtp-Source: AGHT+IHdRfmlLTrJhEef9q9Di3iyBlKd5Z5R64hxnmAydgHwDDKKUy+7eDL7J16wBT+QO27ZF6MMAQ==
X-Received: by 2002:adf:ea88:0:b0:34f:5e1d:4ab9 with SMTP id ffacd0b85a97d-35e8ef18156mr3499898f8f.33.1717661774503;
        Thu, 06 Jun 2024 01:16:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29653sm884344f8f.21.2024.06.06.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:16:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:16:11 +0200
Subject: [PATCH v5] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-sm8650-upstream-hdk-v5-1-5d878f3047e3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEpwYWYC/43OwW7DIAyA4VepOI8KbKBkp73HtAMD06CtIYIs2
 lTl3Ut6aatK0Y6/JX/2mVUqiSp73Z1ZoTnVlIcW+mXHfO+GI/EUWjMQoAQA8imPyfN6skYL/jP
 WqZA78T58cQLpYzBRBrKs7Y+FYvq92u8frftUp1z+rqdmuU7/o86SC+69d0ZpHzoh377T4Ere5
 3JkKzvDjUJptyho1KdBp4PS7mDVE4V3FOgtChulIhodDh2Ci0+UulEKYItS61eIXYfkHJB9oJZ
 luQA7hzWppAEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7172;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kM/bjj5O2UUkmYWJrTcjakHI24Xz7EzFZDN0sBNz54w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXBNkeyFUEmuWhVL//zqNBeoakOH6PNva+jCd8LW
 ptelVNiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmFwTQAKCRB33NvayMhJ0XkED/
 9coAmaF4lvjnAoj4ZGNIZQ9cfhPNbMKCsGTxFxOBPuF/+Eqv3WO6Zf2f3bQVt1hTNqkFrv+TIfEUEu
 ZZtsqb5myh0ObcpiFXoSF3avh+sW4AGei1cIK/hAhiYcA3OTPGLY4oZt7Ew+0MgagoaqSm931TKF9y
 YbMJNSRLptmrUJ1J5ZYAoqUVzsU/yeCHhQTD2GWb5jb5b+no9Wjo1zy4VIQ2dNC3K+fKsLjhpUhhqR
 ifm1ZEiLaq1hrb3vFUBD54yvo4OE/znP2opq24jrtJuRTZv5INWqoE4cl4/wjJgg0aKjmV98yi16Vn
 GslymS0kaeTW82PgtQtpvQzHCY/kKeDCT3UPUXHSIpvHBADtmgUfGoWazx9A9f8AlOt/GZK0bQxxpN
 bXgvsv67gbdf67Gbp45peyhLUBU7hz5euqp9zLilvk4OwigP47C/3i1nb53eSMwJrRYb+WenZPZ3fC
 QSyz2npOxGZwtOTS4Jw4e/kDe/zPCCjVcGM5MGAHAbLfWLoxpndEjkM9K/xICJDdL3sQuG3GnV3kfq
 /mVBNvPJLxIPFzas7F7iWMEojQuG8M2x/14jngYxGxXEwTGsAsMbyBYvYl/3BBJ1VHz8pALyh479Qc
 n1bJC4TYdFhUXISAU5q9zSz5z/YQooLwYHyWTIvUWlstweLqgwgqxRbHVR6w==
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
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     | 144 +++++++++++++++++++++
 2 files changed, 148 insertions(+)

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
index 000000000000..83f2338e5bf4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
@@ -0,0 +1,144 @@
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
+	/*
+	 * DTC requires to have both endpoints when compiling the overlay
+	 * and also requires the #address/size-cells + reg properties
+	 */
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
+	/* DTC requires the #address/size-cells to compile DTBO */
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


