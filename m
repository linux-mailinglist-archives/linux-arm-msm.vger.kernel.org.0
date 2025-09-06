Return-Path: <linux-arm-msm+bounces-72389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 183ECB467E4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 03:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003F01CC1D5D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 01:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3E41A4E70;
	Sat,  6 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZShj5x0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E719F137;
	Sat,  6 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757121149; cv=none; b=Z7nC1jwsTJIurbiqDTWp+1h1cmjqUDPhENar4t1iBOOY3rmMvkPplifmD/3cX0tnhOTugnoq9WdeplTDXET+znvIbnlJLeHvCjuX/GD1vMXqWO+VMtxyjOIrmMYzm3sNlLlSs+ZIq1N1dysUrhX5W8sxIfVoNLuWmA34lMuNSA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757121149; c=relaxed/simple;
	bh=jQNO+DAmCip4vesEFMc3Tv1y6ysB3R992Cyyu+ChrEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPo4D/GvbG8g59mNZ2M6TqHlhjPlaoYcJgtHjlyAd8On9hYzrUsFTtNQ73pCxTwgzlnHduUvkrVhinWZ4VWhaII2xs+37A5YjBIJCWiiT6nmDt3jGDZchahYpMZYCBAOPYZad7cZBWd/JahzKt4zaGZblAFUUhQ00C3miQWXe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZShj5x0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD77C4CEFB;
	Sat,  6 Sep 2025 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757121149;
	bh=jQNO+DAmCip4vesEFMc3Tv1y6ysB3R992Cyyu+ChrEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HZShj5x0BseaSy/k1VmuOiKf9EwmaZ5aCMPb5IkGVbdXiQ2JmtfqyDbO0GjY8L7oc
	 spH2Kj3aeXI1XMRy3BcHmwqcFx+PmzZKaDjAROTSWCT6m5LuhitiPF5nfa7ZORMs6l
	 EDxJleV/8Zgm/lUZhASIZD7S/9f/OMvamT1OiVBgTlfheU1uh7m5WDxgj1o+a+9fd7
	 8YsrYngGLjER+wph+imN20lwYjcqCsRCNRn6ThIu99x9H2yh4sHnq2LRVEd3pmARcw
	 RDjDjnk7G+1Kb02JoGCSsAyH7/u3wCWMn2ICQ8Dzgi4MHwdToo0zGOdmLjF9UfvV7f
	 OwFJO2n9XtKYA==
Received: by venus (Postfix, from userid 1000)
	id 6B145180B21; Sat, 06 Sep 2025 03:12:26 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 06 Sep 2025 03:12:05 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-thinkpad-t14s-ec-v3-3-3ce6ec21ae89@collabora.com>
References: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
In-Reply-To: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jQNO+DAmCip4vesEFMc3Tv1y6ysB3R992Cyyu+ChrEI=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBou4p6xtC8/RqdZxC9m/5OEDCvRd5Y0e2VywFKc
 /YXpbfA40OJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLuKegAKCRDY7tfzyDv6
 mkCiD/9tK9+B2LucYhz4FFgz6rtaNG7aPeA4/zvDAnN3U1TSinvjjBOZKEeSMIpK0zEY/IxNj/N
 NoV1Dib8BIVpta14jWpMbHEOD5VN0QKqBm3Bg3WgDqwEw7lkmzthMv3lYlppNz7IQV9syBdIPF2
 wY2V2iAH2sOFlFVPc3ahlKctL1Hc8YTH5aaL5oaMHyK+xMum28xFKM/xLUZgbaA3EbVFz936ty0
 580UbLauwwxdDl7Jjsm1zN44dZDccS7q6c55kxaWsE0uBOvibko7ftugbEkqXaC2YBDsL9sjsiq
 4UhiCjCHYQ1VyFON8yJ64vaa9I2pngUbKoq4ktlimkCe6LiVfiyDMSYuTa3DmR95m0e5d70fl7d
 NNNGm8FbzrreondOWnkJRaVXcOhSnTHiZ1dFq4XtmBwI53swEMvIbKKq1u/yanpP3idTocRGah9
 UBZ/pbBPnt29/FfD6nxrffJqGhsNJ5GehXZCY1Z3PwnsEN1DVP/Vb5u2oly7bc/e24mW4rHC0NM
 9X/MR2GhckRU1ectnQ8L0fe6i3aXBTqoxxrW7UcGS5osg1yOgAeP0QTetNQsqpeyYncL6D1jZBw
 AYjoSHlPFNPAzcOu51u3rCHK4Z17ocuCL4GMowdpY+4VqAL4SUmA6qann4qBSE7Al/7lRVjVeYW
 ocrawVLCirSx1/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Describe ThinkPad Embedded Controller in the T14s device tree,
which adds LED and special key support.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..f70489aba870289edbcf84ec22fdb004e010868b 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -887,6 +887,24 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1267,6 +1285,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.50.1


