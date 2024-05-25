Return-Path: <linux-arm-msm+bounces-20465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C98CF0DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E96E1F21CCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9A512FF92;
	Sat, 25 May 2024 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFd+V5SW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C712F385;
	Sat, 25 May 2024 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659961; cv=none; b=o866hbJy+06d0NHS95FWRv9RR68gqwrwcWRVb2hIDsQ+KEeFNj8q7cUa56MvIpst7v/YmglcxSLzXWZXbWFyq0GJNwqHqBcuv3UU3qwFJXdD6q9indjyhUKJhyxsMp+y32BogomYXco4+vGdkzLLkiXtjEC1QfT0Pj1+uCube30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659961; c=relaxed/simple;
	bh=KsAmp/Jpl+aoBvYuIOCjghROnM89Np+AJ6hEEntneRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLS2w+d6/9DCy/UUGl2xHAFQg7rFv4TweOXc9SrUWFkuNzNEwgKAajI7Nvu/zz8Uz8MQ6aV1KasfF1YMKDXltPRqfPKXSh/l/GjKKBMB2IhGOyE1GGfkcvUC1PBHpyyVM3K1Be5KxXZCTCxiDcFYijN+3x3s5LKmZrjx7bDX4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFd+V5SW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB84C4AF08;
	Sat, 25 May 2024 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659961;
	bh=KsAmp/Jpl+aoBvYuIOCjghROnM89Np+AJ6hEEntneRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iFd+V5SWaySiqa+AKMAxNj4ROI27gCvr9EeyKKdLYHBPi8BdU5F53chbEH/sPxV5X
	 k9LNheXkF5QX4DdupPwC7dqMeChyxughDdxQEnvtRAp+pxzUY/JPeDbQXejyg64Bfu
	 oURv7nSgN/Xl1xH1Fm96HVxnEOCfPQFSh1oawO1Chk33V+NMmIfAd1/v3w18OwI1QC
	 836e85SXr/OuxmCgZDfAmDMAaNE3h2q5P2amuArTzn0AZIIali7TFxRfj5UUyu3Fyd
	 3XvhA3GImEEiuVUqKmo1oTMoeNo2FCiVjYUTiawipDF67wyRcBZgqPuT14qfwlSbGW
	 mMmAqeDolcuqA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:04:02 -0700
Subject: [PATCH 09/10] arm64: dts: qcom: sc8180x-primus: Enable the two MP
 USB ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-9-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=yBfHZjKorUkAjuU8wZYDXMlV6YNOtdO+oEQ/Pdz50CM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigNgg6i3cQBkU0oOk8Bo3ZOhSDH+NXONlgRj
 HQ3w6aA4ruJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXgWRAAl5ZBUWIZdNNTaSQO8vE74nOcbTkM8cjnSIPSLMx
 6PQR4YGO/o0Hih4wEyKTWd6NM//+WYNaZukmoqReq9tWyCgCDnDBZ5iYgsHYYlP+7DD0zwcWn1O
 rxdz81pwNfh4Py0SSpyL3ftS81uDvloqwvE3NP/6Lw8K1+xw8vqiRnfzdy5ShQkJYqktv6Lzj7j
 nOC2v7/pY2p/ESe9093mS7LIoqE5szuiVBv8lRAsTkQsULV0EaIYD9Jq9XMhxU+H3Xaw2xbFSgU
 4J0S0E1BuOFiM+GxavZYmJh2yhirc2zDPhjH0W9Ya89GCsXivxqAoNOTrzukH0GecqSFJPNK0cs
 m39e69uMpAKmQ+c4rUSpIBVduAcBqBY1tzQLix2XcWdpBl/BNf2wovUXynqLLS5eCp3Cu8oYkzZ
 l9yppklzlB8nq3aUaKk95BUnkkahWKMfj1Ywyu7RajnaN1m/mo6onCZLF/vah9LlJb6N3jNfdRR
 voIdQUdG3/O2wcM3ohWrx2mcvhjaRPuQK9twLewFjdeocr7TU79gKkA+TBsDoKuudZBLOWR/kTQ
 u0uSmgZHQ5LHW6eJII+iLuffCOlamNIipXtwabtcN1GAE14WHn9JR4tedWXd2m94GK/Qp+Zpjgb
 PmABA7aLMlIMuKdYnZevDmG3A2tOBYR7RetLoARHhQc4=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X Primus comes with an AUX card with two USB ports, fed by the
two multiport ports.

Enable the involved nodes and define two always-on regulators to enable
VBUS for these ports.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 60 +++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index bfee60c93ccc..f7632f13ac43 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -223,6 +223,32 @@ vreg_s4a_1p8: pm8150-s4 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	vreg_usb2_host_en: regulator-usb2-host-en {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_host_en";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&pmc8180_1_gpios 9 0>;
+		enable-active-high;
+
+		regulator-always-on;
+	};
+
+	vreg_usb3_host_en: regulator-usb3-host-en {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_host_en";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&pmc8180_2_gpios 9 0>;
+		enable-active-high;
+
+		regulator-always-on;
+	};
+
 	usbprim-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
@@ -623,6 +649,40 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp0_hsphy {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp0_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_mp1_hsphy {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp1_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
 &usb_prim_hsphy {
 	vdda-pll-supply = <&vreg_l5e_0p88>;
 	vdda18-supply = <&vreg_l12a_1p8>;

-- 
2.43.0


