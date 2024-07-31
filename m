Return-Path: <linux-arm-msm+bounces-27458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC909424EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515141C21216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E907210EE;
	Wed, 31 Jul 2024 03:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFJcGa/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712EB20330;
	Wed, 31 Jul 2024 03:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396020; cv=none; b=Vk4rm/IDgZEmyhx3WyZvANRlnr3FRsxWlnZgLPEOn+SXicbR1Y8dfIwIMvPo9GFexpV6nV5jr9PC1TBYxwIbcgvsRgqhW8rKbt5e2vZcKyHFiUwwpJOmIz1vPChDUGbZ7IzzA7LJWvEGRFD1Zk9CCRzn5Uay5FQ05ZcbSR3BRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396020; c=relaxed/simple;
	bh=zlc9Outv8J/SmdPWoBnJw7jsI0nNkrEoTz8rmRSu3Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLDi1sruFvBkaM2tTmGwLNHp1d9e5G92MuDLlFVuTckeyM0ltcIysrY2CuHIC8sbPktMAa52aZZVE0cn39Sn2+CaZcukSz1aa6hb8M4UTbk1w60MUMmIsLOGeTDpKbBkBQVJVNoRA3qOoL9ifw8ezijS3YwbuYgebzOiQ9W/dlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFJcGa/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D003C4AF0E;
	Wed, 31 Jul 2024 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396020;
	bh=zlc9Outv8J/SmdPWoBnJw7jsI0nNkrEoTz8rmRSu3Xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NFJcGa/M4Z4hHxcY1Mmpebld2bV9aHZbBB4LDj963KqHRJe/iSRj3WQSRHch2RsT2
	 QvaIzf51hKsGPV0oqdActYEOhsd8sOnjEXvu7JZHoh5GZ7nUny9cd881HKagPpRBBv
	 bwb9J0snaF96nj1xcijkDWRPQmMpqOEh8CPDP+5ENh08kLkNHPWJoAEvtKB6s+Rzpb
	 FzqkUYJPG4P3FLC/Sx5fwpKDZ520A3bd2MM5JSfGlef7snXGCkYw6IDdt+08AY3LJz
	 Eck/vk5eAXFNinkW0mh2nG5M2f71f2s7i7YbhhFu8ujfbA7nnMtjXhwQxB/5NImPIt
	 jNQk20LICGY5Q==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:40 -0700
Subject: [PATCH v2 3/7] arm64: dts: qcom: sc8180x-pmics: Add second PMC8180
 GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-3-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=WoUciSTAgGTiHp5c2RldbTWydny4BWXv+STWKvCT8rE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HRiqCiT1CS6ofmg4YahxAxdduhhhrUcQRa
 cTZiumAcLCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVdhRAAoIiLu/57d2YZjdV3rbMjM/GZO/6ejnZ26Ujxb2t
 LPXKKjVNdtpCiZezXt2928joG6qktKFNeCVTLp7wDtimqaWHSXuskBfNfxlFKPUx1S9k7hn6LVE
 GYvbmSoQ6iSE8Px4Cxq40DZZ8a4GOCZ5rUoPaR07CcDd805x+W59ZEmnOnhrmzlxo8uSP1wGcRe
 P8lJ1j00qH5oEKKyncorxClFJU8re7p2GFLrzObOBmD3Bfz0gllEiWC0m/EA8HcJ86HD/7F94zl
 86BzZxPYsqcFVvK39fNIyyczWiZRGmhwrEjDPKBgufQ7RKdHvkmfEvTEAW1DValWkH7JtiAK3bg
 WjuTbwvR52FS/BArch4irctFscNsB8j1zpjHD4uUgxNn/xcdQLvxtN6ypiJ2BCpemEIE6gHCfWT
 27TnF8Da+Mr3gg9sZDsQWko9ebtLoUgtihnzBQmkCMeCCJ1bCeWY2g0auhrxyOjSGMzndH/L5WH
 sP8BqExUS/z1kP7lq8QMeU8YCkvkOarIZdA7k4cWlrjET4L6yUJaklrMMa7bbc6tuYwdnQubKEj
 f+rsY8WvvRr/GF77TcA6j4FDmlpuvKbCQvi82dM4qbyJO+BIiTUripGfEFNyzjgxL5Z1mXln1I4
 yMSX29sW5psBSFBg4kaDah9YsMIh1vp6LMZ/BmgPWjLU=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X comes with two PMC8180 PMICs, with the GPIO block being used
to control VBUS supply of the second USB multiport port.

Rename the GPIO controller in the first PMC8180 to match the schematics
and define this second controller.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index 1c6f12fafe1d..b6f8d1558c0d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -139,11 +139,11 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
 
-		pmc8180_gpios: gpio@c000 {
+		pmc8180_1_gpios: gpio@c000 {
 			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
-			gpio-ranges = <&pmc8180_gpios 0 0 10>;
+			gpio-ranges = <&pmc8180_1_gpios 0 0 10>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -198,11 +198,21 @@ pmic@6 {
 		#size-cells = <0>;
 	};
 
-	pmic@8 {
+	pmc8180_2: pmic@8 {
 		compatible = "qcom,pm8150", "qcom,spmi-pmic";
 		reg = <0x8 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmc8180_2_gpios: gpio@c000 {
+			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pmc8180_2_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmic@a {

-- 
2.45.2


